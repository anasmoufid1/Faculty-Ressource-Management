package com.loginservice.login.controllers;

import com.loginservice.login.models.Constat;
import com.loginservice.login.models.Panne;
import com.loginservice.login.models.Technicien;
import com.loginservice.login.services.PanneService;
import com.loginservice.login.services.TechnicienService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

@Controller
public class TechnicienController {
    @Autowired
    private TechnicienService technicienService;

    @Autowired
    private PanneService panneService;

    @GetMapping("/Hamza")
    public String Hamza(Model model) {

        List<Panne> listPanne = panneService.getAll();
        model.addAttribute("listPanne", listPanne);
        return "Technicien/home";
    }

    @PostMapping("/redigerConstat")
    public String redigerConstat(HttpServletRequest request , HttpSession session) {
        String idPanne = request.getParameter("idPanne");
        String idRessource = request.getParameter("idRessource");
        String dateApart = request.getParameter("dateApart");
        String frequence = request.getParameter("frequence");
        String orderLog = request.getParameter("orderLog");
        String descPanne = request.getParameter("descPanne");
        Date dateApar = null;
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date parsedDate = dateFormat.parse(dateApart);
            dateApar = new java.sql.Date(parsedDate.getTime());
        } catch (ParseException e) {
            return "redirect:/Hamza";
        }

        Constat constat = new Constat();
        long id = Long.parseLong(idPanne);
        Panne panne = panneService.getPanneById(id);
        Technicien technicien = (Technicien) session.getAttribute("technicien");
        constat.setDescription(descPanne);
        constat.setFrequence(frequence);
        constat.setOrdre(orderLog);
        constat.setDateApparition(dateApar);
        constat.setPanne(panne);
        constat.setTechnicien(technicien);

        technicienService.enregistrerConstat(constat);
        return "redirect:/Hamza";
    }

    @PostMapping("/supprimerPanne")
    public String supprimerPanne(HttpServletRequest request , HttpSession session) {

        String idPanne = request.getParameter("idPanne");

        long id = Long.parseLong(idPanne);
        Panne panne = panneService.getPanneById(id);

        technicienService.supprimerPanne(panne);

        return "redirect:/Hamza";
    }

}