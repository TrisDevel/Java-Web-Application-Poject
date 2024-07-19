/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClothesOnlineShop.Controller.Web.Handle;

import ClothesOnlineShop.DAO.ProductDAO;
import ClothesOnlineShop.DAO.UserDAO;
import ClothesOnlineShop.Model.Cart;
import ClothesOnlineShop.Model.ProductDTO;
import ClothesOnlineShop.Model.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author buitr
 */
@WebServlet(name = "DispatchServlet", urlPatterns = {"/DispatchServlet"})
public class DispatchServlet extends HttpServlet {

    private final String LOGIN = "login";
    private final String LOGOUT = "logout";
    private final String ADMIN = "AdminServlet";
    private final String PROFILE_USER = "view/web/profileUser.jsp";
    private final String WELCOME = "view/web/home.jsp";
    private final String WELCOME_LOGIN = "view/web/login.jsp";
    private final String LOGIN_CONTROLlER = "view/web/login.jsp";
    private final String LOGOUT_CONTROLlER = "LogoutController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = WELCOME;
        try {
            String btnValue = request.getParameter("action");
            HttpSession session = request.getSession();
            if (btnValue == null) {
                request.setAttribute("message", request.getAttribute("msg"));
                getDataHomeLSP(request, response);
            } else if (btnValue.equals(LOGOUT)) {
                url = LOGOUT_CONTROLlER;
                //request.setAttribute("CURRENTSERVLET", "Home");
            } else if (btnValue.equals(LOGIN)) {
                url = LOGIN_CONTROLlER;
            } else if (btnValue.equals("admin")) {
                url = ADMIN;
            } else if (btnValue.equals("account")) {
                url = PROFILE_USER;
            }

        } catch (Exception ex) {

        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    protected void getDataHomeLSP(HttpServletRequest request, HttpServletResponse response) {
        try {
            ProductDAO pDao = new ProductDAO();
            UserDAO uDao = new UserDAO();
            String keyword = request.getParameter("keyword");
            if (keyword == null) {
                keyword = "";
            }

            List<ProductDTO> allProduct = pDao.selectAllProducts(keyword);
            List<ProductDTO> bestSellers = pDao.getBestSellers();

            request.setAttribute("bestSellers", bestSellers);
            request.setAttribute("allProduct", allProduct);

        } catch (Exception ex) {
            log("DispatchServlet error:" + ex.getMessage());
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
