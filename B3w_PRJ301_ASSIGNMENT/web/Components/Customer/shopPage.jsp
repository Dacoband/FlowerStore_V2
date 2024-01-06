<%-- 
    Document   : shopPage
    Created on : Oct 9, 2023, 8:39:39 PM
    Author     : hendrix
--%>

<%@page import="DAO.FlowerDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DTO.Flower"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/materialize.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="css/shopPage.css" rel="stylesheet">

        <title>Shopping</title>

    </head>
    <body>
        <%@include file="../Generic/navBar.jsp" %> 
        <div class="myContainer">
            <div class="row s3" style="display: inline">

                <%
                    ArrayList<Flower> result = new ArrayList<>();
                    String name = request.getParameter("floName");
                    FlowerDAO flowerdao = new FlowerDAO();
                    if (name == null) {
                        result = (ArrayList<Flower>) flowerdao.listAll(); 
                        for (Flower flower : result) {
                %>

                <form method="POST" action='customer'>
                    <input type='hidden' name='ID' value='<%= flower.getFlower_id()%>'>
                    <input type='hidden' name='action' value='mainpage'>
                    <div class="col s3" >
                        <div class="card">
                            <div class="card-image" style='width:  auto;height: 300px'>
                                <img src="<%= flower.getImage()%>">

                            </div>
                            <div class="card-content">
                                <span class="card-title"><%= flower.getFlower_name()%></span>
                                <p>Import Date: <%= flower.getImport_date()%></p>
                                <p>Color: <%= flower.getFlower_color()%></p>
                                <p class="price"><%= flower.getFlower_price()%>$</p>
                            </div>
                            <div class="card-action">                          
                                <button class="btn waves-effect waves-light" type="submit">
                                    Add To Cart
                                    <i class="material-icons right">add_box</i>
                                </button>
                            </div>
                        </div>
                    </div>
                </form> 

                <%
                    }
                } else {
                    result = (ArrayList<Flower>) flowerdao.searchFlower(name); 
                    if (result.isEmpty()) {
                %> 
                <h1 style='color: #f4511e ;text-align: center;'>NO FLOWER MATCHES THAT SEARCH!!!</h1>
                <%
                } else {
                    for (Flower flower : result) {
                %>

                <form method="POST" action='customer'>
                    <input type='hidden' name='ID' value='<%= flower.getFlower_id()%>'>
                    <input type='hidden' name='action' value='mainpage'>
                    <div class="col s3" >
                        <div class="card">
                            <div class="card-image" style='width:  auto;height: 300px'>
                                <img src="<%= flower.getImage()%>">

                            </div>
                            <div class="card-content">
                                <span class="card-title"><%= flower.getFlower_name()%></span>
                                <p>Import Date: <%= flower.getImport_date()%></p>
                                <p>Color: <%= flower.getFlower_color()%></p>
                                <p class="price"><%= flower.getFlower_price()%>$</p>
                            </div>
                            <div class="card-action">                          
                                <button class="btn waves-effect waves-light" type="submit">
                                    Add To Cart
                                    <i class="material-icons right">add_box</i>
                                </button>
                            </div>
                        </div>
                    </div>
                </form> 
                <%
                            }
                        }
                    }
                %> 
            </div>
        </div>
        
        <%@include file="../Generic/footer.jsp" %> 
    </body>
</html>
