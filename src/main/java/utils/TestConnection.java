package utils;

import java.sql.*;

public class TestConnection {
    public static void main(String[] args) {
        String url = "jdbc:sqlserver://localhost:1433;databaseName=FashionStyleAI;encrypt=true;trustServerCertificate=true";
        String user = "sa"; // sửa nếu khác
        String password = "Bibbee212004"; // sửa đúng mật khẩu SQL Server

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection conn = DriverManager.getConnection(url, user, password);
            System.out.println("✅ Kết nối thành công!");
        } catch (Exception e) {
            System.out.println("❌ Kết nối thất bại!");
            e.printStackTrace();
        }
    }
}
