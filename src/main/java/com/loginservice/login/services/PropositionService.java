package com.loginservice.login.services;

import com.fasterxml.jackson.databind.annotation.JsonAppend;
import com.loginservice.login.models.AppelOffre;
import com.loginservice.login.models.Fournisseur;
import com.loginservice.login.models.Proposition;
import com.loginservice.login.models.User;
import com.loginservice.login.repositories.AppelsOffreRepository;
import com.loginservice.login.repositories.FournisseurRepository;
import com.loginservice.login.repositories.PropositionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.Date;

@Service
public class PropositionService {
    @Autowired
    private PropositionRepository propositionRepository;

    @Autowired
    private FournisseurRepository fournisseurRepository;

    @Autowired
    private AppelsOffreRepository appelOffreRepository;

    public Proposition enregistrerProposition(Long fournisseurId, Long appelOffreId, Integer dureeGarantie, LocalDate dateLivraison, double prixtotale, int status) {
        // Récupérer le fournisseur et l'appel d'offre depuis la base de données
        Fournisseur fournisseur = fournisseurRepository.findById(fournisseurId)
                .orElseThrow(() -> new IllegalArgumentException("Fournisseur non trouvé"));
        AppelOffre appelOffre = appelOffreRepository.findById(appelOffreId)
                .orElseThrow(() -> new IllegalArgumentException("Appel d'offre non trouvé"));

        // Créer une nouvelle proposition
        Proposition proposition = new Proposition();
        proposition.setFournisseur(fournisseur);
        proposition.setAppelOffre(appelOffre);
        proposition.setDureeGarantille(dureeGarantie);
        proposition.setDateLivraison(dateLivraison);
        proposition.setPrix(prixtotale);
        proposition.setStatus(status);
        proposition.setFaiteLe(LocalDate.now());

        // Enregistrer la proposition dans la base de données
        propositionRepository.save(proposition);
        return proposition;
    }
}
