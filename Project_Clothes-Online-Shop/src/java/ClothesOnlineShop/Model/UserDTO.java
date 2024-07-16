  /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClothesOnlineShop.Model;

import java.sql.Date;

/**
 *
 * @author buitr
 */
public class UserDTO {

    public int idCustomer;
    public String firstName;
    public String lastName;
    public String customerAccount;
    public String customerPassword;
    public String address;
    public String gender;
    public String email;
    public String phoneNumber;

    public UserDTO(int idCustomer, String firstName, String lastName, String customerAccount, String customerPassword, String address, String gender, String email, String phoneNumber) {
        this.idCustomer = idCustomer;
        this.firstName = firstName;
        this.lastName = lastName;
        this.customerAccount = customerAccount;
        this.customerPassword = customerPassword;
        this.address = address;
        this.gender = gender;
        this.email = email;
        this.phoneNumber = phoneNumber;
    }

     public UserDTO() {
    }

    public UserDTO(int idCustomer, String firstName, String lastName, String address, String gender, String email, String phoneNumber) {
        this.idCustomer = idCustomer;
        this.firstName = firstName;
        this.lastName = lastName;
        this.address = address;
        this.gender = gender;
        this.email = email;
        this.phoneNumber = phoneNumber;
    }
     

    public int getIdCustomer() {
        return idCustomer;
    }

    public void setIdCustomer(int idCustomer) {
        this.idCustomer = idCustomer;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getCustomerAccount() {
        return customerAccount;
    }

    public void setCustomerAccount(String customerAccount) {
        this.customerAccount = customerAccount;
    }

    public String getCustomerPassword() {
        return customerPassword;
    }

    public void setCustomerPassword(String customerPassword) {
        this.customerPassword = customerPassword;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

}
