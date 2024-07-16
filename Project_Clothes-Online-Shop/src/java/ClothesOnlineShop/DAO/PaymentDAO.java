package ClothesOnlineShop.DAO;

import ClothesOnlineShop.Model.PaymentDTO;
import ClothesOnlineShop.utils.DBUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PaymentDAO {
    private static final String SELECT_ALL_PAYMENTS = "SELECT * FROM Payments";
    private static final String SELECT_PAYMENT_BY_ID = "SELECT * FROM Payments WHERE paymentid = ?";
    private static final String INSERT_PAYMENT = "INSERT INTO Payments (payment_method) VALUES (?)";
    private static final String UPDATE_PAYMENT = "UPDATE Payments SET payment_method = ? WHERE paymentid = ?";
    private static final String DELETE_PAYMENT = "DELETE FROM Payments WHERE paymentid = ?";

    public List<PaymentDTO> selectAllPayments() {
        List<PaymentDTO> payments = new ArrayList<>();
        try (Connection connection = DBUtils.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PAYMENTS)) {
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int paymentId = rs.getInt("paymentid");
                String paymentMethod = rs.getString("payment_method");
                payments.add(new PaymentDTO(paymentId, paymentMethod));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return payments;
    }

    public PaymentDTO selectPaymentById(int id) {
        PaymentDTO payment = null;
        try (Connection connection = DBUtils.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PAYMENT_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                String paymentMethod = rs.getString("payment_method");
                payment = new PaymentDTO(id, paymentMethod);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return payment;
    }

    public void insertPayment(PaymentDTO payment) {
        try (Connection connection = DBUtils.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PAYMENT)) {
            preparedStatement.setString(1, payment.getPaymentMethod());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean updatePayment(PaymentDTO payment) {
        boolean rowUpdated = false;
        try (Connection connection = DBUtils.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PAYMENT)) {
            preparedStatement.setString(1, payment.getPaymentMethod());
            preparedStatement.setInt(2, payment.getPaymentId());

            rowUpdated = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowUpdated;
    }

    public boolean deletePayment(int id) {
        boolean rowDeleted = false;
        try (Connection connection = DBUtils.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_PAYMENT)) {
            preparedStatement.setInt(1, id);
            rowDeleted = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowDeleted;
    }
    public String getPaymentMethodById(int paymentId) {
    String paymentMethod = null;
    String sql = "SELECT payment_method FROM Payments WHERE paymentid = ?";
    try (Connection connection = DBUtils.getConnection();
         PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
        preparedStatement.setInt(1, paymentId);
        ResultSet rs = preparedStatement.executeQuery();
        if (rs.next()) {
            paymentMethod = rs.getString("payment_method");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return paymentMethod;
}

}
