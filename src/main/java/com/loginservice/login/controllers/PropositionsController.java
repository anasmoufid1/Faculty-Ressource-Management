package com.loginservice.login.controllers;

import com.loginservice.login.models.AppelOffre;
import com.loginservice.login.models.Fournisseur;
import com.loginservice.login.models.Proposition;
import com.loginservice.login.services.AppelsOffreService;
import java.util.Collections;

import com.loginservice.login.services.PropositionService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
public class PropositionsController {

    @Autowired
    private AppelsOffreService appelsOffreService;

    @Autowired
    private PropositionService propositionService;


    //partie fournisseur
    @GetMapping("soumissions")
    public String soumissions(HttpSession session, Model model){
        Fournisseur fournisseur = (Fournisseur) session.getAttribute("fournisseur");
        List<Proposition> propositionList=fournisseur.getPropositionList();
        model.addAttribute("fournisseur",fournisseur);
        model.addAttribute("propositions",propositionList);
        return "Fournisseur/Soumissions/home";
    }


    //partie responsable
    @GetMapping("propositions")
    public String propositions(Model model){
        List<AppelOffre> appelsoffre=appelsOffreService.getAllAppelsOffre();
        Collections.reverse(appelsoffre);
        model.addAttribute("appelsoffre",appelsoffre);
        return "Responsable/Appelsoffre/home";
    }
    @GetMapping("appelpropositions/{id}")
    public String appelpropositions(Model model, @PathVariable Long id) {
        Optional<AppelOffre> appeloffre = appelsOffreService.getAppelOffreById(id);
        if (appeloffre.isPresent()) {
            model.addAttribute("appeloffre", appeloffre.get());
            return "Responsable/Propositions/home";
        } else {
            return "redirect:/propositions";
        }
    }
    @PostMapping("/Refuser")
    public String refuser(@RequestParam("proposition") int id,@RequestParam("motif") String motif){
        propositionService.refuserproposition(id,motif);
        return "redirect:/propositions";
    }
    @PostMapping("/Accepter")
    public String Accepter(@RequestParam("proposition") int id){
        propositionService.accepterproposition(id);
        return "redirect:/propositions";
    }



}
