package com.loginservice.login.services;

import com.loginservice.login.models.ChefDepartement;
import com.loginservice.login.models.Enseignant;
import com.loginservice.login.repositories.ChefDepartementRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChefDepartementService {


    @Autowired
    private ChefDepartementRepository chefDepartementRepository;

    public ChefDepartement getchefDepartementByEnseignant(Enseignant enseignant) {
        return chefDepartementRepository.findByEnseignant(enseignant);
    }
}
