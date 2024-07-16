/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClothesOnlineShop.Model;

import java.sql.Date;

public class OrderDTO {

    private int idOrder;
    private int idCustomer;
    private String startDate;
    private double totalMoney;
    private int paymentid;
    private String customerName;
    private String paymentName;
    private String productName;
    private int quantity;
    private double totalCost;
    private String address;

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotalCost() {
        return totalCost;
    }

    public void setTotalCost(double totalCost) {
        this.totalCost = totalCost;
    }

    public String getPaymentName() {
        return paymentName;
    }

    public void setPaymentName(String paymentName) {
        this.paymentName = paymentName;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public OrderDTO() {
    }

    public OrderDTO(int idOrder, int idCustomer, String startDate, double totalMoney, int paymentid) {
        this.idOrder = idOrder;
        this.idCustomer = idCustomer;
        this.startDate = startDate;
        this.totalMoney = totalMoney;
        this.paymentid = paymentid;

    }

    public OrderDTO(int paymentid, String paymentName) {
        this.paymentid = paymentid;
        this.paymentName = paymentName;
    }

     public OrderDTO(int idOrder, int idCustomer, String startDate, double totalMoney, String paymentName,
                    String customerName, String productName, int quantity, double totalCost, String address) {
        this.idOrder = idOrder;
        this.idCustomer = idCustomer;
        this.startDate = startDate;
        this.totalMoney = totalMoney;
        this.paymentName = paymentName;
        this.customerName = customerName;
        this.productName = productName;
        this.quantity = quantity;
        this.totalCost = totalCost;
        this.address = address;
    }
    public int getIdOrder() {
        return idOrder;
    }

    public void setIdOrder(int idOrder) {
        this.idOrder = idOrder;
    }

    public int getIdCustomer() {
        return idCustomer;
    }

    public void setIdCustomer(int idCustomer) {
        this.idCustomer = idCustomer;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public int getPaymentid() {
        return paymentid;
    }

    public void setPaymentid(int paymentid) {
        this.paymentid = paymentid;
    }

    public double getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(double totalMoney) {
        this.totalMoney = totalMoney;
    }

}
