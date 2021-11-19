package com.example.quanlysach.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
public class PhieuMuonTra {
	private String ten;
	private String type;
	private Date ngay;
}
