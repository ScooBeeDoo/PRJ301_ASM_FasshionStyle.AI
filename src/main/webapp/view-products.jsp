<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>

<h2 class="mb-4">Tất cả sản phẩm</h2>

<form method="get" action="search-product" class="mb-4">
  <div class="input-group">
    <input type="text" name="keyword" class="form-control" placeholder="Tìm sản phẩm...">
    <button type="submit" class="btn btn-outline-primary">Tìm kiếm</button>
  </div>
</form>

<div class="row">
  <c:forEach var="p" items="${products}">
    <div class="col-md-3 mb-4">
      <div class="card h-100 shadow-sm">
        <img src="${p.imageUrl}" class="card-img-top" alt="${p.name}" style="height:200px; object-fit:cover;">
        <div class="card-body">
          <h5 class="card-title">${p.name}</h5>
          <p class="card-text">${p.description}</p>
          <p class="fw-bold text-danger">${p.price} đ</p>
          <div class="d-flex justify-content-between">
            <a href="edit-product?id=${p.id}" class="btn btn-warning btn-sm">Edit</a>
            <a href="delete-product?id=${p.id}" class="btn btn-danger btn-sm">Delete</a>
            <a href="product-detail?id=${p.id}" class="btn btn-outline-primary btn-sm">Xem chi tiết</a>

          </div>
        </div>
      </div>
    </div>
  </c:forEach>
</div>

<%@ include file="footer.jsp" %>
