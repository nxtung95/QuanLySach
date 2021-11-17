package com.example.quanlysach.dao;

import com.example.quanlysach.model.QuanLy;
import org.springframework.beans.factory.annotation.Autowired;

import javax.sql.DataSource;

public abstract class ThanhVienDao extends BaseDao {
	@Autowired
	public ThanhVienDao(DataSource dataSource) {
		super(dataSource);
	}

	public abstract QuanLy getQuanLyTheoTen(String ten);
}
