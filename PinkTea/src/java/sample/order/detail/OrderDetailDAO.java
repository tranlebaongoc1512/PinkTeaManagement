/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.order.detail;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import sample.utils.DBUtils;

/**
 *
 * @author ADMIN
 */
public class OrderDetailDAO {

    private static final String INSERT = "INSERT INTO tblOrderDetail(detailID, orderID, productID, price, quantity) VALUES(?, ?, ?, ?, ?)";

    public boolean insert(OrderDetailDTO orderDetail) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT);
                ptm.setString(1, orderDetail.getDetailID());
                ptm.setString(2, orderDetail.getOrderID());
                ptm.setString(3, orderDetail.getProductID());
                ptm.setFloat(4, orderDetail.getPrice());
                ptm.setInt(5, orderDetail.getQuantity());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
}
