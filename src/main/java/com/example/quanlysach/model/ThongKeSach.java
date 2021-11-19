package com.example.quanlysach.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class ThongKeSach {
    private int id;
    private String maSach;
    private String tenSach;
    private String tacGia;
    private String maVach;
    private int tongSoLuotMuon;
}
