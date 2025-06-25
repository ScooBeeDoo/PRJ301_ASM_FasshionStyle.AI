<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Product" %>
<%@ page import="dao.ProductDAO" %>


<!-- 🔥 Hero Banner (Bootstrap Carousel) -->
<div id="heroCarousel" class="carousel slide mb-4" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="https://via.placeholder.com/1200x400?text=Banner+1" class="d-block w-100" alt="Banner 1">
    </div>
    <div class="carousel-item">
      <img src="https://via.placeholder.com/1200x400?text=Banner+2" class="d-block w-100" alt="Banner 2">
    </div>
    <div class="carousel-item">
      <img src="https://via.placeholder.com/1200x400?text=Banner+3" class="d-block w-100" alt="Banner 3">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#heroCarousel" data-bs-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#heroCarousel" data-bs-slide="next">
    <span class="carousel-control-next-icon"></span>
  </button>
</div>

<!-- 🌐 Service Boxes -->
<div class="row text-center">
  <div class="col-md-4 mb-4">
    <div class="border p-4 h-100">
      <h5>International Order</h5>
      <p>Please send us the product link/picture and we’ll get back to you with the price in USD.</p>
    </div>
  </div>
  <div class="col-md-4 mb-4">
    <div class="border p-4 h-100">
      <h5>Lưu ý</h5>
      <p>Vui lòng “Click” vào để được tham khảo chính sách bên Shop trước khi mua hàng.</p>
    </div>
  </div>
  <div class="col-md-4 mb-4">
    <div class="border p-4 h-100">
      <h5>Dịch vụ</h5>
      <p>Hiện tại bên shop có hỗ trợ tìm hàng theo yêu cầu, giao hàng quốc tế.</p>
    </div>
  </div>
</div>

<%
    List<model.Product> featured = new dao.ProductDAO().getFeaturedProducts(4);
    request.setAttribute("featured", featured);
%>

<h3 class="mt-5 mb-3">Sản phẩm nổi bật</h3>
<div class="row">
  <c:forEach var="p" items="${featured}">
    <div class="col-md-3 mb-4">
      <div class="card h-100 border-0 shadow-sm position-relative">

        <!-- Badge góc trên -->
        <span class="position-absolute top-0 start-0 badge bg-danger text-white m-2">Nổi bật</span>

        <a href="product-detail?id=${p.id}">
          <img src="${p.imageUrl}" class="card-img-top" style="height:250px; object-fit:cover; transition: 0.3s ease;" alt="${p.name}">
        </a>

        <div class="card-body text-center">
          <a href="product-detail?id=${p.id}" class="text-decoration-none text-dark">
            <h6 class="card-title mb-1" style="min-height:40px;">${p.name}</h6>
          </a>
          <p class="text-danger fw-bold mb-0">${p.price} đ</p>
        </div>
      </div>
    </div>
  </c:forEach>
</div>

<!-- Optional CSS (nếu chưa có) -->
<style>
  .card:hover img {
    transform: scale(1.05);
    opacity: 0.9;
  }
</style>




<%@ include file="footer.jsp" %>
