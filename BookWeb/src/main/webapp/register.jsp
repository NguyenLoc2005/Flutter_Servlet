<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng ký</title>
</head>
<body>
    <h2>Đăng ký tài khoản</h2>

    <form action="register" method="post">
        <label>Tài khoản:</label>
        <input type="text" name="username" required><br><br>

        <label>Mật khẩu:</label>
        <input type="password" name="password" required><br><br>

        <label>Họ và tên:</label>
        <input type="text" name="fullName" required><br><br>

        <label>Email:</label>
        <input type="email" name="email"><br><br>

        <label>Số điện thoại:</label>
        <input type="text" name="phone"><br><br>

        <input type="submit" value="Đăng ký">
    </form>

    <!-- Hiển thị thông báo -->
    <p style="color:green;">
        ${message}
    </p>
    <p style="color:red;">
        ${error}
    </p>

    <p>Đã có tài khoản? <a href="login.jsp">Đăng nhập</a></p>
</body>
</html>
