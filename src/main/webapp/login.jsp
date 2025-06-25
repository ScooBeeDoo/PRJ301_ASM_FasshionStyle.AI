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
  <div class="col-md-4">
    <h2 class="text-center mb-4">Đăng nhập - <%= role.equals("seller") ? "Chủ shop" : "Khách hàng" %></h2>

    <form action="login" method="post">
      <input type="hidden" name="role" value="<%= role %>">

      <div class="mb-3">
        <label class="form-label">Tên đăng nhập</label>
        <input type="text" class="form-control" name="username" required>
      </div>

      <div class="mb-3">
        <label class="form-label">Mật khẩu</label>
        <input type="password" class="form-control" name="password" required>
      </div>

      <button type="submit" class="btn btn-primary w-100">Đăng nhập</button>

      <div class="mt-3 text-center">
        <a href="register.jsp?role=<%= role %>">Chưa có tài khoản? Đăng ký</a>
      </div>
    </form>

    <%
        String error = (String) request.getAttribute("error");
        if (error != null) {
    %>
      <div class="alert alert-danger mt-3 text-center"><%= error %></div>
    <%
        }
    %>
  </div>
</div>

<%@ include file="footer.jsp" %>
