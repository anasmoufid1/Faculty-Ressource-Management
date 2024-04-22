package com.loginservice.login.controllers;

import com.loginservice.login.models.*;
import com.loginservice.login.services.CollecteBesoinService;
import com.loginservice.login.services.EnseignantService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
public class EnseignantController {

    @Autowired
    private EnseignantService enseignantService;
    @Autowired
    private CollecteBesoinService collecteBesoinService;

    @GetMapping("/EnseignantPerDepartement")

    public String getEnseignantByDepartementIdController(Model model, HttpSession session)
    {
        ChefDepartement chefDepp = (ChefDepartement) session.getAttribute("chefdepartement");
        Long departementId = chefDepp.getEnseignant().getDep().getId();
        List<Enseignant> EnseiList =  enseignantService.getEnseignantByDepartementIdS(departementId);
        model.addAttribute("EnseiList" , EnseiList);
        return "ChefDep/home";
    }

    @GetMapping("/collectbesoinenseignant")
    public String getCollectBesoinByDepartementId(Model model,HttpSession session)
    {
        Enseignant enseignant = (Enseignant) session.getAttribute("enseignant");
        Long departementId = enseignant.getDep().getId();
        List<CollecteBesoin> listB = enseignantService.getCollectBesoinByDepartementId(departementId);
        model.addAttribute("listB",listB);
        return "Enseignant/ListeCollectBesoin/home";
    }


    @PostMapping("/EffectuerDemande")
    public String EffectuerDemande(HttpServletRequest request , HttpSession session)
    {
        String type = request.getParameter("type");
        String marque = request.getParameter("marque");
        String numInventaire = request.getParameter("num_inventaire");
        String prixParameter = request.getParameter("prix");
        String besoinId = request.getParameter("besoinId");

        Long besId = null;
        if (besoinId != null) {
            try {
                besId = Long.valueOf(prixParameter);
            } catch (NumberFormatException e) {
                // Gérer le cas où la valeur n'est pas un nombre valide
                // Par exemple, afficher un message d'erreur ou utiliser une valeur par défaut
                e.printStackTrace();
            }
        }
        Double prix = null;
        if (prixParameter != null) {
            try {
                prix = Double.valueOf(prixParameter);
            } catch (NumberFormatException e) {
                // Gérer le cas où la valeur n'est pas un nombre valide
                // Par exemple, afficher un message d'erreur ou utiliser une valeur par défaut
                e.printStackTrace();
            }
        }

        Ressource ressource = new Ressource();
        ressource.setMarque(marque);
        ressource.setNumInventaire(numInventaire);
        ressource.setPrix(prix);
        ressource.setType(type);
        Enseignant enseignant = (Enseignant) session.getAttribute("enseignant");
        CollecteBesoin besoinn = collecteBesoinService.getBesoinById(besId);
        Besoin besoin = new Besoin();
        besoin.setEnseignant(enseignant);
        besoin.setRessource(ressource);
        besoin.setCollecteBesoin(besoinn);


        if ("ordinateur".equals(type)) {
            // Si c'est un ordinateur, récupérer les champs spécifiques
            String cpu = request.getParameter("cpu_ordi");
            String disqueDure = request.getParameter("disque_dure_ordi");
            String ecran = request.getParameter("ecran_ordi");
            String ram = request.getParameter("ram_ordi");

            Ordinateur ordinateur = new Ordinateur();
            ordinateur.setCpu(cpu);
            ordinateur.setDisqueDure(disqueDure);
            ordinateur.setEcran(ecran);
            ordinateur.setEcran(ecran);
            ordinateur.setRam(ram);
            ordinateur.setRessource(ressource);
            enseignantService.EffectuerDemandeOrd(ressource,ordinateur, besoin);
        } else if ("imprimante".equals(type)) {
            String resolution = request.getParameter("resolution_imp");
            String vitesseImpression = request.getParameter("vitesse_impression_imp");

            Imprimante imprimante = new Imprimante();
            imprimante.setResolution(resolution);
            imprimante.setVitesseImpression(vitesseImpression);
            imprimante.setRessource(ressource);
            enseignantService.EffectuerDemandeImp(ressource,imprimante , besoin);
        }



        return "Enseignant/home";
    }



}
