/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.management.users;

import DAO.UsersDAO;
import Validation.Validation;
import java.io.IOException;
import java.util.Arrays;
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
@WebServlet(name = "InsertUserServlet", urlPatterns = {"/InsertUserServlet"})
public class InsertUserServlet extends HttpServlet {

    private static final String MANAGE_USER_CONTROLLER = "ManageUserServlet";
    private static final String INSERT_USER_PAGE = "view/jsp/admin/admin_user_insert.jsp";

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
        String url = MANAGE_USER_CONTROLLER;
        try {
            UsersDAO uDAO = new UsersDAO();
            String avatar = request.getParameter("avatar");
            String fullName = request.getParameter("fullname");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            String dob = request.getParameter("dob");
            Validation valid = new Validation();
            String image = "";
            int roleId = 2;
            if (uDAO.getUserByUsername(username)!=null) {
                url = INSERT_USER_PAGE;
                request.setAttribute("error", "Tên tài khoản đã tồn tại!");
            } else {
                String normalizeName = valid.normalize(fullName);
                Users user = new Users(normalizeName, username,password, address, email, phone, dob, valid.getCurrentDateTime());
                System.out.println("Ngay sinh: "+dob);
                System.out.println("time update: "+valid.getCurrentDateTime());
                uDAO.insertFullInfo(user);
                request.setAttribute("mess", "Insert successfully!");
            }
        } catch (Exception ex) {
            log("InserUserServlet error:" + ex.getMessage());
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
