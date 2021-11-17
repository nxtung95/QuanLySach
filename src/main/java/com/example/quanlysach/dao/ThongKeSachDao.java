package com.example.quanlysach.dao;

import com.example.quanlysach.model.ThongKeSach;
import org.springframework.beans.factory.annotation.Autowired;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;

public class ThongKeSachDao extends BaseDao {
    @Autowired
    public ThongKeSachDao(DataSource dataSource) {
        super(dataSource);
    }

    public List<ThongKeSach> getDanhSachThongKeSach() {
        List<ThongKeSach> thongKeSachList = new ArrayList<>();
        return thongKeSachList;
    }
}
