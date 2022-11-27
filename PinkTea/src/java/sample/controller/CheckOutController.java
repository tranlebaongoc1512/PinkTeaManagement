/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.cart.Cart;
import sample.cart.ProductCart;
import sample.order.OrderDAO;
import sample.order.OrderDTO;
import sample.order.detail.OrderDetailDAO;
import sample.order.detail.OrderDetailDTO;
import sample.product.ProductDAO;
import sample.product.ProductDTO;
import sample.user.UserDTO;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "CheckOutController", urlPatterns = {"/CheckOutController"})
public class CheckOutController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "viewCart.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            ProductDAO productDAO = new ProductDAO();
            OrderDAO orderDAO = new OrderDAO();
            OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
            HttpSession session = request.getSession();
            if (session != null) {
                UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                if (loginUser == null) {
                    request.setAttribute("ERROR", "Please login to continue");
                } else {
                    String userID = loginUser.getUserID();
                    String orderID = userID + java.time.LocalDateTime.now();
                    Cart cart = (Cart) session.getAttribute("CART");
                    if (cart != null) {
                        int count = 0;
                        float total = 0;
                        for (ProductCart productCart : cart.getCart().values()) {
                            String productID = productCart.getProduct().getProductID();
                            int cmbQuantity = productCart.getQuantity();
                            int quantity = productDAO.getProductQuantity(productID);
                            if (quantity < cmbQuantity) {
                                request.setAttribute("ERROR", "Don't have enough " + productCart.getProduct().getName());
                            } else {
                                count++;
                                float price = productCart.getProduct().getPrice() * cmbQuantity;
                                total += productCart.getProduct().getPrice() * cmbQuantity;
                                String detailID = orderID + count;
                                OrderDetailDTO orderDetail = new OrderDetailDTO(detailID, orderID, productID, price, cmbQuantity);
                                orderDetailDAO.insert(orderDetail);
                                ProductDTO product = productCart.getProduct();
                                product.setQuantity(quantity - cmbQuantity);
                                productDAO.updateProductQuantity(product);
                            }
                        }
                        OrderDTO order = new OrderDTO(orderID, userID, java.sql.Date.valueOf(java.time.LocalDate.now()), total);
                        orderDAO.insert(order);
                        session.setAttribute("CART", null);
                        request.setAttribute("MESSAGE", "Check Out successfully");
                    }
                }
                url = SUCCESS;
            }
        } catch (Exception e) {
            log("Error at CheckOutController" + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
