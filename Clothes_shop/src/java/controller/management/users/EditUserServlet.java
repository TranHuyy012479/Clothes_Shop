/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.management.users;

import DAO.UsersDAO;
import Validation.Validation;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Users;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "EditUserServlet", urlPatterns = {"/EditUserServlet"})
public class EditUserServlet extends HttpServlet {

    private static final String EDIT_PAGE = "view/jsp/admin/admin_edit_user.jsp";
    private static final String MANAGE_USER_CONTROLLER = "ManageUserServlet";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditUserServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditUserServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UsersDAO uDAO = new UsersDAO();
        try {
            String action = request.getParameter("action");
            String url = EDIT_PAGE;
            if (action == null) {
                String username = request.getParameter("username");
                Users user = uDAO.getUserByUsername(username);

                request.setAttribute("username", user.getUsername());
                request.setAttribute("phone", user.getPhoneNumber());
                request.setAttribute("roleid", user.getRoleID());
                request.setAttribute("address", user.getAddress());
                request.setAttribute("email", user.getEmail());
                request.setAttribute("fullname", user.getFullName());
                request.setAttribute("dob", user.getDob());
                request.getRequestDispatcher(url).forward(request, response);
            } else {
                url = MANAGE_USER_CONTROLLER;
                String username = request.getParameter("username");
                String phone = request.getParameter("phone");
                String address = request.getParameter("address");
                String email = request.getParameter("email");
                String dob = request.getParameter("dob");
                String fullname = request.getParameter("fullname");
                int status = Integer.parseInt(request.getParameter("status"));
                Validation valid = new Validation();
                String avatar = request.getParameter("avatar");
                
                Users user = new Users(username, address, email, phone, dob, valid.getCurrentDateTime(), fullname,status);
                uDAO.updateInfoUsers(user);

                request.setAttribute("mess", "Edit successfully!");
                request.getRequestDispatcher(url).forward(request, response);
            }
        } catch (ServletException | IOException ex) {
            log("EditProductServlet error:" + ex.getMessage());
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
