/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClothesOnlineShop.Controller.Admin;

import ClothesOnlineShop.DAO.OrderDAO;
import ClothesOnlineShop.DAO.PaymentDAO;
import ClothesOnlineShop.DAO.ProductDAO;
import ClothesOnlineShop.DAO.UserDAO;
import ClothesOnlineShop.Model.OrderDTO;
import ClothesOnlineShop.Model.PaymentDTO;
import ClothesOnlineShop.Model.ProductDTO;
import ClothesOnlineShop.Model.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.SessionTrackingMode;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author buitr
 */
@WebServlet(name = "AdminServlet", urlPatterns = {"/AdminServlet"})
public class AdminServlet extends HttpServlet {

    private final String ADMIN_PRODUCT = "view/admin-UI/products.jsp";
    private final String ADMIN_INDEX = "view/admin-UI/index.jsp";
    private final String ADMIN_USER = "view/admin-UI/accounts.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String url = ADMIN_INDEX;
            try {
                String btnValue = request.getParameter("action");
                if (btnValue == null) {
                    url = ADMIN_INDEX;
                    getDataHomeLSP(request, response);
                } else if (btnValue.equals("product")) {
                    getDataHomeLSP(request, response);
                    url = ADMIN_PRODUCT;
                } else if (btnValue.equals("account")) {
                    request.setAttribute("message", "msg");
                    getDataHomeLSP(request, response);
                    url = ADMIN_USER;
                }
            } catch (Exception e) {
            } finally {
                request.getRequestDispatcher(url).forward(request, response);
            }
        }
    }

    protected void getDataHomeLSP(HttpServletRequest request, HttpServletResponse response) {
        try {
            String keyword = request.getParameter("keyword");            
            if (keyword == null) keyword = "";
            ProductDAO pDao = new ProductDAO();
            OrderDAO oDAO = new OrderDAO();
            UserDAO uDAO = new UserDAO();
            PaymentDAO pDAO = new PaymentDAO();
            // SupplierDAO sDao = new SupplierDAO();
            // TypeDAO tDao = new TypeDAO();
            //CategoryDAO caDao = new CategoryDAO();

            List<ProductDTO> allProduct = pDao.selectAllProducts(keyword);
            List<OrderDTO> allOrder = oDAO.selectAllOrders();
            List<UserDTO> allUser = uDAO.selectAllCustomers();
            
            // Set Name Customer theo ID
            for (OrderDTO order : allOrder) {
                int customerId = order.getIdCustomer();
                int paymentID = order.getPaymentid();
                System.out.println(paymentID);
                String paymentMethod = pDAO.getPaymentMethodById(paymentID);
                String customerName = uDAO.getCustomerNameById(customerId);
                order.setCustomerName(customerName);
                order.setPaymentName(paymentMethod);
            }
                // List<PaymentDTO> paymentMethod = pDAO.selectPaymentById(pDAO.selectAllPayments());
                //List<ProductDTO> allProduct = pDao.selectAllProducts();
                //List<CategoryDTO> listCategories = cDao.getData();
                //List<SupplierDTO> listSuppliers = sDao.getData();
                //List<ProductDTO> listProductsNew = pDao.getProductNew();
                //List<ProductDTO> listProductsBestSeller = pDao.getProductsBestSeller();
                //List<TypeDTO> listTypes = tDao.getAllType();

                request.setAttribute("allProduct", allProduct);
                request.setAttribute("allOrder", allOrder);
                request.setAttribute("allUser", allUser);
                // request.setAttribute("LIST_TYPES", listTypes);
                //request.setAttribute("LIST_CATEGORIESS", listCategories);
                // request.setAttribute("LIST_SUPPLIERS", listSuppliers);
                // request.setAttribute("LIST_PRODUCTS_NEW", listProductsNew);
                // request.setAttribute("LIST_PRODUCTS_SELLER", listProductsBestSeller);
            }catch (Exception ex) {
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
        protected void doGet
        (HttpServletRequest request, HttpServletResponse response)
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
        protected void doPost
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request, response);
        }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
            () {
        return "Short description";
        }// </editor-fold>

    }
