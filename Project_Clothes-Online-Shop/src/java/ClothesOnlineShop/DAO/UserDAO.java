package ClothesOnlineShop.DAO;

import ClothesOnlineShop.Model.UserDTO;
import ClothesOnlineShop.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

    public UserDTO login(String email, String password) {
        String sql = "SELECT * FROM Customer WHERE email = ? or customerAccount = ? AND customerPassword = ?";
        UserDTO user = null;

        try {
            Connection conn = DBUtils.getConnection();
            if (conn != null) {
                System.out.println("Database connection successful");
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1, email);
                ps.setString(2, email);
                ps.setString(3, password);
                ResultSet rs = ps.executeQuery();

                if (rs != null && rs.next()) {
                    System.out.println("User found in database");
                    user = new UserDTO();
                    user.setIdCustomer(rs.getInt("idCustomer"));
                    user.setFirstName(rs.getString("firstName"));
                    user.setLastName(rs.getString("lastName"));
                    System.out.println(user.getLastName());
                    user.setCustomerAccount(rs.getString("customerAccount"));
                    user.setCustomerPassword(rs.getString("customerPassword"));
                    user.setAddress(rs.getString("address"));
                    user.setGender(rs.getString("gender"));
                    user.setEmail(rs.getString("email"));
                    user.setPhoneNumber(rs.getString("phoneNumber"));
                } else {
                    System.out.println("No user found with given credentials");
                }
                rs.close();
                ps.close();
                conn.close();
            } else {
                System.out.println("Failed to make connection!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error in DAO: " + e.getMessage());
        }
        return user;
    }

    public UserDTO selectCustomer(int idCustomer) {
        UserDTO customer = null;
        String sql = "SELECT * FROM Customer WHERE idCustomer = ?";
        try (Connection connection = DBUtils.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, idCustomer);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                String firstName = rs.getString("firstName");
                String lastName = rs.getString("lastName");
                String customerAccount = rs.getString("customerAccount");
                String customerPassword = rs.getString("customerPassword");
                String address = rs.getString("address");
                String gender = rs.getString("gender");
                String email = rs.getString("email");
                String phoneNumber = rs.getString("phoneNumber");
                customer = new UserDTO(idCustomer, firstName, lastName, customerAccount, customerPassword, address, gender, email, phoneNumber);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer;
    }

    public List<UserDTO> selectAllCustomers() {
        List<UserDTO> customers = new ArrayList<>();
        String sql = "SELECT * FROM Customer";
        try (Connection connection = DBUtils.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int idCustomer = rs.getInt("idCustomer");
                String firstName = rs.getString("firstName");
                String lastName = rs.getString("lastName");
                String customerAccount = rs.getString("customerAccount");
                String customerPassword = rs.getString("customerPassword");
                String address = rs.getString("address");
                String gender = rs.getString("gender");
                String email = rs.getString("email");
                String phoneNumber = rs.getString("phoneNumber");
                customers.add(new UserDTO(idCustomer, firstName, lastName, customerAccount, customerPassword, address, gender, email, phoneNumber));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customers;
    }

    // UPDATE
    public void updateCustomer(UserDTO customer) {
        String sql = "UPDATE Customer SET firstName=?, lastName=?, address=?, gender=?, email=?, phoneNumber=? WHERE idCustomer=?";
        try (Connection connection = DBUtils.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, customer.getFirstName());
            preparedStatement.setString(2, customer.getLastName());
            preparedStatement.setString(3, customer.getAddress());
            preparedStatement.setString(4, customer.getGender());
            preparedStatement.setString(5, customer.getEmail());
            preparedStatement.setString(6, customer.getPhoneNumber());
            preparedStatement.setInt(7, customer.getIdCustomer());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void updateCustomerAdmin(UserDTO customer) {
        String sql = "UPDATE Customer SET firstName=?, lastName=?, customerAccount=?, customerPassword=?, address=?, gender=?, email=?, phoneNumber=? WHERE idCustomer=?";
        try (Connection connection = DBUtils.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, customer.getFirstName());
            preparedStatement.setString(2, customer.getLastName());
            preparedStatement.setString(3, customer.getCustomerAccount());
            preparedStatement.setString(4, customer.getCustomerPassword());
            preparedStatement.setString(5, customer.getAddress());
            preparedStatement.setString(6, customer.getGender());
            preparedStatement.setString(7, customer.getEmail());
            preparedStatement.setString(8, customer.getPhoneNumber());
            preparedStatement.setInt(9, customer.getIdCustomer());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    

    // DELETE
    public void deleteCustomer(int idCustomer) {
        String sql = "DELETE FROM Customer WHERE idCustomer = ?";
        try (Connection connection = DBUtils.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, idCustomer);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void insertCustomer(UserDTO customer) {
        String sql = "INSERT INTO Customer (firstName, lastName, customerAccount, customerPassword, address, gender, email, phoneNumber) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection connection = DBUtils.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, customer.getFirstName());
            preparedStatement.setString(2, customer.getLastName());
            preparedStatement.setString(3, customer.getCustomerAccount());
            preparedStatement.setString(4, customer.getCustomerPassword());
            preparedStatement.setString(5, customer.getAddress());
            preparedStatement.setString(6, customer.getGender());
            preparedStatement.setString(7, customer.getEmail());
            preparedStatement.setString(8, customer.getPhoneNumber());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean isUserExists(String userName) {
        boolean exists = false;
        String sql = "SELECT * FROM Customer WHERE customerAccount = ?";
        try (Connection connection = DBUtils.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, userName);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                exists = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return exists;
    }

    public String getCustomerNameById(int idCustomer) {
    String customerName = null;
    String sql = "SELECT firstName, lastName FROM Customer WHERE idCustomer = ?";
    try (Connection connection = DBUtils.getConnection();
         PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
        preparedStatement.setInt(1, idCustomer);
        ResultSet rs = preparedStatement.executeQuery();
        if (rs.next()) {
            String firstName = rs.getString("firstName");
            String lastName = rs.getString("lastName");
            customerName = firstName + " " + lastName;
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return customerName;
}



}
