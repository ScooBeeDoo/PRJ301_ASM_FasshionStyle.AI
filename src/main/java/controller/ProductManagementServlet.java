package controller;

import dao.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Product;
import model.User;

import java.io.IOException;
import java.util.List;

@WebServlet("/product-management")
public class ProductManagementServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null || !"seller".equals(user.getRole())) {
            response.sendRedirect("login.jsp?role=seller");
            return;
        }

        ProductDAO dao = new ProductDAO();
        List<Product> products = dao.getProductsBySeller(user.getId());

        request.setAttribute("products", products);
        request.getRequestDispatcher("WEB-INF/seller/products.jsp").forward(request, response);
    }
}
