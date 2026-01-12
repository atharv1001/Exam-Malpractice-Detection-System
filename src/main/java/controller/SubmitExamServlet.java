package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/submitExam")
public class SubmitExamServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Get answers
        String q1 = request.getParameter("q1");
        String q2 = request.getParameter("q2");

        int score = 0;

        // Correct answers
        if ("b".equals(q1)) score++;
        if ("c".equals(q2)) score++;

        request.setAttribute("score", score);
        request.getRequestDispatcher("result.jsp").forward(request, response);
    }
}
