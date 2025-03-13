/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author tranh
 */
public class Shipping {
    private int id;
    private double totalMoney;
    private Users users;
    private String status;

    public Shipping() {
    }

    public Shipping(int id, double totalMoney, Users users, String status) {
        this.id = id;
        this.totalMoney = totalMoney;
        this.users = users;
        this.status = status;
    }

    public Shipping(double totalMoney, Users users, String status) {
        this.totalMoney = totalMoney;
        this.users = users;
        this.status = status;
    }
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(double totalMoney) {
        this.totalMoney = totalMoney;
    }

    public Users getUsers() {
        return users;
    }

    public void setUsers(Users users) {
        this.users = users;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
}
