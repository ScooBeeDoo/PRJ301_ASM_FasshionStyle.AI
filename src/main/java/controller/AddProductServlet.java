package controller;

import dao.ProductDAO;
import model.Product;
import model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/add-product")
public class AddProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null || !"seller".equals(user.getRole())) {
            response.sendRedirect("login.jsp");
            return;
        }

        Product p = new Product();
        p.setName(request.getParameter("name"));
        p.setDescription(request.getParameter("description"));
        p.setPrice(Double.parseDouble(request.getParameter("price")));
        p.setImageUrl(request.getParameter("imageUrl"));
        p.setCategory(request.getParameter("category"));
        p.setStock(Integer.parseInt(request.getParameter("stock")));
        p.setSellerId(user.getId()); // 🔹 Gán sellerId từ người dùng đăng nhập

        new ProductDAO().addProduct(p);

        response.sendRedirect("view-products");
    }
}
