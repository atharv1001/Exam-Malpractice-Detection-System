package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.Student;

public class StudentDAO {

    public Student login(String email, String password) {
        Student student = null;

        try {
            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM student WHERE email=? AND password=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                student = new Student();
                student.setId(rs.getInt("id"));
                student.setEmail(rs.getString("email"));
                student.setRole(rs.getString("role"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return student;
    }
}
