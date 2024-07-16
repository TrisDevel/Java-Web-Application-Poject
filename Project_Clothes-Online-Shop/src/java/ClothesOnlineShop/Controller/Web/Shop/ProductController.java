/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClothesOnlineShop.Controller.Web.Shop;

import ClothesOnlineShop.DAO.ProductDAO;
import ClothesOnlineShop.Model.ProductDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author buitr
 */
@WebServlet(name = "ProductController", urlPatterns = {"/ProductController"})
public class ProductController extends HttpServlet {

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
        ProductDAO pDao = new ProductDAO();
        String action = request.getParameter("action");
        String keyword = request.getParameter("keyword");
        if (keyword == null) {
            keyword = "";
        }
        if (action == null) {
            List<ProductDTO> allProduct = pDao.selectAllProducts(keyword);
            request.setAttribute("allProduct", allProduct);
            request.getRequestDispatcher("view/web/all-product.jsp").forward(request, response);
        } else if (action.equals("detail")) {
            Integer ID = null;
            String type = request.getParameter("type");
            System.out.println(type);
            try {
                ID = Integer.parseInt(request.getParameter("id"));
            } catch (NumberFormatException ex) {
                log("Parameter ID has wrong format.");
            }
            ProductDTO product = null;
            if (ID != null) {
                product = pDao.selectProduct(ID);

            }
            List<ProductDTO> list = pDao.selectRelatedProduct(type);
            request.setAttribute("message", "msg");
            request.setAttribute("list", list);
            request.setAttribute("product", product);
            RequestDispatcher rd = request.getRequestDispatcher("view/web/product-detail.jsp");
            rd.forward(request, response);
            System.out.println(list);
        } else if (action.equals("sort")) {
            String order = request.getParameter("order") == null ? "asc" : request.getParameter("order");
            String type = request.getParameter("type") == null ? "" : request.getParameter("type");
            String color = request.getParameter("color") == null ? "" : request.getParameter("color");
            List<ProductDTO> allProduct = pDao.getProductsSortedByPriceSearchByType(order, type, color);
            request.setAttribute("order", order);
            request.setAttribute("type", type);
            request.setAttribute("color", color);
            request.setAttribute("allProduct", allProduct);
            request.getRequestDispatcher("view/web/all-product.jsp").forward(request, response);

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
