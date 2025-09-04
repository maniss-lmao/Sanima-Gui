package com.sanima.controller;

import com.sanima.Model.usermodel;
import sanima.dao.UserDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@WebServlet("/admin")
public class admincontroller extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDao userDao;

    @Override
    public void init() throws ServletException {
        try {
            userDao = new UserDao();
        } catch (Exception e) {
            throw new ServletException("Failed to initialize UserDao", e);
        }
    }

    // Load all users 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<usermodel> userList = userDao.getAllUsers();
        request.setAttribute("userList", userList);
        request.getRequestDispatcher("admin.jsp").forward(request, response);
    }

    // Handle Add / Update / Delete
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if ("delete".equals(action)) {
                int userId = Integer.parseInt(request.getParameter("id"));
                userDao.deleteUser(userId);

            } else if ("update".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                String firstName = request.getParameter("firstName");
                String lastName = request.getParameter("lastName");
                String username = request.getParameter("username");
                LocalDate dob = LocalDate.parse(request.getParameter("dob"));
                String gender = request.getParameter("gender");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                String password = request.getParameter("password");
                String role = request.getParameter("role");

                usermodel user = new usermodel(id, firstName, lastName, username, dob, gender,
                                               email, phone, password, role);
                userDao.updateUser(user);

            } else if ("add".equals(action)) {
                String firstName = request.getParameter("firstName");
                String lastName = request.getParameter("lastName");
                String username = request.getParameter("username");
                LocalDate dob = LocalDate.parse(request.getParameter("dob"));
                String gender = request.getParameter("gender");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                String password = request.getParameter("password");
                String role = request.getParameter("role");

                usermodel newUser = new usermodel(firstName, lastName, username, dob, gender,
                                                  email, phone, password, role);
                userDao.insertUser(newUser);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Refresh table
        response.sendRedirect("admin");
    }
}
