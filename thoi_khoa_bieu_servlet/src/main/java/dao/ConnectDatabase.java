package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectDatabase {
    public static Connection Connect() {
        String url = "jdbc:mysql://127.0.0.1:3306/thoi-khoa-bieu?useSSL=false&serverTimezone=UTC";
        String user = "root";
        String password = "2005";
        Connection conn = null;
        try {
            // Ép load driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Tạo kết nối
            conn = DriverManager.getConnection(url, user, password);
            System.out.println("Kết nối thành công!");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}