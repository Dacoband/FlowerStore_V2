<%-- 
    Document   : updateOrder
    Created on : Oct 27, 2023, 10:44:14 PM
    Author     : hendrix
--%>

<%@page import="DAO.ShipperDAO"%>
<%@page import="DAO.OrderDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int orderID = Integer.parseInt(request.getParameter("orderID")) ;
            String email= request.getParameter("shipper");
            
            
            if(orderID != 0 && email != null){
                int resultOrder;
                    resultOrder = OrderDAO.updateOrder(orderID);
                    resultOrder = ShipperDAO.updateShipper(email, orderID);
                    if(resultOrder != 0){request.setAttribute("role", "admin");request.setAttribute("page", "order");request.getRequestDispatcher("../CentralController").forward(request, response); }
                    else{request.setAttribute("role", "error");request.getRequestDispatcher("CentralController").forward(request, response); }
            }
            

        %>
    </body>
</html>
