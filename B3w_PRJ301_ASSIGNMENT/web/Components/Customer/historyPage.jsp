<%-- 
    Document   : historyPage
    Created on : Oct 9, 2023, 8:40:08 PM
    Author     : hendrix
--%>

<%@page import="java.util.HashMap"%>
<%@page import="DTO.Flowers"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- historyPage.jsp --%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order History</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        h1 {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 20px;
        }

        ul {
            list-style: none;
            padding: 0;
        }

        li {
            background-color: #fff;
            margin: 10px;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s;
        }

        li:hover {
            background-color: #f9f9f9;
        }

        li::after {
            content: "";
            clear: both;
            display: table;
        }

        .product-info {
            float: left;
            width: 70%;
        }

        .product-price {
            float: right;
            text-align: right;
        }
    </style>
</head>
<body>
    <h1>Your Order History</h1>
    <ul>
        <%
            // Lấy danh sách sản phẩm đã đặt hàng từ session
            HashMap<Flowers, Integer> flowerList = (HashMap<Flowers, Integer>)session.getAttribute("orders");
                   
            // Kiểm tra xem danh sách sản phẩm đã đặt hàng có dữ liệu hay không
            if (flowerList != null && !flowerList.isEmpty()) {
                for (Flowers e : flowerList.keySet()) {
        %>
        <li>
            <div class="product-info">
                <p>Product Name: <%=   e.getFlower_name()  %></p>
                <p>Quantity: <%=   flowerList.get(e)   %></p>
                <p>Price: <%=  e.getFlower_price()  %> USD</p>
            </div>
            <div class="product-price">
                
                <p>Total Price: <%= e.getFlower_price() * flowerList.get(e) %> USD</p>
                
            </div>
        </li>
        <%
            }
        } else {
        %>
        <li>No orders found.</li>
        <%
            }
        %>
    </ul>
     <form id='return' method='post' action='CentralController'>
        <input form="return" type="submit" value="shop" name="action"/>
    </form>
</body>
</html>
