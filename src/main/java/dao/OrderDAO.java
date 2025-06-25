package dao;

import java.sql.*;
import java.util.*;
import model.CartItem;
import model.Order;
import utils.DBConnection;

public class OrderDAO {

    public List<Order> getOrdersByUserId(int userId) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT * FROM Orders WHERE user_id = ? ORDER BY created_at DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setId(rs.getInt("id"));
                o.setUserId(rs.getInt("user_id"));
                o.setOrderDate(rs.getTimestamp("created_at"));
                o.setTotalAmount(rs.getDouble("total_amount"));
                o.setStatus(rs.getString("status"));
                o.setFullName(rs.getString("full_name"));
                o.setPhone(rs.getString("phone"));
                o.setAddress(rs.getString("address"));
                o.setNote(rs.getString("note"));
                list.add(o);
            }
        } catch (Exception e) {
            System.err.println("❌ Lỗi SQL khi lấy đơn hàng user: " + e.getMessage());
            e.printStackTrace();
        }

        return list;
    }

    public List<Order> getOrdersBySellerId(int sellerId) {
        List<Order> list = new ArrayList<>();
       String sql =
    "SELECT DISTINCT o.id, o.user_id, o.full_name, o.phone, o.address, " +
    "o.note, o.total_amount, o.status, o.created_at " +
    "FROM Orders o " +
    "JOIN OrderDetails od ON o.id = od.order_id " +
    "JOIN Products p ON od.product_id = p.id " +
    "WHERE p.seller_id = ? " +
    "ORDER BY o.created_at DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, sellerId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Order o = new Order();
                o.setId(rs.getInt("id"));
                o.setUserId(rs.getInt("user_id"));
                o.setOrderDate(rs.getTimestamp("created_at"));
                o.setTotalAmount(rs.getDouble("total_amount"));
                o.setStatus(rs.getString("status"));
                o.setFullName(rs.getString("full_name"));
                o.setPhone(rs.getString("phone"));
                o.setAddress(rs.getString("address"));
                o.setNote(rs.getString("note"));
                list.add(o);
            }

        } catch (Exception e) {
            System.err.println("❌ Lỗi SQL khi lấy đơn hàng seller: " + e.getMessage());
            e.printStackTrace();
        }

        return list;
    }

    public boolean createOrder(int userId, String fullName, String phone, String address, String note, double total, Map<Integer, CartItem> cart) {
        String insertOrderSQL = "INSERT INTO Orders(user_id, full_name, phone, address, note, total_amount) VALUES (?, ?, ?, ?, ?, ?)";
        String insertDetailSQL = "INSERT INTO OrderDetails(order_id, product_id, quantity, price) VALUES (?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection()) {
            conn.setAutoCommit(false);

            try (PreparedStatement orderStmt = conn.prepareStatement(insertOrderSQL, Statement.RETURN_GENERATED_KEYS)) {
                orderStmt.setInt(1, userId);
                orderStmt.setString(2, fullName);
                orderStmt.setString(3, phone);
                orderStmt.setString(4, address);
                orderStmt.setString(5, note);
                orderStmt.setDouble(6, total);

                System.out.println(">> Bắt đầu insert vào bảng Orders");
                orderStmt.executeUpdate();

                ResultSet rs = orderStmt.getGeneratedKeys();
                if (rs.next()) {
                    int orderId = rs.getInt(1);
                    System.out.println(">> Đã tạo Order ID: " + orderId);

                    try (PreparedStatement detailStmt = conn.prepareStatement(insertDetailSQL)) {
                        for (CartItem item : cart.values()) {
                            System.out.println(">> Thêm sản phẩm ID: " + item.getProduct().getId() + " - SL: " + item.getQuantity());
                            detailStmt.setInt(1, orderId);
                            detailStmt.setInt(2, item.getProduct().getId());
                            detailStmt.setInt(3, item.getQuantity());
                            detailStmt.setDouble(4, item.getProduct().getPrice());
                            detailStmt.addBatch();
                        }

                        detailStmt.executeBatch();
                        conn.commit();
                        System.out.println(">> Đã commit toàn bộ đơn hàng");
                        return true;
                    }
                }
            } catch (Exception e) {
                conn.rollback();
                System.out.println("!! Lỗi khi insert Order/Details. Rollback lại.");
                e.printStackTrace();
            }

        } catch (Exception ex) {
            System.out.println("!! Không thể kết nối DB hoặc lỗi ngoài.");
            ex.printStackTrace();
        }

        return false;
    }
}
