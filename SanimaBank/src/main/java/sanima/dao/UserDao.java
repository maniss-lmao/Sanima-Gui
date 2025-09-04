package sanima.dao;

import com.sanima.config.Dbconfig;
import com.sanima.Model.usermodel;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDao {
    private Connection conn;

    public UserDao() throws Exception {
        conn = Dbconfig.getDbConnection();
        if (conn == null) {
            throw new SQLException(" DB connection is null.");
        } else {
            System.out.println(" DB connection established.");
            if (!conn.getAutoCommit()) {
                conn.setAutoCommit(true);
            }
        }
    }

    // INSERT USER
    public void insertUser(usermodel user) throws SQLException {
        String sql = "INSERT INTO users (FirstName, LastName, Username, DOB, Gender, Email, PhoneNumber, Password, Role) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, user.getFirstName());
            ps.setString(2, user.getLastName());
            ps.setString(3, user.getUsername());
            ps.setDate(4, Date.valueOf(user.getDob()));
            ps.setString(5, user.getGender());
            ps.setString(6, user.getEmail());
            ps.setString(7, user.getPhoneNumber());
            ps.setString(8, user.getPassword());
            ps.setString(9, user.getRole());

            ps.executeUpdate();
        }
    }

    // UPDATE USER
    public void updateUser(usermodel user) throws SQLException {
        String sql = "UPDATE users SET FirstName=?, LastName=?, Username=?, DOB=?, Gender=?, " +
                     "Email=?, PhoneNumber=?, Password=?, Role=? WHERE UserID=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, user.getFirstName());
            ps.setString(2, user.getLastName());
            ps.setString(3, user.getUsername());
            ps.setDate(4, Date.valueOf(user.getDob()));
            ps.setString(5, user.getGender());
            ps.setString(6, user.getEmail());
            ps.setString(7, user.getPhoneNumber());
            ps.setString(8, user.getPassword());
            ps.setString(9, user.getRole());
            ps.setInt(10, user.getId());

            ps.executeUpdate();
        }
    }

    // DELETE USER
    public void deleteUser(int userId) throws SQLException {
        String sql = "DELETE FROM users WHERE UserID = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.executeUpdate();
        }
    }

    // GET ALL USERS
    public List<usermodel> getAllUsers() {
        List<usermodel> userList = new ArrayList<>();
        String sql = "SELECT * FROM users";
        try (PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                usermodel u = new usermodel(
                        rs.getInt("UserID"),
                        rs.getString("FirstName"),
                        rs.getString("LastName"),
                        rs.getString("Username"),
                        rs.getDate("DOB").toLocalDate(),
                        rs.getString("Gender"),
                        rs.getString("Email"),
                        rs.getString("PhoneNumber"),
                        rs.getString("Password"),
                        rs.getString("Role")
                );
                userList.add(u);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }
}
