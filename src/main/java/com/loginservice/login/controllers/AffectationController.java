package com.loginservice.login.controllers;

import com.loginservice.login.models.Affectation;
import com.loginservice.login.models.Besoin;
import com.loginservice.login.models.ChefDepartement;
import com.loginservice.login.models.Enseignant;
import com.loginservice.login.services.AffectationService;
import com.loginservice.login.services.BesoinService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;
import java.util.Optional;

@Controller
public class AffectationController {

    @Autowired
    private AffectationService affectationService;

    @Autowired
    private BesoinService besoinService;

    @GetMapping("/SendToResponsable")
    public String SendToResponsable(Model model , HttpSession session)
    {
        ChefDepartement chefDepp = (ChefDepartement) session.getAttribute("chefdepartement");
        Long chefDepId = chefDepp.getId();
        List<Besoin> besoinList =  besoinService.getAllBesoin(chefDepId);
        for (Besoin besoin : besoinList) {
            Affectation affectation = new Affectation();
            affectation.setEnseignant(besoin.getEnseignant());
            affectation.setRessource(besoin.getRessource());

            affectationService.saveAffectation(affectation);
        }

        return "redirect:/EnseignantPerDepartement ";
    }

    @GetMapping("/AffectationPrevue")
    public String ListAffectationPrevue(Model model , HttpSession session)
    {
        Enseignant enseignant = (Enseignant)session.getAttribute("enseignant");
        Long enseignantID = enseignant.getId();
        List<Affectation> listAffectation = affectationService.getAffectationById(enseignantID);
        model.addAttribute("listAffectation" , listAffectation);
        return "Enseignant/Affectation/home";
    }
}