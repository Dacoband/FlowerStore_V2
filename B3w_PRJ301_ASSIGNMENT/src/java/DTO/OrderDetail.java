/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

/**
 *
 * @author hendrix
 */
public class OrderDetail {
    
    private int order_detail_id;
    private int order_id;
    private int flower_id;
    private int quantity;
    private int flower_unit_price;
    private int total_price;

    public OrderDetail(int order_detail_id, int order_id, int flower_id, int quantity, int flower_unit_price, int total_price) {
        this.order_detail_id = order_detail_id;
        this.order_id = order_id;
        this.flower_id = flower_id;
        this.quantity = quantity;
        this.flower_unit_price = flower_unit_price;
        this.total_price = total_price;
    }

    public OrderDetail() {
    }

    public int getOrder_detail_id() {
        return order_detail_id;
    }

    public void setOrder_detail_id(int order_detail_id) {
        this.order_detail_id = order_detail_id;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getFlower_id() {
        return flower_id;
    }

    public void setFlower_id(int flower_id) {
        this.flower_id = flower_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getFlower_unit_price() {
        return flower_unit_price;
    }

    public void setFlower_unit_price(int flower_unit_price) {
        this.flower_unit_price = flower_unit_price;
    }

    public int getTotal_price() {
        return total_price;
    }

    public void setTotal_price(int total_price) {
        this.total_price = total_price;
    }

   
    
    
}
