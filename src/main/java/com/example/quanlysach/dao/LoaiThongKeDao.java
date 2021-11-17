package com.example.quanlysach.dao;

import com.example.quanlysach.model.LoaiThongKe;
import com.example.quanlysach.model.QuanLy;
import com.example.quanlysach.model.ThanhVien;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;

@Repository
public class LoaiThongKeDao extends BaseDao {

    @Autowired
    public LoaiThongKeDao(DataSource dataSource) {
        super(dataSource);
    }

    public List<LoaiThongKe> getLoaiThongKe(int quanLyId) {
        StringBuilder sql = new StringBuilder("SELECT * FROM tblloaithongke t");
        sql.append("INNER JOIN tblquanly q ");
        sql.append("ON t.tblquanlyid = q.tblthanhvienid ");
        sql.append("INNER JOIN tblthanhvien v ");
        sql.append("ON q.tblthanhvienid = v.id ");
        sql.append("WHERE t.tblquanlyid = ? ");
        sql.append("ORDER BY ordernumber ASC ");
        List<LoaiThongKe> loaiThongKeList = new ArrayList<>();
        super.getJdbcTemplate().query(sql.toString(), rs -> {
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String orderNumber = rs.getString("ordernumber");
                loaiThongKeList.add(new LoaiThongKe(id, name, orderNumber));
            }
            return loaiThongKeList;
        }, quanLyId);
        return loaiThongKeList;
    }
}