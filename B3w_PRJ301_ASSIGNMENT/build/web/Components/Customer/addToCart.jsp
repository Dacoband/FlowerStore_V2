<%-- 
    Document   : addToCart
    Created on : Oct 30, 2023, 8:58:53 PM
    Author     : hendrix
--%>

<%@page import="DAO.FlowerDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="DTO.Flowers"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add to Cart</title>
    </head>
    <body>
        <%
            String id = request.getParameter("ID") ;
            if (id != null) {
                int floID = Integer.parseInt(id);
                Flowers resultFlo = FlowerDAO.getFlowerById(floID);
                int quantity;   
                
                HashMap<Flowers, Integer> order = (HashMap<Flowers, Integer>) session.getAttribute("order");

                if (order == null) { 
                    order = new HashMap<>();
                    order.put(resultFlo, 1);
                } else {
                    //save Order in a timely matter -> save order for 30 minutes, afterward is auto deleted.
                    //Check if Item is already in cart or not
                    boolean flag = false;
                    for (Flowers flower : order.keySet()) {
                        if (flower.getFlower_id() == floID) {
                            flag = true;
                            quantity = order.get(flower);
                            quantity++;
                            order.put(flower, quantity);
                        }
                    }
                    if (flag == false) {
                        order.put(resultFlo, 1);
                    }
                }
                session.setAttribute("order", order);
            }

        %>
    </body>
</html>
