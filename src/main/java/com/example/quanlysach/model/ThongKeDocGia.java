package com.example.quanlysach.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
public class ThongKeDocGia {
	private int idDocGia;
	private Date ngayMuon;
	private String tenDocGia;
	private Date ngayTra;
	private String tienPhat;
}
