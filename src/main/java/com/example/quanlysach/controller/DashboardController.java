package com.example.quanlysach.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DashboardController {
    @RequestMapping(value = "/quanly/dashboard")
    public String index() {
        return "dashboard";
    }
}
