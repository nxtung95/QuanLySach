package com.example.quanlysach.dao;

import org.springframework.jdbc.core.support.JdbcDaoSupport;

import javax.sql.DataSource;

public abstract class BaseDao extends JdbcDaoSupport {
    public BaseDao(DataSource dataSource) {
        this.setDataSource(dataSource);
    }
}
