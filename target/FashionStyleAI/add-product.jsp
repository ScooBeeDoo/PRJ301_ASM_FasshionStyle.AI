<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>
<h2>Thêm sản phẩm mới</h2>
<form method="post" action="add-product">
  <div class="mb-3">
    <label for="name" class="form-label">Tên sản phẩm</label>
    <input type="text" class="form-control" name="name" required>
  </div>
  <div class="mb-3">
    <label for="description" class="form-label">Mô tả</label>
    <textarea class="form-control" name="description" required></textarea>
  </div>
  <div class="mb-3">
    <label for="price" class="form-label">Giá</label>
    <input type="number" class="form-control" name="price" step="0.01" required>
  </div>
  <div class="mb-3">
    <label for="imageUrl" class="form-label">Link ảnh</label>
    <input type="text" class="form-control" name="imageUrl">
  </div>
  <div class="mb-3">
    <label for="category" class="form-label">Loại</label>
    <input type="text" class="form-control" name="category">
  </div>
  <div class="mb-3">
    <label for="stock" class="form-label">Tồn kho</label>
    <input type="number" class="form-control" name="stock" required>
  </div>
  <button type="submit" class="btn btn-primary">Thêm sản phẩm</button>
</form>
<%@ include file="footer.jsp" %>