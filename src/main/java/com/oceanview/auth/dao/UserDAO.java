package com.oceanview.auth.dao;

import com.oceanview.auth.model.User;

import java.sql.SQLException;
import java.util.Optional;

public interface UserDAO {
    Optional<User> findByUsernameAndPasswordHash(String username, String passwordHash) throws SQLException;
}
