package controller;

import dao.ProductDAO;
import model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/view-products")
public class ViewProductsServlet extends HttpServlet {
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    List<Product> products = new ProductDAO().getAllProducts();
    request.setAttribute("products", products);
    request.getRequestDispatcher("view-products.jsp").forward(request, response);
    System.out.println("Number of products: " + products.size());

}
}
