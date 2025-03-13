/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author tranh
 */
public class Orders {
    private int id;
    private Users users;
    private String shippingAddress,note,orderDate,status;
    private double totalMoney;
    private Shipping shipping;

    public Orders() {
    }

    public Orders(int id, Users users, String shippingAddress, String note, String orderDate, String status, double totalMoney, Shipping shipping) {
        this.id = id;
        this.users = users;
        this.shippingAddress = shippingAddress;
        this.note = note;
        this.orderDate = orderDate;
        this.status = status;
        this.totalMoney = totalMoney;
        this.shipping = shipping;
    }

    public Orders(Users users, String shippingAddress, String note, String orderDate, String status, double totalMoney, Shipping shipping) {
        this.users = users;
        this.shippingAddress = shippingAddress;
        this.note = note;
        this.orderDate = orderDate;
        this.status = status;
        this.totalMoney = totalMoney;
        this.shipping = shipping;
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Users getUsers() {
        return users;
    }

    public void setUsers(Users users) {
        this.users = users;
    }

    public String getShippingAddress() {
        return shippingAddress;
    }

    public void setShippingAddress(String shippingAddress) {
        this.shippingAddress = shippingAddress;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public double getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(double totalMoney) {
        this.totalMoney = totalMoney;
    }

    public Shipping getShipping() {
        return shipping;
    }

    public void setShipping(Shipping shipping) {
        this.shipping = shipping;
    }
    
    
    
}
