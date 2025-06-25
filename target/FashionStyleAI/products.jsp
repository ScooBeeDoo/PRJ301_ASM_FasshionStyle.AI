<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Product" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../../header.jsp" %>

<div class="container mt-5">
  <h3 class="mb-4">📦 Danh sách sản phẩm của bạn</h3>

  <a href="add-product.jsp" class="btn btn-primary mb-3">➕ Thêm sản phẩm</a>

  <table class="table table-bordered">
    <thead>
      <tr>
        <th>STT</th>
        <th>Tên</th>
        <th>Giá</th>
        <th>Số lượng</th>
        <th>Ảnh</th>
        <th>Thao tác</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="p" items="${products}" varStatus="loop">
      <tr>
        <td>${loop.index + 1}</td>
        <td>${p.name}</td>
        <td>${p.price}</td>
        <td>${p.stock}</td>
        <td><img src="${p.imageUrl}" width="50" alt="Ảnh SP"></td>
        <td>
          <a href="ProductServlet?action=edit&id=${p.id}" class="btn btn-sm btn-warning">✏️ Sửa</a>
          <a href="ProductServlet?action=delete&id=${p.id}" class="btn btn-sm btn-danger" onclick="return confirm('Bạn chắc chắn muốn xoá?');">🗑️ Xóa</a>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>

<%@ include file="../../footer.jsp" %>
