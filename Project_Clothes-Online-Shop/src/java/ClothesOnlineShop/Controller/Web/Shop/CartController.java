/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClothesOnlineShop.Controller.Web.Shop;

import ClothesOnlineShop.DAO.ProductDAO;
import ClothesOnlineShop.Model.Cart;
import ClothesOnlineShop.Model.Item;
import ClothesOnlineShop.Model.ProductDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "CartController", urlPatterns = {"/CartController"})
public class CartController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession(false);
            HttpSession sessionCart = request.getSession(true);
            Cart cart = null;          
            Object o = sessionCart.getAttribute("cart");
            String action = request.getParameter("action");
            String type = request.getParameter("type");
            if(session == null || session.getAttribute("usersession") == null){
                request.setAttribute("msg", "You need to login!");
                request.getRequestDispatcher("view/web/login.jsp").forward(request, response);
                return;
            }
            if(action == null){
                if(o != null){
                cart = (Cart) o;
            }else{
                cart = new Cart();
            }
            String size = request.getParameter("size");
            Integer idProduct = null;
            Integer quantity = null;
                try{
                    idProduct = Integer.parseInt(request.getParameter("idProduct"));
                    quantity = Integer.parseInt(request.getParameter("quantity"));
                }catch (NumberFormatException ex){
                    log("Parameter idProduct or quantity  has wrong format.");
                }
            ProductDAO pDao = new ProductDAO();
            ProductDTO product = pDao.selectProduct(idProduct);
            Item t =new Item(product, size, quantity, product.getCost());
            cart.addItem(t);
            List<Item> list = cart.getItem();
            sessionCart.setAttribute("size", size);
            sessionCart.setAttribute("cart", cart);
            sessionCart.setAttribute("listSize", list.size());
            request.setAttribute("msg", "Thanks");
            request.getRequestDispatcher("view/web/cart.jsp");            
            response.sendRedirect("ProductController?&id="+idProduct+"&action=detail"+"&type="+type);
            
            }
            else if(action.equals("goToCart")){
                cart = (Cart) o;
                if (cart == null) {
                    request.getRequestDispatcher("view/web/cart.jsp").forward(request, response);
                }
            cart = (Cart) o;
            List<Item> list = cart.getItem();
            session.setAttribute("cart", cart);
            session.setAttribute("listSize", list.size());
            request.getRequestDispatcher("view/web/cart.jsp").forward(request, response);
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
