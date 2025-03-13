package controller.shop;

import DAO.ProductsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Products;
import model.Users;

/**
 *
 * @author tranh
 */
@WebServlet(name = "AddToWishlist", urlPatterns = {"/addtowishlist"})
public class AddToWishlist extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddToWishlist</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddToWishlist at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int productID = Integer.parseInt(request.getParameter("pID"));
//      String type = request.getParameter("type");
        String username = request.getParameter("username");
        String listpID = "";
        Cookie[] cList = request.getCookies();
        for (Cookie cookie : cList) {
            if (cookie.getName().equals(username)) {
                listpID = cookie.getValue();
                break;
            }
        }
        if (!listpID.contains(String.valueOf(productID))){
        listpID += String.valueOf(productID)+"_";
        }
        Cookie c = new Cookie(username, listpID);
        c.setMaxAge(60*60*24);
        response.addCookie(c);
        response.sendRedirect("home");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
