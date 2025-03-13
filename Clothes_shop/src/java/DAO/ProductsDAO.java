/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import dal.DBContext;
import java.util.ArrayList;
import java.util.List;
import model.Products;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author tranh
 */
public class ProductsDAO extends DBContext {

    public List<Products> getProductHome() {
        List<Products> list = new ArrayList<>();
        String sql = "select * from products where status = 1";
        CategoriesDAO cDAO = new CategoriesDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Products s = new Products(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getFloat("price"),
                        rs.getInt("quantity"),
                        rs.getString("description"),
                        rs.getString("image"),
                        rs.getString("created_at"),
                        rs.getString("updated_at"),
                        cDAO.getCategoryByID(rs.getInt("category_id")));
                list.add(s);
                if (list.size() > 7) {
                    break;
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Products> getProductsSelling() {
        List<Products> list = new ArrayList<>();
        String sql = "select * from products where status = 1";
        CategoriesDAO cDAO = new CategoriesDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Products s = new Products(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getFloat("price"),
                        rs.getInt("quantity"),
                        rs.getString("description"),
                        rs.getString("image"),
                        rs.getString("created_at"),
                        rs.getString("updated_at"),
                        cDAO.getCategoryByID(rs.getInt("category_id")),
                        rs.getInt("status"));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public List<Products> getAllProducts() {
        List<Products> list = new ArrayList<>();
        String sql = "select * from products";
        CategoriesDAO cDAO = new CategoriesDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Products s = new Products(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getFloat("price"),
                        rs.getInt("quantity"),
                        rs.getString("description"),
                        rs.getString("image"),
                        rs.getString("created_at"),
                        rs.getString("updated_at"),
                        cDAO.getCategoryByID(rs.getInt("category_id")),
                        rs.getInt("status"));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public List<Products> getRecentProduct() {
        List<Products> list = new ArrayList<>();
        String sql = "SELECT TOP 5 * FROM products WHERE status = 1 ORDER BY created_at DESC;";
        CategoriesDAO cDAO = new CategoriesDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Products s = new Products(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getFloat("price"),
                        rs.getInt("quantity"),
                        rs.getString("description"),
                        rs.getString("image"),
                        rs.getString("created_at"),
                        rs.getString("updated_at"),
                        cDAO.getCategoryByID(rs.getInt("category_id")),
                        rs.getInt("status"));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Products getProductByID(int id) {
        String sql = "select * from products where id=?";
        CategoriesDAO cDAO = new CategoriesDAO();
        try {
            PreparedStatement st = connection.prepareCall(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Products s = new Products(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getFloat("price"),
                        rs.getInt("quantity"),
                        rs.getString("description"),
                        rs.getString("image"),
                        rs.getString("created_at"),
                        rs.getString("updated_at"),
                        cDAO.getCategoryByID(rs.getInt("category_id")));
                return s;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public int getTotalProducts() {
        String sql = "SELECT COUNT(*) AS Total FROM products WHERE status=1";
        int result = 0;
        try {
            PreparedStatement st = connection.prepareCall(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                result = rs.getInt("Total");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return result;
    }

    public int getProductLowQuantity() {
        String sql = "SELECT COUNT(*) AS Total from products WHERE quantity < 10 AND status = 1";
        int result = 0;
        try {
            PreparedStatement st = connection.prepareCall(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                result = rs.getInt("Total");
            }
        } catch (SQLException e) {
        }
        return result;
    }
    
    public int getQuantityByCategoryID(int id) {
        String sql = "SELECT COUNT(*) AS Total from products WHERE category_id =? and status = 1";
        int result = 0;
        try {
            PreparedStatement st = connection.prepareCall(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                result = rs.getInt("Total");
            }
        } catch (SQLException e) {
        }
        return result;
    }

    public void editProducts(Products p) {
        String sql = "update products set name=?,price=?,quantity=?,description=?,updated_at=?,category_id=? where id=?";
        try {
            PreparedStatement st = connection.prepareCall(sql);
            st.setString(1, p.getName());
            st.setDouble(2, p.getPrice());
            st.setInt(3, p.getQuantity());
            st.setString(4, p.getDescription());
            
            st.setString(5, p.getUpdateddAt());
            st.setInt(6, p.getCategory().getId());
            st.setInt(7, p.getId());
            
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public void deleteProducts(int id){
        String sql = "UPDATE products SET status = 0 WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareCall(sql);
            st.setInt(1, id);
            
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
    public void insertProducts(Products p){
        String sql = "insert into products(name,price,quantity,description,image,category_id) values(?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareCall(sql);
            st.setString(1, p.getName());
            st.setDouble(2, p.getPrice());
            st.setInt(3, p.getQuantity());
            st.setString(4, p.getDescription());
            st.setString(5, p.getImage());
            st.setInt(6, p.getCategory().getId());
            
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
