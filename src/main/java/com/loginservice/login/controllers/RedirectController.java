package com.loginservice.login.controllers;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class RedirectController {

@GetMapping("/")
    public String welcome(){
    return "Auth/login";
}


}
