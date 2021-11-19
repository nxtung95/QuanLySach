package com.example.quanlysach.dao;

import com.example.quanlysach.model.ThongKeSach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;

@Repository
public class ThongKeSachDao extends BaseDao {
    @Autowired
    public ThongKeSachDao(DataSource dataSource) {
        super(dataSource);
    }

    public List<ThongKeSach> getDanhSachThongKeSach(String startTime, String endTime) {
        StringBuilder sql = new StringBuilder("SELECT a.id, a.masach, a.ten as tensach, GROUP_CONCAT(DISTINCT c.ten) as tacgia, a.mavach, a.soluotmuon ");
        sql.append("FROM tblsach a ");
        sql.append("INNER JOIN tblsachtacgia b ON a.id = b.tblsachid ");
        sql.append("INNER JOIN tbltacgia c ON c.id = b.tbltacgiaid ");
        sql.append("INNER JOIN tblphieusach d ON d.tblsachid = a.id ");
        sql.append("INNER JOIN tblphieu e ON e.id = d.tblphieuid ");
        sql.append("INNER JOIN tblthoigian f ON e.id = d.tblphieuid ");
        sql.append("WHERE DATE(f.ngaymuon) BETWEEN ? AND ? ");
        sql.append("GROUP BY a.id, a.masach, tensach, mavach, soluotmuon ");
        sql.append("ORDER BY soluotmuon DESC ");
//        sql.append("LIMIT ").append(offset).append(",").append(limit);
        List<ThongKeSach> thongKeSachList = super.getJdbcTemplate().query(sql.toString(), rs -> {
            List<ThongKeSach> tksList = new ArrayList<>();
            while (rs.next()) {
                int id = rs.getInt("id");
                String maSach = rs.getString("masach");
                String tenSach = rs.getString("tensach");
                String tenTacGia = rs.getString("tacgia");
                String maVach = rs.getString("mavach");
                int soLuotMuon = rs.getInt("soluotmuon");
                tksList.add(new ThongKeSach(id, maSach, tenSach, tenTacGia, maVach, soLuotMuon));
            }
            return tksList;
        }, startTime, endTime);
        return thongKeSachList;
    }
}
