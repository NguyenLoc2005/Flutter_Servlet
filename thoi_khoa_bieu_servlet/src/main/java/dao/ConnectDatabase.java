package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectDatabase {
	//Hàm kết nối
	public static Connection Connect() {
		//Thông tin kết nối
		String url = "jdbc:mysql:/localhost:3306/ThoiKhoaBieu";
		String user = "root";
		String password = "2005";
		Connection conn = null;
		try {
			//Tạo kết nối
			conn = DriverManager.getConnection(url, user, password);
			System.err.println("Kết nối với database thành công");
		}
		catch(SQLException e) {
			System.out.println("Không kết nối được với database");
			e.printStackTrace();
		}
		return conn;
	}
}
