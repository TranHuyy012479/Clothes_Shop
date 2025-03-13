/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.shop;

import DAO.OrderDetailsDAO;
import DAO.OrdersDAO;
import DAO.ProductsDAO;
import DAO.ShippingDAO;
import Validation.Validation;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.OrderDetails;
import model.Orders;
import model.Shipping;
import model.Users;

/**
 *
 * @author tranh
 */
@WebServlet(name = "CheckOut", urlPatterns = {"/checkout"})
public class CheckOut extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CheckOut</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckOut at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductsDAO pDAO =  new ProductsDAO();
        ShippingDAO shipDAO = new ShippingDAO();
        OrdersDAO ordersDAO = new OrdersDAO();
        OrderDetailsDAO odDAO = new OrderDetailsDAO();
        Validation valid = new Validation();
        
        Users users = (Users) request.getSession().getAttribute("users");
        Cookie cookieList[] = request.getCookies();
        
        
        //Xóa đi cart của khách sau khi mua hàng
        for (Cookie cookie : cookieList) {
            if(cookie.getName().equals(users.getUsername()+"cart")){
                cookie.setPath("/");
                cookie.setMaxAge(0);
                response.addCookie(cookie);
            }
        }
        
        String[] productIds = request.getParameterValues("productId");
        String[] quantities = request.getParameterValues("quantity");
        String shippingAddress = request.getParameter("shipaddress");
        
        //tính tổng tiền của orders 
        double totalMoney = 0;
        for (int i = 0; i < productIds.length; i++) {
            int quantity = Integer.parseInt(quantities[i]);
            double price = pDAO.getProductByID(Integer.parseInt(productIds[i])).getPrice();
            totalMoney += quantity * price;
        }
        
        Shipping s = new Shipping(totalMoney, users, "delivering");
        shipDAO.insert(s);
        int shippingID = shipDAO.getShippingIDByUserID(users.getId());
        s.setId(shippingID);
        Orders o = new Orders(users, shippingAddress, "hàng siêu chất lượng", valid.getCurrentDateTime() , "processing", totalMoney, s);
        ordersDAO.insert(o);
        int ordersID = ordersDAO.getOrdersIDByUserID(users.getId());
        o.setId(ordersID);
        for (int i = 0; i < productIds.length; i++) {
            int quantity = Integer.parseInt(quantities[i]);
            double price = pDAO.getProductByID(Integer.parseInt(productIds[i])).getPrice();
            double totalperProduct = quantity * price;
            odDAO.insert(new OrderDetails(
                    o, 
                    pDAO.getProductByID(Integer.parseInt(productIds[i])),
                    price , 
                    quantity, 
                    totalperProduct)
            );
        }
        response.sendRedirect("trackorder");
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
