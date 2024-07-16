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
public class Item {
    private ProductDTO product;
    private String size; 
    private int quantity;
    private double price;

    public Item() {
    }

    public Item(ProductDTO product, String size, int quantity, double price) {
        this.product = product;
        this.size = size;
        this.quantity = quantity;
        this.price = price;
    }

    

    public ProductDTO getProduct() {
        return product;
    }

    public void setProduct(ProductDTO product) {
        this.product = product;
    }
    
    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }
    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
    
}
