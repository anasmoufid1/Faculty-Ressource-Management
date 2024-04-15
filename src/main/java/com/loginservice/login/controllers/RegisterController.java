package com.loginservice.login.controllers;

import com.loginservice.login.models.Fournisseur;
import com.loginservice.login.services.FournisseurService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class RegisterController {


    @Autowired
    private FournisseurService fournisseurService;
    @GetMapping("register")
    public String registerForm(){
        return "Auth/Register";
    }
    @PostMapping("register")
    public String register(@RequestParam String companyName,
                           @RequestParam String username,
                           @RequestParam String password) {
        Fournisseur fournisseur = new Fournisseur();
        fournisseur.setCompanyName(companyName);
        fournisseurService.saveFournisseur(fournisseur, username, password);

        return "redirect:login?success=true";
    }
}
