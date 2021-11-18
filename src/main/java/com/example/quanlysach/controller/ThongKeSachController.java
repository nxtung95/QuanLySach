package com.example.quanlysach.controller;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
public class ThongKeSachController {
    @RequestMapping(value = "/quanly/thongkesach", method = RequestMethod.GET)
    public String index() {
        return "thongkesach";
    };

    @RequestMapping(
            value = "/quanly/thongkesach/seach",
            method = RequestMethod.GET,
            consumes = {MediaType.APPLICATION_JSON_VALUE},
            produces = {MediaType.APPLICATION_JSON_VALUE}
    )
    @ResponseBody
    public Map<String,Object> search(
        @RequestParam(name = "pageNumber", required = false, defaultValue = "1") int pageNumber,
        @RequestParam(name = "pageSize", required = false, defaultValue = "10") int pageSize,
        @RequestParam(name = "startTime") String startTime,
        @RequestParam(name = "endTime") String endTime
    ) {
        Map<String, Object> result = new HashMap<>();
        try {

        } catch (Exception e) {

        }
        return result;
    }
}
