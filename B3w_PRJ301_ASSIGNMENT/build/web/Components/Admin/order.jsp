<%-- 
    Document   : order
    Created on : Oct 13, 2023, 12:42:47 PM
    Author     : hendrix
--%>

<%@page import="DAO.OrderDAO"%>

<%@page import="DAO.ShipperDAO"%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>JSP Page</title>
        <script type = "text/javascript"  
                src = "https://code.jquery.com/jquery-2.1.1.min.js">
        </script>   
    </head>
    <body>
        <div class="myPage col s8 offset-s1">

            <div class="myProfile">
                <h1>Assign A Shipper To The Order</h1>
                <form class='col s3' id="name" action="admin" method="post" >
                    <input type="hidden" name="action" value="mainpage"  />
                    <input type="hidden" name="page" value="shipper"  /> 
                    <button class="btn waves-effect waves-light">View Shipper's Profiles</button>
                </form>
                 <form class='col s3' id="name" action="CentralController" method="post" >
                    <input type="hidden" name="action" value="admin"  />
                    <input type="hidden" name="page" value="orderDetail"  /> 
                    <button class="btn waves-effect waves-light">View Order's Detail</button>
                </form>
                <table>
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Address</th>
                            <th>Status</th>
                            <th>On Order?</th>
                            <th>Assign Order</th>
                        </tr>
                    </thead>


                    <tbody>
                       
                    </tbody>
                </table>
            </div>
        </div>
        <script src= 
                "https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/js/materialize.min.js">
        </script> 
    </body>
</html>
