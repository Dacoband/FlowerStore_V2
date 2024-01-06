<%-- 
    Document   : Information
    Created on : Oct 30, 2023, 9:38:27 AM
    Author     : bolic
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript"
                src=
                "https://code.jquery.com/jquery-2.1.1.min.js">
        </script>
        <script src=
                "https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/js/materialize.min.js">
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Personal Info</title>
        <style>
     

            @import url('https://fonts.googleapis.com/css2?family=Poppins&display=swap');
            @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap');


            body{
                margin: 0 ;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Poppins',sans-serif;
                width: 100%;
                height: 100vh;
                background-image: url('https://images.pexels.com/photos/7778287/pexels-photo-7778287.jpeg');
                background-position: center;
                background-size: cover;
                color: #fff;
            }
            .container {
                margin:  auto;
                margin-top: 10%;
                width: 70%;
                padding: 20px;
            }

            h1 {
                text-align: center;
            }

            form {
                padding: 20px;
                border: 1px solid rgb(48, 120, 69);
                border-radius: 10px;
                transform: translate(-50% , -50%);
                background-image: url('https://images.pexels.com/photos/7778287/pexels-photo-7778287.jpeg') ;
                background-position: center;
                background-size: cover;
                position: absolute;
                top: 50%;
                left: 50%;
                width: 65%;
                height: 50%;
            }
            .information{

                border-radius: 6px;

            }

            input[type="text"],
            input[type="password"] {
                width: 95%;
                padding: 5px;
                margin-bottom: 10px;
                border: none;
                outline: none;
                font-size: 20px;
                background: transparent;
                color: #fff;
                border-bottom: 2px solid #fff;
            }
            ::placeholder{
                color: #fff;
                font-size: 18px;
            }

            input[type="submit"] {

                background-color: #fff;
                color: #fff;
                padding: 10px;
                margin-left: 40%;
                background: fixed;
                border: 0.1ch solid #fff;
                outline: none;
                border-radius:3px;
                cursor: pointer;
                transition: 0.3s;
            }

            input[type="submit"]:hover {
                background-color: rgb(48, 120, 69);
                color: #fff;
            }

            input[type="submit"]:active{
                font-size: 15px;
            }

            .information {
                display: flex;
                flex-direction: column;
                margin-bottom: 20px;
                

            }
            .information input {
                display: block;
                margin-bottom: 10px;
            }
        </style>
    </head>
    <body>
        <%
            String nameError = (String) request.getAttribute("nameError");
            String phoneError = (String) request.getAttribute("phoneError");
            String addressError = (String) request.getAttribute("addressError");
            String NAME_ERROR = "Name didn't match requirement ->";
            String PHONE_ERROR = "Phone didn't match requirement ->";
            String ADDRESS_ERROR = "Address didn't match requirement ->"; 
            
            %>
        <div class="container">
            <h1>Personal Information</h1>
            <form action="CentralController" method="post" >
                <% String email = request.getParameter("txtemail"); %>
               <input type="hidden" name="action"  value="checkSignUp">
                <div class="information">
                    <input  type="hidden" name="txtemail"  value="<%= email %>" style="background: transparent; color: #fff; border-bottom: 2px solid #fff; ::placeholder{color: #fff; font-size: 18px;}">
                   
                    <input type="text" name="name" required="" placeholder="Name" style="background: transparent; color: #fff; border-bottom: 2px solid #fff; ::placeholder{color: #fff; font-size: 18px;}">
                     <%if(nameError=="err"){%><p style='color:yellow'><%= NAME_ERROR %></p><%}%><p>*Must Be At Least 3 Characters</p>
                    <input type="date" name="birth" required="" placeholder="Birthdate yyyy-mm-dd" style="background: transparent; color: #fff; border-bottom: 2px solid #fff; ::placeholder{color: #fff; font-size: 18px; border: none;}">
                    
                    <input type="text" name="phone" required="" placeholder="Phone" style="background: transparent; color: #fff; border-bottom: 2px solid #fff; ::placeholder{color: #fff; font-size: 18px;}">
                     <%if(phoneError=="err"){%><p style='color:yellow'><%= PHONE_ERROR %></p><%}%><p>*Must Be 9 Digits</p>
                    <input type="text" name="address" required="" placeholder="Address" style="background: transparent; color: #fff; border-bottom: 2px solid #fff; ::placeholder{color: #fff; font-size: 18px;}">
                     <%if(addressError=="err"){%><p style='color:yellow'><%= ADDRESS_ERROR %></p><%}%><p>*Must Be At Least 10 Characters</p>
                
                </div>
                <input name="btnAction" type="submit" value="Register">
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
