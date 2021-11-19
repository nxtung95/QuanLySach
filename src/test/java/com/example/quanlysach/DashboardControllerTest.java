package com.example.quanlysach;

import com.example.quanlysach.controller.DashboardController;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.security.test.context.support.WithUserDetails;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;

@RunWith(SpringRunner.class)
@WebMvcTest(DashboardController.class)
public class DashboardControllerTest {
    @Autowired
    private MockMvc mvc;

    @Test
    @WithMockUser(username = "quanly", password = "test1234", roles = "QUANLY")
    public void testIndex() throws Exception {
        mvc.perform(MockMvcRequestBuilders.get("/quanly/dashboard"))
                .andExpect(MockMvcResultMatchers.view().name("dashboard"));
    };
}
