<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>
<h2>Sửa sản phẩm</h2>
<form method="post" action="update-product">
  <input type="hidden" name="id" value="${product.id}">
  <div class="mb-3">
    <label for="name" class="form-label">Tên sản phẩm</label>
    <input type="text" class="form-control" name="name" value="${product.name}" required>
  </div>
  <div class="mb-3">
    <label for="description" class="form-label">Mô tả</label>
    <textarea class="form-control" name="description">${product.description}</textarea>
  </div>
  <div class="mb-3">
    <label for="price" class="form-label">Giá</label>
    <input type="number" class="form-control" name="price" step="0.01" value="${product.price}" required>
  </div>
  <div class="mb-3">
    <label for="imageUrl" class="form-label">Link ảnh</label>
    <input type="text" class="form-control" name="imageUrl" value="${product.imageUrl}">
  </div>
  <div class="mb-3">
    <label for="category" class="form-label">Loại</label>
    <input type="text" class="form-control" name="category" value="${product.category}">
  </div>
  <div class="mb-3">
    <label for="stock" class="form-label">Tồn kho</label>
    <input type="number" class="form-control" name="stock" value="${product.stock}" required>
  </div>
  <button type="submit" class="btn btn-success">Cập nhật</button>
</form>
<%@ include file="footer.jsp" %>