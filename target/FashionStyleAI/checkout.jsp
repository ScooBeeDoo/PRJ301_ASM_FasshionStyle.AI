<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>
<%@ page import="model.CartItem, java.util.*" %>

<h2>Thanh toán đơn hàng</h2>

<%
    Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
    double total = 0;
%>

<% if (cart == null || cart.isEmpty()) { %>
    <p>Bạn chưa chọn sản phẩm nào để thanh toán.</p>
<% } else { %>

<table class="table table-bordered">
  <thead>
    <tr>
      <th>Sản phẩm</th>
      <th>Giá</th>
      <th>Số lượng</th>
      <th>Tổng</th>
    </tr>
  </thead>
  <tbody>
    <% for (CartItem item : cart.values()) {
         total += item.getTotalPrice(); %>
      <tr>
        <td><%= item.getProduct().getName() %></td>
        <td><%= item.getProduct().getPrice() %> đ</td>
        <td><%= item.getQuantity() %></td>
        <td><%= item.getTotalPrice() %> đ</td>
      </tr>
    <% } %>
    <tr>
      <td colspan="3" class="text-end"><strong>Tổng cộng:</strong></td>
      <td><strong><%= total %> đ</strong></td>
    </tr>
  </tbody>
</table>

<hr>
<h4>Thông tin giao hàng</h4>
<form action="checkout" method="post">
  <div class="mb-3">
    <label class="form-label">Họ và tên</label>
    <input type="text" class="form-control" name="fullname" required>
  </div>
  <div class="mb-3">
    <label class="form-label">Số điện thoại</label>
    <input type="text" class="form-control" name="phone" required>
  </div>
  <div class="mb-3">
    <label class="form-label">Địa chỉ giao hàng</label>
    <textarea class="form-control" name="address" required></textarea>
  </div>
  <div class="mb-3">
    <label class="form-label">Ghi chú</label>
    <textarea class="form-control" name="note"></textarea>
  </div>
  <button type="submit" class="btn btn-primary">Xác nhận đặt hàng</button>
</form>

<% } %>

<%@ include file="footer.jsp" %>
