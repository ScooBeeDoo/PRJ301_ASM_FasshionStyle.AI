package controller;

import dao.OrderDAO;
import model.Order;
import model.User;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/order-history")
public class OrderHistoryServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<Order> orders = new OrderDAO().getOrdersByUserId(user.getId());
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("order-history.jsp").forward(request, response);
    }
}
