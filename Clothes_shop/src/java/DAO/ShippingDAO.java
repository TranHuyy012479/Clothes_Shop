/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Shipping;

/**
 *
 * @author tranh
 */
public class ShippingDAO extends DBContext{
    
    public List<Shipping> getAllOrders(){
        List<Shipping> list = new ArrayList<>();
        String sql = "select * from shipping";
        UsersDAO uDAO = new UsersDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Shipping s = new Shipping(rs.getInt("id"),
                        rs.getDouble("total_money"),
                        uDAO.getUserByUserID(rs.getInt("user_id")),
                        rs.getString("status"));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public Shipping getShippingByID(int id){
        String sql = "select * from shipping where id=?";
        UsersDAO uDAO = new UsersDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Shipping s = new Shipping(rs.getInt("id"),
                        rs.getDouble("total_money"),
                        uDAO.getUserByUserID(rs.getInt("user_id")),
                        rs.getString("status"));
                return s;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    public void insert(Shipping s){
        String sql = "insert into shipping(total_money,user_id,status) values (?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setDouble(1, s.getTotalMoney());
            st.setInt(2, s.getUsers().getId());
            st.setString(3, s.getStatus());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public int getShippingIDByUserID(int id){
        String sql = "SELECT MAX(id) AS max_id FROM shipping WHERE user_id = ?";
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
    
}
