<%@ page import="java.util.List" %>
<%@ page import="com.sanima.Model.usermodel" %>
<%
    List<usermodel> userList = (List<usermodel>) request.getAttribute("userList");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" type="text/css" href="css/admin.css">
</head>
<body>
    <header>
        <h1>Admin Dashboard</h1>
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
            <% if(userList != null) {
                for(usermodel user : userList) { %>
            <tr>
                <form action="admin" method="post">
                    <td>
                        <input type="hidden" name="id" value="<%= user.getId() %>">
                        <%= user.getId() %>
                    </td>
                    <td><input type="text" name="firstName" value="<%= user.getFirstName() %>"></td>
                    <td><input type="text" name="lastName" value="<%= user.getLastName() %>"></td>
                    <td><input type="text" name="username" value="<%= user.getUsername() %>"></td>
                    <td><input type="date" name="dob" value="<%= user.getDob() %>"></td>
                    <td><input type="text" name="gender" value="<%= user.getGender() %>"></td>
                    <td><input type="email" name="email" value="<%= user.getEmail() %>"></td>
                    <td><input type="text" name="phone" value="<%= user.getPhoneNumber() %>"></td>
                    <td><input type="password" name="password" value="<%= user.getPassword() %>"></td>
                    <td><input type="text" name="role" value="<%= user.getRole() %>"></td>
                    <td>
                        <button type="submit" name="action" value="update" class="btn save-btn">Save</button>
                        <button type="submit" name="action" value="delete" class="btn delete-btn">Delete</button>
                    </td>
                </form>
            </tr>
            <% } } %>
        </tbody>
    </table>
</body>
</html>
