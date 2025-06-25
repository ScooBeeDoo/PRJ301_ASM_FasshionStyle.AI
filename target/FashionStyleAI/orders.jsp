<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../header.jsp" %>

<div class="container mt-5">
  <h3>🧾 Đơn hàng có sản phẩm của bạn</h3>
  <table class="table table-bordered mt-3">
    <thead>
      <tr>
        <th>ID</th>
        <th>Người mua</th>
        <th>SĐT</th>
        <th>Địa chỉ</th>
        <th>Tổng tiền</th>
        <th>Ngày tạo</th>
        <th>Trạng thái</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="o" items="${orders}">
        <tr>
          <td>${o.id}</td>
          <td>${o.fullName}</td>
          <td>${o.phone}</td>
          <td>${o.address}</td>
          <td>${o.totalAmount}</td>
          <td>${o.createdAt}</td>
          <td>${o.status}</td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
</div>

<%@ include file="../../footer.jsp" %>
