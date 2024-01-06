<%-- 
    Document   : profilePage
    Created on : Nov 1, 2023, 3:28:00 PM
    Author     : hendrix
--%>
<%@page import="DTO.Login"%>
<%@page import="DTO.Account"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DTO.Customers"%>
<%@page import="DAO.CustomerDAO" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/materialize.css" rel="stylesheet" type="text/css"/>
        <link href="css/customerProfileCss.css" rel="stylesheet" type="text/css"/>
        <title>Profile</title>
    </head>
    <body>
        <div class="background">
        <div class="container" style="padding-top:2%;height:80vh">
            <%
                Login l = (Login) session.getAttribute("result");
                if (l != null) {
                    String email = l.getEmail();
                    ArrayList<Customers> customersList = CustomerDAO.getCustomersByEmail(email);
                    for (Customers customer : customersList) {
            %>
        <ul class="collection with-header" style="height:80vh;background-color: white">
        <li class="collection-header"><h4><%= customer.getName()%></h4></li>
        <li class="collection-item">Email: <%= customer.getEmail()%></li>
        <li class="collection-item">Birth Date: <%= customer.getBirth_date()%></li>
        <li class="collection-item">Phone Number: <%= customer.getPhone_number()%></li>
        <li class="collection-item">Address: <%= customer.getAddress()%></li>
        <li class="collection-item">Order Canceled: <%= customer.getFlag()%></li>
        
        <li class="collection-item" style="position: absolute;bottom: 5px"> <a class="btn waves-ripple" href="CentralController">Log Out</a></li>
      </ul>
            <%
                }
            } else {
            %>
            <p>Not Found.</p>
            <%
                }
            %>
        </div>
        </div>
    </body>
</html>
