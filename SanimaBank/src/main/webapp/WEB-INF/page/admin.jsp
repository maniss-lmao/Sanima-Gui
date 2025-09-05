<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>AdminDashboard</title>
    <link rel="stylesheet" type="text/css" href="css/admin.css">
</head>
<body>
    <header>
        <h1>AdminDashboard</h1>
    </header>

    <!-- Add new user form -->
    <form action="admin" method="post">
        <table>
            <tr>
                <th colspan="11">Add New User</th>
            </tr>
            <tr>
                <td><input type="text" name="firstName" placeholder="First Name"></td>
                <td><input type="text" name="lastName" placeholder="Last Name"></td>
                <td><input type="text" name="username" placeholder="Username"></td>
                <td><input type="date" name="dob"></td>
                <td><input type="text" name="gender" placeholder="Gender"></td>
                <td><input type="email" name="email" placeholder="Email"></td>
                <td><input type="text" name="phone" placeholder="Phone"></td>
                <td><input type="password" name="password" placeholder="Password"></td>
                <td><input type="text" name="role" placeholder="Role"></td>
                <td colspan="2">
                    <button type="submit" name="action" value="add" class="btn edit-btn">Add</button>
                </td>
            </tr>
        </table>
    </form>

    <!-- User table -->
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>First</th>
                <th>Last</th>
                <th>Username</th>
                <th>DOB</th>
                <th>Gender</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Password</th>
                <th>Role</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:if test="${not empty userList}">
                <c:forEach var="user" items="${userList}">
                    <form action="admin" method="post">
                        <tr>
                            <td>
                                <input type="hidden" name="id" value="${user.id}">
                                ${user.id}
                            </td>
                            <td><input type="text" name="firstName" value="${user.firstName}"></td>
                            <td><input type="text" name="lastName" value="${user.lastName}"></td>
                            <td><input type="text" name="username" value="${user.username}"></td>
                            <td>
                                <input type="date" name="dob"
                                    value="<fmt:formatDate value='${user.dob}' pattern='yyyy-MM-dd'/>">
                            </td>
                            <td><input type="text" name="gender" value="${user.gender}"></td>
                            <td><input type="email" name="email" value="${user.email}"></td>
                            <td><input type="text" name="phone" value="${user.phoneNumber}"></td>
                            <!-- Do not prefill password for security -->
                            <td><input type="password" name="password" placeholder="Enter new password"></td>
                            <td><input type="text" name="role" value="${user.role}"></td>
                            <td>
                                <button type="submit" name="action" value="update" class="btn save-btn">Save</button>
                                <button type="submit" name="action" value="delete" class="btn delete-btn">Delete</button>
                            </td>
                        </tr>
                    </form>
                </c:forEach>
            </c:if>
        </tbody>
    </table>
</body>
</html>
