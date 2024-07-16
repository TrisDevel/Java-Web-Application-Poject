/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClothesOnlineShop.Controller.Admin.Management.Product;

import ClothesOnlineShop.DAO.ProductDAO;
import ClothesOnlineShop.Model.ProductDTO;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.nio.file.Files;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.commons.io.FilenameUtils;

@WebServlet(name = "InsertProduct", urlPatterns = {"/InsertProduct"})
public class InsertProductServlet extends HttpServlet {

    private static final String UPLOAD_DIRECTORY = "view/web/img";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            System.out.println("Done");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8"); 

        String nameProduct = request.getParameter("nameProduct");
        String description = request.getParameter("description");
        String type = request.getParameter("type");
        String size = request.getParameter("size");
        String color = request.getParameter("color");
        int productQuantity = Integer.parseInt(request.getParameter("productQuantity"));
        double cost = Double.parseDouble(request.getParameter("cost"));
        String image = request.getParameter("image");
        
        // Since no image is uploaded, set image as an empty string or default value
        
//          Part filePart = request.getPart("images");
//        if (filePart != null && filePart.getSize() > 0) {
//            String fileName = FilenameUtils.getName(filePart.getSubmittedFileName());
//            image = UPLOAD_DIRECTORY + "/" + fileName;
//            String absolutePath = getServletContext().getRealPath("/") + image;
//
//            // Create directories if not exist
//            File file = new File(absolutePath);
//            file.getParentFile().mkdirs();
//
//            // Save the file on the server
//            filePart.write(file.getAbsolutePath());
//        }

        ProductDTO product = new ProductDTO(nameProduct, size, type, color, productQuantity, cost, description, image);
        ProductDAO productDAO = new ProductDAO();
        try {
            
            productDAO.insertProduct(product);
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect("AdminServlet?action=product");
    }
}
