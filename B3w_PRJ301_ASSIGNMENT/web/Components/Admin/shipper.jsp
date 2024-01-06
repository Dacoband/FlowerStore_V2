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
                <h1>Shipper's Profiles</h1>
                <form class='col s6' id="name" action="CentralController" method="post" >
                    <input type="hidden" name="action" value="admin"  />
                    <input type="hidden" name="page" value="order"  />

                    <button class="btn waves-effect waves-light">Assign Shippers To Orders</button>
                </form>
                <table>
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Address</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Status</th>
                            <th>On Order?</th>
                            
                        </tr>
                    </thead>


                    <tbody>
                        <%
                            ArrayList<Shippers> shipList = new ArrayList<>();
                            shipList = ShipperDAO.getAll();
                            ArrayList<Orders> orderList = new ArrayList<>();
                            String shipOrder = "disabled"; //check if shipper is already on shift
                            orderList = OrderDAO.getAllOrders();
                            for(Shippers ship : shipList){
                        %>
                        <tr>

                            <td><%= ship.getName() %></td>
                            <td><%= ship.getAddress() %></td>
                            <td><%= ship.getEmail() %></td>
                            <td><%= ship.getPhone_number() %></td>
                            <td><% if(ship.isStatus()){%>Active<%}else{%>Inactive<%} %></td>
                            <td><% if(ship.getOrder_assigned()!= 0){%>Busy With Order: <%= ship.getOrder_assigned() %> <% }else{ shipOrder = "";
                                            %>Shipper is free<%}  %></td>
                            

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
