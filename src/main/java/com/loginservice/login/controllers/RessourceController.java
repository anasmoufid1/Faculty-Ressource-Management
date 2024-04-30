package com.loginservice.login.controllers;

import com.loginservice.login.models.*;
import com.loginservice.login.services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Random;

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
    private PropositionService propositionService;

    @Autowired
    private BesoinService besoinService;

    @Autowired
    private AppelsOffreService appelsOffreService;

    @Autowired
    private FournisseurService fournisseurService;

    @Autowired
    private PrixBesoinPropositionService prixBesoinPropositionService;

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

    @PostMapping("/confirmer")
    public String congirmer(@RequestParam("nomgerant") String nomgerant,
                            @RequestParam("adresse") String adresse,
                            @RequestParam("siteinternet") String siteinternet,
                            @RequestParam("proposition") int id){
        Proposition proposition= propositionService.getpropositionbyid(id);
        if(proposition!=null){
            Fournisseur fournisseur=proposition.getFournisseur();
            AppelOffre appelOffre=proposition.getAppelOffre();
            List<Besoin> besoinsList=appelOffre.getBesoins();
            //supprimer les propositons associées
            for(Proposition prop:appelOffre.getPropositionList()){
                propositionService.deleteProposition(prop);
            }
            for(Besoin besoin:besoinsList){
                Ressource ressource=besoin.getRessource();
                //affecter un numero d'inventaire alétoire a la ressource (a modifier en cas de besoin)
                ressource.setNumInventaire(generateRandomString(8));
                //affeceter le fournisseur au ressource
                ressource.setFournisseur(fournisseur);
                //supprimer les prix de chaque proposition
                for(PrixBesoinProposition prixBesoinProposition:besoin.getPropositionsAvecPrix()){
                    prixBesoinPropositionService.deletePrixProposition(prixBesoinProposition);
                }
                ressourceService.save(ressource);
                //supprimer les besoins associées
                besoinService.deleteBesoin(besoin);
            }


            //supprimer l'appel d'offre
            appelsOffreService.deleteAppelOffre(appelOffre);
            //mettre a jour les informations du fournisseur
            fournisseur.setAdresse(adresse);
            fournisseur.setGerantName(nomgerant);
            fournisseur.setSiteInternet(siteinternet);
            fournisseurService.update(fournisseur);
            return "redirect:/RessourceDisponible";
        }else{
            return "redirect:/propositions";
        }
    }


    public String generateRandomString(int length) {
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        StringBuilder sb = new StringBuilder();
        Random random = new Random();
        for (int i = 0; i < length; i++) {
            char randomChar = characters.charAt(random.nextInt(characters.length()));
            sb.append(randomChar);
        }
        return sb.toString();
    }



}
