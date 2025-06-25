package controller;

import dao.ProductDAO;
import model.Product;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/search-products")
public class SearchProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String keyword = request.getParameter("keyword");
        ProductDAO dao = new ProductDAO();
        List<Product> results = dao.searchProducts(keyword);

        request.setAttribute("products", results);
        request.getRequestDispatcher("view-products.jsp").forward(request, response);
    }
}
