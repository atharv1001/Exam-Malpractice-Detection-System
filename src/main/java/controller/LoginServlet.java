package controller;

import java.io.IOException;

import dao.StudentDAO;
import model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        StudentDAO dao = new StudentDAO();
        Student student = dao.login(email, password);

        if (student != null) {
            // Login successful
            HttpSession session = request.getSession();
            session.setAttribute("user", student);

            if ("admin".equals(student.getRole())) {
                response.sendRedirect(request.getContextPath() + "/adminDashboard.jsp");
            } else {
                response.sendRedirect(request.getContextPath() + "/exam.jsp");
            }

        } else {
            // Login failed → redirect to index.jsp with error
            response.sendRedirect(request.getContextPath() + "/index.jsp?error=invalid");
        }
    }
}