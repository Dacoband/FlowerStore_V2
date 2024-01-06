/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBUtils.DBConnection;
import DTO.Order;
import DTO.OrderDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author hendrix
 */
public class OrderDAO {
    
    public List<Order> listAll() throws Exception{
        
        ArrayList<Order> list = new ArrayList<>();
        
        String sql="SELECT order_id, order_date, delivery_date, status, shipping_cost, total_value, payment_method, delivery_address, customer_id, flower_total_price, shipping_total_price, total_payment "
                + "FROM Orders";
        
        try{
            
            Connection conn = DBConnection.makeConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                
                int order_id = rs.getInt("order_id");
                Date order_date= rs.getDate("order_date");
                Date delivery_date= rs.getDate("import_date");
                boolean status = rs.getBoolean("status");
                int shipping_cost = rs.getInt("shipping_cost");
                int total_value = rs.getInt("total_value");
                String payment_method = rs.getString("payment_method");
                String delivery_address = rs.getString("delivery_address");
                int customer_id = rs.getInt("customer_id");
                int flower_total_price = rs.getInt("flower_total_price");
                int shipping_total_price = rs.getInt("shipping_total_price");
                int total_payment = rs.getInt("total_payment");
                
                
                Order dto = new Order(order_id, order_date, delivery_date, status, shipping_cost, total_value, payment_method, delivery_address, customer_id, flower_total_price, shipping_total_price, total_payment);
                list.add(dto);
                
            }
            return list;
            
        }catch (SQLException ex) {
            System.out.println("Query OrderDAO error!" + ex.getMessage());
        }
        
