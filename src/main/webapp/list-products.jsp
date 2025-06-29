<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../header.jsp" %>

<div class="container mt-5">
  <h3 class="mb-4">📦 Danh sách sản phẩm của bạn</h3>

  <a href="add-product.jsp" class="btn btn-primary mb-3">➕ Thêm sản phẩm</a>

  <table class="table table-bordered table-hover">
    <thead class="table-dark">
      <tr>
        <th>STT</th>
        <th>Tên</th>
        <th>Giá</th>
        <th>Kho</th>
        <th>Ảnh</th>
        <th>Hành động</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="p" items="${products}" varStatus="loop">
        <tr>
          <td>${loop.index + 1}</td>
          <td>${p.name}</td>
          <td>${p.price} đ</td>
          <td>${p.stock}</td>
          <td><img src="${p.imageUrl}" alt="ảnh" width="50"></td>
          <td>
            <a href="edit-product?id=${p.id}" class="btn btn-sm btn-warning">✏️ Sửa</a>
            <a href="delete-product?id=${p.id}" class="btn btn-sm btn-danger">🗑️ Xóa</a>
          </td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
</div>

<%@ include file="../../footer.jsp" %>
