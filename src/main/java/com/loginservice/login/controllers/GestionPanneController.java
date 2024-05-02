package com.loginservice.login.controllers;

import com.loginservice.login.models.Constat;
import com.loginservice.login.models.Panne;
import com.loginservice.login.models.Technicien;
import com.loginservice.login.services.ConstatService;
import com.loginservice.login.services.PanneService;
import com.loginservice.login.services.TechnicienService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;
@Controller
public class GestionPanneController {

    @Autowired
    private ConstatService constatService;

    @Autowired
    private PanneService panneService;

    @Autowired
    private TechnicienService technicienService;

    @GetMapping("/listeConstats")
    public String listeConstats(Model model) {

        List<Constat> listeConstats = constatService.getAll();
        model.addAttribute("listeConstats", listeConstats);
        return "Responsable/ListeConstat/home";
    }

    @GetMapping("/listePanne")
    public String listePanne(Model model) {
        List<Panne> listePannes = panneService.getPanneByTechnicienNonAffecte();
        model.addAttribute("listePannes", listePannes);

        List<Technicien> listeTechniciens = technicienService.getAll();
        model.addAttribute("listeTechniciens", listeTechniciens);
        return "Responsable/ListePanne/home";
    }

    @PostMapping("/affecterTechnicien")
    public String affecterTechnicien(HttpServletRequest request , HttpSession session){
        String technicienId = request.getParameter("technicienId");
        String panneId = request.getParameter("idPanne");

        long id = Long.parseLong(panneId);
        long techId = Long.parseLong(technicienId);

        panneService.affecterTechnicienById(id, techId);

        return "redirect:/listeConstats";
    }

    @PostMapping("/supprimerconstat")
    public String supprimerConstat(HttpServletRequest request , HttpSession session) {

        String idconstat = request.getParameter("idconstat");

        long id = Long.parseLong(idconstat);
        Constat constat = constatService.getConstatById(id);

        constatService.supprimerConstat(constat);

        return "redirect:/listeConstats";
    }
}
