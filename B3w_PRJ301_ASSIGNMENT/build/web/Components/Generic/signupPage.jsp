<%-- 
    Document   : signup
    Created on : Oct 9, 2023, 8:39:11 PM
    Author     : hendrix
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Account Sign Up</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            /*
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
            */
            /* 
                Created on : Oct 19, 2023, 10:13:57 AM
                Author     : bolic
            */

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
                height: 50vh;
            }
            .signup{

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

        </style>
        <script>
            function checkPassword() {
                if (document.getElementById("txtpassword").value !== document.getElementById("txtrepassword").value) {
                    alert("password is invalid");
                    return false;
                }
                return true;
            }

        </script>
    </head>
    <body>
        <% 
           String emailError = (String) request.getAttribute("emailError");
           String passwordError = (String) request.getAttribute("passwordError");
           String accountError = (String) request.getAttribute("accountError");
            String ACCOUNT_ERROR = "ACCOUNT IS ALREADY EXIST!!!";
            String EMAIL_ERROR = "Email Didn't Match Requirement";
            String PASSWORD_ERROR = "Password Didn't Match Requirement";
        %>
        <div class="container">
            <h1>Sign Up</h1>
            <form action="login" method="post" >
                 <input type="hidden" name="action"  value="checkSignUp">
                <div class="signup">
                    <p><input type="text" name="txtemail" required=""  placeholder="Email"> *Must End With '@gmail.com'</p>
                    <%if(emailError=="err"){%><p style='color:yellow'><%= EMAIL_ERROR %></p><%}%>
                    <%if(accountError=="err"){%><p style='color:yellow'><%= ACCOUNT_ERROR %></p><%}%>
                    <p><input type="password" id="txtpassword" name="txtpassword" required="" placeholder="Password"> *Must Be At Least 5 Characters</p>
                    <%if(passwordError=="err"){%><p style='color:yellow'><%= PASSWORD_ERROR %></p><%}%>
                    <p><input type="password" id="txtrepassword" name="txtrepassword" required="" placeholder="Re-Password"></p>
                    <p><input type="submit" name="btnAction" value="Sign Up" onclick="return checkPassword()"></p>
                     
                    
                </div>
            </form>
            
        </div>

    </body>
</html>

