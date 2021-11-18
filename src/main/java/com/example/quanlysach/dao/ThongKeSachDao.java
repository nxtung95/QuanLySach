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

    public List<ThongKeSach> getDanhSachThongKeSach(int limit, int offset, String startTime, String endTime) {
        List<ThongKeSach> thongKeSachList = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT a.masach, a.ten as tensach, GROUP_CONCAT(b.ten) as tacgia, a.mavach, a.soluotmuon ");
        sql.append("FROM tblsach a ");
        sql.append("INNER JOIN tblsachtacgia b ON a.id = b.tblsachid ");
        sql.append("INNER JOIN tbltacgia c ON b.tacgiaid = c.id ");
        sql.append("INNER JOIN tblphieusach d ON d.tblsachid = a.id ");
        sql.append("INNER JOIN tblphieu e ON e.id = d.tblphieuid ");
        sql.append("INNER JOIN tblthoigian f ON e.id = d.tblphieuid ");
        sql.append("WHERE DATE(f.ngaymuon) BETWEEN startTime AND endTime ");
        sql.append("GROUP BY a.masach ");
        super.getJdbcTemplate().query(sql.toString(), rs -> {
            while (rs.next()) {
                String maSach = rs.getString("masach");
                String tenSach = rs.getString("tensach");
                String tenTacGia = rs.getString("tacgia");
                String maVach = rs.getString("mavach");
                int soLuotMuon = rs.getInt("soluotmuon");
                thongKeSachList.add(new ThongKeSach(maSach, tenSach, tenTacGia, maVach, soLuotMuon));
            }
        });
        return thongKeSachList;
    }
}
