/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author tranh
 */
public class OrderDetails {
    private int id;
    private Orders orders;
    private Products products;
    private double price;
    private int numberOfProduct;
    private double totalMoney;

    public OrderDetails() {
    }

    public OrderDetails(int id, Orders orders, Products products, double price, int numberOfProduct, double totalMoney) {
        this.id = id;
        this.orders = orders;
        this.products = products;
        this.price = price;
        this.numberOfProduct = numberOfProduct;
        this.totalMoney = totalMoney;
    }

    public OrderDetails(Orders orders, Products products, double price, int numberOfProduct, double totalMoney) {
        this.orders = orders;
        this.products = products;
        this.price = price;
        this.numberOfProduct = numberOfProduct;
        this.totalMoney = totalMoney;
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Orders getOrders() {
        return orders;
    }

    public void setOrders(Orders orders) {
        this.orders = orders;
    }

    public Products getProducts() {
        return products;
    }

    public void setProducts(Products products) {
        this.products = products;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getNumberOfProduct() {
        return numberOfProduct;
    }

    public void setNumberOfProduct(int numberOfProduct) {
        this.numberOfProduct = numberOfProduct;
    }

    public double getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(double totalMoney) {
        this.totalMoney = totalMoney;
    }
    
    
    
    
    
}
