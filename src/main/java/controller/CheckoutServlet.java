package controller;

import dao.OrderDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.CartItem;
import model.User;

import java.io.IOException;
import java.util.*;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("Fullname: " + request.getParameter("fullname"));
System.out.println("Phone: " + request.getParameter("phone"));
System.out.println("Address: " + request.getParameter("address"));
System.out.println("Note: " + request.getParameter("note"));


        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();
        Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");

        String[] selectedIds = request.getParameterValues("selectedIds");
        if (selectedIds == null || selectedIds.length == 0 || cart == null) {
            response.sendRedirect("cart.jsp");
            return;
        }

        Map<Integer, CartItem> selectedCart = new HashMap<>();
        double total = 0;

        for (String idStr : selectedIds) {
            try {
                int id = Integer.parseInt(idStr);
                if (cart.containsKey(id)) {
                    CartItem item = cart.get(id);
                    selectedCart.put(id, item);
                    total += item.getTotalPrice();
                }
            } catch (NumberFormatException ignored) {}
        }

        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String fullName = user.getFullName();
        String phone = user.getPhone(); 
        String address = "Địa chỉ mặc định";
        String note = "Không có ghi chú";


        boolean success = new OrderDAO().createOrder(user.getId(), fullName, phone, address, note, total, selectedCart);

        if (success) {
            for (int id : selectedCart.keySet()) {
                cart.remove(id);
            }
            session.setAttribute("cart", cart);
            response.sendRedirect("thankyou.jsp");
        }else {
    System.out.println("DỮ LIỆU NHẬN VÀO:");
    System.out.println("FullName: " + fullName);
    System.out.println("Phone: " + phone);
    System.out.println("Address: " + address);
    System.out.println("Total: " + total);
    System.out.println("Cart size: " + cart.size());
    response.getWriter().println("Lỗi đặt hàng. Vui lòng thử lại.");
}

    }
}
