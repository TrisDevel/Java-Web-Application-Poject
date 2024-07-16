package ClothesOnlineShop.Controller.Admin.Management.Product;

import ClothesOnlineShop.DAO.ProductDAO;
import ClothesOnlineShop.Model.ProductDTO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ManagementProduct", urlPatterns = {"/ManagementProduct"})
public class ManagementProduct extends HttpServlet {

    private final String MANAGEMENT_PRODUCT = "ManagementProduct";
    private final String ADD_PRODUCT = "view/admin-UI/add-product.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = MANAGEMENT_PRODUCT;
        String action = request.getParameter("action");
        
        try {
            if (action.equals("view")) {
                int id = Integer.parseInt(request.getParameter("id"));
                url = "view/admin-UI/edit-product.jsp";
                int idProduct = id;
                ProductDAO productDAO = new ProductDAO();
                ProductDTO product = productDAO.selectProduct(idProduct);
                request.setAttribute("product", product);
            } else if (action.equals("delete")) {
                int id = Integer.parseInt(request.getParameter("id"));
                url = "DeleteProduct?id=" + id;
            } else if (action.equals("edit")) {
                int id = Integer.parseInt(request.getParameter("id"));
                url = "UpdateProduct?id=" + id;
            } else if (action.equals("create")) {
                url = ADD_PRODUCT;
            }
        } catch (Exception e) {
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
