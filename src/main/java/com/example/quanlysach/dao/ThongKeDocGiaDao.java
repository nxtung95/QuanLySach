package com.example.quanlysach.dao;

import com.example.quanlysach.model.ThongKeDocGia;
import com.example.quanlysach.model.ThongKeSach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Repository
public class ThongKeDocGiaDao extends BaseDao {
	@Autowired
	public ThongKeDocGiaDao(DataSource dataSource) {
		super(dataSource);
	}

	public List<ThongKeDocGia> getDanhSachDocGia(int bookId) {
		StringBuilder sql = new StringBuilder("SELECT a.id, g.ten, e.ngaymuon, a.ten, e.ngaytra, c.tienphat FROM tbldocgia a ");
		sql.append("INNER JOIN tblphieu b ON a.id = b.tbldocgiaid ");
		sql.append("INNER JOIN tblphieutra c ON b.id = c.tblphieuid ");
		sql.append("INNER JOIN tblthoigian e ON e.id = b.tblthoigianid ");
		sql.append("INNER JOIN tbldocgiasach f ON a.id = f.tbldocgiaid ");
		sql.append("INNER JOIN tblsach g ON f.tblsachid = g.id ");
		sql.append("WHERE g.id = ? ");
		List<ThongKeDocGia> thongKeDocGiaList = super.getJdbcTemplate().query(sql.toString(), rs -> {
			List<ThongKeDocGia> tkdgList = new ArrayList<>();
			while (rs.next()) {
				int id = rs.getInt("id");
				Date ngayMuon = rs.getDate("ngaymuon");
				String tenDocGia = rs.getString("ten");
				Date ngayTra = rs.getDate("ngaytra");
				String tienPhat = rs.getString("tienPhat");
				tkdgList.add(new ThongKeDocGia(id, ngayMuon, tenDocGia, ngayTra, tienPhat));
			}
			return tkdgList;
		}, bookId);
		return thongKeDocGiaList;
	}
}
