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

/**
 *
 * @author Tuanhuym
 */
@WebServlet(name = "ProcessCartController", urlPatterns = {"/process"})
public class ProcessCartController extends HttpServlet {

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
           String action = request.getParameter("action");
           HttpSession sessionCart = request.getSession(true);
           Cart cart = null;          
           Object o = sessionCart.getAttribute("cart");
           if(action.equals("return")){
               if(o != null){
                   cart = (Cart) o;
               }else{
                   cart = new Cart();
               }
               Integer ID = null;
             
                try{
                    ID = Integer.parseInt(request.getParameter("id"));      
                }catch (NumberFormatException ex){
                    log("Parameter ID has wrong format.");
                }
                cart.removeItem(ID);
                List<Item> list = cart.getItem();
                sessionCart.setAttribute("cart", cart);
                sessionCart.setAttribute("listSize", list.size());
                request.getRequestDispatcher("view/web/cart.jsp").forward(request, response);
           }
           else if(action.equals("adjust")){
               if(o != null){
                   cart = (Cart) o;
               }else{
                   cart = new Cart();
               }
               Integer ID = null;
               Integer num = null;
                try{
                    ID = Integer.parseInt(request.getParameter("id"));
                    num = Integer.parseInt(request.getParameter("num").trim());  
                }catch (NumberFormatException ex){
                    log("Parameter ID has wrong format.");
                }
                if((num ==-1) &&(cart.getQuantityById(ID)<=1)){
                    cart.removeItem(ID);
                }else{
                    ProductDAO pDao = new ProductDAO();
                    ProductDTO product = pDao.selectProduct(ID);
                    double price = product.getCost();
                    String size = request.getParameter("size");
                    Item t =new Item(product, size, num, product.getCost());
                    cart.addItem(t);
                }
                List<Item> list = cart.getItem();
                sessionCart.setAttribute("cart", cart);
                sessionCart.setAttribute("listSize", list.size());
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
