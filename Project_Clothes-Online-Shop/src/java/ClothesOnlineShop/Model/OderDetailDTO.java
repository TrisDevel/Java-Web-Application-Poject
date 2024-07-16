/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClothesOnlineShop.Model;

/**
 *
 * @author haclo
 */
public class OderDetailDTO {
    private int idOrder,idProduct;
    private int quantity;
    private double totalCost;

    public OderDetailDTO() {
    }

    public OderDetailDTO(int idOrder, int idProduct, int quantity, double totalCost) {
        this.idOrder = idOrder;
        this.idProduct = idProduct;
        this.quantity = quantity;
        this.totalCost = totalCost;
    }

    public int getIdOrder() {
        return idOrder;
    }

    public void setIdOrder(int idOrder) {
        this.idOrder = idOrder;
    }

    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
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
    
}
