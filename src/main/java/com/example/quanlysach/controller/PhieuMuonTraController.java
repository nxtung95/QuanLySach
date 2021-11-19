package com.example.quanlysach.controller;

import com.example.quanlysach.dao.PhieuMuonTraDao;
import com.example.quanlysach.dao.ThongKeDocGiaDao;
import com.example.quanlysach.model.PhieuMuonTra;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.List;

@Controller
public class PhieuMuonTraController {
	private static final Logger log = LoggerFactory.getLogger(PhieuMuonTraController.class);

	@Autowired
	private PhieuMuonTraDao phieuMuonTraDao;

	@RequestMapping(value = "/quanly/{bookId}/{docGiaId}/phieu", method = RequestMethod.GET)
	public String getPhieu(@PathVariable int bookId, @PathVariable int docGiaId, Model model) {
		try {
			List<PhieuMuonTra> phieuMuonTraList = phieuMuonTraDao.getPhieuMuonTra(bookId, docGiaId);

			model.addAttribute("phieuMuon", phieuMuonTraList.stream().filter(p -> "0".equals(p.getType())).findFirst().get());
			model.addAttribute("phieuTra", phieuMuonTraList.stream().filter(p -> "1".equals(p.getType())).findFirst().get());
		} catch (Exception e) {
			log.error("err " + e);
		}
		return "phieu";
	}
}
