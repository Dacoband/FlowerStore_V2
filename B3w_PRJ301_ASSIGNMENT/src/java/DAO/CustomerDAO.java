/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBUtils.DBConnection;
import DTO.Customer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author hendrix
 */
public class CustomerDAO {
    
    public List<Customer> listAll() throws Exception{
        
        ArrayList<Customer> list = new ArrayList<>();
        
        String sql="SELECT customer_id, email, name, birth_date, phone_number, address, status, flag "
                + "FROM Customer";
        
        try{
            Connection conn = DBConnection.makeConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                
                int customer_id = rs.getInt("customer_id");
                String email = rs.getString("email");
                String name = rs.getString("name");
                Date birth_date= rs.getDate("birth_date");
                String phone_number = rs.getString("phone_number");
                String address = rs.getString("address");
                boolean status = rs.getBoolean("status");
                int flag = rs.getInt("flag");
                
                
                Customer dto = new Customer(customer_id, email, name, birth_date, phone_number, address, status, flag);
                list.add(dto);
                
            }
            return list;
            
        }catch (SQLException ex) {
            System.out.println("Query listAll error!" + ex.getMessage());
        }
        
        return null;
    }
    
    public List<Customer> searchCustomerByName(String Name) throws Exception{
        
        ArrayList<Customer> list = new ArrayList<>();
        
        String sql="SELECT customer_id, email, name, birth_date, phone_number, address, status, flag "
                + "FROM Customer "
                + "WHERE name LIKE ?";
        
        try{
            
            Connection conn = DBConnection.makeConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setString(1, "%"+Name+"%");
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                
                int customer_id = rs.getInt("customer_id");
                String email = rs.getString("email");
                String name = rs.getString("name");
                Date birth_date= rs.getDate("birth_date");
                String phone_number = rs.getString("phone_number");
                String address = rs.getString("address");
                boolean status = rs.getBoolean("status");
                int flag = rs.getInt("flag");
                Customer dto = new Customer(customer_id, email, name, birth_date, phone_number, address, status, flag);
                list.add(dto);
            }
            return list;
            
        }catch (SQLException ex) {
            System.out.println("Query listAll error!" + ex.getMessage());
        }
        
        return null;
    }
    
    public List<Customer> searchCustomerByEmail(String Email) throws Exception{
        
        ArrayList<Customer> list = new ArrayList<>();
        
        String sql="SELECT customer_id, email, name, birth_date, phone_number, address, status, flag "
                + "FROM Customer "
                + "WHERE email LIKE ?";
        try{
            Connection conn = DBConnection.makeConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%"+Email+"%");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                int customer_id = rs.getInt("customer_id");
                String email = rs.getString("email");
                String name = rs.getString("name");
                Date birth_date= rs.getDate("birth_date");
                String phone_number = rs.getString("phone_number");
                String address = rs.getString("address");
                boolean status = rs.getBoolean("status");
                int flag = rs.getInt("flag");

                Customer dto = new Customer(customer_id, email, name, birth_date, phone_number, address, status, flag);
                list.add(dto);
                
            }
            return list;
            
        }catch (SQLException ex) {
            System.out.println("Query listAll error!" + ex.getMessage());
        }
        
        return null;
    }
    
    public Customer loadCustomer(int id) throws Exception{
        
        Customer customer=null;
        String sql="SELECT customer_id, email, name, birth_date, phone_number, address, status, flag "
                + "FROM Customer "
                + "WHERE customer_id = ?";
        
        try{
            
            Connection conn = DBConnection.makeConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setInt(1, id);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                
                int customer_id = rs.getInt("customer_id");
                String email = rs.getString("email");
                String name = rs.getString("name");
                Date birth_date= rs.getDate("birth_date");
                String phone_number = rs.getString("phone_number");
                String address = rs.getString("address");
                boolean status = rs.getBoolean("status");
                int flag = rs.getInt("flag");
                
                
                customer = new Customer(customer_id, email, name, birth_date, phone_number, address, status, flag);
                
            }
            return customer;
            
        }catch (SQLException ex) {
            System.out.println("Query listAll error!" + ex.getMessage());
        }
        
        return null;
    }
    public boolean insert(Customer customer) throws Exception{
        
        String sql = "INSERT INTO Customer( email, name, birth_date, phone_number, address, status, flag) "               
                + " VALUES (?, ?, ?, ?, ?, ?, ?)";
        try{
            
            Connection conn = DBConnection.makeConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setString(1, customer.getEmail());
            ps.setString(2, customer.getName());
            ps.setDate(3, (java.sql.Date) customer.getBirth_date());
            ps.setString(4, customer.getPhone_number());
            ps.setString(5, customer.getAddress());
            ps.setBoolean(6, customer.isStatus());
            ps.setInt(7, customer.getFlag());
            
            
            int rs = ps.executeUpdate();
            
            if(rs >= 1){
                return  true;
            }
            
        } catch (SQLException ex) {
            System.out.println("Query insert error!" + ex.getMessage());
        }
        return false;
    }
    
    public static int CreateCus(
            String email,
            String name,
            String birth_date,
            String phone_number,
            String address,
            Boolean status,
            String orders,
            int flag
    ) {
        Connection con = null;
        PreparedStatement pts = null;
        int result = 0;
        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "INSERT INTO [dbo].[Customer]\n"
                        + "           ([email]\n"
                        + "           ,[name]\n"
                        + "           ,[birth_date]\n"
                        + "           ,[phone_number]\n"
                        + "           ,[address]\n"
                        + "           ,[status]\n"
                        + "           ,[orders]\n"
                        + "           ,[flag])\n"
                        + "     VALUES\n"
                        + "           (?,?,?,?,?,?,?,?)";
                pts = con.prepareStatement(sql);
                pts.setString(1, email);
                pts.setString(2, name);
                
                pts.setDate(3, java.sql.Date.valueOf(birth_date));
                pts.setString(4, phone_number);
                pts.setString(5, address);
               
                pts.setBoolean(6, status);
                pts.setString(7, orders);
                pts.setInt(8, flag);
                result = pts.executeUpdate();
            }
        } catch (Exception e) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            if (pts != null) {
                try {
                    pts.close();
                } catch (SQLException e) {
                    // Handle the exception
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    // Handle the exception
                }
            }
        }
        return result;
    }
    
    public boolean update(Customer customer, int id) throws Exception{
        
        String sql = "UPDATE Customer "
                + "SET email = ?, name = ?, birth_date = ?, phone_number = ?, address = ?, status = ?, flag = ? "              
                + "WHERE customer_id = ?";
        
        try{
            
            Connection conn = DBConnection.makeConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setString(1, customer.getEmail());
            ps.setString(2, customer.getName());
            ps.setDate(3, (java.sql.Date) customer.getBirth_date());
            ps.setString(4, customer.getPhone_number());
            ps.setString(5, customer.getAddress());
            ps.setBoolean(6, customer.isStatus());
            ps.setInt(7, customer.getFlag());
            ps.setInt(8, id);
            
            int rs = ps.executeUpdate();
            
            if(rs >= 1){
                return  true;
            }
            
        } catch (SQLException ex) {
            System.out.println("Query insert error!" + ex.getMessage());
        }
        return false;
    }
    
    public boolean disable(int id) throws Exception{
        String sql = "UPDATE Customer "
                + "SET status = 0 "              
                + "WHERE customer_id = ?";
        try{
            
            Connection conn = DBConnection.makeConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setInt(1, id);
            
            
            int rs = ps.executeUpdate();
            
            if(rs >= 1){
                return  true;
            }
            
        } catch (SQLException ex) {
            System.out.println("Query FlowerDAO error!" + ex.getMessage());
        }
        
        return false;
    }
    
    public boolean enable(int id) throws Exception{
        String sql = "UPDATE Customer "
                + "SET status = 1 "              
                + "WHERE customer_id = ?";
        try{
            
            Connection conn = DBConnection.makeConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setInt(1, id);
            
            
            int rs = ps.executeUpdate();
            
            if(rs >= 1){
                return  true;
            }
            
        } catch (SQLException ex) {
            System.out.println("Query FlowerDAO error!" + ex.getMessage());
        }
        
        return false;
    }
}
