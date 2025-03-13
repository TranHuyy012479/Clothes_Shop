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
import model.OrderDetails;

/**
 *
 * @author tranh
 */
public class OrderDetailsDAO extends DBContext {

    public void insert(OrderDetails o) {
        String sql = "insert into order_details(order_id,product_id,price,number_of_products,total_money) values (?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setInt(1, o.getOrders().getId());
            st.setInt(2, o.getProducts().getId());
            st.setDouble(3, o.getPrice());
            st.setInt(4, o.getNumberOfProduct());
            st.setDouble(5, o.getTotalMoney());

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<OrderDetails> getOrderDetailsByOrderID(int id) {
        String sql = "select * from order_details where order_id = ?";
        List<OrderDetails> list = new ArrayList<>();
        OrdersDAO oDAO = new OrdersDAO();
        ProductsDAO pDAO = new ProductsDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                OrderDetails od = new OrderDetails(
                        rs.getInt("id"), 
                        oDAO.getOrdersByID(rs.getInt("order_id")), 
                        pDAO.getProductByID(rs.getInt("product_id")), 
                        rs.getDouble("price"), 
                        rs.getInt("number_of_products"), 
                        rs.getDouble("total_money"));
                list.add(od);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
}
