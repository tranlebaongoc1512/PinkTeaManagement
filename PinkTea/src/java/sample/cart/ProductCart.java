/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.cart;

import sample.product.ProductDTO;

/**
 *
 * @author ADMIN
 */
public class ProductCart {

    private ProductDTO product;
    private Integer quantity;

    public ProductCart() {
        this.product = new ProductDTO();
        this.quantity = 0;
    }

    public ProductCart(ProductDTO product, Integer quantity) {
        this.product = product;
        this.quantity = quantity;
    }

    public ProductDTO getProduct() {
        return product;
    }

    public void setProduct(ProductDTO product) {
        this.product = product;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

}
