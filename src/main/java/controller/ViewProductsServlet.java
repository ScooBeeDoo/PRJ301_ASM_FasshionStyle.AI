package controller;

import dao.ProductDAO;
import model.Product;
import model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/view-products")
public class ViewProductsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");

        if (user == null || !"seller".equals(user.getRole())) {
            response.sendRedirect("login.jsp");
            return;
        }

        ProductDAO dao = new ProductDAO();
        List<Product> products = dao.getProductsBySeller(user.getId());

        request.setAttribute("products", products);
        request.getRequestDispatcher("WEB-INF/seller/list-products.jsp").forward(request, response);
    }
}
