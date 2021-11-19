package com.example.quanlysach.controller;

import com.example.quanlysach.dao.ThongKeDocGiaDao;
import com.example.quanlysach.model.ThongKeDocGia;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
public class ThongKeDocGiaController {
	private static final Logger log = LoggerFactory.getLogger(ThongKeDocGiaController.class);

	@Autowired
	private ThongKeDocGiaDao thongKeDocGiaDao;

	@RequestMapping(value = "/quanly/{bookId}/thongkedocgia", method = RequestMethod.GET)
	public String index(@PathVariable int bookId, Model model) {
		try {
			List<ThongKeDocGia> thongKeDocGiaDaoList = thongKeDocGiaDao.getDanhSachDocGia(bookId);
			model.addAttribute("thongKeDocGiaList", thongKeDocGiaDaoList);
			model.addAttribute("bookId", bookId);
		} catch (Exception e) {
			log.error("err " + e);
		}
		return "thongkedocgia";
	};
}
