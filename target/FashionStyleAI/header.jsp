<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>FashionStyle.AI</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>
<!-- 🔳 Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
  <div class="container-fluid">
    <a class="navbar-brand fw-bold" href="index.jsp">FashionStyle.AI</a>

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarMain">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarMain">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
        <li class="nav-item"><a class="nav-link" href="view-products">Products</a></li>
        <li class="nav-item"><a class="nav-link" href="#">Sale</a></li>
        <li class="nav-item"><a class="nav-link" href="#">Contact</a></li>
      </ul>

      <!-- 🔍 Search -->
      <form class="d-flex me-3" method="get" action="search-products">
        <input class="form-control form-control-sm me-2" type="search" name="keyword" placeholder="Tìm kiếm sản phẩm...">
        <button class="btn btn-outline-light btn-sm" type="submit">Search</button>
      </form>

<!-- 👤 Account & Cart -->
<ul class="navbar-nav mb-2 mb-lg-0">
  <c:choose>
    <c:when test="${not empty sessionScope.user}">
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
          <i class="bi bi-person-circle"></i> ${sessionScope.user.username}
        </a>
        <ul class="dropdown-menu dropdown-menu-end">
          <li><a class="dropdown-item" href="#">Thông tin</a></li>
          <li><a class="dropdown-item" href="logout">Đăng xuất</a></li>
        </ul>
      </li>
    </c:when>
    <c:otherwise>
      <li class="nav-item">
        <a class="nav-link" href="login.jsp"><i class="bi bi-person-circle"></i> Tài khoản</a>
      </li>
    </c:otherwise>
  </c:choose>

<li class="nav-item">
  <a class="nav-link" href="cart"><i class="bi bi-cart"></i> Giỏ hàng</a>
</li>

</ul>

<c:choose>
  <c:when test="${not empty sessionScope.user}">
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
        <i class="bi bi-person-circle"></i> ${sessionScope.user.username}
      </a>
      <ul class="dropdown-menu dropdown-menu-end">
        <li><a class="dropdown-item" href="#">Trang cá nhân</a></li>
        <li><a class="dropdown-item" href="logout">Đăng xuất</a></li>
      </ul>
    </li>
  </c:when>
  <c:otherwise>
    <li class="nav-item">
      <a class="nav-link" href="login.jsp"><i class="bi bi-person-circle"></i> Tài khoản</a>
    </li>
  </c:otherwise>
</c:choose>

      </ul>
    </div>
  </div>
</nav>

<div class="container mt-4">
