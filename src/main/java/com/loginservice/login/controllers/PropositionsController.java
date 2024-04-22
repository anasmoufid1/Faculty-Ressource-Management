package com.loginservice.login.controllers;

import com.loginservice.login.models.Fournisseur;
import com.loginservice.login.models.Proposition;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class PropositionsController {
    @GetMapping("soumissions")
    public String soumissions(HttpSession session, Model model){
        Fournisseur fournisseur = (Fournisseur) session.getAttribute("fournisseur");
        List<Proposition> propositionList=fournisseur.getPropositionList();
        model.addAttribute("fournisseur",fournisseur);
        model.addAttribute("propositions",propositionList);
        return "Fournisseur/Soumissions/home";
    }
}
