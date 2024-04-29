package com.loginservice.login.services;

import com.loginservice.login.models.AppelOffre;
import com.loginservice.login.models.Fournisseur;
import com.loginservice.login.models.Notification;
import com.loginservice.login.models.Proposition;
import com.loginservice.login.repositories.AppelsOffreRepository;
import com.loginservice.login.repositories.FournisseurRepository;
import com.loginservice.login.repositories.NotificationRepository;
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

    @Autowired
    private NotificationRepository notificationRepository;

    @Autowired
    private NotificationService notificationService;

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
    public void refuserproposition(int id,String motif){
        Proposition proposition=propositionRepository.findById((long) id).get();
        proposition.setStatus(0);
        Fournisseur fournisseur=proposition.getFournisseur();
        fournisseur.setEstListeNoire(true);
        fournisseurRepository.save(fournisseur);
        propositionRepository.save(proposition);
        Notification notification=new Notification();
        notification.setStatus(false);
        notification.setFournisseur(fournisseur);
        notification.setDate(new Date());
        notification.setMessage(motif);
        notificationRepository.save(notification);
    }
    public void accepterproposition(int id){
        Proposition proposition=propositionRepository.findById((long)id).get();
        AppelOffre appelOffre= proposition.getAppelOffre();
        for(Proposition prop:appelOffre.getPropositionList() ){
            if(prop!=proposition){
                prop.setStatus(0);
                propositionRepository.save(prop);
                Notification notification=new Notification();
                notification.setStatus(false);
                notification.setFournisseur(prop.getFournisseur());
                notification.setDate(new Date());
                notification.setMessage("votre proposition a l'appel d'offre a ete refusé");
                notificationRepository.save(notification);
            }
        }
        proposition.setStatus(1);
        Notification notification=new Notification();
        notification.setStatus(false);
        notification.setFournisseur(proposition.getFournisseur());
        notification.setDate(new Date());
        notification.setMessage("votre proposition a l'appel d'offre a ete accepetée");
        notificationRepository.save(notification);
    }
}
