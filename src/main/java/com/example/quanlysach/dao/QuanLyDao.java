package com.example.quanlysach.dao;

import com.example.quanlysach.model.QuanLy;
import com.example.quanlysach.model.ThanhVien;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;

@Repository("quanLyDao")
public class QuanLyDao extends ThanhVienDao {

	public QuanLyDao(DataSource dataSource) {
		super(dataSource);
	}

	@Override
	public QuanLy getQuanLyTheoTen(String username) {
		StringBuilder sql = new StringBuilder("SELECT t.id, t.username, t.password, q.vitri FROM tblquanly q ");
		sql.append("INNER JOIN tblthanhvien t ");
		sql.append("ON t.id = q.tblthanhvienid ");
		sql.append("WHERE t.username = ? ");
		QuanLy quanLy = (QuanLy) super.getJdbcTemplate().query(sql.toString(), rs -> {

			if (rs.next()) {
				int id = rs.getInt("id");
				String userName = rs.getString("username");
				String password = rs.getString("password");
				String vitri = rs.getString("vitri");
				ThanhVien tv = new QuanLy(id, userName, password, vitri);
				return tv;
			}
			return null;
		}, username);
		return quanLy;
	}
}
