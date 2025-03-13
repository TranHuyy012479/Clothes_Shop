/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.management.products;

import DAO.CategoriesDAO;
import DAO.ProductsDAO;
import Validation.Validation;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Categories;
import model.Products;
/**
 *
 * @author Administrator
 */
@WebServlet(name = "InsertProductServlet", urlPatterns = {"/InsertProductServlet"})
public class InsertProductServlet extends HttpServlet {

    private static final String INSERT_PAGE = "view/jsp/admin/admin_products_insert.jsp";
    private static final String MANAGE_PRODUCT_CONTROLLER = "ManageProductServlet";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = INSERT_PAGE;
        try {
            String action = request.getParameter("action");
            ProductsDAO pDao = new ProductsDAO();
            if (action != null) {
                CategoriesDAO cDao = new CategoriesDAO();
                List<Categories> listCategories = cDao.getAll();
                request.setAttribute("LIST_CATEGORIES", listCategories);
            } else {
                String name = request.getParameter("product_name");
                String price_raw = request.getParameter("price");
                String quantity_raw = request.getParameter("stock");
                String image = request.getParameter("image");
                String description = request.getParameter("description");
                String cid_raw = request.getParameter("category_id");

                int cId = Integer.parseInt(cid_raw);
                int quantity = Integer.parseInt(quantity_raw);
                double price = Double.parseDouble(price_raw);
                Validation v = new Validation();
                CategoriesDAO cDAO = new CategoriesDAO();
                Products p = new Products(name, price, quantity, description, image, v.getCurrentDateTime(), cDAO.getCategoryByID(cId));
                pDao.insertProducts(p);
                request.setAttribute("mess", "Insert successfully!");
                url = MANAGE_PRODUCT_CONTROLLER;
            }
        } catch (NumberFormatException ex) {
            log("InsertProductServlet error:" + ex.getMessage());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
