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
 * @author HuuThanh
 */
@WebServlet(name = "EditProductServlet", urlPatterns = {"/EditProductServlet"})
public class EditProductServlet extends HttpServlet {

    private static final String EDIT_PAGE = "view/jsp/admin/admin_edit_product.jsp";
    private static final String MANAGE_PRODUCT_CONTROLLER = "ManageProductServlet";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String action = request.getParameter("action");
            String url = EDIT_PAGE;
            if (action == null) {
                System.out.println("da chay vao day");
                ProductsDAO pDAO = new ProductsDAO();
                String pid_raw = request.getParameter("product_id");
                CategoriesDAO cDao = new CategoriesDAO();

                List<Categories> listCategories = cDao.getAll();
                Products product = pDAO.getProductByID(Integer.parseInt(pid_raw));

                request.setAttribute("LIST_CATEGORIES", listCategories);
                request.setAttribute("pid", product.getId());
                request.setAttribute("pstock", product.getQuantity());
                request.setAttribute("pname", product.getName());
                request.setAttribute("pprice", product.getPrice());
                request.setAttribute("pdescription", product.getDescription());
                request.setAttribute("pimages", product.getImage());
                request.setAttribute("pcategory", product.getCategory());
                request.getRequestDispatcher(url).forward(request, response);
            } else {
                url = MANAGE_PRODUCT_CONTROLLER;
                String pname = request.getParameter("product_name");
                String pprice_raw = request.getParameter("product_price");
                String pdescription = request.getParameter("product_description");
                String pstock_raw = request.getParameter("product_stock");
                String pcategory_raw = request.getParameter("category_id");
                int product_id = Integer.parseInt(request.getParameter("product_id"));
                String image = request.getParameter("image");
           
               
                ProductsDAO pDAO = new ProductsDAO();
                CategoriesDAO cDAO = new CategoriesDAO();
                
                double pprice;
                int pquantity, pcategory;
                pprice = Double.parseDouble(pprice_raw);
                pquantity = Integer.parseInt(pstock_raw);
               
                
          
                pcategory = Integer.parseInt(pcategory_raw);
                Validation valid = new Validation();
                Products p = new Products(pname, pprice, pquantity, pdescription, image,valid.getCurrentDateTime() ,cDAO.getCategoryByID(pcategory));
                p.setId(product_id);
                pDAO.editProducts(p);

                request.setAttribute("mess", "Edit successfully!");
                request.getRequestDispatcher(url).forward(request, response);
            }
        } catch (ServletException | IOException | NumberFormatException ex) {
            log("EditProductServlet error:" + ex.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
