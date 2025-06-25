package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.CartItem;
import model.Product;
import dao.ProductDAO;

import java.io.IOException;
import java.util.*;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
        if (cart == null) cart = new HashMap<>();

        String action = request.getParameter("action");
        String idParam = request.getParameter("id");

        if (idParam == null || action == null) {
            response.sendRedirect("cart.jsp");
            return;
        }

        try {
            int id = Integer.parseInt(idParam);
            System.out.println("Action: " + action + ", ID: " + id);

            if ("add".equals(action)) {
                Product p = new ProductDAO().getProductById(id);
                if (cart.containsKey(id)) {
                    cart.get(id).setQuantity(cart.get(id).getQuantity() + 1);
                } else {
                    cart.put(id, new CartItem(p, 1));
                }

            } else if ("update".equals(action)) {
                String deltaStr = request.getParameter("delta");
                String qtyStr = request.getParameter("quantity");

                if (deltaStr != null && !deltaStr.isEmpty()) {
                    int delta = Integer.parseInt(deltaStr);
                    CartItem item = cart.get(id);
                    if (item != null) {
                        int newQty = item.getQuantity() + delta;
                        if (newQty <= 0) {
                            cart.remove(id);
                        } else {
                            item.setQuantity(newQty);
                        }
                    }
                } else if (qtyStr != null && !qtyStr.isEmpty()) {
                    int qty = Integer.parseInt(qtyStr);
                    CartItem item = cart.get(id);
                    if (qty <= 0) {
                        cart.remove(id);
                    } else if (item != null) {
                        item.setQuantity(qty);
                    }
                }

            } else if ("remove".equals(action)) {
                cart.remove(id);
            }

        } catch (NumberFormatException e) {
            e.printStackTrace();
        }

        session.setAttribute("cart", cart);
        response.sendRedirect("cart.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }
}
