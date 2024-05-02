package com.loginservice.login.services;

import com.loginservice.login.models.Affectation;
import com.loginservice.login.models.Ressource;
import com.loginservice.login.repositories.AffectationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class AffectationService {

    @Autowired
    private AffectationRepository affectationRepository;
    public void saveAffectation(Affectation affectation)
    {
        affectationRepository.save(affectation);
    }

    public List<Affectation> getAffectationById(Long enseignantID)
    {

        return affectationRepository.findAffectationById(enseignantID);
    }

    public List<Affectation> getAll(){
        return affectationRepository.findAll();
    }



}