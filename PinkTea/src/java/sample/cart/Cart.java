/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.cart;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author ADMIN
 */
public class Cart {

    private Map<String, ProductCart> cart;

    public Cart() {
    }

    public Cart(Map<String, ProductCart> cart) {
        this.cart = cart;
    }

    public Map<String, ProductCart> getCart() {
        return cart;
    }

    public void setCart(Map<String, ProductCart> cart) {
        this.cart = cart;
    }

    public boolean add(ProductCart productCart) {
        boolean check = false;
        if (this.cart == null) {
            this.cart = new HashMap<>();
        }
        if (this.cart.containsKey(productCart.getProduct().getProductID())) {
            int currentQuantity = this.cart.get(productCart.getProduct().getProductID()).getQuantity();
            productCart.setQuantity(currentQuantity + productCart.getQuantity());
        }
        this.cart.put(productCart.getProduct().getProductID(), productCart);
        check = true;
        return check;
    }

    public boolean remove(String productID) {
        boolean check = false;
        if (this.cart != null) {
            if (this.cart.containsKey(productID)) {
                this.cart.remove(productID);
                check = true;
            }
        }
        return check;
    }

    public boolean update(String productID, ProductCart productCart) {
        boolean check = false;
        if (this.cart != null) {
            this.cart.replace(productID, productCart);
            check = true;
        }
        return check;
    }
}
