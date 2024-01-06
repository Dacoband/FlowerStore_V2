/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBUtils.DBConnection;
import DTO.Flower;
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
public class FlowerDAO {
    
    public List<Flower> listAll() throws Exception{
        
        ArrayList<Flower> list = new ArrayList<>();
        
        String sql="SELECT flower_id, flower_name, flower_color, flower_price, status, import_date, category_id, image, quantity "
                + "FROM Flower";
        
        try{
            
            Connection conn = DBConnection.makeConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                
                int flower_id = rs.getInt("flower_id");
                String flower_name = rs.getString("flower_name");
                String flower_color = rs.getString("flower_color");
                int flower_price = rs.getInt("flower_price");
                boolean status = rs.getBoolean("status");
                Date import_date= rs.getDate("import_date");
                int category_id = rs.getInt("category_id");
                String image = rs.getString("image");
                int quantity = rs.getInt("quantity");
                
                Flower dto = new Flower(flower_id, flower_name, flower_color, flower_price, status, import_date, category_id, image, quantity);
                list.add(dto);
                
            }
            return list;
            
        }catch (SQLException ex) {
            System.out.println("Query FlowerDAO error!" + ex.getMessage());
        }
        
        return null;
    }
    
    public List<Flower> searchFlower(String flower_name) throws Exception{
        
        ArrayList<Flower> list = new ArrayList<>();
        
        String sql="SELECT flower_id, flower_name, flower_color, flower_price, status, import_date, category_id, image, quantity "
                + "FROM Flower "
                + "WHERE flower_name LIKE ?";
            try{
            
            Connection conn = DBConnection.makeConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setString(1, "%"+flower_name+"%");
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                
                int flower_id = rs.getInt("flower_id");
                String flower_Name = rs.getString("flower_name");
                String flower_color = rs.getString("flower_color");
                int flower_price = rs.getInt("flower_price");
                boolean status = rs.getBoolean("status");
                Date import_date= rs.getDate("import_date");
                int category_id = rs.getInt("category_id");
                String image = rs.getString("image");
                int quantity = rs.getInt("quantity");
                
                Flower dto = new Flower(flower_id, flower_Name, flower_color, flower_price, status, import_date, category_id, image, quantity);
                list.add(dto);
                
            }
            return list;
            
        }catch (SQLException ex) {
            System.out.println("Query FlowerDAO error!" + ex.getMessage());
        }
        
        return null;
    }
    
    public Flower loadFlower(int id) throws Exception{
        
            Flower flower= null;
            
            String sql="SELECT flower_id, flower_name, flower_color, flower_price, status, import_date, category_id, image, quantity "
                + "FROM Flower "
                + "WHERE flower_id = ?";
            try{
            
            Connection conn = DBConnection.makeConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setInt(1, id);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                
                int flower_id = rs.getInt("flower_id");
                String flower_Name = rs.getString("flower_name");
                String flower_color = rs.getString("flower_color");
                int flower_price = rs.getInt("flower_price");
                boolean status = rs.getBoolean("status");
                Date import_date= rs.getDate("import_date");
                int category_id = rs.getInt("category_id");
                String image = rs.getString("image");
                int quantity = rs.getInt("quantity");
                
                flower = new Flower(flower_id, flower_Name, flower_color, flower_price, status, import_date, category_id, image, quantity);
                
                return flower;
            }
            
        }catch (SQLException ex) {
            System.out.println("Query FlowerDAO error!" + ex.getMessage());
        }
            return null;
    }
    
    public boolean insert(Flower flower) throws Exception{
        
        String sql = "INSERT INTO Flower( flower_name, flower_color, flower_price, status, import_date, category_id, image, quantity) "               
                + " VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try{
            
            Connection conn = DBConnection.makeConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setString(1, flower.getFlower_name());
            ps.setString(2, flower.getFlower_color());
            ps.setInt(3, flower.getFlower_price());
            ps.setBoolean(4, flower.isStatus());
            ps.setDate(5, (java.sql.Date) flower.getImport_date());
            ps.setInt(6, flower.getCategory_id());
            ps.setString(7, flower.getImage());
            ps.setInt(8, flower.getQuantity());
            
            
            int rs = ps.executeUpdate();
            
            if(rs >= 1){
                return  true;
            }
            
        } catch (SQLException ex) {
            System.out.println("Query FlowerDAO error!" + ex.getMessage());
        }
        
        return false;
    }
    
    public boolean update(Flower flower, int ID) throws Exception{
        
        String sql = "UPDATE Flower "
                + "SET flower_name = ?, flower_color = ?, flower_price = ?, status = ?, import_date = ?, category_id = ?, image = ?, quantity = ? "              
                + "WHERE flower_id = ?";
        try{
            
            Connection conn = DBConnection.makeConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setString(1, flower.getFlower_name());
            ps.setString(2, flower.getFlower_color());
            ps.setInt(3, flower.getFlower_price());
            ps.setBoolean(4, flower.isStatus());
            ps.setDate(5, (java.sql.Date) flower.getImport_date());
            ps.setInt(6, flower.getCategory_id());
            ps.setString(7, flower.getImage());
            ps.setInt(8, flower.getQuantity());
            ps.setInt(9, ID);
            
            
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
        String sql = "UPDATE Flower "
                + "SET status = 0 "              
                + "WHERE flower_id = ?";
        try{
            
            Connection conn = DBConnection.makeConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setInt(1, ID);
            
            
            int rs = ps.executeUpdate();
            
            if(rs >= 1){
                return  true;
            }
            
        } catch (SQLException ex) {
            System.out.println("Query FlowerDAO error!" + ex.getMessage());
        }
        
        return false;
    }
    
    public boolean enable(int ID) throws Exception{
        String sql = "UPDATE Flower "
                + "SET status = 1 "              
                + "WHERE flower_id = ?";
        try{
            
            Connection conn = DBConnection.makeConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setInt(1, ID);
            
            
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
