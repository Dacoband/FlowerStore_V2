<%-- 
    Document   : profile
    Created on : Oct 13, 2023, 12:42:26 PM
    Author     : hendrix
--%>


<%@page import="DAO.CustomerDAO"%>
<%@page import="DTO.Customer"%>
<%@page import="java.util.ArrayList"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/profileAdmin.css" rel="stylesheet" type="text/css">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="myPage col s8 offset-s1">

            <div class="myProfile">
                <h1>Profile</h1>
                <form class='col s6' id="mail" action="admin" method="post" >
                    <input type="hidden" name="action" value="mainpage"  />
                    <input type="hidden" name="page" value="profile"  />
                    <input class=" col s10" id="icon_prefix" type="text" name="mail" class="validate" placeholder="Search By Mail">   
                    <button class="btn waves-effect waves-light" type="submit" form="mail"><i class="material-icons prefix">search</i></button>
                </form>
                <form class='col s6' id="name" action="admin" method="post" >
                    <input type="hidden" name="action" value="mainpage"  />
                    <input type="hidden" name="page" value="profile"  /> 
                    <input class=" col s10" id="icon_prefix" type="text" name="name" class="validate"  placeholder="Search By Name">           
                    <button class="btn waves-effect waves-light" type="submit" form="name"><i class="material-icons prefix">search</i></button>
                </form>

                <div class='table col s12'>  
                    <table class="highlight">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Mail</th>
                                <th>Phone</th>
                                <th>Address</th>
                                <th>Flag</th>
                                <th>Status</th>
                                <th>Ban Account</th>

                            </tr>
                        </thead>


                        <%
                            String name = request.getParameter("name");
                            String mail = request.getParameter("mail");
                            int id=0;
                            try {
                                    id = Integer.parseInt(request.getParameter("ID")) ;
                                } catch (Exception e) {
                                    System.out.println("No ID Currently");
                                }
                           
                            
                            String active = "Active"; // Customize Name for the 'Status' Column
                            String disabled = ""; //If flag is lower than 2. The BAN Button is disabled
                            String button = "light-green accent-4"; //Button will switch color depend on if you banned user or not
                            CustomerDAO cusdao = new CustomerDAO();
                            String banButton = request.getParameter("banBtn");
                            if(banButton!=null && banButton.equals("banUser")){
                                Customer cus = cusdao.loadCustomer(id);
                                if(cus!=null && cus.isStatus()==true){
                                    cusdao.disable(id);
                            }else{
                                    cusdao.enable(id);
                            }
                            }
                            
                            if (name != null) {
                                ArrayList<Customer> list = (ArrayList<Customer>)cusdao.searchCustomerByName(name);
                                for (Customer e : list) {


                        %>

                        <tr>

                            <td><%= e.getName()%></td>
                            <td><%= e.getEmail()%></td>
                            <td><%= e.getPhone_number()%></td>
                            <td><%= e.getAddress()%></td>
                            <td><%= e.getFlag()%></td>
                            <td>

                                <%
                                    if (e.isStatus()== false) {
                                        active = "Banned";
                                    } else {
                                        active = "Active";
                                    }
                                %> <%= active%> <%
                                %>
                            </td>
                            <% if (e.getFlag() > 2) {
                                    disabled = "";
                                } else {
                                    disabled = "disabled";
                                }%>
                            <td>
                                <form id="banUser" action="admin" method="POST">
                                    <input type="hidden" name="page" value="profile"/>  <%-- SEND YOU BACK TO THIS PAGE AUTOMATICALLY --%>
                                    <input type="hidden" name="action" value="mainpage"  />
                                    <input type="hidden" name="ID" value="<%= e.getCustomer_id()%>">
                                    <input type="hidden" name="flag" value="<%= e.getFlag()%>">
                                    <input type="hidden" name="status" value="<%= e.isStatus()%>">
                                    <% if (e.isStatus()== false) {
                                        button = "light-green accent-4";%>
                                    <div class=""><button title="UNBAN THEM <3"  <%= disabled%>
                                                          class="btn waves-effect <%= button%> waves-light " type="submit" name ="banBtn" value="banUser"><i class="material-icons">check</i></button>
                                    </div>
                                    <% } else {
                                    button = "deep-orange";%>
                                    <div class=""><button title="BAN THEM!!!" <%= disabled%>
                                                          class="btn waves-effect <%= button%> waves-light " type="submit" name ="banBtn" value="banUser"><i class="material-icons">warning</i></button>
                                    </div>
                                    <%
                                        }
                                    %>
                                </form>
                            </td>

                        </tr>

                        <% }

                        } else if (mail != null) {
                            ArrayList<Customer> list = (ArrayList<Customer>)cusdao.searchCustomerByEmail(mail);
                            for (Customer e : list) {


                        %>

                        <tr>
                            <td><%= e.getName()%></td>
                            <td><%= e.getEmail()%></td>
                            <td><%= e.getPhone_number()%></td>
                            <td><%= e.getAddress()%></td>
                            <td><%= e.getFlag()%></td>
                            <td><%
                                if (e.isStatus()== false) {
                                    active = "Banned";
                                } else {
                                    active = "Active";
                                }
                                %> <%= active%> <%
                                %></td>
                            <% if (e.getFlag() > 2) {
                                    disabled = "";
                                } else {
                                    disabled = "disabled";
                                }%>
                            <td>
                                <form id="banUser" action="admin" method="POST">
                                    <input type="hidden" name="page" value="profile"/>  <%-- SEND YOU BACK TO THIS PAGE AUTOMATICALLY --%>
                                    <input type="hidden" name="action" value="mainpage"  />
                                    <input type="hidden" name="ID" value="<%= e.getCustomer_id()%>">
                                    <input type="hidden" name="flag" value="<%= e.getFlag()%>">
                                    <input type="hidden" name="status" value="<%= e.isStatus()%>">
                                    <% if (e.isStatus()== false) {
                                        button = "light-green accent-4";%>
                                    <div class=""><button title="UNBAN THEM <3"  <%= disabled%>
                                                          class="btn waves-effect <%= button%> waves-light " type="submit" name ="banBtn" value="banUser"><i class="material-icons">check</i></button>
                                    </div>
                                    <% } else {
                                    button = "deep-orange";%>
                                    <div class=""><button title="BAN THEM!!!" <%= disabled%>
                                                          class="btn waves-effect <%= button%> waves-light " type="submit" name ="banBtn" value="banUser"><i class="material-icons">warning</i></button>
                                    </div>
                                    <%
                                        }
                                    %>
                                </form>
                            </td>
                        </tr>

                        <% }

                        } else {
                            ArrayList<Customer> List = (ArrayList<Customer>)cusdao.listAll();
                            for (Customer e : List) {
                        %>
                        <tr>
                            <td><%= e.getName()%></td>
                            <td><%= e.getEmail()%></td>
                            <td><%= e.getPhone_number()%></td>
                            <td><%= e.getAddress()%></td>
                            <td><%= e.getFlag()%></td>
                            <td>
                                <%
                                    if (e.isStatus()== false) {
                                        active = "Banned";
                                    } else {
                                        active = "Active";
                                    }
                                %> <%= active%> <%
                                %>
                            </td>
                            
                            <% if (e.getFlag() > 2) {
                                    disabled = "";
                                } else {
                                    disabled = "disabled";
                                }%>
                            <td>
                                <form id="banUser" action="admin" method="POST">
                                    <input type="hidden" name="page" value="profile"/>  <%-- SEND YOU BACK TO THIS PAGE AUTOMATICALLY --%>
                                    <input type="hidden" name="action" value="mainpage"  />
                                    <input type="hidden" name="ID" value="<%= e.getCustomer_id()%>">
                                    <input type="hidden" name="flag" value="<%= e.getFlag()%>">
                                    <input type="hidden" name="status" value="<%= e.isStatus()%>">
                                    <% if (e.isStatus()== false) {
                                        button = "light-green accent-4";%>
                                    <div class=""><button title="UNBAN THEM <3"  <%= disabled%>
                                                          class="btn waves-effect <%= button%> waves-light " type="submit" name ="banBtn" value="banUser"><i class="material-icons">check</i></button>
                                    </div>
                                    <% } else {
                                    button = "deep-orange";%>
                                    <div class=""><button title="BAN THEM!!!" <%= disabled%>
                                                          class="btn waves-effect <%= button%> waves-light " type="submit" name ="banBtn" value="banUser"><i class="material-icons">warning</i></button>
                                    </div>
                                    <%
                                        }
                                    %>
                                </form>
                            </td>


                        </tr>
                        <%
                                }
                            }
                        %>
                    </table>

                </div>
            </div>

        </div>
    </body>
</html>
