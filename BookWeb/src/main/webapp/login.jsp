<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String savedUsername = "";
    String savedPassword = "";
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie c : cookies) {
            if ("username".equals(c.getName())) {
                savedUsername = c.getValue();
            }
            if ("password".equals(c.getName())) {
                savedPassword = c.getValue();
            }
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập</title>
</head>
<body>
    <h2>Đăng nhập</h2>

    <form action="login" method="post">
        <label>Tài khoản:</label>
        <input type="text" name="username" value="<%= savedUsername %>" required><br><br>

        <label>Mật khẩu:</label>
        <input type="password" name="password" value="<%= savedPassword %>" required><br><br>

        <input type="checkbox" name="remember" 
            <%= (savedUsername.isEmpty() ? "" : "checked") %> >
            Ghi nhớ đăng nhập<br><br>

        <input type="submit" value="Đăng nhập">
    </form>

    <p style="color:red;">
        ${error}
    </p>
</body>
</html>
