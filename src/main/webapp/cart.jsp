<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>
<%@ page import="model.CartItem, java.util.*" %>

<h2 class="mb-4"><i class="bi bi-cart-check"></i> Giỏ hàng của bạn</h2>

<%
    Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
    if (cart == null || cart.isEmpty()) {
%>
    <div class="alert alert-info">Chưa có sản phẩm nào trong giỏ hàng.</div>
<%
    } else {
%>
<form method="post" action="checkout">
<table class="table table-bordered align-middle text-center">
    <thead class="table-dark">
    <tr>
        <th><input type="checkbox" id="selectAll"></th>
        <th>Sản phẩm</th>
        <th>Giá</th>
        <th>Số lượng</th>
        <th>Tổng</th>
        <th>Hành động</th>
    </tr>
    </thead>
    <tbody id="cartBody">
    <%
        for (CartItem item : cart.values()) {
            int id = item.getProduct().getId();
    %>
    <tr class="cart-row">
        <td><input type="checkbox" class="product-check" name="selectedIds" value="<%= id %>"></td>
        <td class="text-start">
            <img src="<%= item.getProduct().getImageUrl() %>" width="60" height="60" class="me-2">
            <strong><%= item.getProduct().getName() %></strong>
        </td>
        <td class="price"><%= item.getProduct().getPrice() %></td>
        <td>
            <div class="d-flex justify-content-center align-items-center">
                <form method="post" action="cart" class="d-inline">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="id" value="<%= id %>">
                    <input type="hidden" name="delta" value="-1">
                    <button class="btn btn-outline-secondary btn-sm" type="submit">−</button>
                </form>

                <input type="text" readonly class="form-control form-control-sm mx-1 text-center"
                       value="<%= item.getQuantity() %>" style="width: 50px;">

                <form method="post" action="cart" class="d-inline">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="id" value="<%= id %>">
                    <input type="hidden" name="delta" value="1">
                    <button class="btn btn-outline-secondary btn-sm" type="submit">+</button>
                </form>
            </div>
        </td>
        <td class="line-total"><%= item.getTotalPrice() %></td>
        <td>
            <form method="post" action="cart">
                <input type="hidden" name="action" value="remove">
                <input type="hidden" name="id" value="<%= id %>">
                <button class="btn btn-danger btn-sm">Xóa</button>
            </form>
        </td>
    </tr>
    <%
        }
    %>
    </tbody>
    <tfoot>
    <tr>
        <td colspan="4" class="text-end fw-bold">Tổng cộng:</td>
        <td colspan="2" class="fw-bold text-danger" id="totalAmount">0 đ</td>
    </tr>
    </tfoot>
</table>

<!-- 📝 Thông tin đặt hàng -->
<div class="row g-3 mb-3">
    <div class="col-md-6">
        <label class="form-label">Họ và tên</label>
        <input type="text" name="fullname" class="form-control" required>
    </div>
    <div class="col-md-6">
        <label class="form-label">Số điện thoại</label>
        <input type="text" name="phone" class="form-control" required>
    </div>
    <div class="col-12">
        <label class="form-label">Địa chỉ</label>
        <input type="text" name="address" class="form-control" required>
    </div>
    <div class="col-12">
        <label class="form-label">Ghi chú</label>
        <textarea name="note" class="form-control" rows="2"></textarea>
    </div>
</div>

<div class="text-end">
    <button class="btn btn-primary btn-lg">Mua hàng</button>
</div>
</form>

<script>
    const checkboxes = document.querySelectorAll('.product-check');
    const selectAll = document.getElementById('selectAll');
    const totalDisplay = document.getElementById('totalAmount');

    function updateTotal() {
        let total = 0;
        document.querySelectorAll('.cart-row').forEach(row => {
            const checkbox = row.querySelector('.product-check');
            if (checkbox.checked) {
                const price = parseFloat(row.querySelector('.line-total').innerText);
                total += price;
            }
        });
        totalDisplay.innerText = total.toLocaleString() + ' đ';
    }

    checkboxes.forEach(cb => cb.addEventListener('change', updateTotal));
    if (selectAll) {
        selectAll.addEventListener('change', () => {
            checkboxes.forEach(cb => cb.checked = selectAll.checked);
            updateTotal();
        });
    }

    updateTotal(); // khởi tạo
</script>

<% } %>

<%@ include file="footer.jsp" %>
