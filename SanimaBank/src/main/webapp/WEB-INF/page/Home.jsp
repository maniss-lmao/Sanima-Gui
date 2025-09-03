<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home - MyBank</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Home.css">
</head>
<body>
    <!-- Include Header -->
    <jsp:include page="Header.jsp" />

    <!-- Main Content -->
    <main class="home-container">
        <section class="welcome">
            <h2>Welcome to MyBank</h2>
            <p>Your trusted partner for secure and reliable banking solutions.</p>
            <a href="accounts.jsp" class="btn">View Your Accounts</a>
        </section>
    </main>
</body>
</html>
