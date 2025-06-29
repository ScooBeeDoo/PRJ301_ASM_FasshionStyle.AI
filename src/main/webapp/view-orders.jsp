<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../header.jsp" %>

<div class="container mt-5">
  <h2 class="mb-4">📦 Danh sách đơn hàng</h2>

  <table class="table table-bordered">
    <thead>
      <tr>
        <th>STT</th>
        <th>Mã đơn</th>
        <th>Khách hàng</th>
        <th>Ngày đặt</th>
        <th>Trạng thái</th>
        <th>Tổng tiền</th>
        <th>Thao tác</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="o" items="${orders}" varStatus="loop">
        <tr>
          <td>${loop.index + 1}</td>
          <td>${o.id}</td>
          <td>${o.customerName}</td>
          <td>${o.orderDate}</td>
          <td>${o.status}</td>
          <td>${o.totalPrice}</td>
          <td>
            <a href="order-detail?id=${o.id}" class="btn btn-sm btn-info">Xem</a>
          </td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
</div>

<%@ include file="../footer.jsp" %>
