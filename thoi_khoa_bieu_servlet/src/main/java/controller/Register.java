package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ConnectDatabase;

@WebServlet("/Register")
public class Register extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/plain; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        String userName = request.getParameter("userName");
        String password1 = request.getParameter("password1");
        String password2 = request.getParameter("password2");

        if (userName == null || password1 == null || password2 == null || userName.isEmpty()
                || password1.isEmpty() || password2.isEmpty()) {
            response.getWriter().print("Vui lòng điền đầy đủ thông tin");
            return;
        }

        if (!password1.equals(password2)) {
            response.getWriter().print("Mật khẩu nhập lại không khớp");
            return;
        }

        try (Connection conn = ConnectDatabase.Connect()) {
            // Kiểm tra username đã tồn tại chưa
            String checkSql = "SELECT * FROM user WHERE userName=?";
            try (PreparedStatement checkStmt = conn.prepareStatement(checkSql)) {
                checkStmt.setString(1, userName);
                try (ResultSet rs = checkStmt.executeQuery()) {
                    if (rs.next()) {
                        response.getWriter().print("Tài khoản đã tồn tại");
                        return;
                    }
                }
            }

            // Thêm user mới
            String insertSql = "INSERT INTO user(userName, password) VALUES(?, ?)";
            try (PreparedStatement insertStmt = conn.prepareStatement(insertSql)) {
                insertStmt.setString(1, userName);
                insertStmt.setString(2, password1);
                insertStmt.executeUpdate();
            }

            response.getWriter().print("Đăng ký thành công");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().print("Lỗi server");
        }
    }
}
