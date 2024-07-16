package ClothesOnlineShop.Controller.Admin.Management.Product;

import ClothesOnlineShop.DAO.ProductDAO;
import ClothesOnlineShop.Model.ProductDTO;
import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.commons.io.FilenameUtils;

@WebServlet(name = "UpdateProduct", urlPatterns = {"/UpdateProduct"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class UpdateProductServlet extends HttpServlet {

    private static final String UPLOAD_DIRECTORY = "view/web/img";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        int idProduct = Integer.parseInt(request.getParameter("id"));
        String nameProduct = request.getParameter("nameProduct");
        String description = request.getParameter("description");
        String type = request.getParameter("type");
        String size = request.getParameter("size");
        String color = request.getParameter("color");
        int productQuantity = Integer.parseInt(request.getParameter("quantity"));
        double cost = Double.parseDouble(request.getParameter("cost"));
        String imageName = request.getParameter("images");
        System.out.println(idProduct);
        

        // Handle file upload
//        Part filePart = request.getPart("image");
//        if (filePart != null && filePart.getSize() > 0) {
//            String fileName = FilenameUtils.getName(filePart.getSubmittedFileName());
//            imageName = UPLOAD_DIRECTORY + "/" + fileName;
//            String absolutePath = getServletContext().getRealPath("/") + imageName;
//
//            File file = new File(absolutePath);
//            filePart.write(file.getAbsolutePath());
//        }

        // Get the product DAO and update the product details
        ProductDAO productDAO = new ProductDAO();
        ProductDTO product = new ProductDTO(idProduct,nameProduct, size, type, color, productQuantity, cost, description, imageName);
        try {
            productDAO.updateProduct(product);
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("product", product); 
        request.getRequestDispatcher("view/admin-UI/edit-product.jsp").forward(request, response);
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
