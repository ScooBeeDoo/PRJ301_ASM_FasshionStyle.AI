<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h2>Lịch sử đơn hàng</h2>
<table class="table table-bordered">
    <tr>
        <th>Mã đơn</th>
        <th>Ngày đặt</th>
        <th>Tổng tiền</th>
        <th>Trạng thái</th>
        <th></th>
    </tr>
    <c:forEach var="o" items="${orders}">
        <tr>
            <td>#${o.id}</td>
            <td>${o.orderDate}</td>
            <td>${o.totalAmount} đ</td>
            <td>${o.status}</td>
            <td><a href="order-detail?orderId=${o.id}" class="btn btn-sm btn-primary">Xem chi tiết</a></td>
        </tr>
    </c:forEach>
</table>

<%@ include file="footer.jsp" %>