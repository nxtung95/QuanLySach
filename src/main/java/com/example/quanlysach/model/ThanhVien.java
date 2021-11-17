package com.example.quanlysach.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public abstract class ThanhVien {
	private int id;
	private String username;
	private String password;

	public ThanhVien() {

	}

	public ThanhVien(int id, String username, String password) {
		this.id = id;
		this.username = username;
		this.password = password;
	}
}
