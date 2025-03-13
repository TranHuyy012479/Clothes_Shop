/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.management;

import DAO.OrdersDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet(name = "ChartServlet", urlPatterns = {"/ChartServlet"})
public class ChartServlet extends HttpServlet {
    private static final String CHART = "view/jsp/admin/admin_chart.jsp";

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
        OrdersDAO oDao = new OrdersDAO();
        try {
            double year2024 = oDao.getTotalMoneyByYear(2024);
            double year2025 = oDao.getTotalMoneyByYear(2025);
            double year2026 = oDao.getTotalMoneyByYear(2026);
            double year2027 = oDao.getTotalMoneyByYear(2027);
            double year2028 = oDao.getTotalMoneyByYear(2028);
            double year2029 = oDao.getTotalMoneyByYear(2029);
            double year2030 = oDao.getTotalMoneyByYear(2030);
            
            double month1 = oDao.getTotalMoneyByMonth(1);
            double month2 = oDao.getTotalMoneyByMonth(2);
            double month3 = oDao.getTotalMoneyByMonth(3);
            double month4 = oDao.getTotalMoneyByMonth(4);
            double month5 = oDao.getTotalMoneyByMonth(5);
            double month6 = oDao.getTotalMoneyByMonth(6);
            double month7 = oDao.getTotalMoneyByMonth(7);
            double month8 = oDao.getTotalMoneyByMonth(8);
            double month9 = oDao.getTotalMoneyByMonth(9);
            double month10 = oDao.getTotalMoneyByMonth(10);
            double month11 = oDao.getTotalMoneyByMonth(11);
            double month12 = oDao.getTotalMoneyByMonth(12);

            request.setAttribute("YEAR24", year2024);
            request.setAttribute("YEAR25", year2025);
            request.setAttribute("YEAR26", year2026);
            request.setAttribute("YEAR27", year2027);
            request.setAttribute("YEAR28", year2028);
            request.setAttribute("YEAR29", year2029);
            request.setAttribute("YEAR30", year2030);
            
            request.setAttribute("MONTH1", month1);
            request.setAttribute("MONTH2", month2);
            request.setAttribute("MONTH3", month3);
            request.setAttribute("MONTH4", month4);
            request.setAttribute("MONTH5", month5);
            request.setAttribute("MONTH6", month6);
            request.setAttribute("MONTH7", month7);
            request.setAttribute("MONTH8", month8);
            request.setAttribute("MONTH9", month9);
            request.setAttribute("MONTH10", month10);
            request.setAttribute("MONTH11", month11);
            request.setAttribute("MONTH12", month12);
            
            request.setAttribute("CURRENTSERVLET", "Chart");
        } catch (Exception ex) {
            log("CharSerlvet error:" + ex.getMessage());
        } finally {
            request.getRequestDispatcher(CHART).forward(request, response);
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
