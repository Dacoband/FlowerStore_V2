<%@page import="DTO.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DTO.Flowers"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/flowerAdmin.css" rel="stylesheet" type="text/css"/>

        <!-- LINK TO A JAVA-SCRIPT FOR SELECT OPTION-->
        <script type="text/javascript"
                src=
                "https://code.jquery.com/jquery-2.1.1.min.js">
        </script>
        <script src=
                "https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/js/materialize.min.js">
        </script>
        <!-- END LINK TO A JAVA-SCRIPT FOR SELECT OPTION-->

        <title>Flower Form</title>
    </head>
    <body>
        
        <div class="myPage col s8 offset-s1">
            <h1>New Flower</h1>
            <form action="CentralController" method="post" style='margin-bottom: 2%'>
                <input  type="hidden" name="action" value="admin" />
                <input type="hidden" name="page" value="checkCreateFlower"/> 
                <!-- Flower ID (int) -->
                <label for="flowerName">Flower Name</label>
                <input type="text" name="flowerName" id="flowerName" value='' ><br/>


                <label for="flowerColor">Flower Color</label>
                <input type="text" name="flowerColor" id="flowerColor" value=''><br/>


                <label for="flowerPrice">Flower Price</label>
                <input type="text" name="flowerPrice" id="flowerPrice" value=''><br/>
                
                <label for="flowerQuan">Quantity</label>
                <input type="text" name="flowerQuantity" id="flowerQuan" value=''><br/>


                <label for="status">Status</label>
                <select name='status'>
                    <option value='true'>Available</option>
                    <option value='false'>Not Available</option>
                </select>


                <label for="importDate">Import Date</label>
                <input type="date" name="importDate" id="importDate" value='' ><br/>

                <label for="categoryId">Category</label>
                <select name='categoryId'>

                    <%
                        ArrayList<Category> listCate = DAO.FlowerDAO.getAllCategory();

                        for (Category F : listCate) {
                    %>
                    <option value='<%= F.getCategory_id()%>'><%= F.getCategory_id()%></option>
                    <%
                        }
                    %>

                </select>

                <br/>
                <label for="image">Image URL</label>
                <input type="text" name="image" id="image" value='' >

                <button type="submit" class="btn waves-effect waves-light" type="submit">Create<i class="material-icons">system_update_alt</i></button>
            </form>
        </div>
        <script>
            $(document).ready(function () {
                $("select").material_select();
            });
        </script>
        <!-- Compiled and minified JavaScript -->
        <script src=
                "https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/js/materialize.min.js">
        </script>
    </body>
</html>
