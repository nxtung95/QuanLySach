package com.example.quanlysach.dao;

import com.example.quanlysach.model.PhieuMuonTra;
import com.example.quanlysach.model.ThongKeDocGia;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Repository
public class PhieuMuonTraDao extends BaseDao {

	@Autowired
	public PhieuMuonTraDao(DataSource dataSource) {
		super(dataSource);
	}

	public List<PhieuMuonTra> getPhieuMuonTra(int bookId, int docGiaId) {
		StringBuilder sql = new StringBuilder("SELECT d.ten, e.ngaymuon as ngay, '0' as type FROM tblphieumuon a ");
		sql.append("INNER JOIN tblphieu b ON b.id = a.tblphieuid ");
		sql.append("INNER JOIN tblthoigian e ON e.id = b.tblthoigianid ");
		sql.append("INNER JOIN tblphieusach c ON c.tblphieuid = b.id ");
		sql.append("INNER JOIN tblsach d ON d.id = c.tblsachid ");
		sql.append("WHERE d.id = ? AND b.tbldocgiaid = ? ");
		sql.append("UNION ALL ");
		sql.append("SELECT d.ten, e.ngaytra as ngay, '1' as type FROM tblphieutra a ");
		sql.append("INNER JOIN tblphieu b ON b.id = a.tblphieuid ");
		sql.append("INNER JOIN tblthoigian e ON e.id = b.tblthoigianid ");
		sql.append("INNER JOIN tblphieusach c ON c.tblphieuid = b.id ");
		sql.append("INNER JOIN tblsach d ON d.id = c.tblsachid ");
		sql.append("WHERE d.id = ? AND b.tbldocgiaid = ? ");
		List<PhieuMuonTra> phieuMuonTraList = super.getJdbcTemplate().query(sql.toString(), rs -> {
			List<PhieuMuonTra> pmtList = new ArrayList<>();
			while (rs.next()) {
				String tenSach = rs.getString("ten");
				Date ngay = rs.getDate("ngay");
				String type = rs.getString("type");
				pmtList.add(new PhieuMuonTra(tenSach, type, ngay));
			}
			return pmtList;
		}, bookId, docGiaId, bookId, docGiaId);
		return phieuMuonTraList;
	}
}
