<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>

<div class="container mt-5">
  <h2 class="mb-4">👑 Seller Dashboard</h2>

  <div class="row">
    <div class="col-md-4">
      <div class="card text-white bg-primary mb-3">
        <div class="card-body">
          <h5 class="card-title">🛍️ Quản lý sản phẩm</h5>
          <p class="card-text">Xem, thêm, sửa hoặc xóa sản phẩm của bạn.</p>
          <a href="view-products" class="btn btn-light">Xem sản phẩm</a>
        </div>
      </div>
    </div>

    <div class="col-md-4">
      <div class="card text-white bg-success mb-3">
        <div class="card-body">
          <h5 class="card-title">📦 Quản lý đơn hàng</h5>
          <p class="card-text">Xem danh sách đơn hàng mà khách đã đặt.</p>
          <a href="view-orders" class="btn btn-light">Xem đơn hàng</a>
        </div>
      </div>
    </div>

    <div class="col-md-4">
      <div class="card text-white bg-info mb-3">
        <div class="card-body">
          <h5 class="card-title">📊 Thống kê doanh thu</h5>
          <p class="card-text">Xem tổng quan doanh thu theo ngày / tháng.</p>
          <a href="revenue-report" class="btn btn-light">Xem thống kê</a>
        </div>
      </div>
    </div>
  </div>
</div>

<%@ include file="../footer.jsp" %>
