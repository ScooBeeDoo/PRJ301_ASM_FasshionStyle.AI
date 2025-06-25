<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>

<div class="text-center mt-5">
  <h3>Bạn là ai?</h3>
  <p>Vui lòng chọn vai trò để tiếp tục</p>
  <div class="d-flex justify-content-center gap-3">
    <a href="login.jsp?role=customer" class="btn btn-primary">Tôi là Khách hàng</a>
    <a href="login.jsp?role=seller" class="btn btn-warning">Tôi là Chủ shop</a>
  </div>
  <hr class="my-4" style="width: 200px; margin: 2rem auto;">
  <div class="d-flex justify-content-center gap-3">
    <a href="register.jsp?role=customer" class="btn btn-outline-primary">Đăng ký làm Khách hàng</a>
    <a href="register.jsp?role=seller" class="btn btn-outline-warning">Đăng ký làm Chủ shop</a>
  </div>
</div>

<%@ include file="footer.jsp" %>
