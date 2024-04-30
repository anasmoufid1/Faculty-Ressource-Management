package com.loginservice.login.services;

import com.loginservice.login.models.Ressource;
import com.loginservice.login.repositories.RessourceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class RessourceService {

    @Autowired
    private RessourceRepository ressourceRepository;

    public List<Ressource> getRessourceDisponibleSErvice(){ return ressourceRepository.getRessourcDisponible();}

    public Ressource getRessource(Long id)
    {
        return  ressourceRepository.getRessourceById(id);
    }

    public Void DeleteResource(Long id){  ressourceRepository.deleteById(id);
        return null;
    }
    public void save(Ressource ressource){
        ressourceRepository.save(ressource);
    }
}
