package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static final String JDBC_URL = "jdbc:sqlserver://localhost:1433;databaseName=FashionStyleAI;encrypt=false";
    private static final String JDBC_USER = "sa";
    private static final String JDBC_PASSWORD = "Bibbee212004";

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        } catch (ClassNotFoundException e) {
            System.err.println("❌ Không tìm thấy SQLServer JDBC Driver");
            e.printStackTrace();
        }

        return DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
    }
}

