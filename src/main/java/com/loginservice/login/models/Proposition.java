package com.loginservice.login.models;

import jakarta.persistence.*;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

@Entity
public class Proposition {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private LocalDate DateLivraison;
    private int dureeGarantille;
    private double prix;
    private LocalDate faiteLe;
    private int status; //0 refusé 1 accepter 2 en cours
    @ManyToOne
    @JoinColumn(name = "Appel_offreID")
    private AppelOffre appelOffre;

    @ManyToOne
    @JoinColumn(name = "FournisseurID")
    private Fournisseur fournisseur;

    @OneToMany(mappedBy = "proposition", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private List<PrixBesoinProposition> prixDesBesoins;


    public LocalDate getFaiteLe() {
        return faiteLe;
    }

    public void setFaiteLe(LocalDate faiteLe) {
        this.faiteLe = faiteLe;
    }

    public List<PrixBesoinProposition> getPrixDesBesoins() {
        return prixDesBesoins;
    }

    public void setPrixDesBesoins(List<PrixBesoinProposition> prixDesBesoins) {
        this.prixDesBesoins = prixDesBesoins;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public LocalDate getDateLivraison() {
        return DateLivraison;
    }

    public void setDateLivraison(LocalDate dateLivraison) {
        DateLivraison = dateLivraison;
    }

    public int getDureeGarantille() {
        return dureeGarantille;
    }

    public void setDureeGarantille(int dureeGarantille) {
        this.dureeGarantille = dureeGarantille;
    }

    public double getPrix() {
        return prix;
    }

    public void setPrix(double prix) {
        this.prix = prix;
    }

    public AppelOffre getAppelOffre() {
        return appelOffre;
    }

    public void setAppelOffre(AppelOffre appelOffre) {
        this.appelOffre = appelOffre;
    }

    public Fournisseur getFournisseur() {
        return fournisseur;
    }

    public void setFournisseur(Fournisseur fournisseur) {
        this.fournisseur = fournisseur;
    }
}
