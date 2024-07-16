/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClothesOnlineShop.Controller.Web.Shop;

import ClothesOnlineShop.DAO.OrderDAO;
import ClothesOnlineShop.DAO.PaymentDAO;
import ClothesOnlineShop.Model.Cart;
import ClothesOnlineShop.Model.PaymentDTO;
import ClothesOnlineShop.Model.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "CheckoutController", urlPatterns = {"/CheckoutController"})
public class CheckoutController extends HttpServlet {

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
           HttpSession sessionCart = request.getSession(true);    
           Cart cart = null;          
           Object o = sessionCart.getAttribute("cart");
           Integer ID = null;
                try{
                    ID = Integer.parseInt(request.getParameter("paymentId"));      
                }catch (NumberFormatException ex){
                    log("Parameter ID has wrong format.");
                }
            if(o != null){
                cart = (Cart) o;
            }else{
                cart = new Cart();
            }
            PaymentDTO p = null;
            PaymentDAO pDao =new PaymentDAO();
            if (ID != null){
                    p =  pDao.selectPaymentById(ID);                   
                }
            UserDTO user = (UserDTO) sessionCart.getAttribute("usersession");
            
            if(user != null){
                
                OrderDAO oDao = new OrderDAO();
                oDao.addOrder(user, cart,p );
                sessionCart.removeAttribute("cart");
                sessionCart.setAttribute("listSize", 0);
                String msg = " Cảm ơn bạn";
                request.setAttribute("msg", msg);
                response.sendRedirect("ProductController");
                
                System.out.println(user.getEmail());
                System.out.println(user.idCustomer);
                System.out.println(user.getIdCustomer());
                System.out.println(user.firstName);
                System.out.println(user.lastName);
                System.out.println(cart.getTotalMoney());
                System.out.println(p.getPaymentMethod());
            }else{
                response.sendRedirect("DispatchServlet?action=login");
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