        return null;
    }
    
    public List<Order> listNotDone() throws Exception{
        
        ArrayList<Order> list = new ArrayList<>();
        
        String sql="SELECT order_id, order_date, delivery_date, status, shipping_cost, total_value, payment_method, delivery_address, customer_id, flower_total_price, shipping_total_price, total_payment "
                + "FROM Orders "
                + "WHERE status = 0";
        
        try{
            
            Connection conn = DBConnection.makeConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                
                int order_id = rs.getInt("order_id");
                Date order_date= rs.getDate("order_date");
                Date delivery_date= rs.getDate("import_date");
                boolean status = rs.getBoolean("status");
                int shipping_cost = rs.getInt("shipping_cost");
                int total_value = rs.getInt("total_value");
                String payment_method = rs.getString("payment_method");
                String delivery_address = rs.getString("delivery_address");
                int customer_id = rs.getInt("customer_id");
                int flower_total_price = rs.getInt("flower_total_price");
                int shipping_total_price = rs.getInt("shipping_total_price");
                int total_payment = rs.getInt("total_payment");
                
                
                Order dto = new Order(order_id, order_date, delivery_date, status, shipping_cost, total_value, payment_method, delivery_address, customer_id, flower_total_price, shipping_total_price, total_payment);
                list.add(dto);
                
            }
            return list;
            
        }catch (SQLException ex) {
            System.out.println("Query OrderDAO error!" + ex.getMessage());
        }
        
        return null;
    }
    
    public List<Order> listOrderDone() throws Exception{
        
        ArrayList<Order> list = new ArrayList<>();
        
        String sql="SELECT order_id, order_date, delivery_date, status, shipping_cost, total_value, payment_method, delivery_address, customer_id, flower_total_price, shipping_total_price, total_payment "
                + "FROM Orders "
                + "WHERE status = 1";
        
        try{
            
            Connection conn = DBConnection.makeConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                
                int order_id = rs.getInt("order_id");
                Date order_date= rs.getDate("order_date");
                Date delivery_date= rs.getDate("import_date");
                boolean status = rs.getBoolean("status");
                int shipping_cost = rs.getInt("shipping_cost");
                int total_value = rs.getInt("total_value");
                String payment_method = rs.getString("payment_method");
                String delivery_address = rs.getString("delivery_address");
                int customer_id = rs.getInt("customer_id");
                int flower_total_price = rs.getInt("flower_total_price");
                int shipping_total_price = rs.getInt("shipping_total_price");
                int total_payment = rs.getInt("total_payment");
                
                
                Order dto = new Order(order_id, order_date, delivery_date, status, shipping_cost, total_value, payment_method, delivery_address, customer_id, flower_total_price, shipping_total_price, total_payment);
                list.add(dto);
                
            }
            return list;
            
        }catch (SQLException ex) {
            System.out.println("Query OrderDAO error!" + ex.getMessage());
        }
        
        return null;
    }
    
    public List<Order> listOrderByCustomer(int ID) throws Exception{
        ArrayList<Order> list = new ArrayList<>();
        
        String sql="SELECT order_id, order_date, delivery_date, status, shipping_cost, total_value, payment_method, delivery_address, customer_id, flower_total_price, shipping_total_price, total_payment "
                + "FROM Orders "
                + "WHERE customer_id = ?";
        
        try{
            
            Connection conn = DBConnection.makeConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setInt(1, ID);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                
                int order_id = rs.getInt("order_id");
                Date order_date= rs.getDate("order_date");
                Date delivery_date= rs.getDate("import_date");
                boolean status = rs.getBoolean("status");
                int shipping_cost = rs.getInt("shipping_cost");
                int total_value = rs.getInt("total_value");
                String payment_method = rs.getString("payment_method");
                String delivery_address = rs.getString("delivery_address");
                int customer_id = rs.getInt("customer_id");
                int flower_total_price = rs.getInt("flower_total_price");
                int shipping_total_price = rs.getInt("shipping_total_price");
                int total_payment = rs.getInt("total_payment");
                
                
                Order dto = new Order(order_id, order_date, delivery_date, status, shipping_cost, total_value, payment_method, delivery_address, customer_id, flower_total_price, shipping_total_price, total_payment);
                list.add(dto);
                
            }
            return list;
            
        }catch (SQLException ex) {
            System.out.println("Query OrderDAO error!" + ex.getMessage());
        }
        
        return null;
    }
    
    public boolean update(Order order, int ID) throws Exception{
        
       String sql = "UPDATE Orders "
                + "SET order_date = ?, delivery_date = ?, status = ?, shipping_cost = ?, total_value = ?, payment_method = ?, delivery_address = ?, customer_id = ?, flower_total_price = ?, shipping_total_price = ?, total_payment = ? "              
                + "WHERE order_id = ?";
        try{
            
            Connection conn = DBConnection.makeConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setDate(1, (java.sql.Date) order.getOrder_date());
            ps.setDate(2, (java.sql.Date) order.getDelivery_date());
            ps.setBoolean(3, order.isStatus());
            ps.setInt(4, order.getShipping_cost());
            ps.setInt(5, order.getTotal_value());
            ps.setString(6, order.getPayment_method());
            ps.setString(7, order.getDelivery_address());
            ps.setInt(8, order.getCustomer_id());
            ps.setInt(9, order.getFlower_total_price());
            ps.setInt(10, order.getShipping_total_price());
            ps.setInt(11, order.getTotal_payment());
            ps.setInt(12, ID);

            int rs = ps.executeUpdate();
            
            if(rs >= 1){
                return  true;
            }
            
        } catch (SQLException ex) {
            System.out.println("Query OrderDAO error!" + ex.getMessage());
        }
        
        return false;
        
    }
    
    public boolean insert(Order order) throws Exception{
        
       String sql = "INSERT INTO Orders(order_date, delivery_date, status, shipping_cost, total_value, payment_method, delivery_address, customer_id, flower_total_price, shipping_total_price, total_payment) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try{
            
            Connection conn = DBConnection.makeConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setDate(1, (java.sql.Date) order.getOrder_date());
            ps.setDate(2, (java.sql.Date) order.getDelivery_date());
            ps.setBoolean(3, order.isStatus());
            ps.setInt(4, order.getShipping_cost());
            ps.setInt(5, order.getTotal_value());
            ps.setString(6, order.getPayment_method());
            ps.setString(7, order.getDelivery_address());
            ps.setInt(8, order.getCustomer_id());
            ps.setInt(9, order.getFlower_total_price());
            ps.setInt(10, order.getShipping_total_price());
            ps.setInt(11, order.getTotal_payment());

            int rs = ps.executeUpdate();
            
            if(rs >= 1){
                return  true;
            }
            
        } catch (SQLException ex) {
            System.out.println("Query OrderDAO error!" + ex.getMessage());
        }
        
        return false;
        
    }
    
    public boolean enable(int ID) throws Exception{
        
       String sql = "UPDATE Orders "
                + "SET status = 1 "              
                + "WHERE order_id = ?";
        try{
            
            Connection conn = DBConnection.makeConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setInt(1, ID);

            int rs = ps.executeUpdate();
            
            if(rs >= 1){
                return  true;
            }
            
        } catch (SQLException ex) {
            System.out.println("Query OrderDAO error!" + ex.getMessage());
        }
        
        return false;
        
    }
    
    public boolean disable(int ID) throws Exception{
        
       String sql = "UPDATE Orders "
                + "SET status = 0 "              
                + "WHERE order_id = ?";
        try{
            
            Connection conn = DBConnection.makeConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setInt(1, ID);

            int rs = ps.executeUpdate();
            
            if(rs >= 1){
                return  true;
            }
            
        } catch (SQLException ex) {
            System.out.println("Query OrderDAO error!" + ex.getMessage());
        }
        
        return false;
        
    }
    
    
    
    public List<OrderDetail> listDetail(int ID) throws Exception{
        
        ArrayList<OrderDetail> list = new ArrayList<>();
        
        String sql="SELECT order_detail_id, order_id, flower_id, quantity, flower_unit_price, total_price "
                + "FROM Order_Detail "
                + "WHERE order_id = ?";
        
        try{
            
            Connection conn = DBConnection.makeConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setInt(1, ID);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                
                int order_detail_id = rs.getInt("order_detail_id");
                int order_id = rs.getInt("order_id");
                int flower_id = rs.getInt("flower_id");
                int quantity = rs.getInt("quantity");
                int flower_unit_price = rs.getInt("flower_unit_price");
                int total_price = rs.getInt("total_price");
                
                OrderDetail dto= new OrderDetail(order_detail_id, order_id, flower_id, quantity, flower_unit_price, total_price);
                
                list.add(dto);
                
            }
            return list;
            
        }catch (SQLException ex) {
            System.out.println("Query OrderDAO error!" + ex.getMessage());
        }
        
        return null;
    }
    
    public boolean insertDetail(OrderDetail orderDetail) throws Exception{
        
       String sql = "INSERT INTO Order_Detail(order_id, flower_id, quantity, flower_unit_price, total_price) "
                + "VALUES (?, ?, ?, ?, ?)";
        try{
            
            Connection conn = DBConnection.makeConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            

            ps.setInt(4, orderDetail.getOrder_id());
            ps.setInt(5, orderDetail.getFlower_id());
            ps.setInt(8, orderDetail.getQuantity());
            ps.setInt(9, orderDetail.getFlower_unit_price());
            ps.setInt(10, orderDetail.getTotal_price());

            int rs = ps.executeUpdate();
            
            if(rs >= 1){
                return  true;
            }
            
        } catch (SQLException ex) {
            System.out.println("Query OrderDAO error!" + ex.getMessage());
        }
        
        return false;
        
    }
}
