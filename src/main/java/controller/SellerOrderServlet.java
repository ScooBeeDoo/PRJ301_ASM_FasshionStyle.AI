package controller;

import dao.OrderDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Order;
import model.User;

import java.io.IOException;
import java.util.List;

@WebServlet("/seller/orders")
public class SellerOrderServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User seller = (User) session.getAttribute("user");
        if (seller == null || !"seller".equals(seller.getRole())) {
            response.sendRedirect("../login.jsp");
            return;
        }

        List<Order> orders = new OrderDAO().getOrdersBySellerId(seller.getId());
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("/WEB-INF/seller/orders.jsp").forward(request, response);
    }
}
