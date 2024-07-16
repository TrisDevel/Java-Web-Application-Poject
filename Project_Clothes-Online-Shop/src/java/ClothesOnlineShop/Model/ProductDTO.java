/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClothesOnlineShop.Model;

import java.math.BigDecimal;

/**
 *
 * @author buitr
 */
public class ProductDTO {
    private int idProduct;
    private String nameProduct;
    private String size;
    private String type;
    private String color;
    private int productQuantity;
    private double cost;
    private String description;
    private String images;

    // Constructors
    public ProductDTO() {}

    public ProductDTO(int idProduct, String nameProduct, String size, String type, String color, int productQuantity, double cost, String description, String images) {
        this.idProduct = idProduct;
        this.nameProduct = nameProduct;
        this.size = size;
        this.type = type;
        this.color = color;
        this.productQuantity = productQuantity;
        this.cost = cost;
        this.description = description;
        this.images = images;
    }
    
     public ProductDTO( String nameProduct, String size, String type, String color, int productQuantity, double cost, String description, String images) {
        this.nameProduct = nameProduct;
        this.size = size;
        this.type = type;
        this.color = color;
        this.productQuantity = productQuantity;
        this.cost = cost;
        this.description = description;
        this.images = images;
    }

    // Getters and setters
    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public String getNameProduct() {
        return nameProduct;
    }

    public void setNameProduct(String nameProduct) {
        this.nameProduct = nameProduct;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getProductQuantity() {
        return productQuantity;
    }

    public void setProductQuantity(int productQuantity) {
        this.productQuantity = productQuantity;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }
}

