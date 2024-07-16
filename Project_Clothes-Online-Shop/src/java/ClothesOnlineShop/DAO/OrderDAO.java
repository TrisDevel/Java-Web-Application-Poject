/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClothesOnlineShop.DAO;

import ClothesOnlineShop.Model.Cart;
import ClothesOnlineShop.Model.Item;
import ClothesOnlineShop.Model.OrderDTO;
import ClothesOnlineShop.Model.PaymentDTO;
import ClothesOnlineShop.Model.UserDTO;
import ClothesOnlineShop.utils.DBUtils;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO extends DBUtils {

    private static final String SELECT_ALL_ORDERS = "SELECT * FROM Orders";
    private static final String SELECT_ORDER_BY_ID = "SELECT * FROM Orders WHERE idOrder = ?";
    private static final String INSERT_ORDER = "INSERT INTO Orders (idCustomer, startDate,totalMoney, paymentid) VALUES (?, ?, ?,?)";
    private static final String UPDATE_ORDER = "UPDATE Orders SET idCustomer = ?, startDate = ?,totalMoney = ?, paymentid = ? WHERE idOrder = ?";
    private static final String DELETE_ORDER = "DELETE FROM Orders WHERE idOrder = ?";

    public List<OrderDTO> selectAllOrders() {
        List<OrderDTO> orders = new ArrayList<>();
        try (Connection connection = DBUtils.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_ORDERS)) {
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int idOrder = rs.getInt("idOrder");
                int idCustomer = rs.getInt("idCustomer");
                String startDate = rs.getString("startDate");
                double totalMoney = rs.getDouble("totalMoney");
                int paymentid = rs.getInt("paymentid");
                orders.add(new OrderDTO(idOrder, idCustomer, startDate, totalMoney, paymentid));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    public OrderDTO selectOrderById(int id) {
        OrderDTO order = null;
        try (Connection connection = DBUtils.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ORDER_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                int idCustomer = rs.getInt("idCustomer");
                String startDate = rs.getString("startDate");
                double totalMoney = rs.getDouble("totalMoney");
                int paymentid = rs.getInt("paymentid");
                order = new OrderDTO(id, idCustomer, startDate, totalMoney, paymentid);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return order;
    }

    public void insertOrder(OrderDTO order) {
        try (Connection connection = DBUtils.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(INSERT_ORDER)) {
            preparedStatement.setInt(1, order.getIdCustomer());
            preparedStatement.setString(2, order.getStartDate());
            preparedStatement.setDouble(3, order.getTotalMoney());
            preparedStatement.setInt(4, order.getPaymentid());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean updateOrder(OrderDTO order) {
        boolean rowUpdated = false;
        try (Connection connection = DBUtils.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_ORDER)) {
            preparedStatement.setInt(1, order.getIdCustomer());
            preparedStatement.setString(2, order.getStartDate());
            preparedStatement.setDouble(3, order.getTotalMoney());
            preparedStatement.setInt(4, order.getPaymentid());
            preparedStatement.setInt(5, order.getIdOrder());

            rowUpdated = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowUpdated;
    }

    public boolean deleteOrder(int id) {
        boolean rowDeleted = false;
        try (Connection connection = DBUtils.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(DELETE_ORDER)) {
            preparedStatement.setInt(1, id);
            rowDeleted = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowDeleted;
    }

    public void addOrder(UserDTO u, Cart cart, PaymentDTO p) {
        LocalDate curDate = java.time.LocalDate.now();
        String date = curDate.toString();
        try {
            //add vào Oder
            Connection conn = DBUtils.getConnection();
//         String sqltest = "SELECT idCustomer FROM Customer WHERE"
            String sql = "INSERT INTO Orders (idCustomer, startDate,totalMoney, paymentid) VALUES (?, ?, ?,?)";
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setInt(1, u.getIdCustomer());
            stm.setString(2, date);
            stm.setDouble(3, cart.getTotalMoney());
            stm.setInt(4, p.getPaymentId());
            stm.executeUpdate();
            //lấy id của Order vừa add
            String sqll = "SELECT TOP 1 idOrder FROM Orders ORDER BY idOrder DESC ";
            PreparedStatement stmm = conn.prepareStatement(sqll);
            ResultSet rs = stmm.executeQuery();
            //add vào OrderDetail
            if (rs.next()) {
                int idOrder = rs.getInt(1);
                for (Item i : cart.getItem()) {
                    String sqlll = "INSERT INTO OrderDetail VALUES(?,?,?,?)";
                    PreparedStatement stmmm = conn.prepareStatement(sqlll);
                    stmmm.setInt(1, idOrder);
                    stmmm.setInt(2, i.getProduct().getIdProduct());
                    stmmm.setInt(3, i.getQuantity());
                    stmmm.setDouble(4, i.getPrice());
                    stmmm.executeUpdate();
                    String updateInventorySql = "UPDATE Products SET productQuantity = productQuantity - ? WHERE idProduct = ?";
                    PreparedStatement updateInventoryStm = conn.prepareStatement(updateInventorySql);
                    updateInventoryStm.setInt(1, i.getQuantity());
                    updateInventoryStm.setInt(2, i.getProduct().getIdProduct());
                    updateInventoryStm.executeUpdate();
                }

            }
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
    }

    private static final String SELECT_ORDER_DETAILS_BY_ID
            = "SELECT o.idOrder, o.idCustomer, o.startDate, o.totalMoney, o.paymentid, "
            + "c.lastName AS customerName,c.address as address , p.nameProduct AS productName, od.quantity, od.totalCost, "
            + "pm.payment_method AS paymentMethod "
            + "FROM Orders o "
            + "JOIN Customer c ON o.idCustomer = c.idCustomer "
            + "JOIN OrderDetail od ON o.idOrder = od.idOrder "
            + "JOIN Products p ON od.idProduct = p.idProduct "
            + "JOIN Payments pm ON o.paymentid = pm.paymentid "
            + "WHERE o.idOrder = ?";

    public List<OrderDTO> selectOrderDetailsById(int idOrder) {
        List<OrderDTO> orderDetails = new ArrayList<>();
        try (Connection connection = DBUtils.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ORDER_DETAILS_BY_ID)) {
            preparedStatement.setInt(1, idOrder);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int idCustomer = rs.getInt("idCustomer");
                String startDate = rs.getString("startDate");
                double totalMoney = rs.getDouble("totalMoney");
                String paymentMethod = rs.getString("paymentMethod");
                String customerName = rs.getString("customerName");
                String productName = rs.getString("productName");
                int quantity = rs.getInt("quantity");
                double totalCost = rs.getDouble("totalCost");
                String address = rs.getString("address");
                orderDetails.add(new OrderDTO(idOrder, idCustomer, startDate, totalMoney, paymentMethod,
                        customerName, productName, quantity, totalCost, address));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderDetails;
    }

    public static void main(String[] args) {
        OrderDAO orderDAO = new OrderDAO();
        int testOrderId = 1; // Thay thế bằng idOrder hợp lệ để kiểm tra
        List<OrderDTO> orderDetails = orderDAO.selectOrderDetailsById(testOrderId);

        // In kết quả ra console để kiểm tra
        for (OrderDTO order : orderDetails) {
            System.out.println("Order ID: " + order.getIdOrder());
            System.out.println("Customer ID: " + order.getIdCustomer());
            System.out.println("Start Date: " + order.getStartDate());
            System.out.println("Total Money: " + order.getTotalMoney());
            System.out.println("Payment ID: " + order.getPaymentName() );
            System.out.println("Customer Name: " + order.getCustomerName());
            System.out.println("Product Name: " + order.getProductName());
            System.out.println("Quantity: " + order.getQuantity());
            System.out.println("Total Cost: " + order.getTotalCost());
            System.out.println("Addess: " + order.getAddress());
        }
    }
}
