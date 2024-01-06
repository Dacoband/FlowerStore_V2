<%-- 
    Document   : flower
    Created on : Oct 13, 2023, 12:42:39 PM
    Author     : hendrix
--%>


<%@page import="DAO.FlowerDAO"%>
<%@page import="DTO.Flower"%>
<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/flowerAdmin.css" rel="stylesheet" type="text/css"/>

        <title>JSP Page</title>
    </head>
    <body>
        <div class="myPage col s8 offset-s1">

            <div class="myProfile">
                <h1>Flower</h1>


                <form class='form col s6' id="name" action="admin" method="post" >
                    <input  type="hidden" name="action" value="mainpage"  />
                    <input type="hidden" name="page" value="flower"  /> 
                    <input class=" col s6"  id="icon_prefix" type="text" name="name" class="validate"  placeholder="Search By Name">           
                    <button class="btn waves-effect waves-light" type="submit" form="name"><i class="material-icons prefix">search</i></button>
                </form>
                <form class='form col s3' id="create" action="admin" method="post" >
                    <input  type="hidden" name="action" value="mainpage"  />
                    <input type="hidden" name="page" value="createFlower"  /> 
                    <button class="btn waves-effect waves-light" type="submit" form="create">Create New Flower</button>
                </form>

                <div class='table col s12'>  
                    <table class="highlight">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Id</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Status</th>
                                <th>Category</th>
                                <th>Update</th>
                            </tr>
                        </thead>

                        <%
                            String floname = request.getParameter("name");
                            FlowerDAO flowerdao = new FlowerDAO();
                            if (floname != null) {
                                ArrayList<Flower> lists = (ArrayList<Flower>)flowerdao.searchFlower(floname);

                                for (Flower f : lists) {


                        %>
                        <tbody>
                            <tr>
                                <td><div><%= f.getFlower_name()%></div></td>
                                <td><div><%= f.getFlower_id()%> </div></td>
                                <td><div><%= f.getFlower_price()%></div></td>
                                <td><div><%= f.getQuantity()%></div></td>
                                <td><div><%= f.isStatus()%> </div></td>
                                <td><div><%= f.getCategory_id()%></div></td>
                                <td><form action="login" method="POST">
                                        <input type="hidden" name="flower" value="<%= f.getFlower_id() %>">
                                        <input  type="hidden" name="action" value="mainpage"  />
                                        <input type="hidden" name="page" value="flowerupdate"/> 
                                        <button type="submit" class="btn waves-effect waves-light" type="submit"><i class="material-icons">description</i></button>
                                    </form></td>
                            </tr>
                        </tbody>


                        <% }
                        } else {

                            ArrayList<Flower> list = (ArrayList<Flower>)flowerdao.listAll();
                            for (Flower m : list) {

                        %>
                        <tbody>
                            <tr>
                                <td><div><%= m.getFlower_name()%></div></td>
                                <td><div><%= m.getFlower_id()%> </div></td>
                                <td><div><%= m.getFlower_price()%></div></td>
                                <td><div><%= m.getQuantity()%></div></td>
                                <td><div><%= m.isStatus()%> </div></td>
                                <td><div><%= m.getCategory_id()%></div></td>
                                 <td><form action="login" method="POST">
                                        <input type="hidden" name="flower" value="<%= m.getFlower_id() %>">
                                        <input  type="hidden" name="action" value="mainpage"  />
                                        <input type="hidden" name="page" value="flowerupdate"  /> 
                                        <button type="submit" class="btn waves-effect waves-light" type="submit"><i class="material-icons">description</i></button>
                                    </form></td>
                        </tbody>
                    
                    <% }
                        }
                    %>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
