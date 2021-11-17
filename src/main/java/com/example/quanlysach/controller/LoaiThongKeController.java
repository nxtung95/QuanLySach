package com.example.quanlysach.controller;

import com.example.quanlysach.dao.LoaiThongKeDao;
import com.example.quanlysach.model.LoaiThongKe;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
public class LoaiThongKeController {
    @Autowired
    private LoaiThongKeDao loaiThongKeDao;

    @RequestMapping(value = "/quanly/loaithongke", method = RequestMethod.GET)
    public String index(Model model) {
        int quanLyId = 1;
        List<LoaiThongKe> loaiThongKeList = loaiThongKeDao.getLoaiThongKe(quanLyId);
        model.addAttribute("loaiThongKeList", loaiThongKeList);
        return "loaithongke";
    }
}
