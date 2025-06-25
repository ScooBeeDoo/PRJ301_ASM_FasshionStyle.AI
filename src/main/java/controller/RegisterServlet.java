package controller;

import dao.UserDAO;
import model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String username = request.getParameter("username");
        String fullName = request.getParameter("fullname");
        String ageRaw = request.getParameter("age");
        String gender = request.getParameter("gender");
        String hometown = request.getParameter("hometown");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirm = request.getParameter("confirm");
        String role = request.getParameter("role");

        System.out.println("Đã nhận request đăng ký:");
        System.out.println("Username: " + username);
        System.out.println("FullName: " + fullName);
        System.out.println("Email: " + email);
        System.out.println("Password: " + password);
        System.out.println("Confirm: " + confirm);
        System.out.println("Role: " + role);
        System.out.println("Gender: " + gender + ", Hometown: " + hometown + ", Age Raw: " + ageRaw);

        int age;
        try {
            age = Integer.parseInt(ageRaw);
        } catch (NumberFormatException e) {
            System.out.println("Lỗi parse age: " + e.getMessage());
            request.setAttribute("error", "Tuổi không hợp lệ!");
            request.getRequestDispatcher("register.jsp?role=" + role).forward(request, response);
            return;
        }

        if (!password.equals(confirm)) {
            System.out.println("Mật khẩu không khớp");
            request.setAttribute("error", "Mật khẩu không khớp!");
            request.getRequestDispatcher("register.jsp?role=" + role).forward(request, response);
            return;
        }

        User user = new User();
        user.setUsername(username);
        user.setFullName(fullName);
        user.setAge(age);
        user.setGender(gender);
        user.setHometown(hometown);
        user.setEmail(email);
        user.setPassword(password);
        user.setRole(role);

        UserDAO dao = new UserDAO();
        boolean success = dao.register(user);

        System.out.println("Kết quả insert SQL: " + success);

        if (success) {
            System.out.println(">>> Đăng ký thành công, chuyển đến login.jsp");
            response.sendRedirect("login.jsp?role=" + role);
        } else {
            System.out.println(">>> Đăng ký thất bại, quay lại form");
            request.setAttribute("error", "Đăng ký thất bại. Email hoặc Username đã tồn tại?");
            request.getRequestDispatcher("register.jsp?role=" + role).forward(request, response);
        }
    }
}






