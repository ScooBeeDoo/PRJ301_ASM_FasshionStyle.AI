package controller;

import dao.ProductDAO;
import model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/update-product")
public class UpdateProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // Lấy dữ liệu từ form
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        String imageUrl = request.getParameter("imageUrl");
        String category = request.getParameter("category");
        int stock = Integer.parseInt(request.getParameter("stock"));

        // Tạo đối tượng Product mới
        Product p = new Product();
        p.setId(id);
        p.setName(name);
        p.setDescription(description);
        p.setPrice(price);
        p.setImageUrl(imageUrl);
        p.setCategory(category);
        p.setStock(stock);

        // Gọi DAO để cập nhật
        ProductDAO dao = new ProductDAO();
        dao.updateProduct(p);

        // Redirect về danh sách
        response.sendRedirect("view-products");
        
        System.out.println("Updating product with ID: " + id);

    }
}
