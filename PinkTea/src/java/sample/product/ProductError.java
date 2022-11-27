/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.product;

/**
 *
 * @author ADMIN
 */
public class ProductError {

    private String productID;
    private String name;
    private float price;
    private int quantity;
    private String image;
    private String categoryID;
    private String error;

    public ProductError() {
        this.productID = "";
        this.name = "";
        this.price = 0;
        this.quantity = 0;
        this.image = "";
        this.categoryID = "";
        this.error = "";
    }

    public ProductError(String productID, String name, float price, int quantity, String image, String categoryID, String error) {
        this.productID = productID;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.image = image;
        this.categoryID = categoryID;
        this.error = error;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

}
