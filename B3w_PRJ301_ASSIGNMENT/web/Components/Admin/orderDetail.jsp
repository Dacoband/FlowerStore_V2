    <%-- 
    Document   : order
    Created on : Oct 13, 2023, 12:42:47 PM
    Author     : hendrix
--%>

<%@page import="DAO.OrderDAO"%>
<%@page import="DTO.Orders"%>
<%@page import="DAO.ShipperDAO"%>
<%@page import="DTO.Shippers"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/orderAdmin.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="myPage col s8 offset-s1">

            <div class="myProfile">
                <h1>Order's Detail</h1>
                <form class='col s6' id="name" action="CentralController" method="post" >
                    <input type="hidden" name="action" value="admin"  />
                    <input type="hidden" name="page" value="order"  />
                    <button class="btn waves-effect waves-light">Assign Orders To Shippers</button>
                </form>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Order Requested On</th>
                            <th>Deliver Address</th>
                            <th>Total Price</th>
                            <th>Payment Method</th>
                            <th>Status</th>
                            
                        </tr>
                    </thead>


                    <tbody>
                        <%
                            
                            ArrayList<Orders> orderList = new ArrayList<>();
                            orderList = OrderDAO.getAllOrders();
                            for(Orders order : orderList){
                        %>
                        <tr>

                            <td><%= order.getOrder_id() %></td>
                            <td><%= order.getOrder_date()%></td>
                            <td><%= order.getDelivery_address() %></td>
                            <td><%= order.getTotal_payment() %></td>
                            <td><%= order.getPayment_method() %></td>
                            <td> <% if(order.getStatus()){ %>Not Deliver<%}else{%>Delivering<%} %></td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
                    
                    
                    
    </body>
</html>
