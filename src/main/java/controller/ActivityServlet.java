package controller;

import java.io.IOException;

import dao.ActivityDAO;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/logActivity")
public class ActivityServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        int studentId = Integer.parseInt(request.getParameter("studentId"));
        String event = request.getParameter("event");
        String ip = request.getRemoteAddr();

        ActivityDAO dao = new ActivityDAO();
        dao.saveActivity(studentId, event, ip);

        response.getWriter().print("OK");
    }
}
