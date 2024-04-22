package com.loginservice.login.models;

import jakarta.persistence.*;

@Entity
public class Ressource {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String marque;
    private String numInventaire;
    private double prix;

    private String type;

    @ManyToOne
    @JoinColumn(name = "fournisseur_id")
    private Fournisseur fournisseur;

    @OneToOne(mappedBy = "ressource", cascade = CascadeType.ALL, fetch = FetchType.LAZY, optional = true)
    private Ordinateur ordinateur;

    @OneToOne(mappedBy = "ressource", cascade = CascadeType.ALL, fetch = FetchType.LAZY, optional = true)
    private Imprimante imprimante;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Ordinateur getOrdinateur() {
        return ordinateur;
    }

    public void setOrdinateur(Ordinateur ordinateur) {
        this.ordinateur = ordinateur;
    }

    public Imprimante getImprimante() {
        return imprimante;
    }

    public void setImprimante(Imprimante imprimante) {
        this.imprimante = imprimante;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getMarque() {
        return marque;
    }

    public void setMarque(String marque) {
        this.marque = marque;
    }

    public String getNumInventaire() {
        return numInventaire;
    }

    public void setNumInventaire(String numInventaire) {
        this.numInventaire = numInventaire;
    }

    public double getPrix() {
        return prix;
    }

    public void setPrix(double prix) {
        this.prix = prix;
    }

    public Fournisseur getFournisseur() {
        return fournisseur;
    }

    public void setFournisseur(Fournisseur fournisseur) {
        this.fournisseur = fournisseur;
    }
}
