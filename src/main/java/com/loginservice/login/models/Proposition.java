package com.loginservice.login.models;

import jakarta.persistence.*;

import java.util.Date;

@Entity
public class Proposition {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Date DateLivraison;
    private int dureeGarantille;
    private String Marque;
    private double prix;
    @ManyToOne
    @JoinColumn(name = "Appel_offreID")
    private AppelOffre appelOffre;

    @ManyToOne
    @JoinColumn(name = "FournisseurID")
    private Fournisseur fournisseur;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getDateLivraison() {
        return DateLivraison;
    }

    public void setDateLivraison(Date dateLivraison) {
        DateLivraison = dateLivraison;
    }

    public int getDureeGarantille() {
        return dureeGarantille;
    }

    public void setDureeGarantille(int dureeGarantille) {
        this.dureeGarantille = dureeGarantille;
    }

    public String getMarque() {
        return Marque;
    }

    public void setMarque(String marque) {
        Marque = marque;
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
