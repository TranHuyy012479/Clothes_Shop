/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.shop;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Users;

/**
 *
 * @author tranh
 */
@WebServlet(name = "RemoveFromWishlist", urlPatterns = {"/removewl"})
public class RemoveFromWishlist extends HttpServlet {

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
            out.println("<title>Servlet RemoveFromWishlist</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RemoveFromWishlist at " + request.getContextPath() + "</h1>");
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
        String pID = request.getParameter("id");
        Users users = (Users) request.getSession().getAttribute("users");
        Cookie[] cList = request.getCookies();
        String listpID = "";
        for (Cookie cookie : cList) {
            if (cookie.getName().equals(users.getUsername()+"wishlist")) {
                cookie.setPath("/");
                cookie.setMaxAge(0);
                listpID = cookie.getValue();
                response.addCookie(cookie);
                break;
            }
        }
        String value = deleteFromCookie(listpID, pID);
        Cookie c = new Cookie(users.getUsername()+"wishlist", value);
        c.setMaxAge(60 * 60 * 24);
        response.addCookie(c);
        response.sendRedirect("loadwl");
    }

    private String deleteFromCookie(String value, String id) {
        String[] listID = value.split("_");
        StringBuilder newIds = new StringBuilder();
        for (String string : listID) {
            if (!string.equals(id)) {
                if (newIds.length() > 0) {
                    newIds.append("_");
                }
                newIds.append(string);
            }
        }
        return newIds.toString();
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
