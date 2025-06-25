<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>

<div class="text-center">
  <h2 class="text-success my-4">✅ Đặt hàng thành công!</h2>
  <p>Cảm ơn bạn đã mua hàng tại <strong>FashionStyle.AI</strong></p>
  <p>Mã đơn hàng của bạn: <strong>${orderId}</strong></p>
  <a href="index.jsp" class="btn btn-primary mt-3">Tiếp tục mua sắm</a>
  <a href="order-history" class="btn btn-outline-secondary mt-3">Xem đơn hàng của tôi</a>
</div>

<%@ include file="footer.jsp" %>
