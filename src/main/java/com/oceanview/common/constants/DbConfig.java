package com.oceanview.common.constants;

public final class DbConfig {
    private DbConfig() {}

    public static final String URL =
            "jdbc:mysql://localhost:3306/oceanview_resort?useSSL=false&serverTimezone=UTC";
    public static final String USER = "root";
    public static final String PASSWORD = ""; // empty for XAMPP default
}
