package com.sanima.controller;

import java.io.IOException;

import com.sanima.Model.usermodel;
import com.sanima.service.signinservice;
import com.sanima.util.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * LoginController is responsible for handling login requests.
 * It interacts with the signinservice to authenticate users.
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/signincontroller" })
public class signincontroller extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final signinservice signinservice;

    public signincontroller() {
        this.signinservice = new signinservice();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/page/Login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        usermodel Usermodel = new usermodel(username, password);
        Boolean SigninStatus = signinservice.signinUser(Usermodel);

        if (SigninStatus != null && SigninStatus) {
            // 
            HttpSession session = req.getSession();
            session.setAttribute("user", Usermodel);
            SessionUtil.setAttribute(req, "username", username);
            SessionUtil.setAttribute(req, "role", Usermodel.getRole());

            // 
            if ("admin".equalsIgnoreCase(Usermodel.getRole())) {
                req.getRequestDispatcher("/WEB-INF/page/Adminpannel.jsp").forward(req, resp);
            } else {
                req.getRequestDispatcher("/WEB-INF/page/Home.jsp").forward(req, resp);
            }
        } else {
            handleLoginFailure(req, resp, SigninStatus);
        }
    }

    private void handleLoginFailure(HttpServletRequest req, HttpServletResponse resp, Boolean SigninStatus)
            throws ServletException, IOException {
        String errorMessage;
        if (SigninStatus == null) {
            errorMessage = "Our server is under maintenance. Please try again later!";
        } else {
            errorMessage = "User credential mismatch. Please try again!";
        }
        req.setAttribute("error", errorMessage);
        req.getRequestDispatcher("/WEB-INF/page/Login.jsp").forward(req, resp);
    }
}
