/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClothesOnlineShop.Controller.Admin.Management.Users;

import ClothesOnlineShop.DAO.ProductDAO;
import ClothesOnlineShop.DAO.UserDAO;
import ClothesOnlineShop.Model.ProductDTO;
import ClothesOnlineShop.Model.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author buitr
 */
@WebServlet(name = "ManagementUser", urlPatterns = {"/ManagementUser"})
public class ManagementUser extends HttpServlet {

    private final String EDIT_USER = "view/admin-UI/edit-user.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            String url = EDIT_USER;
            String action = request.getParameter("action");

            try {
                if (action.equals("edit")) {
                    int idCustomer = Integer.parseInt(request.getParameter("id"));
                    url = EDIT_USER;
                    UserDAO DAO = new UserDAO();
                    UserDTO user = DAO.selectCustomer(idCustomer);
                    request.setAttribute("user", user);
                } else if (action.equals("update")) {
                    int idCustomer = Integer.parseInt(request.getParameter("id"));
                    url = "UpdateUser?id=" + idCustomer;
                } else if (action.equals("delete")) {
                    int idCustomer = Integer.parseInt(request.getParameter("id"));
                    url = "DeleteUser?id=" + idCustomer;
                }
            } catch (Exception e) {
                
            } finally {
                request.getRequestDispatcher(url).forward(request, response);
            }
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
