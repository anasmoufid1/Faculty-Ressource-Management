package com.loginservice.login.controllers;

import com.loginservice.login.models.Fournisseur;
import com.loginservice.login.models.User;
import com.loginservice.login.repositories.UserRepository;
import com.loginservice.login.services.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class ProfileController {
    @Autowired
    private UserRepository userRepository;
@GetMapping("/profile")
    public String profile(HttpServletRequest request, Model model){
    HttpSession session=request.getSession();
    String role=(String) session.getAttribute("role");
    switch (role) {
        case "FOURNISSEUR" -> {
            return "redirect:fournisseur";
        }
        case "ENSEIGNANT" -> {
            return "redirect:enseignant";
        }
        case "TECHNICIEN" -> {
            return "redirect:technicien";
        }
        case "RESPONSABLE" -> {
            return "redirect:responsable";
        }
        case "CHEFDEPARTEMENT" -> {
            return "ChefDep/Profile/home";
        }
        default -> {
            return "redirect:logout";
        }
    }

}

    @GetMapping("fournisseur")
        public String fournisseur(){
        return "Fournisseur/Profile/home";
    }
    @GetMapping("responsable")
    public String responsable(){
        return "Responsable/Profile/home";
    }
    @GetMapping("enseignant")
    public String enseignant(){
        return "Enseignant/Profile/home";
    }

    @GetMapping("technicien")
    public String technicien(){
        return "Technicien/Profile/home";
    }

    @PostMapping("changepass")
    public String changepass(@RequestParam("confirmPassword") String confirmPassword,
                             @RequestParam("newPassword") String newPassword,
                             @RequestParam("currentPassword") String currentPassword,
                             HttpSession session, RedirectAttributes redirectAttributes) {
        User user = (User) session.getAttribute("user");
        String role=user.getRole();
        role=role.toLowerCase();
        if (user.getPassword().equals(currentPassword)) {
            if (newPassword.equals(confirmPassword)) {
                user.setPassword(newPassword);
                userRepository.save(user);
                return "redirect:"+role+"?success=true";
            } else {
                redirectAttributes.addFlashAttribute("erreur", "newpass");
                return "redirect:"+role+"?success=false";
            }
        } else {
            redirectAttributes.addFlashAttribute("erreur", "currentpass");
            return "redirect:"+role+"?success=false";
        }

    }

}
