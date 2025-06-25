<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="header.jsp" %>

<jsp:useBean id="product" class="model.Product" scope="request" />

<h2>${product.name}</h2>
<div class="row">
  <div class="col-md-5">
    <img src="${product.imageUrl}" class="img-fluid" />
  </div>
  <div class="col-md-7">
    <p><strong>Giá:</strong> ${product.price} đ</p>
    <p><strong>Mô tả:</strong> ${product.description}</p>
    <p><strong>Loại:</strong> ${product.category}</p>
    <p><strong>Tồn kho:</strong> ${product.stock}</p>
  </div>
</div>
<form method="post" action="cart">
  <input type="hidden" name="action" value="add">
  <input type="hidden" name="id" value="${product.id}">
  <div class="mb-3">
    <label for="quantity" class="form-label">Số lượng:</label>
    <input type="number" name="quantity" value="1" min="1" class="form-control" style="width:100px;">
  </div>
  <button type="submit" class="btn btn-primary">
    <i class="bi bi-cart-plus"></i> Thêm vào giỏ hàng
  </button>
</form>

<%@ include file="footer.jsp" %>
