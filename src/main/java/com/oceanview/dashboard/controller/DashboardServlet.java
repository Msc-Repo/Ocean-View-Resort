package com.oceanview.dashboard.controller;

import com.oceanview.auth.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        User user = (User) session.getAttribute("user");

        String view = req.getParameter("view");
        if (view == null || view.isBlank()) view = "home";

        // safety: allow only known partials
        if (!isAllowedView(view)) view = "home";

        req.setAttribute("activeView", view);
        req.setAttribute("username", user.getUsername());
        req.setAttribute("partialPath",
                "/WEB-INF/views/dashboard/partials/" + view + ".jsp");

        req.getRequestDispatcher("/WEB-INF/views/dashboard/dashboard.jsp").forward(req, resp);
    }

    private boolean isAllowedView(String view) {
        return switch (view) {
            case "home", "rooms", "reservations", "billing", "help" -> true;
            default -> false;
        };
    }
}
