<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login & Signup</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Login.css" />
    <style>
        .error-span {
            color: red;
            font-size: 12px;
            display: none;
        }
    </style>
</head>
<body>
    <div class="container">

        <!-- Login Form -->
        <form action="signincontroller" method="post" id="loginForm" onsubmit="return validateLogin()">
            <h2>Login</h2>
            
            <c:if test="${not empty error}">
                <div class="error-message">${error}</div>
            </c:if>
            
            <div class="input-field">
                <input type="text" name="username" id="loginUsername" placeholder="Username" />
                <span class="error-span" id="loginUserError">Username is required</span>
            </div>
            <div class="input-field">
                <input type="password" name="password" id="loginPassword" placeholder="Password" />
                <span class="error-span" id="loginPassError">Password is required</span>
            </div>
            <button type="submit">Login</button>

            <div class="form-toggle">
                <p>Don't have an account? <a onclick="showSignup()">Sign up</a></p>
            </div>
        </form>

        <!-- Signup Form -->
        <form action="signupcontroller" method="post" id="signupForm" style="display: none;" onsubmit="return validateSignup()">
            <h2>Sign Up</h2>

            <div class="input-field">
                <input type="text" id="Username" name="Username" placeholder="Username" />
                <span class="error-span" id="signupUserError">Username is required</span>
            </div>

            <div class="input-field">
                <input type="text" id="FirstName" name="FirstName" placeholder="First Name" />
                <span class="error-span" id="signupFirstError">First name is required</span>
            </div>

            <div class="input-field">
                <input type="text" id="LastName" name="LastName" placeholder="Last Name" />
                <span class="error-span" id="signupLastError">Last name is required</span>
            </div>

            <div class="input-field">
                <input type="date" id="Birthday" name="dob" />
                <span class="error-span" id="signupDobError">Date of birth is required</span>
            </div>

            <div class="input-field">
                <select name="Gender" id="Gender">
                    <option value="" disabled selected>Select Gender</option>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                </select>
                <span class="error-span" id="signupGenderError">Gender is required</span>
            </div>

            <div class="input-field">
                <input type="email" id="Email" name="Email" placeholder="Email" />
                <span class="error-span" id="signupEmailError">Email is required</span>
            </div>

            <div class="input-field">
                <input type="text" id="Phone" name="Phone" placeholder="Phone" />
                <span class="error-span" id="signupPhoneError">Phone is required</span>
            </div>

            <div class="input-field">
                <input type="password" id="Password" name="Password" placeholder="Password" />
                <span class="error-span" id="signupPassError">Password is required</span>
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

        // Login validation
        function validateLogin() {
            let valid = true;
            const username = document.getElementById("loginUsername").value.trim();
            const password = document.getElementById("loginPassword").value.trim();

            document.getElementById("loginUserError").style.display = username === "" ? "block" : "none";
            document.getElementById("loginPassError").style.display = password === "" ? "block" : "none";

            if (username === "" || password === "") {
                valid = false;
            }
            return valid;
        }

        // Signup validation
        function validateSignup() {
            let valid = true;
            const fields = [
                { id: "Username", errorId: "signupUserError" },
                { id: "FirstName", errorId: "signupFirstError" },
                { id: "LastName", errorId: "signupLastError" },
                { id: "Birthday", errorId: "signupDobError" },
                { id: "Gender", errorId: "signupGenderError" },
                { id: "Email", errorId: "signupEmailError" },
                { id: "Phone", errorId: "signupPhoneError" },
                { id: "Password", errorId: "signupPassError" }
            ];

            fields.forEach(f => {
                const value = document.getElementById(f.id).value.trim();
                if (value === "") {
                    document.getElementById(f.errorId).style.display = "block";
                    valid = false;
                } else {
                    document.getElementById(f.errorId).style.display = "none";
                }
            });

            return valid;
        }
    </script>
</body>
</html>
