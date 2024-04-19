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
    @ManyToOne
    @JoinColumn(name = "Appel_offreID")
    private AppelOffre appelOffre;

    @OneToOne
    @JoinColumn(name = "FournisseurID")
    private Fournisseur fournisseur;

    @OneToMany(mappedBy = "proposition", cascade = CascadeType.ALL)
    private List<PrixBesoinProposition> prixDesBesoins;

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
