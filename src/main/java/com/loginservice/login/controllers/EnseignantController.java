package com.loginservice.login.controllers;

import com.loginservice.login.models.ChefDepartement;
import com.loginservice.login.models.Enseignant;
import com.loginservice.login.services.EnseignantService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class EnseignantController {

    @Autowired
    private EnseignantService enseignantService;


    @GetMapping("/EnseignantPerDepartement")

    public String getEnseignantByDepartementIdController(Model model, HttpSession session)
    {
        ChefDepartement chefDepp = (ChefDepartement) session.getAttribute("chefdepartement");
        Long departementId = chefDepp.getEnseignant().getDep().getId();
        List<Enseignant> EnseiList =  enseignantService.getEnseignantByDepartementIdS(departementId);
        model.addAttribute("EnseiList" , EnseiList);
        return "ChefDep/home";
    }



}
