<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../header.jsp" %>

<div class="container mt-5">
  <h2 class="mb-4">📊 Báo cáo doanh thu</h2>

  <form action="revenue-report" method="get" class="row g-3 mb-4">
    <div class="col-md-4">
      <label for="fromDate" class="form-label">Từ ngày</label>
      <input type="date" class="form-control" name="fromDate" value="${param.fromDate}">
    </div>
    <div class="col-md-4">
      <label for="toDate" class="form-label">Đến ngày</label>
      <input type="date" class="form-control" name="toDate" value="${param.toDate}">
    </div>
    <div class="col-md-4 d-flex align-items-end">
      <button type="submit" class="btn btn-primary">Lọc thống kê</button>
    </div>
  </form>

  <table class="table table-striped">
    <thead>
      <tr>
        <th>Ngày</th>
        <th>Số đơn hàng</th>
        <th>Tổng doanh thu</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="r" items="${report}">
        <tr>
          <td>${r.date}</td>
          <td>${r.totalOrders}</td>
          <td>${r.totalRevenue}</td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
</div>

<%@ include file="../footer.jsp" %>
