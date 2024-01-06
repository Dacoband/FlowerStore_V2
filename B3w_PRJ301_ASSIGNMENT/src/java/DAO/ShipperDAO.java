/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;


import DBUtils.DBConnection;
import DTO.Shipper;
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
public class ShipperDAO {
    
    public List<Shipper> listAll() throws Exception{
        
        ArrayList<Shipper> list = new ArrayList<>();
        
        String sql="SELECT shipper_id, email, name, birth_date, phone_number, address, status, order_id "
                + "FROM Shipper";
        
        try{
            
            Connection conn = DBConnection.makeConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                
                int shipper_id = rs.getInt("shipper_id");
                String email = rs.getString("email");
                String name = rs.getString("name");
                Date birth_date= rs.getDate("birth_date");
                String phone_number = rs.getString("phone_number");
                String address = rs.getString("address");
                boolean status = rs.getBoolean("status");
                int order_id = rs.getInt("order_id");
                
                Shipper dto = new Shipper(shipper_id ,email, name, birth_date, phone_number, address, status, order_id);
                list.add(dto);
                
            }
            return list;
            
        }catch (SQLException ex) {
            System.out.println("Query ShipperDAO error!" + ex.getMessage());
        }
        
        return null;
    }
    
    public List<Shipper> searchShipper(String Name) throws Exception{
        
        ArrayList<Shipper> list = new ArrayList<>();
        
        String sql="SELECT shipper_id, email, name, birth_date, phone_number, address, status, order_id "
                + "FROM Shipper "
                + "WHERE name LIKE ?";
        
        try{
            
            Connection conn = DBConnection.makeConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setString(1, "%"+Name+"%");
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                
                int shipper_id = rs.getInt("shipper_id");
                String email = rs.getString("email");
                String name = rs.getString("name");
                Date birth_date= rs.getDate("birth_date");
                String phone_number = rs.getString("phone_number");
                String address = rs.getString("address");
                boolean status = rs.getBoolean("status");
                int order_id = rs.getInt("order_id");
                
                Shipper dto = new Shipper(shipper_id ,email, name, birth_date, phone_number, address, status, order_id);
                list.add(dto);
                
            }
            return list;
            
        }catch (SQLException ex) {
            System.out.println("Query ShipperDAO error!" + ex.getMessage());
        }
        
        return null;
    }
    
    public Shipper loadShipper(int id) throws Exception{
        
            Shipper shipper= null;
            
            String sql="SELECT shipper_id, email, name, birth_date, phone_number, address, status, order_id "
                + "FROM Shipper "
                + "WHERE shipper_id = ?";
            try{
            
            Connection conn = DBConnection.makeConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setInt(1, id);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                
                int shipper_id = rs.getInt("shipper_id");
                String email = rs.getString("email");
                String name = rs.getString("name");
                Date birth_date= rs.getDate("birth_date");
                String phone_number = rs.getString("phone_number");
                String address = rs.getString("address");
                boolean status = rs.getBoolean("status");
                int order_id = rs.getInt("order_id");
                
                shipper = new Shipper(shipper_id, email, name, birth_date, phone_number, address, status, order_id);
                
                return shipper;
            }
            
        }catch (SQLException ex) {
            System.out.println("Query ShipperDAO error!" + ex.getMessage());
        }
            return null;
    }
    
    public boolean insert(Shipper shipper) throws Exception{
        
        String sql = "INSERT INTO Shipper( email, name, birth_date, phone_number, address, status, order_id) "               
                + " VALUES (?, ?, ?, ?, ?, ?, ?)";
        try{
            
            Connection conn = DBConnection.makeConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setString(1, shipper.getEmail());
            ps.setString(2, shipper.getName());
            ps.setDate(3, (java.sql.Date) shipper.getBirth_date());
            ps.setString(4, shipper.getPhone_number());
            ps.setString(5, shipper.getAddress());
            ps.setBoolean(6, shipper.isStatus());
            ps.setInt(7, shipper.getOrder_id());

            
            
            int rs = ps.executeUpdate();
            
            if(rs >= 1){
                return  true;
            }
            
        } catch (SQLException ex) {
            System.out.println("Query FlowerDAO error!" + ex.getMessage());
        }
        
        return false;
    }
    
    public boolean update(Shipper shipper, int ID) throws Exception{
        
        String sql = "UPDATE Shipper "
                + "SET email = ?, name = ?, birth_date = ?, phone_number = ?, address = ?, status = ?, order_id = ?"              
                + "WHERE shipper_id = ?";
        try{
            
            Connection conn = DBConnection.makeConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setString(1, shipper.getEmail());
            ps.setString(2, shipper.getName());
            ps.setDate(3, (java.sql.Date) shipper.getBirth_date());
            ps.setString(4, shipper.getPhone_number());
            ps.setString(5, shipper.getAddress());
            ps.setBoolean(6, shipper.isStatus());
            ps.setInt(7, shipper.getOrder_id());
            ps.setInt(8, ID);

            int rs = ps.executeUpdate();
            
            if(rs >= 1){
                return  true;
            }
            
        } catch (SQLException ex) {
            System.out.println("Query FlowerDAO error!" + ex.getMessage());
        }
        
        return false;
    }
    
    public boolean disable(int ID) throws Exception{
        String sql = "UPDATE Shipper "
                + "SET status = 0 "              
                + "WHERE shipper_id = ?";
        try{
            
            Connection conn = DBConnection.makeConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setInt(1, ID);
            
            
            int rs = ps.executeUpdate();
            
            if(rs >= 1){
                return  true;
            }
            
        } catch (SQLException ex) {
            System.out.println("Query Shipper error!" + ex.getMessage());
        }
        
        return false;
    }
    
    public boolean enable(int ID) throws Exception{
        String sql = "UPDATE Shipper "
                + "SET status = 1 "              
                + "WHERE shipper_id = ?";
        try{
            
            Connection conn = DBConnection.makeConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setInt(1, ID);
            
            
            int rs = ps.executeUpdate();
            
            if(rs >= 1){
                return  true;
            }
            
        } catch (SQLException ex) {
            System.out.println("Query shipper error!" + ex.getMessage());
        }
        
        return false;
    }   
}
