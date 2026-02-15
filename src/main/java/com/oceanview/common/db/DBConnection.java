package com.oceanview.common.db;

import com.oceanview.common.constants.DbConfig;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public final class DBConnection {

    private static DBConnection instance;

    private DBConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL connector driver
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("MySQL JDBC Driver not found.", e);
        }
    }

    public static synchronized DBConnection getInstance() {
        if (instance == null) {
            instance = new DBConnection();
        }
        return instance;
    }

    public Connection getConnection() throws SQLException {
        return DriverManager.getConnection(DbConfig.URL, DbConfig.USER, DbConfig.PASSWORD);
    }
}
