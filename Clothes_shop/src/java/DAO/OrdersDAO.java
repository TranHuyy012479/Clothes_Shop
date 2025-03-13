/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import dal.DBContext;
import java.util.ArrayList;
import java.util.List;
import model.Orders;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author tranh
 */
public class OrdersDAO extends DBContext {
    
    
    
    
    public List<Orders> getAllOrders() {
        List<Orders> list = new ArrayList<>();
        String sql = "select * from orders";
        UsersDAO uDAO = new UsersDAO();
        ShippingDAO shipDAO = new ShippingDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Orders o = new Orders(
                        rs.getInt("id"),
                        uDAO.getUserByUserID(rs.getInt("user_id")),
                        rs.getString("shipping_address"),
                        rs.getString("note"),
                        rs.getString("order_date"),
                        rs.getString("status"),
                        rs.getDouble("total_money"),
                        shipDAO.getShippingByID(rs.getInt("shipping_id")));
                list.add(o);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Orders> getOrdersByUserID(int id) {
        List<Orders> list = new ArrayList<>();
        String sql = "select * from orders where user_id = ?";
        UsersDAO uDAO = new UsersDAO();
        ShippingDAO shipDAO = new ShippingDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Orders o = new Orders(
                        rs.getInt("id"),
                        uDAO.getUserByUserID(rs.getInt("user_id")),
                        rs.getString("shipping_address"),
                        rs.getString("note"),
                        rs.getString("order_date"),
                        rs.getString("status"),
                        rs.getDouble("total_money"),
                        shipDAO.getShippingByID(rs.getInt("shipping_id")));
                list.add(o);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void insert(Orders o) {
        String sql = "insert into orders(user_id,shipping_address,note,order_date,status,total_money,shipping_id) values (?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setInt(1, o.getUsers().getId());
            st.setString(2, o.getShippingAddress());
            st.setString(3, o.getNote());
            st.setString(4, o.getOrderDate());
            st.setString(5, o.getStatus());
            st.setDouble(6, o.getTotalMoney());
            st.setInt(7, o.getShipping().getId());

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int getOrdersIDByUserID(int id) {
        String sql = "SELECT MAX(id) AS max_id FROM orders WHERE user_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("max_id");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public int getTotalOrders() {
        String sql = "SELECT COUNT(*) AS total_orders FROM orders";
        int totalOrders = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                totalOrders = rs.getInt("total_orders");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return totalOrders;
    }

    public List<Orders> getRecentOrders() {
        String sql = "SELECT top 10 * FROM orders ORDER BY order_date DESC";
        List<Orders> recentOrders = new ArrayList<>();
        UsersDAO uDAO = new UsersDAO();
        ShippingDAO shipDAO = new ShippingDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Orders o = new Orders(
                        rs.getInt("id"),
                        uDAO.getUserByUserID(rs.getInt("user_id")),
                        rs.getString("shipping_address"),
                        rs.getString("note"),
                        rs.getString("order_date"),
                        rs.getString("status"),
                        rs.getDouble("total_money"),
                        shipDAO.getShippingByID(rs.getInt("shipping_id")));
                recentOrders.add(o);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return recentOrders;
    }

    public Orders getOrdersByID(int id) {
        String sql = "select * from orders where id = ?";
        UsersDAO uDAO = new UsersDAO();
        ShippingDAO shipDAO = new ShippingDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Orders o = new Orders(
                        rs.getInt("id"),
                        uDAO.getUserByUserID(rs.getInt("user_id")),
                        rs.getString("shipping_address"),
                        rs.getString("note"),
                        rs.getString("order_date"),
                        rs.getString("status"),
                        rs.getDouble("total_money"),
                        shipDAO.getShippingByID(rs.getInt("shipping_id")));
                return o;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    public void updateStatus(int id){
        String sql = "UPDATE orders SET status = 'Done' WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            
            st.executeQuery();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public double getTotalMoneyByYear(int year){
        String sql = "SELECT SUM(total_money) AS TotalSale from [orders] where year([order_date]) = ? AND Status = 'Done'";
        double result = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, year);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                result = rs.getDouble("TotalSale");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return result;
    }
    
    
    public double getTotalMoneyByMonth(int month){
        String sql = "SELECT SUM(total_money) AS TotalSale from [orders] where month([order_date]) = ? AND Status = 'Done'";
        double result = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, month);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                result = rs.getDouble("TotalSale");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return result;
    }
    
    
    public double getTotalRevenue(){
        String sql = "SELECT SUM(total_money) AS TotalSale from [orders] where status = 'Done'";
        double result = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                result = rs.getDouble("TotalSale");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return result;
    }

}
