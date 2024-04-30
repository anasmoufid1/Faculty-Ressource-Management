package com.loginservice.login.services;

import com.loginservice.login.models.*;
import com.loginservice.login.repositories.BesoinRepository;
import com.loginservice.login.repositories.FournisseurRepository;
import com.loginservice.login.repositories.PrixBesoinPropositionRepository;
import com.loginservice.login.repositories.PropositionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;

@Service
public class PrixBesoinPropositionService {
    @Autowired
    private PrixBesoinPropositionRepository prixBesoinPropositionpropositionRepository;

    @Autowired
    private PropositionRepository propositionRepository;
    @Autowired
    private BesoinRepository besoinRepository;
    public PrixBesoinProposition PrixBesoinPropositionSave(Long besoinId, Long propositionId, double prix) {
        // Récupérer le fournisseur et l'appel d'offre depuis la base de données
        Besoin besoin = besoinRepository.findById(besoinId)
                .orElseThrow(() -> new IllegalArgumentException("besoin non trouvé"));
        Proposition proposition = propositionRepository.findById(propositionId)
                .orElseThrow(() -> new IllegalArgumentException("proposition non trouvé"));

        // Créer une nouvelle proposition
        PrixBesoinProposition prixBesoinProposition = new PrixBesoinProposition();
        prixBesoinProposition.setProposition(proposition);
        prixBesoinProposition.setBesoin(besoin);
        prixBesoinProposition.setPrix(prix);

        // Enregistrer la proposition dans la base de données
        prixBesoinPropositionpropositionRepository.save(prixBesoinProposition);
        return prixBesoinProposition;
    }

    public void deletePrixProposition(PrixBesoinProposition prixBesoinProposition){
        prixBesoinPropositionpropositionRepository.deleteById(prixBesoinProposition.getId());
    }
}
