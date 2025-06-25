<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>
<%@ page import="model.Product" %>

<%
    Product p = (Product) request.getAttribute("product");
%>

<div class="row">
  <div class="col-md-5">
    <img src="<%= p.getImageUrl() %>" class="img-fluid" alt="<%= p.getName() %>">
  </div>
  <div class="col-md-7">
    <h3><%= p.getName() %></h3>
    <p><strong>Giá:</strong> <%= p.getPrice() %> đ</p>
    <p><strong>Mô tả:</strong> <%= p.getDescription() %></p>
    <p><strong>Loại:</strong> <%= p.getCategory() %></p>
    <p><strong>Tồn kho:</strong> <%= p.getStock() %></p>

    <form method="post" action="cart">
      <input type="hidden" name="action" value="add">
      <input type="hidden" name="id" value="<%= p.getId() %>">
      <button class="btn btn-success">🛒 Thêm vào giỏ</button>
    </form>
  </div>
</div>

<%@ include file="footer.jsp" %>
