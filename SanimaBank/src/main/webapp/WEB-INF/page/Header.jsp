<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Banking System</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Header.css" />
</head>
<body>
    <header class="bank-header">
        <div class="logo">
            <h1>MyBank</h1>
        </div>
        <nav class="navbar">
            <ul>
                <li><a href="${pageContext.request.contextPath}/Home.jsp">Home</a></li>
                <li><a href="${pageContext.request.contextPath}/Accounts">Accounts</a></li>
                <li><a href="${pageContext.request.contextPath}/Services">Services</a></li>
                <li><a href="${pageContext.request.contextPath}/Contact">Contact</a></li>
            </ul>
        </nav>
    </header>
</body>
</html>
