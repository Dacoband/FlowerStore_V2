<%-- 
    Document   : cartPage
    Created on : Oct 9, 2023, 8:39:57 PM
    Author     : hendrix
--%>

<%@page import="java.util.HashMap"%>
<%@page import="DTO.Flowers"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/materialize.css" rel="stylesheet" type="text/css"/>
        <link href="css/cartPageCss.css" rel="stylesheet" type="text/css"/>
        <title>Cart</title>
    </head>
    <body>
        <div class="background">
            <div class="container">
        <%
            HashMap<Flowers, Integer> flowerList = (HashMap<Flowers, Integer>) session.getAttribute("order");
            if (flowerList == null) {
                out.println("Your Cart Is Currently Empty");
        %>
        <form id='return' method='post' action='CentralController'>
            <p>Return To Shop Page <input form="return" type="submit" value="shop" name="action"/></p>
        </form>
        <%
        } else {
            int Quantity = 0;

        %>
        <h1>Your Order</h1>
        <table>

            <tr>
                <th>NAME</th>
                <th>PRICE</th>
                <th>QUANTITY</th>
                <th>Action</th>
            </tr>

            <%                for (Flowers flower : flowerList.keySet()) {
                    if (flowerList.get(flower) > flower.getQuantity()) {
                        flowerList.put(flower, flower.getQuantity());
                    }
                    Quantity += (flower.getFlower_price() * flowerList.get(flower));
            %>


            <tr>
                <td><%= flower.getFlower_name()%> </td>
                <td><%= flower.getFlower_price()%></td>
                <td>
                    <form id="<%= flower.getFlower_id()%>" action='updateServlet' method='POST'> 

                        <input type="number" name="quantity" value="<%= flowerList.get(flower)%>" min="1" max="<%= flower.getQuantity()%>">

                        <input type='hidden' name='ID' value='<%= flower.getFlower_id()%>'>
                    </form>
                </td>

                <td>
                    <input form="<%= flower.getFlower_id()%>" type="submit" value="Update" name="Action"/>
                    <input form="<%= flower.getFlower_id()%>" type="submit" value="Delete" name="Action"/>
                </td>

            </tr>
        </form>

        <%
            }
        %>
    </table>

    <h3>Total Price Charge: <%= Quantity%>$</h3>
    
    
    <%    session.setAttribute("Total", Quantity);  %>
    <form id='return' method='post' action='CentralController'>
        <input form="return" type="submit" value="shop" name="action"/>
    </form>
    <form  action='CentralController'>
        <input  type="submit" value="buy" name="action"/>
    </form>

    <%
        }
    %>


</div>
</div>
</body>
</html>
