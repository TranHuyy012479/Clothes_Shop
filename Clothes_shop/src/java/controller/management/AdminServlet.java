/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.management;

import DAO.OrdersDAO;
import DAO.ProductsDAO;
import DAO.UsersDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Orders;
import model.Products;

/**
 *
 * @author TranHuy
 */
@WebServlet(name = "AdminServlet", urlPatterns = {"/AdminServlet"})
public class AdminServlet extends HttpServlet {

    private static final String ADMIN = "view/jsp/admin/admin_home.jsp";
    private final static String ORDER_DETAIL_PAGE = "view/jsp/admin/admin_order_detail.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AdminServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductsDAO pDao = new ProductsDAO();
//        OrderItemDAO oIDao = new OrderItemDAO();
        OrdersDAO oDao = new OrdersDAO();
        UsersDAO uDao = new UsersDAO();

        String url = ADMIN;
        try {
//            double totalSale = oDao.getTotalSale();
//            double totalSaleTD = oDao.getTotalSaleToday();
            int totalProducts = pDao.getTotalProducts();
            int totalUsers = uDao.getTotalUsers();
            int totalOrders = oDao.getTotalOrders();
            double totalRevenue = oDao.getTotalRevenue();
            int quan = pDao.getQuantityByCategoryID(1);
            int ao = pDao.getQuantityByCategoryID(2);
            int giay = pDao.getQuantityByCategoryID(3);
            int phukien = pDao.getQuantityByCategoryID(4);
            List<Orders> lastRecentOrders = oDao.getRecentOrders();
            List<Products> recentProduct = pDao.getRecentProduct();

//            request.setAttribute("TOTALSALE", totalSale);
//            request.setAttribute("TOTALSALETODAY", totalSaleTD);
            request.setAttribute("TOTALPRODUCTS", totalProducts);
            request.setAttribute("TOTALUSERS", totalUsers);
            request.setAttribute("TOTALORDERS", totalOrders);
            request.setAttribute("LAST_RECENT_ORDERS", lastRecentOrders);
            request.setAttribute("LAST_RECENT_PRODUCTS", recentProduct);
            request.setAttribute("TOTAL_REVENUE", totalRevenue);
            request.setAttribute("chartadminhome", "Quần-"+quan+",Áo-"+ao+",Giày-"+giay+",Phụ kiện-"+phukien);

            request.setAttribute("CURRENTSERVLET", "Dashboard");
            String action = request.getParameter("showdetail");
            if ("showdetail".equals(action)) {
                url = ORDER_DETAIL_PAGE;
                String bill_id = request.getParameter("bill_id");
//                OrderDTO order = oDao.getOrdersByID(bill_id);
//                int id = order.getOrderID();
//                List<OrderItem> list = oIDao.getOrderItemByOrderId(id);
//                request.setAttribute("LIST_PRODUCTS_IN_ORDER", list);

            }

        } catch (Exception ex) {
            log("AdminServlet error:" + ex.getMessage());
        } finally {
            request.getRequestDispatcher(ADMIN).forward(request, response);
        }
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
