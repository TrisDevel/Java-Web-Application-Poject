/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClothesOnlineShop.DAO;

import ClothesOnlineShop.Model.ProductDTO;
import ClothesOnlineShop.utils.DBUtils;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author buitr
 */
public class ProductDAO extends DBUtils {

    private static final String INSERT_PRODUCT_SQL = "INSERT INTO Products (nameProduct, size, type, color, productQuantity, cost, description, images) VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
    private static final String SELECT_PRODUCT_BY_ID = "SELECT * FROM Products WHERE idProduct = ?;";
    private static final String SELECT_ALL_PRODUCTS = "SELECT * FROM Products;";
    private static final String DELETE_PRODUCT_SQL = "DELETE FROM Products WHERE idProduct = ?;";
    private static final String UPDATE_PRODUCT_SQL = "UPDATE Products SET nameProduct = ?, size = ?, type = ?, color = ?, productQuantity = ?, cost = ?, description = ?, images = ? WHERE idProduct = ?;";
    private static final String SELECT_BEST_SELLERS = "SELECT TOP 3 * FROM Products ORDER BY productQuantity DESC;";
    private static final String SELECT_PRODUCTS_SORTED_BY_PRICE_ASC = "SELECT * FROM Products ORDER BY cost ASC;";
    private static final String SELECT_PRODUCTS_SORTED_BY_PRICE_DESC = "SELECT * FROM Products ORDER BY cost DESC;";
    // Create product

