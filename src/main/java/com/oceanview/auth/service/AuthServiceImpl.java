package com.oceanview.auth.service;

import com.oceanview.auth.dao.UserDAO;
import com.oceanview.auth.model.User;
import com.oceanview.common.util.PasswordUtil;

import java.sql.SQLException;
import java.util.Optional;

public class AuthServiceImpl implements AuthService {

    private final UserDAO userDAO;

    public AuthServiceImpl(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    @Override
    public Optional<User> login(String username, String password) throws SQLException {
        String hash = PasswordUtil.sha256(password);
        return userDAO.findByUsernameAndPasswordHash(username, hash);
    }
}
