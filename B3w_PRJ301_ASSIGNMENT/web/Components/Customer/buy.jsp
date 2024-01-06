<%-- 
    Document   : buy
    Created on : Nov 4, 2023, 9:03:48 PM
    Author     : THY
--%>

<%@page import="java.util.HashMap"%>
<%@page import="DTO.Flowers"%>
<%@page import="DTO.Flowers"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    <body>
        <style>
    .success-message {
        background-color: #4CAF50;
        color: white;
        padding: 10px;
        text-align: center;
        font-size: 16px;
    }
</style>

    
    
    
   
        
    
    
    
    
    
    
    
    
    
    
    <%
        // Lấy giỏ hàng từ session
        HashMap<Flowers, Integer> flowerList = (HashMap<Flowers, Integer>) session.getAttribute("order");

        // Kiểm tra xem giỏ hàng có dữ liệu hay không
        if (flowerList != null && !flowerList.isEmpty()) {
            session.setAttribute("orders",flowerList );
            // Thực hiện mua hàng thành công
            // Ở đây, bạn có thể thêm mã xử lý để xác nhận và cập nhật đơn hàng trong cơ sở dữ liệu.
    %>
            <h1>Purchase Successful</h1>
            <p>You have successfully made a purchase. Thank you and see you again!</p>
            <%  session.removeAttribute("order");
            
        
        
        } else {
            // Giỏ hàng trống, mua hàng không thành công
    %>
            <h1>Purchase Unsuccessful</h1>
            <p>Your cart is empty. Please add items to your cart before making a purchase.</p>
    <%
        }
    %>
    <form id='return' method='post' action='CentralController'>
        <p>Return To Shop Page <input form="return" type="submit" value="shop" name="action"/></p>
    </form>


    </body>
</html>
