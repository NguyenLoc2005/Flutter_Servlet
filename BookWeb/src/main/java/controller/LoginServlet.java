package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dao.UserDAO;
import model.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
	        throws ServletException, IOException {

	    req.setCharacterEncoding("UTF-8");
	    resp.setContentType("text/html;charset=UTF-8");

	    String username = req.getParameter("username");
	    String password = req.getParameter("password");
	    String remember = req.getParameter("remember");

	    UserDAO userDAO = new UserDAO();
	    User user = userDAO.login(username, password);

	    if (user != null) {
	        HttpSession session = req.getSession();
	        session.setAttribute("user", user);

	        // Nếu tick Remember me thì lưu cookie
	        if ("on".equals(remember)) {
	            Cookie ckUser = new Cookie("username", username);
	            Cookie ckPass = new Cookie("password", password); // ⚠️ thực tế nên mã hóa
	            ckUser.setMaxAge(7 * 24 * 60 * 60); // 7 ngày
	            ckPass.setMaxAge(7 * 24 * 60 * 60);
	            ckUser.setPath("/");
	            ckPass.setPath("/");
	            resp.addCookie(ckUser);
	            resp.addCookie(ckPass);
	        } else {
	            // Xóa cookie nếu bỏ chọn Remember me
	            Cookie ckUser = new Cookie("username", "");
	            Cookie ckPass = new Cookie("password", "");
	            ckUser.setMaxAge(0);
	            ckPass.setMaxAge(0);
	            resp.addCookie(ckUser);
	            resp.addCookie(ckPass);
	        }

	        // Điều hướng theo role
	        if ("admin".equalsIgnoreCase(user.getRole())) {
	            resp.sendRedirect("adminHome");
	        } else {
	            resp.sendRedirect("clientHome");
	        }
	    } else {
	        req.setAttribute("error", "Sai tài khoản hoặc mật khẩu!");
	        req.getRequestDispatcher("login.jsp").forward(req, resp);
	    }
	}
}
