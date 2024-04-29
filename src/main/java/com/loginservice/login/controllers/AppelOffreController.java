package com.loginservice.login.controllers;

import com.loginservice.login.models.*;
import com.loginservice.login.repositories.AppelsOffreRepository;
import com.loginservice.login.repositories.FournisseurRepository;
import com.loginservice.login.services.AppelsOffreService;
import com.loginservice.login.services.BesoinService;
import com.loginservice.login.services.PrixBesoinPropositionService;
import com.loginservice.login.services.PropositionService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.*;

@Controller
public class AppelOffreController {

    @Autowired
    private AppelsOffreService appelsOffreService;

    @Autowired
    private FournisseurRepository fournisseurRepository;

    @Autowired
    private PropositionService propositionService;

    @Autowired
    private BesoinService besoinService;

    @Autowired
    private PrixBesoinPropositionService prixBesoinPropositionService;
    @GetMapping("/appelsoffre")
    public String appeloffre(Model model, HttpServletRequest request){
        HttpSession session=request.getSession();
        Fournisseur fournisseur = (Fournisseur) session.getAttribute("fournisseur");
        List<AppelOffre> appelsoffre=appelsOffreService.getAllAppelsOffre();

        model.addAttribute("appelsoffre",appelsoffre);
        model.addAttribute("fournisseur",fournisseur);
        return "Fournisseur/Appelsoffre/home";
    }
    @PostMapping("/Soummettre")
    public String soumettre(@RequestParam("totalPrice") double totalPrice,
                                                         @RequestParam Map<String, String> formData,
                                                         @RequestParam("appelOffre") Long id,
                                                         @RequestParam("dateLivraison") LocalDate datelivraison,
                                                         @RequestParam("dureeGarantie") int dureeGarantie,
                                                         @RequestParam("fournisseur") Long fournisseur){
        Fournisseur fournisseur1 = fournisseurRepository.getById(fournisseur);
        if(fournisseur1.isEstListeNoire()){
            return "redirect:fournisseur";
        }
        List<Double> prixBesoins = new ArrayList<>();
        // Parcourir les données du formulaire
        for (Map.Entry<String, String> entry : formData.entrySet()) {
            // Vérifier si la clé correspond à prixBesoin<id>
            if (entry.getKey().startsWith("prixBesoin")) {
                // Extraire la valeur et la convertir en Double
                try {
                    Double prix = Double.parseDouble(entry.getValue());
                    prixBesoins.add(prix);
                } catch (NumberFormatException e) {
                    // Gérer les valeurs non valides si nécessaire
                }
            }
        }
        List<Integer> idBesoins = new ArrayList<>();
        // Parcourir les données du formulaire
        for (Map.Entry<String, String> entry : formData.entrySet()) {
            // Vérifier si la clé correspond à prixBesoin<id>
            if (entry.getKey().startsWith("idBesoin")) {
                // Extraire la valeur et la convertir en Double
                try {
                    int iden = Integer.parseInt(entry.getValue());
                    idBesoins.add(iden);
                } catch (NumberFormatException e) {
                    // Gérer les valeurs non valides si nécessaire
                }
            }
        }

        Date date = new Date();
        Proposition proposition=propositionService.enregistrerProposition(fournisseur,id,dureeGarantie,datelivraison,totalPrice,2);
        Long propostioni = proposition.getId();
        for (int i = 0; i < idBesoins.size(); i++) {
            Long ic= Long.valueOf(idBesoins.get(i));
            prixBesoinPropositionService.PrixBesoinPropositionSave(ic,propostioni,prixBesoins.get(i));
        }
        return "redirect:appelsoffre?success=true";
    }


    @PostMapping("/EffctuerAppelOffre")
    public String EffectuerAppelOffre(Model model, HttpServletRequest request, HttpSession session) {
        Responsable responsable = (Responsable) session.getAttribute("responsable");
        String dateDebutStr = request.getParameter("date_debut");
        String dateExpirationStr = request.getParameter("date_expiration");

        Date dateDebut = null;
        Date dateExpiration = null;

        // Vérifier si les paramètres de date ne sont pas null avant de les utiliser
        if (dateDebutStr != null && dateExpirationStr != null) {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

            try {
                dateDebut = formatter.parse(dateDebutStr);
                dateExpiration = formatter.parse(dateExpirationStr);
            } catch (ParseException e) {
                e.printStackTrace(); // ou une autre action appropriée
            }
        }

        AppelOffre appelOffre = new AppelOffre();

        appelOffre.setDateDebut(dateDebut);
        appelOffre.setDateFin(dateExpiration);
        appelOffre.setResponsable(responsable);

        appelsOffreService.insertAppelOffre(appelOffre);
        Long appelOffreInsertedId = appelsOffreService.GetAppelOffreID(appelOffre.getDateDebut() , appelOffre.getDateFin() , appelOffre.getResponsable().getId());

        //session.setAttribute("appp" , appelOffreInsertedId);
        List<Besoin> listBesoin = besoinService.getAll();
        for (Besoin besoin : listBesoin) {
            besoin.setAppelOffre(appelOffre); // Mettez la nouvelle valeur de l'id
        }
        besoinService.saveAlll(listBesoin);

        return "Responsable/home";
    }


}
