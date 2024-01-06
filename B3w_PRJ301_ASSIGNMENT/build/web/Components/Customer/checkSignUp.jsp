<%-- 
    Document   : checkSignUp
    Created on : Oct 18, 2023, 10:28:11 AM
    Author     : bolic
--%>

<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="DAO.UserDAO"%>
<%@page import="DTO.Users"%>
<%@page import="DTO.Customer"%>
<%@page import="DAO.CustomerDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Check SignUp</title>
        <style>
            .notice{
                width: 100%;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <%!
            public boolean stringInfo(String parameter, String reRex) {
                boolean flag = true;
                if (reRex.equalsIgnoreCase("none") == true) {
                    // If You don't want to check for regex -type 'none' in the second param
                } else {
                    Pattern rules = Pattern.compile(reRex);
                    Matcher checkRules = rules.matcher(parameter);
                    flag = checkRules.matches();
                }
                return flag;
            }
        %>

        <%
            String button = request.getParameter("btnAction");
            if (button == null) {
                button = "";
            }
            switch (button) {
                case "Sign Up": {
                    String email = request.getParameter("txtemail");
                    String password = request.getParameter("txtpassword");
                    boolean flagEmail = stringInfo(email, "^([\\w\\d]*)@(gmail)\\.com$");
                    boolean flagPassword = stringInfo(password, "^[\\w\\d]{5,}$");
                    //Validate if inputs are not match with requirement
                    if (flagEmail == false) {
                        request.setAttribute("emailError", "err");
                    }
                    if (flagPassword == false) {
                        request.setAttribute("passwordError", "err");
                    }
                    if (flagEmail == false || flagPassword == false) {
                        request.setAttribute("role", "signup");
                        request.getRequestDispatcher("../login").forward(request, response);
                    } else {
                        try {
                            // Kiểm tra xem tài khoản đã tồn tại trong cơ sở dữ liệu chưa
                            Users account = UserDAO.getAccount(email, password);
                            if (account != null) {
                                request.setAttribute("accountError", "err");
                                request.setAttribute("role", "signup");
                                request.getRequestDispatcher("../CentralController").forward(request, response);
                            } else {
                                // Tên người dùng chưa tồn tại
                                String role = "CS"; // Gán vai trò mặc định "CS"
                                int result = UserDAO.insertAccount(email, password, role);
                                if (result > 0) {
                                    request.setAttribute("role", "information");
                                    request.getRequestDispatcher("../login").forward(request, response);
                                } else {
                                    out.print("Fail To Register Your Account");
                                }
                            }
                        } catch (Exception e) {
                            out.print(e);
                        }
                    }
                    break;
                }
                case "Register": {

                    String email = request.getParameter("txtemail");
                    String name = request.getParameter("name");
                    String birthday = request.getParameter("birth");
                    String phone = request.getParameter("phone");
                    String address = request.getParameter("address");
                    Boolean Status = true;
                    String order = "0";
                    int flag = 0;

                    //Validate Them Inputs
                    boolean flagName = stringInfo(name, "^[\\w\\s]{3,}$");
                    if (flagName == false) {
                        request.setAttribute("nameError", "err");
                    }

                    boolean flagPhone = stringInfo(phone, "^[\\d]{9}$");
                    if (flagPhone == false) {
                        request.setAttribute("phoneError", "err");
                    }

                    boolean flagAddress = stringInfo(address, "^[\\w\\d\\s]{10,}$");
                    if (flagAddress == false) {
                        request.setAttribute("addressError", "err");
                    }
                    
                    if (flagName == false || flagPhone == false || flagAddress == false) {
                        request.setAttribute("role", "information");
                        request.getRequestDispatcher("../CentralController").forward(request, response);
                    } else {
                        int result = DAO.CustomerDAO.CreateCus(email, name, birth_date, phone_number, address, status, orders, flag);
                        if (result > 0) {
                            request.setAttribute("message", "createSuccess");
                            request.setAttribute("role", "welcome");
                            request.getRequestDispatcher("../CentralController").forward(request, response);
                        } else {
                            out.print("Fail To Register Your Personal Infomation ");
                        }
                    }
                    break;
                }
            }
        %>
    </body>
</html>
