package com.loginservice.login.controllers;

import com.loginservice.login.services.ChefDepartementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class Chef_Dep_Controller {

    @Autowired
    private ChefDepartementService chefService;


}