    public void insertProduct(ProductDTO product) throws SQLException {
        try (Connection connection = DBUtils.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PRODUCT_SQL)) {
            preparedStatement.setString(1, product.getNameProduct());
            preparedStatement.setString(2, product.getSize());
            preparedStatement.setString(3, product.getType());
            preparedStatement.setString(4, product.getColor());
            preparedStatement.setInt(5, product.getProductQuantity());
            preparedStatement.setDouble(6, product.getCost());
            preparedStatement.setString(7, product.getDescription());
            preparedStatement.setString(8, product.getImages());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    // Update product
    public boolean updateProduct(ProductDTO product) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = DBUtils.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PRODUCT_SQL)) {
            preparedStatement.setString(1, product.getNameProduct());
            preparedStatement.setString(2, product.getSize());
            preparedStatement.setString(3, product.getType());
            preparedStatement.setString(4, product.getColor());
            preparedStatement.setInt(5, product.getProductQuantity());
            preparedStatement.setDouble(6, product.getCost());
            preparedStatement.setString(7, product.getDescription());
            preparedStatement.setString(8, product.getImages());
            preparedStatement.setInt(9, product.getIdProduct());

            rowUpdated = preparedStatement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    // Select product by id
    public ProductDTO selectProduct(int idProduct) {
        ProductDTO product = null;
        try (Connection connection = DBUtils.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PRODUCT_BY_ID)) {
            preparedStatement.setInt(1, idProduct);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String nameProduct = rs.getString("nameProduct");
                String size = rs.getString("size");
                String type = rs.getString("type");
                String color = rs.getString("color");
                int productQuantity = rs.getInt("productQuantity");
                double cost = rs.getDouble("cost");
                String description = rs.getString("description");
                String images = rs.getString("images");
                product = new ProductDTO(idProduct, nameProduct, size, type, color, productQuantity, cost, description, images);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return product;
    }

    // Select all products
    public List<ProductDTO> selectAllProducts(String keyword) {
        List<ProductDTO> products = new ArrayList<>();
        String query = "SELECT * FROM Products";

        if (keyword != null && !keyword.trim().isEmpty()) {
            query += " WHERE nameProduct LIKE ?";
        }

        try (Connection connection = DBUtils.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            // Set the keyword parameter if keyword is not null or empty
            if (keyword != null && !keyword.trim().isEmpty()) {
                preparedStatement.setString(1, "%" + keyword + "%");
            }

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int idProduct = rs.getInt("idProduct");
                String nameProduct = rs.getString("nameProduct");
                String size = rs.getString("size");
                String type = rs.getString("type");
                String color = rs.getString("color");
                int productQuantity = rs.getInt("productQuantity");
                double cost = rs.getDouble("cost");
                String description = rs.getString("description");
                String images = rs.getString("images");
                products.add(new ProductDTO(idProduct, nameProduct, size, type, color, productQuantity, cost, description, images));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return products;
    }

    // Delete product
    public boolean deleteProduct(int idProduct) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = DBUtils.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(DELETE_PRODUCT_SQL)) {
            preparedStatement.setInt(1, idProduct);
            rowDeleted = preparedStatement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }

    public List<ProductDTO> getBestSellers() {
        List<ProductDTO> bestSellers = new ArrayList<>();
        try (Connection connection = DBUtils.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BEST_SELLERS)) {
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int idProduct = rs.getInt("idProduct");
                String nameProduct = rs.getString("nameProduct");
                String size = rs.getString("size");
                String type = rs.getString("type");
                String color = rs.getString("color");
                int productQuantity = rs.getInt("productQuantity");
                double cost = rs.getDouble("cost");
                String description = rs.getString("description");
                String images = rs.getString("images");
                bestSellers.add(new ProductDTO(idProduct, nameProduct, size, type, color, productQuantity, cost, description, images));
                System.out.println(images);
            }
            System.out.println("Best sellers retrieved from database: " + bestSellers.size());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bestSellers;
    }
    public List<ProductDTO> selectRelatedProduct(String type) {
        List<ProductDTO> list = new ArrayList<>();

        final String SELECT_RELATED_PRODUCT = "SELECT * FROM Products WHERE type LIKE ?";

        try (Connection connection = DBUtils.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_RELATED_PRODUCT)) {

            preparedStatement.setString(1, "%" + type + "%");
            ResultSet rs = preparedStatement.executeQuery();

            if (rs != null) {
                while (rs.next()) {
                    int idProduct = rs.getInt("idProduct");
                    String nameProduct = rs.getString("nameProduct");
                    String size = rs.getString("size");
                    String color = rs.getString("color");
                    int productQuantity = rs.getInt("productQuantity");
                    double cost = rs.getDouble("cost");
                    String description = rs.getString("description");
                    String images = rs.getString("images");
                    list.add(new ProductDTO(idProduct, nameProduct, size, type, color, productQuantity, cost, description, images));
                }
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return list;
    }

    public List<ProductDTO> getProductsSortedByPrice(boolean ascending) {
        List<ProductDTO> products = new ArrayList<>();
        String query = ascending ? SELECT_PRODUCTS_SORTED_BY_PRICE_ASC : SELECT_PRODUCTS_SORTED_BY_PRICE_DESC;

        try (Connection connection = DBUtils.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int idProduct = rs.getInt("idProduct");
                String nameProduct = rs.getString("nameProduct");
                String size = rs.getString("size");
                String type = rs.getString("type");
                String color = rs.getString("color");
                int productQuantity = rs.getInt("productQuantity");
                double cost = rs.getDouble("cost");
                String description = rs.getString("description");
                String images = rs.getString("images");
                products.add(new ProductDTO(idProduct, nameProduct, size, type, color, productQuantity, cost, description, images));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return products;
    }

    public List<ProductDTO> getProductsSortedByPriceSearchByType(String order, String Searchtype, String color) {
        List<ProductDTO> products = new ArrayList<>();
        String query = "Select * from Products where LOWER([type]) like '%" + Searchtype.toLowerCase() + "%' "
                + "AND LOWER([color]) like '%" + color.toLowerCase() + "%' "
                + "order by cost " + order;
        System.out.println(query);
        try (Connection connection = DBUtils.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int idProduct = rs.getInt("idProduct");
                String nameProduct = rs.getString("nameProduct");
                String size = rs.getString("size");
                String type = rs.getString("type");
                String colorResult = rs.getString("color"); 
                int productQuantity = rs.getInt("productQuantity");
                double cost = rs.getDouble("cost");
                String description = rs.getString("description");
                String images = rs.getString("images");
                products.add(new ProductDTO(idProduct, nameProduct, size, type, colorResult, productQuantity, cost, description, images));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return products;
    }

}
