package com.oceanview.auth.dao;

import com.oceanview.auth.model.User;
import com.oceanview.common.db.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Optional;

public class UserDAOImpl implements UserDAO {

    private static final String SQL =
            "SELECT id, username, role FROM users WHERE username=? AND password_hash=?";

    @Override
    public Optional<User> findByUsernameAndPasswordHash(String username, String passwordHash) throws SQLException {
        try (Connection con = DBConnection.getInstance().getConnection();
             PreparedStatement ps = con.prepareStatement(SQL)) {

            ps.setString(1, username);
            ps.setString(2, passwordHash);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return Optional.of(new User(
                            rs.getInt("id"),
                            rs.getString("username"),
                            rs.getString("role")
                    ));
                }
                return Optional.empty();
            }
        }
    }
}
