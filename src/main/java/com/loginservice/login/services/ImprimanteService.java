package com.loginservice.login.services;

import com.loginservice.login.models.Imprimante;
import com.loginservice.login.models.Ordinateur;
import com.loginservice.login.repositories.ImprimanteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ImprimanteService {

    @Autowired
    private ImprimanteRepository imprimanteRepository;
    public Imprimante saveImprimante(Imprimante imprimante)
    {
        return  imprimanteRepository.save(imprimante);
    }

    public Imprimante findImprimanteByRessourceId(Long id)
    {
        return imprimanteRepository.findByRessourceId(id);
    }

    public void deleteImprimante(Long id){ imprimanteRepository.deleteById(id);}
}
