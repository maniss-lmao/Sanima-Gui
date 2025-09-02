<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>


	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<script src="https://kit.fontawesome.com/64d58efce2.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/Login.css" />
	<title>Sign in & Sign up Form</title>
</head>

<body>
	<div class="container">
		<div class="forms-container">
			<div class="signin-signup">
				<!--  <form action="signincontroller" method="post" class="sign-in-form"> -->
					<h2 class="title">Sign in</h2>
					<div class="input-field">
						<i class="fas fa-user"></i>
						<input type="text" name="username" placeholder="Username" />
					</div>
					<div class="input-field">
						<i class="fas fa-lock"></i>
						<input type="password" name="password" placeholder="Password" />
					</div>
					<button type="submit" value="Login" class="Loginbtn">Login</button>
					
				</form> 
				<c:if test="${not empty error}">
    <div style="color: red;">${error}</div>
</c:if>
	        
				<!--  <form action="signupcontroller" method="post" class="sign-up-form"> -->
    <h2 class="title">Sign up</h2>

    <div class="input-field">
        <i class="fas fa-user"></i>
        <input type="text" id="Username" name="Username" placeholder="Username" />
    </div>

    <div class="input-field">
        <i class="fas fa-envelope"></i>
        <input type="text" id="FirstName" name="FirstName" placeholder="First Name" />
    </div>

    <div class="input-field">
        <i class="fas fa-envelope"></i>
        <input type="text" id="LastName" name="LastName" placeholder="Last Name" />
    </div>

    <div class="input-field">
        <i class="fas fa-envelope"></i>
        <input type="date" id="Birthday" name="dob" />
    </div>

    <div class="input-field">
    <i class="fas fa-venus-mars"></i>
    <select name="Gender" required style="border: none; background: none; font-weight: 600; font-size: 1.1rem; color: #3b4d3b; width: 100%;">
        <option value="" disabled selected>Select Gender</option>
        <option value="Male">Male</option>
        <option value="Female">Female</option>
        <option value="Other">Other</option>
    </select>
</div>



    <div class="input-field">
        <i class="fas fa-envelope"></i>
        <input type="email" id="Email" name="Email" placeholder="Email" />
    </div>

    <div class="input-field">
        <i class="fas fa-envelope"></i>
        <input type="text" id="Phone" name="Phone" placeholder="Phone" />
    </div>

    <div class="input-field">
        <i class="fas fa-lock"></i>
        <input type="password" id="Password" name="Password" placeholder="Password" />
    </div>

  

    <button type="submit" class="Signupbtn">Signup</button>
</form>
			</div>
		</div>

		<div class="panels-container">
			<div class="panel left-panel">
				<div class="content">
					<h3>New here ?</h3>
					<p>
						Sign up to know more!!
					</p>
					<button class="btn transparent" id="sign-up-btn">
						Sign up
					</button>
				</div>
				<img  src="https://i.ibb.co/6HXL6q1/Privacy-policy-rafiki.png" class="image" alt="" />
			</div>
			<div class="panel right-panel">
				<div class="content">
					<h3>One of us ?</h3>
					<p>
						Investment for the future
					</p>
					<button class="btn transparent" id="sign-in-btn">
						Sign in
					</button>
				</div>
				<img src="https://i.ibb.co/nP8H853/Mobile-login-rafiki.png"  class="image" alt="" />
			</div>
		</div>
	</div>
<script>
const sign_in_btn = document.querySelector("#sign-in-btn");
const sign_up_btn = document.querySelector("#sign-up-btn");
const container = document.querySelector(".container");

sign_up_btn.addEventListener("click", () => {
  container.classList.add("sign-up-mode");
});

sign_in_btn.addEventListener("click", () => {
  container.classList.remove("sign-up-mode");
});</script>
</body>

</html>