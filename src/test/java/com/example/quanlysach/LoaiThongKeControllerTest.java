package com.example.quanlysach;

import com.example.quanlysach.controller.LoaiThongKeController;
import com.example.quanlysach.dao.LoaiThongKeDao;
import com.example.quanlysach.model.LoaiThongKe;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;

import java.util.ArrayList;
import java.util.List;

@RunWith(SpringRunner.class)
@WebMvcTest(LoaiThongKeController.class)
public class LoaiThongKeControllerTest {
    @Autowired
    private MockMvc mvc;

    @MockBean
    private LoaiThongKeDao loaiThongKeDao;

    @Test
    @WithMockUser(username = "quanly", password = "test1234", roles = "QUANLY")
    public void testIndex() throws Exception {
        List<LoaiThongKe> loaiThongKeList = new ArrayList<>();
        loaiThongKeList.add(new LoaiThongKe(1, 1, "Thống kê sách theo lượt chọn"));
        loaiThongKeList.add(new LoaiThongKe(2, 1, "Thống kê sách theo tác giả"));
//        when();
        mvc.perform(MockMvcRequestBuilders.get("/quanly/dashboard"))
                .andExpect(MockMvcResultMatchers.view().name("dashboard"));
    };
}
