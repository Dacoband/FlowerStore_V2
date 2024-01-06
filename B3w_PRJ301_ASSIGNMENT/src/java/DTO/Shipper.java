/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

import java.util.Date;

/**
 *
 * @author hendrix
 */
public class Shipper {
    
    private int shipper_id;
    private String email;
    private String name;
    private Date birth_date;
    private String phone_number;
    private String address;
    private boolean status;
    private int order_id;

    public Shipper() {
    }

    public Shipper(int shipper_id, String email, String name, Date birth_date, String phone_number, String address, boolean status, int order_id) {
        this.shipper_id = shipper_id;
        this.email = email;
        this.name = name;
        this.birth_date = birth_date;
        this.phone_number = phone_number;
        this.address = address;
        this.status = status;
        this.order_id = order_id;
    }

    public int getShipper_id() {
        return shipper_id;
    }

    public void setShipper_id(int shipper_id) {
        this.shipper_id = shipper_id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getBirth_date() {
        return birth_date;
    }

    public void setBirth_date(Date birth_date) {
        this.birth_date = birth_date;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    
    
}
