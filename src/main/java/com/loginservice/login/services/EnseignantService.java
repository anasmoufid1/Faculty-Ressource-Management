package com.loginservice.login.services;

import com.loginservice.login.models.*;
import com.loginservice.login.repositories.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EnseignantService{

    @Autowired
    private RessourceRepository ressourceRepository;

    @Autowired
    private OrdinateurRepository ordinateurRepository;

    @Autowired
    private ImprimanteRepository imprimanteRepository;
    @Autowired
    private BesoinRepository besoinRepository;

    @Autowired
    private EnseignantRepository enseignantRepository;

    public Enseignant getEnseignantByUser(User user) {
        return enseignantRepository.findByUser(user);
    }


    public List<Enseignant> getEnseignantByDepartementIdS(Long departementId)
    {
        return enseignantRepository.getEnseignantByDepartementId(departementId);
    }
    public List<CollecteBesoin> getCollectBesoinByDepartementId(Long depID)
    {
        return enseignantRepository.getCollectBesoinByDepartementId(depID);
    }

    public void EffectuerDemandeOrd(Ressource ressource , Ordinateur ordinateur, Besoin b)
    {
        ressourceRepository.save(ressource);
        ordinateurRepository.save(ordinateur);
        besoinRepository.save(b);

    }
    public void EffectuerDemandeImp(Ressource ressource , Imprimante imprimante, Besoin b)
    {
        ressourceRepository.save(ressource);
        imprimanteRepository.save(imprimante);
        besoinRepository.save(b);
    }

}
