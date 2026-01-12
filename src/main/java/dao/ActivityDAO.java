package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class ActivityDAO {

    public void saveActivity(int studentId, String event, String ipAddress) {
        try {
            Connection con = DBConnection.getConnection();
            String sql = "INSERT INTO activity_log (student_id, event_type, ip_address) VALUES (?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, studentId);
            ps.setString(2, event);
            ps.setString(3, ipAddress);

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
