package dao;

import model.User;
import utils.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {

    public boolean register(User user) {
    String sql = "INSERT INTO Users (username, password, email, full_name, age, gender, hometown, role, created_at, updated_at, is_deleted) " +
                 "VALUES (?, ?, ?, ?, ?, ?, ?, ?, GETDATE(), GETDATE(), 0)";

    try (Connection conn = DBConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setString(1, user.getUsername());  // username
        ps.setString(2, user.getPassword());  // password
        ps.setString(3, user.getEmail());     // email
        ps.setString(4, user.getFullName());  // full_name
        ps.setInt(5, user.getAge());          // age
        ps.setString(6, user.getGender());    // gender
        ps.setString(7, user.getHometown());  // hometown
        ps.setString(8, user.getRole());      // role

        int rows = ps.executeUpdate();
        System.out.println("✅ SQL INSERT executed, affected rows: " + rows);
        return rows > 0;

    } catch (SQLException e) {
        System.err.println("❌ Lỗi SQL khi đăng ký: " + e.getMessage());
        return false;
    } catch (Exception e) {
        System.err.println("❌ Lỗi khác khi đăng ký: " + e.getMessage());
        return false;
    }
}


    public User login(String username, String password) {
        String sql = "SELECT * FROM Users WHERE username = ? AND password = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                u.setEmail(rs.getString("email"));
                u.setFullName(rs.getString("full_name"));
                u.setAge(rs.getInt("age"));
                u.setGender(rs.getString("gender"));
                u.setHometown(rs.getString("hometown"));
                u.setRole(rs.getString("role"));
                u.setPhone(rs.getString("phone")); 

                return u;
            }

        } catch (SQLException e) {
            System.err.println("❌ Lỗi khi đăng nhập: " + e.getMessage());
        }

        return null;
    }
}
