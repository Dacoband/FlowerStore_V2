/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.CustomerDAO;
import DAO.UserDAO;
import DTO.Customer;
import DTO.Users;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author hendrix
 */
public class LoginController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String action = request.getParameter("action");
            String URL = "./Components/Generic/login.jsp";
            if (action == null) {
                action = "";
            }
            if (action.equals("logout")) {
                HttpSession session = request.getSession(false); //Disable Session -> Only Login User can see other pages
                if (session != null) {
                    session.invalidate();
                    response.sendRedirect("main");
                }
            } else {

                switch (action) {
                    case "login":
                        HttpSession session = request.getSession(true);
                        String email = request.getParameter("email");
                        String pass = request.getParameter("pass");
                        UserDAO userdao = new UserDAO();
                        CustomerDAO cusdao = new CustomerDAO();
                        Users result=null;
                    try {
                        result = userdao.login(email, pass);
                    } catch (Exception ex) {
                        Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                        if (result != null) {
                            try {
                                for (Customer bannedCustomer : cusdao.listAll()) {
                                    if (bannedCustomer.getEmail().equals(result.getEmail()) && bannedCustomer.isStatus()== false) {
                                        String message = "User is BANNED! See you in 2 weeks!";
                                        request.setAttribute("error", message);
                                        request.getRequestDispatcher(URL).forward(request, response);
                                    }
                                }
                            } catch (Exception ex) {
                                Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
                            }
                            URL = "main";
                            session.setAttribute("usersession", result);
                            if (result.getRole().equals("AD")) {
                                request.setAttribute("action", "admin");
                            }
                            if (result.getRole().equals("SH")) {
                                request.setAttribute("action", "shipper");
                            }
                            if (result.getRole().equals("CS")) {
                                request.setAttribute("action", "customer");
                            }
                        } else {
                            String message = "Wrong Username or Password";
                            request.setAttribute("error", message);
                        }
                        request.getRequestDispatcher(URL).forward(request, response);
                        break;
                    case "signup":
                        URL = "./Components/Generic/signupPage.jsp";
                        request.getRequestDispatcher(URL).forward(request, response);
                        break;
                    default:
                        request.getRequestDispatcher(URL).forward(request, response);
                        break;
                }
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
