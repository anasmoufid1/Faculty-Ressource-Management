package com.loginservice.login.controllers;

import com.loginservice.login.models.*;
import com.loginservice.login.services.*;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AuthController {

    @Autowired
    private UserService userService;
    @Autowired
    private FournisseurService fournisseurService;

    @Autowired
    private EnseignantService enseignantService;

    @Autowired
    private ResponsableService responsableService;

    @Autowired
    private CollecteBesoinService collecteBesoinService;


    @Autowired
    private TechnicienService technicienService;

    @Autowired
    private ChefDepartementService chefDepartementService;

    @GetMapping("login")
    public String loginForm(){
        return "Auth/login";
    }

    @PostMapping("login")
    public String login(@RequestParam String username,
                        @RequestParam String password,
                        @RequestParam(required = false, defaultValue = "false") boolean rememberMe,
                        HttpSession session) {
        User user = userService.getUserByUsername(username);
        session.setAttribute("user",user);
        if (user != null && user.getPassword().equals(password)) {
            session.setAttribute("role",user.getRole());

            switch (user.getRole()) {
                case "FOURNISSEUR" -> {
                    Fournisseur fournisseur = fournisseurService.getFournisseurByUser(user);
                    if (fournisseur != null) {
                        session.setAttribute("fournisseur",fournisseur);
                        return "Fournisseur/home";
                    }
                    return "redirect:/login?success=false";
                }
                case "ENSEIGNANT" -> {
                    Enseignant enseignant=enseignantService.getEnseignantByUser(user);
                    if (enseignant != null) {
                        Personne personne = enseignant.getPersonne();
                        if (personne != null) {
                            session.setAttribute("personne",personne);
                            session.setAttribute("enseignant",enseignant);
                            int cpt = collecteBesoinService.GetCountCollectBesoin(enseignant.getDep().getId());
                            session.setAttribute("compteur",cpt);
                            return "Enseignant/home";
                        }
                        return "redirect:/login?success=false";
                    }
                }
                case "TECHNICIEN" -> {
                    Technicien technicien=technicienService.getTechnicienByUser(user);
                    if (technicien != null) {
                        Personne personne = technicien.getPersonne();
                        if (personne != null) {
                            session.setAttribute("personne",personne);
                            session.setAttribute("technicien",technicien);
                            return "redirect:/Hamza";
                        }
                        return "redirect:/login?success=false";
                    }
                }
                case "RESPONSABLE"->{
                    Responsable responsable=responsableService.getResponsableByUser(user);
                    if (responsable != null) {
                        Personne personne = responsable.getPersonne();
                        if (personne != null) {
                            session.setAttribute("personne",personne);
                            session.setAttribute("responsable",responsable);
                            return "Responsable/home";
                        }
                        return "redirect:/login?success=false";
                    }
                }
                case "CHEFDEPARTEMENT"->{
                    Enseignant enseignant=enseignantService.getEnseignantByUser(user);
                    ChefDepartement chefDepartement=chefDepartementService.getchefDepartementByEnseignant(enseignant);
                    if (chefDepartement != null) {
                        Personne personne = chefDepartement.getEnseignant().getPersonne();
                        if (personne != null) {
                            session.setAttribute("personne",personne);
                            session.setAttribute("chefdepartement",chefDepartement);
                            session.setAttribute("enseignant",chefDepartement.getEnseignant());
                            return "redirect:/EnseignantPerDepartement";
                        }
                        return "redirect:/login?success=false";
                    }
                }
                default -> {
                    return "redirect:/login?success=false";
                }
            }
        }
        // Si l'authentification échoue, rediriger vers la page de connexion avec un message d'erreur
        return "redirect:/login?success=false";
    }


    @GetMapping("logout")

    public String logout(HttpServletRequest request, HttpServletResponse response){
        // Récupérer la session
        HttpSession session = request.getSession(false);
        if (session != null) {
            // Invalidons la session
            session.invalidate();
        }
        // Effacer les cookies de session
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                cookie.setMaxAge(0);
                response.addCookie(cookie);
            }
        }
        // Rediriger vers la page de connexion
        return "redirect:/login";
    }
}
