package com.loginservice.login.models;

import jakarta.persistence.*;

@Entity
public class Imprimante{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String resolution;
    private String vitesseImpression;



    @OneToOne
    @JoinColumn(name = "ressource_id")
    private Ressource ressource;


    public Imprimante(String resolution, String vitesseImpression, Ressource ressource) {
        this.resolution = resolution;
        this.vitesseImpression = vitesseImpression;
        this.ressource = ressource;
    }

    public Imprimante() {
    }

    public Ressource getRessource() {
        return ressource;
    }

    public void setRessource(Ressource ressource) {
        this.ressource = ressource;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getResolution() {
        return resolution;
    }

    public void setResolution(String resolution) {
        this.resolution = resolution;
    }

    public String getVitesseImpression() {
        return vitesseImpression;
    }

    public void setVitesseImpression(String vitesseImpression) {
        this.vitesseImpression = vitesseImpression;
    }
}
