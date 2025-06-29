package controller;

import dao.ProductDAO;
import model.Product;
import model.User;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/seller/view-products") // ✅ Đường dẫn riêng biệt cho seller

public class ViewSellerProductsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null || !"seller".equals(user.getRole())) {
            response.sendRedirect("login.jsp");
            return;
        }

        int sellerId = user.getId();
        List<Product> products = new ProductDAO().getProductsBySeller(sellerId);

        request.setAttribute("products", products);
        request.getRequestDispatcher("WEB-INF/views/seller/list-products.jsp").forward(request, response);
    }
}
