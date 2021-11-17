package com.example.quanlysach.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class QuanLy extends ThanhVien {
	public QuanLy(int id, String username, String password, String vitri) {
		super(id, username, password);
		this.vitri = vitri;
	}

	public QuanLy() {

	}

	private String vitri;
}
