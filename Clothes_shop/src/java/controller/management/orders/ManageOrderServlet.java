/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.management.orders;

import DAO.OrderDetailsDAO;
import DAO.OrdersDAO;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.OrderDetails;
import model.Orders;

/**
 *
 * @author lvhho
 */
@WebServlet(name = "ManageOrderServlet", urlPatterns = {"/ManageOrderServlet"})
public class ManageOrderServlet extends HttpServlet {

    private final static String ORDER_PAGE = "view/jsp/admin/admin_order.jsp";
    private final static String ORDER_DETAIL_PAGE = "view/jsp/admin/admin_order_detail.jsp";
    private final static String CHANGE_STATUS = "changeStatus";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ORDER_PAGE;
        try {
            OrdersDAO oDAO = new OrdersDAO();
            OrderDetailsDAO odDAO = new OrderDetailsDAO();
            List<Orders> listOrders = oDAO.getAllOrders();
            System.out.println(listOrders.size());
            String action = request.getParameter("action");

            if ("showdetail".equals(action)) {
                url = ORDER_DETAIL_PAGE;
                int bill_id = Integer.parseInt(request.getParameter("bill_id"));
                Orders order = oDAO.getOrdersByID(bill_id);
                int id = order.getId();
                List<OrderDetails> list = odDAO.getOrderDetailsByOrderID(id);
                request.setAttribute("LIST_PRODUCTS_IN_ORDER", list);

            } else if (CHANGE_STATUS.equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                oDAO.updateStatus(id);
            }
            
            request.setAttribute("CURRENTSERVLET", "Order");
            request.setAttribute("LIST_ORDERS", listOrders);
        } catch (NumberFormatException ex) {
            log("ManageOrderServlet error:" + ex.getMessage());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
        processRequest(request, response);
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
