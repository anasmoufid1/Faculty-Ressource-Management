package com.loginservice.login.services;

import com.loginservice.login.models.Fournisseur;
import com.loginservice.login.models.User;
import com.loginservice.login.repositories.FournisseurRepository;
import com.loginservice.login.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FournisseurService{

    @Autowired
    private FournisseurRepository fournisseurRepository;

    @Autowired
    private UserRepository userRepository;

    public Fournisseur saveFournisseur(Fournisseur fournisseur, String username, String password) {
        // Création d'un nouvel utilisateur avec le rôle "FOURNISSEUR"
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setRole("FOURNISSEUR");
        userRepository.save(user);

        // Attribution de l'utilisateur au fournisseur
        fournisseur.setUser(user);

        // Enregistrement du fournisseur
        return fournisseurRepository.save(fournisseur);
    }
    public Fournisseur getFournisseurByUser(User user) {
        return fournisseurRepository.findByUser(user);
    }

    public void update(Fournisseur fournisseur){
        fournisseurRepository.save(fournisseur);
    }
}
