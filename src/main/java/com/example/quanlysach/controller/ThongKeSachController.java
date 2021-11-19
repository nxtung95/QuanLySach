package com.example.quanlysach.controller;

import com.example.quanlysach.dao.ThongKeSachDao;
import com.example.quanlysach.model.ThongKeSach;
import com.example.quanlysach.utils.DateUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ThongKeSachController {
    private static final Logger log = LoggerFactory.getLogger(ThongKeSachController.class);

    @Autowired
    private ThongKeSachDao thongKeSachDao;

    @RequestMapping(value = "/quanly/thongkesach", method = RequestMethod.GET)
    public String index() {
        return "thongkesach";
    };

    @RequestMapping(
            value = "/quanly/thongkesach/seach",
            method = RequestMethod.GET,
            produces = {MediaType.APPLICATION_JSON_VALUE}
    )
    @ResponseBody
    public Map<String,Object> search(
        @RequestParam(name = "startTime") String startTime,
        @RequestParam(name = "endTime") String endTime
    ) {
        int status = HttpStatus.OK.value();
        Map<String, Object> result = new HashMap<>();
        List<ThongKeSach> thongKeSachList = new ArrayList<>();
        try {
//            int offset = (pageNumber - 1) * pageSize;
//            int limit = pageSize;
            startTime = DateUtil.formatDate(startTime, "dd/MM/yyyy", "yyyy-MM-dd");
            endTime = DateUtil.formatDate(endTime, "dd/MM/yyyy", "yyyy-MM-dd");
            thongKeSachList = thongKeSachDao.getDanhSachThongKeSach(startTime, endTime);
        } catch (Exception e) {
            log.error("error " + e);
            status = HttpStatus.INTERNAL_SERVER_ERROR.value();
        }
        result.put("status", status);
        result.put("thongKeSachList", thongKeSachList);
        return result;
    }
}
