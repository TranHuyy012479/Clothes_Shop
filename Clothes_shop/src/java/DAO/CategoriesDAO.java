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
import model.Categories;

/**
 *
 * @author tranh
 */
public class CategoriesDAO extends DBContext {

    public Categories getCategoryByID(int id) {
        String sql = "select * from categories where id=?";
        try {
            PreparedStatement st = connection.prepareCall(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Categories c = new Categories(rs.getInt("id"), rs.getString("name"));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Categories> getAll() {
        List<Categories> list = new ArrayList<>();
        String sql = "select * from categories";
        try {
            PreparedStatement st = connection.prepareCall(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Categories c = new Categories(rs.getInt("id"), rs.getString("name"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public void insertCategories(Categories c){
        String sql = "insert into categories(id,name) values (?,?)";
        try {
            PreparedStatement st = connection.prepareCall(sql);
            st.setInt(1, c.getId());
            st.setString(2, c.getName());
            
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
    
    public void editCategories(Categories c){
        String sql = "update categories set name=? where id=?";
        try {
            PreparedStatement st = connection.prepareCall(sql);
            
            st.setString(1, c.getName());
            st.setInt(2, c.getId());
            
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
    public void deleteCategories(int id){
        String sql = "delete categories where id=?";
        try {
            PreparedStatement st = connection.prepareCall(sql);
            st.setInt(1, id);
            
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
    
    
    
}
