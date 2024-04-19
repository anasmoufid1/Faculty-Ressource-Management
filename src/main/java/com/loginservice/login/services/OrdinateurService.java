package com.loginservice.login.services;

import com.loginservice.login.models.ChefDepartement;
import com.loginservice.login.models.Enseignant;
import com.loginservice.login.models.Ordinateur;
import com.loginservice.login.models.Ressource;
import com.loginservice.login.repositories.OrdinateurRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrdinateurService {
    @Autowired
    private OrdinateurRepository ordinateurRepository;
    public OrdinateurService(OrdinateurRepository ordinateurRepository){
        this.ordinateurRepository=ordinateurRepository;
    }
    public Ordinateur getOrdinateurByRessource(Ressource ressource) {
        return ordinateurRepository.findByRessource(ressource);
    }
}
