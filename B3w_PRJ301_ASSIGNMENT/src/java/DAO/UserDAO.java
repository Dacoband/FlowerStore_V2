/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBUtils.DBConnection;
import DTO.Customer;
import DTO.Users;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author hendrix
 */
public class UserDAO {
        public Users login(String email, String password) throws Exception{
        
        String sql = "select email, role from Account "
                + " where email = ? and password = ?";
        try {
            Connection conn = DBConnection.makeConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            
            
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Users userDTO =  new Users();
                userDTO.setEmail(rs.getString("email"));
                userDTO.setRole(rs.getString("role"));
                return userDTO;
            }
        }catch (SQLException ex) {
            System.out.println("Query Student error!" + ex.getMessage());
        }
        return null;
    }
        
         public static Users getAccount(String email, String password) throws Exception {
        Users result = null;
        Connection cn = DBConnection.makeConnection();
        if (cn != null) {
            String sql = "SELECT [email]\n"
                    + "      ,[password]\n"
                    + "      ,[role]\n"
                    + "  FROM [flower_shop].[dbo].[Account]\n"
                    + "  where [email] = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, email);
            ResultSet rs = pst.executeQuery();
            if (rs != null && rs.next()) {
                String e = rs.getString("email");
                String pwd = rs.getString("password");
                String role = rs.getString("role");

                result = new Users(e, pwd, role);
            }
            cn.close();
        }
        return result;
    }
        
        
        
        public static boolean signup(String email, String password) throws Exception{
            String sql = "INSERT INTO Account( email, password, role) "
                + "  VALUES (?, ?,?)";
        try {
            Connection conn = DBConnection.makeConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setString(1, email);
            ps.setString(2, password);
            ps.setString(3,"CS");
            
            
            int rs = ps.executeUpdate();
            
            if(rs >= 1){
                return  true;
            }
        }
        catch (SQLException ex) {
            System.out.println("Query Customer error!" + ex.getMessage());
        }
        return false;
        } 
        public static int insertAccount(String email, String password, String role) throws Exception {
        int rs = 0;
        Connection cn = DBConnection.makeConnection();
        if (cn != null) {
            String sql = "INSERT INTO [dbo].[Account]\n"
                    + "           ([email]\n"
                    + "           ,[password]\n"
                    + "           ,[role])\n"
                    + "     VALUES(?,?,?)\n";

            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, email);
            pst.setString(2, password);
            pst.setString(3, "CS");
            rs = pst.executeUpdate();
            cn.close();
        }
        return rs;
    }
        
        
        
        public static boolean personalInfo(Customer customer) throws Exception{
            String sql = "INSERT INTO Customer( email, name, birth_date, phone_number, address, status, orders, flag) "
                + "  VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        
            try {
            Connection conn = DBConnection.makeConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setString(1, customer.getEmail());
            ps.setString(2, customer.getName());
            ps.setDate(1, (java.sql.Date) customer.getBirth_date());
            ps.setString(1, customer.getEmail());
            ps.setString(2, customer.getName());
            ps.setString(1, customer.getEmail());
            ps.setString(2, customer.getName());
            ps.setString(1, customer.getEmail());
            ps.setString(2, customer.getName());
            ps.setString(1, customer.getEmail());
            
            
            int rs = ps.executeUpdate();
            
            if(rs >= 1){
                return  true;
            }
        }
        catch (SQLException ex) {
            System.out.println("Query Customer error!" + ex.getMessage());
        }
        return false;
        }
}
