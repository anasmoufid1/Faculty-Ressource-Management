package com.loginservice.login.controllers;

import com.loginservice.login.models.*;
import com.loginservice.login.services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Optional;

@Controller
public class RessourceController {

    @Autowired
    private RessourceService ressourceService;

    @Autowired
    private OrdinateurService ordinateurService;

    @Autowired
    private ImprimanteService imprimanteService;
    @Autowired
    private EnseignantService enseignantService;

    @Autowired
    private AffectationService affectationService;

    @GetMapping("/RessourceDisponible")
    public String GetRessourceDispo(Model model)
    {
        List<Ressource> listRessourceDispo = ressourceService.getRessourceDisponibleSErvice();
        List<Enseignant> enseignantList = enseignantService.getAll();
        model.addAttribute("listRessourceDispo",listRessourceDispo);
        model.addAttribute("listEnseignant" , enseignantList);

        return "Responsable/RessourceDiponibles/home";
    }




    @PostMapping("/update-ordinateur")
    public String updateOrdinateur(@RequestParam("id") Long id,
                                   @RequestParam("cpu") String cpu,
                                   @RequestParam("disqueDur") String disqueDur,
                                   @RequestParam("ecran") String ecran,
                                   @RequestParam("ram") String ram) {

        Ordinateur ordinateur = ordinateurService.getOrdinateurByRessourceId(id);
        ordinateur.setCpu(cpu);
        ordinateur.setDisqueDure(disqueDur);
        ordinateur.setEcran(ecran);
        ordinateur.setRam(ram);


        ordinateurService.saveOrdinateur(ordinateur);
        return "Responsable/home";
    }

    @PostMapping("/update-imprimante")
    public String updateImprimante(@RequestParam("id") Long id,
                                   @RequestParam("resolution") String resolution,
                                   @RequestParam("vitesseImpression") String vitesseImpression) {

        Imprimante imprimante = imprimanteService.findImprimanteByRessourceId(id);
        imprimante.setResolution(resolution);
        imprimante.setVitesseImpression(vitesseImpression);


        imprimanteService.saveImprimante(imprimante);
        return "Responsable/home";
    }

    @PostMapping("DeleteRessource")
    public String deleteRessource(@RequestParam("id") Long id,
                                  @RequestParam("type") String type){
        if ("Ordinateur".equals(type)) { // Correction de la casse
            ordinateurService.deleteOrdinateur(id);
        } else {
            imprimanteService.deleteImprimante(id);
        }
        ressourceService.DeleteResource(id);

        return "Responsable/home";
    }




}
