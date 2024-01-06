<%-- 
    Document   : navBar
    Created on : Oct 10, 2023, 11:56:16 AM
    Author     : hendrix
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nav Bar</title>
        <style>
            .search{
                border-top: #26a69a solid 2px;
            }
            .nav {
                float: right;
                margin-right: 1%;
            }

        </style>
    </head>
    <body>
        <nav>
            <div class="nav-wrapper teal lighten-2">
                <a style="margin-left: 2%" class="brand-logo">Yuuka's Garden</a>
                <form action='CentralController' method='POST'>
                    <ul class="button hide-on-med-and-down">
                        <li class='nav'><button class='waves-effect waves-light btn-large' type='submit' name="action" value='history'><i class="material-icons">filter_list</i></button></li>
                        <li class='nav'><button class='waves-effect waves-light btn-large' type='submit' name="action" value='cart'><i class="material-icons">shopping_cart</i></button></li>
                        <li class='nav'><button class='waves-effect waves-light btn-large' type='submit' name="action" value='profile'><i class="material-icons">account_circle</i></button></li>
                    </ul>
                </form>
            </div>
        </nav>
        <nav>
            <div class="search nav-wrapper teal lighten-2">
                <form action='CentralController' method='POST'>
                    <div class="input-field">
                        <input id="search" type="hidden" name='action' value='shop'>
                        <input id="search" type="search" name='floName' value=''>
                        <label class="label-icon" for="search"><i class="material-icons">search</i></label>
                        <i class="material-icons">close</i>
                    </div>
                </form>
            </div>
        </nav>
    </body>
</html>
