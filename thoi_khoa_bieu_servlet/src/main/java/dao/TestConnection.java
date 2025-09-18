package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class TestConnection {
	public static void main(String[] args) {
	    try (Connection conn = DriverManager.getConnection(
	            "jdbc:mysql://127.0.0.1:3306/thoi-khoa-bieu",
	            "root", "2005")) {
	        if (conn != null) {
	            System.out.println("Kết nối thành công!");
	        } else {
	            System.out.println("Kết nối thất bại!");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

}
