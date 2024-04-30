package com.loginservice.login.controllers;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class RedirectController {

@GetMapping("/")
    public String welcome(){
    return "Auth/login";
}
@GetMapping("/EffectuerNouvelleAppelOffre")
    public String EffctuerAppelOffre(){return "Responsable/EffectuerAppelOffre/home" ;}

@GetMapping("/fournisseurhome")
    public String fournisseurhome(){
    return "Fournisseur/home";
}
    @GetMapping("/enseignanthome")
    public String enseignanthome(){
        return "Enseignant/home";
    }

    @GetMapping("/responsablehome")
    public String responsablehome(){
        return "Responsable/home";
    }
}
