package com.loginservice.login.controllers;

import com.loginservice.login.models.Besoin;
import com.loginservice.login.models.ChefDepartement;
import com.loginservice.login.models.CollecteBesoin;
import com.loginservice.login.services.CollecteBesoinService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Date;
import java.util.List;


@Controller
public class CollecteBesoinController {

    @Autowired
    private CollecteBesoinService collecteBesoinService;

    @Autowired
    private com.loginservice.login.services.BesoinService besoin;

    @GetMapping("/Collecte_Besoin")
    public String insertBesoin(CollecteBesoin c, HttpSession session) {

        Date now = new Date();


        c.setDateDemande(now);

        // Calculer la date d'expiration en ajoutant 24 heures à la date de demande
        long expirationTime = now.getTime() + (24 * 60 * 60 * 1000); // Ajoute 24 heures en millisecondes
        Date expirationDate = new Date(expirationTime);
        c.setDateExpiration(expirationDate);

        // Récupérer l'ID du chef depuis la session
        ChefDepartement chefDepp = (ChefDepartement) session.getAttribute("chefdepartement");
        Long chefDepId = chefDepp.getId();
        // Assurez-vous que l'ID du chef est récupéré avec succès
        if (chefDepId != null) {
            // Définir l'ID du chef dans la demande de collecte
            ChefDepartement chefDep = new ChefDepartement();
            chefDep.setId(chefDepId);
            c.setChefDep(chefDep);

            // Enregistrer la demande de collecte dans la base de données
            collecteBesoinService.insertDemandeBesoin(c);
            return "test/home";
        } else {
            return "test/error";
        }
    }

    @GetMapping("/ShowListBesoin")
    public String GetAllBesoin(Model model , HttpSession session)
    {
        ChefDepartement chefDepp = (ChefDepartement) session.getAttribute("chefdepartement");
        Long chefDepId = chefDepp.getId();
        List<Besoin> besoinList =  besoin.getAllBesoin(chefDepId);

        model.addAttribute("besoinlist" , besoinList);
        return "ChefDep/listeBesoin/home";
    }


}

