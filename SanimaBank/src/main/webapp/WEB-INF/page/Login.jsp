<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login & Signup</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Login.css" />
</head>
<body>
    <div class="container">

        <!-- Login Form -->
        <form action="signincontroller" method="post" id="loginForm">
            <h2>Login</h2>
            
            <c:if test="${not empty error}">
                <div class="error-message">${error}</div>
            </c:if>
            
            <div class="input-field">
                <input type="text" name="username" placeholder="Username" required />
            </div>
            <div class="input-field">
                <input type="password" name="password" placeholder="Password" required />
            </div>
            <button type="submit">Login</button>

            <div class="form-toggle">
                <p>Don't have an account? <a onclick="showSignup()">Sign up</a></p>
            </div>
        </form>

        <!-- Signup Form -->
        <form action="signupcontroller" method="post" id="signupForm" style="display: none;">
            <h2>Sign Up</h2>

            <div class="input-field">
                <input type="text" id="Username" name="Username" placeholder="Username" required />
            </div>

            <div class="input-field">
                <input type="text" id="FirstName" name="FirstName" placeholder="First Name" required />
            </div>

            <div class="input-field">
                <input type="text" id="LastName" name="LastName" placeholder="Last Name" required />
            </div>

            <div class="input-field">
                <input type="date" id="Birthday" name="dob" required />
            </div>

            <div class="input-field">
                <select name="Gender" required>
                    <option value="" disabled selected>Select Gender</option>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                </select>
            </div>

            <div class="input-field">
                <input type="email" id="Email" name="Email" placeholder="Email" required />
            </div>

            <div class="input-field">
                <input type="text" id="Phone" name="Phone" placeholder="Phone" required />
            </div>

            <div class="input-field">
                <input type="password" id="Password" name="Password" placeholder="Password" required />
            </div>

            <button type="submit">Sign Up</button>

            <div class="form-toggle">
                <p>Already have an account? <a onclick="showLogin()">Login</a></p>
            </div>
        </form>
    </div>

    <script>
        function showSignup() {
            document.getElementById("loginForm").style.display = "none";
            document.getElementById("signupForm").style.display = "block";
        }
        function showLogin() {
            document.getElementById("signupForm").style.display = "none";
            document.getElementById("loginForm").style.display = "block";
        }
    </script>
</body>
</html>
