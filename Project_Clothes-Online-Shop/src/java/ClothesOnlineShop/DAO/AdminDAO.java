/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClothesOnlineShop.DAO;

import ClothesOnlineShop.Model.AdminDTO;
import ClothesOnlineShop.Model.UserDTO;
import ClothesOnlineShop.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author buitr
 */
public class AdminDAO {
    public AdminDTO login(String adAccount, String password) {
        String sql = "SELECT adName FROM Admin WHERE adAccount = ? AND adPass = ?";
        AdminDTO admin = null;

        try {
            Connection conn = DBUtils.getConnection();
            if (conn != null) {
                System.out.println("Database connection successful");
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1,adAccount );
                ps.setString(2, password);
                ResultSet rs = ps.executeQuery();

                if (rs != null && rs.next()) {
                    System.out.println("Admin found in database");
                    admin = new AdminDTO();
                    //user.setIdCustomer(rs.getInt("idCustomer"));
                    //user.setFirstName(rs.getString("firstName"));
                    admin.setAdName(rs.getString("adName"));
                    System.out.println(admin.getAdName());
                    //user.setCustomerAccount(rs.getString("customerAccount"));
                    //user.setCustomerPassword(rs.getString("customerPassword"));
                    //user.setAddress(rs.getString("address"));
                    //user.setGender(rs.getString("gender"));
                    //user.setEmail(rs.getString("email"));
                    //user.setPhoneNumber(rs.getString("phoneNumber"));
                } else {
                    System.out.println("No admin found with given credentials");
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
        return admin;
    }
}
