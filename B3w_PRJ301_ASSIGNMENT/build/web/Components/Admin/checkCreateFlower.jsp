<%-- 
    Document   : checkCreateFlower
    Created on : Oct 31, 2023, 7:59:39 PM
    Author     : hendrix
--%>

<%@page import="DAO.FlowerDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Flower</title>
    </head>
    <body>
        <%
                    String flower_name = request.getParameter("flowerName");
                    String flower_color = request.getParameter("flowerColor");
                    int flower_price = Integer.parseInt(request.getParameter("flowerPrice"));
                    boolean status = Boolean.parseBoolean(request.getParameter("status"));
                    String import_date = request.getParameter("importDate");
                    int category_id = Integer.parseInt(request.getParameter("categoryId"));
                    String image = request.getParameter("image");
                    int quantity = Integer.parseInt( request.getParameter("flowerQuantity"));
                    int resultFlo = FlowerDAO.CreateFlowers(flower_name, flower_color, flower_price, status, import_date, category_id, image, quantity);
                     if(resultFlo != 0){request.setAttribute("role", "admin");request.setAttribute("page", "flower");request.getRequestDispatcher("../CentralController").forward(request, response); }
                    else{request.setAttribute("role", "error");request.getRequestDispatcher("../CentralController").forward(request, response); }
        %>
    </body>
</html>
