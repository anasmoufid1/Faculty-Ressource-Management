package com.loginservice.login.controllers;

import com.loginservice.login.services.NotificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class NotificationController {
    @Autowired
    private NotificationService notificationService;
    @PostMapping("/notification")
    public String notification(@RequestParam("notification") int id){
        notificationService.updatenotifetat((long) id);
        return "redirect:/soumissions";
    }
}
