package controller;

import dao.UserDAO;
import model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        UserDAO dao = new UserDAO();
        User user = dao.login(username, password);

        if (user != null) {
            System.out.println("🔐 Tìm thấy user: " + user.getUsername() + " với vai trò: " + user.getRole());

            if (user.getRole().equalsIgnoreCase(role)) {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);

                if (role.equalsIgnoreCase("seller")) {
                    response.sendRedirect("admin/dashboard.jsp");
                } else {
                    response.sendRedirect("index.jsp");
                }
            } else {
                request.setAttribute("error", "Sai vai trò. Bạn đang đăng nhập với tư cách không hợp lệ!");
                request.getRequestDispatcher("login.jsp?role=" + role).forward(request, response);
            }
        } else {
            request.setAttribute("error", "Đăng nhập thất bại. Vui lòng kiểm tra thông tin!");
            request.getRequestDispatcher("login.jsp?role=" + role).forward(request, response);
        }
    }
}
