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
import model.Users;

/**
 *
 * @author tranh
 */
public class UsersDAO extends DBContext {

    public List<Users> getAll() {
        List<Users> list = new ArrayList<>();
        String sql = "select * from users";
        try {
            PreparedStatement st = connection.prepareCall(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Users u = new Users(rs.getInt("id"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("full_name"),
                        rs.getString("address"),
                        rs.getString("email"),
                        rs.getString("phone_number"),
                        rs.getString("date_of_birth"),
                        rs.getInt("role_id"),
                        rs.getInt("is_active"),
                        rs.getString("created_at"),
                        rs.getString("updated_at"));
                list.add(u);
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
    public List<Users> getAllActive() {
        List<Users> list = new ArrayList<>();
        String sql = "select * from users where is_active = 1";
        try {
            PreparedStatement st = connection.prepareCall(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Users u = new Users(rs.getInt("id"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("full_name"),
                        rs.getString("address"),
                        rs.getString("email"),
                        rs.getString("phone_number"),
                        rs.getString("date_of_birth"),
                        rs.getInt("role_id"),
                        rs.getInt("is_active"),
                        rs.getString("created_at"),
                        rs.getString("updated_at"));
                list.add(u);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public Users checkLogin(String username, String password) {
        String sql = "select * from users where username=? and password=?";
        try {
            PreparedStatement st = connection.prepareCall(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Users u = new Users(rs.getInt("id"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("full_name"),
                        rs.getString("address"),
                        rs.getString("email"),
                        rs.getString("phone_number"),
                        rs.getString("date_of_birth"),
                        rs.getInt("role_id"),
                        rs.getInt("is_active"),
                        rs.getString("created_at"),
                        rs.getString("updated_at"));
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Users getUserByUsername(String username) {
        String sql = "select * from users where username=?";
        try {
            PreparedStatement st = connection.prepareCall(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Users u = new Users(rs.getInt("id"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("full_name"),
                        rs.getString("address"),
                        rs.getString("email"),
                        rs.getString("phone_number"),
                        rs.getString("date_of_birth"),
                        rs.getInt("role_id"),
                        rs.getInt("is_active"),
                        rs.getString("created_at"),
                        rs.getString("updated_at"));
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    public Users getUserByUserID(int id) {
        String sql = "select * from users where id=?";
        try {
            PreparedStatement st = connection.prepareCall(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Users u = new Users(rs.getInt("id"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("full_name"),
                        rs.getString("address"),
                        rs.getString("email"),
                        rs.getString("phone_number"),
                        rs.getString("date_of_birth"),
                        rs.getInt("role_id"),
                        rs.getInt("is_active"),
                        rs.getString("created_at"),
                        rs.getString("updated_at"));
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void insertOnUsers(Users s) {
        String sql = "insert into users ([username],[password]) values (?, ?);";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, s.getUsername());
            st.setString(2, s.getPassword());

            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public void insertFullInfo(Users s) {
        String sql = "insert into users ([username],[password],full_name,date_of_birth,phone_number,address,email,updated_at) values (?,?,?,?,?,?,?,?);";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            
            st.setString(1, s.getUsername());
            st.setString(2, s.getPassword());
            st.setString(3, s.getFullName());
            st.setString(4, s.getDob());
            st.setString(5, s.getPhoneNumber());
            st.setString(6, s.getAddress());
            st.setString(7, s.getEmail());
            st.setString(8, s.getUpdatedAt());
            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public void updateInfoUsers(Users s) {
        String sql = "update users set full_name=?,date_of_birth=?,phone_number=?,address=?,email=?,is_active=?,updated_at=? where username=?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, s.getFullName());
            st.setString(2, s.getDob());
            st.setString(3, s.getPhoneNumber());
            st.setString(4, s.getAddress());
            st.setString(5, s.getEmail());
            st.setInt(6, s.getIsActive());
            st.setString(7, s.getUpdatedAt());
            st.setString(8, s.getUsername());

            int rowaffected = st.executeUpdate();
            System.out.println("Tong so dong "+rowaffected);
        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    public int getTotalUsers() {
        String sql = "SELECT COUNT(*) AS Total FROM users WHERE role_id=0";
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

    public void deleteUsers(int id) {
        String sql = "UPDATE users SET is_active = 0 WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareCall(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

}
