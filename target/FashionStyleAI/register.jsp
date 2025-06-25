<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>
<%
    String role = request.getParameter("role");
    if (role == null || (!role.equals("customer") && !role.equals("seller"))) {
        response.sendRedirect("selectRole.jsp");
        return;
    }
%>

<div class="row justify-content-center">
  <div class="col-md-6">
    <h2 class="text-center mb-4">Đăng ký - <%= role.equals("seller") ? "Chủ shop" : "Khách hàng" %></h2>
    <form action="register" method="post">
      <input type="hidden" name="role" value="<%= role %>">

      <div class="mb-3">
        <label class="form-label">Username</label>
        <input type="text" class="form-control" name="username" required>
      </div>
      <div class="mb-3">
        <label class="form-label">Họ và tên</label>
        <input type="text" class="form-control" name="fullname" required>
      </div>
      <div class="mb-3">
        <label class="form-label">Tuổi</label>
        <input type="number" class="form-control" name="age" required>
      </div>
      <div class="mb-3">
        <label class="form-label">Giới tính</label>
        <select class="form-control" name="gender">
          <option value="Nam">Nam</option>
          <option value="Nữ">Nữ</option>
        </select>
      </div>
      <div class="mb-3">
        <label class="form-label">Quê quán</label>
        <input type="text" class="form-control" name="hometown" required>
      </div>
      <div class="mb-3">
        <label class="form-label">Email</label>
        <input type="email" class="form-control" name="email" required>
      </div>
      <div class="mb-3">
        <label class="form-label">Mật khẩu</label>
        <input type="password" class="form-control" name="password" required>
      </div>
      <div class="mb-3">
        <label class="form-label">Xác nhận mật khẩu</label>
        <input type="password" class="form-control" name="confirm" required>
      </div>
      <button type="submit" class="btn btn-success w-100">Đăng ký</button>
      <div class="mt-3 text-center">
        <a href="login.jsp?role=<%= role %>">Đã có tài khoản? Đăng nhập</a>
      </div>
    </form>
  </div>
</div>

<%@ include file="footer.jsp" %>
