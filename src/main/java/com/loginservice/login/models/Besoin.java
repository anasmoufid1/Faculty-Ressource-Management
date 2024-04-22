package com.loginservice.login.models;

import jakarta.persistence.*;

import java.util.List;

@Entity
public class Besoin {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "enseignant_id")
    private Enseignant enseignant;
    @OneToOne
    @JoinColumn(name = "ressource_id")
    private Ressource ressource;

    @ManyToOne
    @JoinColumn(name = "appeloffre_id")
    private AppelOffre appelOffre;

    @OneToMany(mappedBy = "besoin", cascade = CascadeType.ALL)
    private List<PrixBesoinProposition> propositionsAvecPrix;


    @ManyToOne
    @JoinColumn(name = "Collect_id")
    private CollecteBesoin collecteBesoin;

    public CollecteBesoin getCollecteBesoin() {
        return collecteBesoin;
    }

    public void setCollecteBesoin(CollecteBesoin collecteBesoin) {
        this.collecteBesoin = collecteBesoin;
    }

    public List<PrixBesoinProposition> getPropositionsAvecPrix() {
        return propositionsAvecPrix;
    }

    public void setPropositionsAvecPrix(List<PrixBesoinProposition> propositionsAvecPrix) {
        this.propositionsAvecPrix = propositionsAvecPrix;
    }

    public AppelOffre getAppelOffre() {
        return appelOffre;
    }

    public void setAppelOffre(AppelOffre appelOffre) {
        this.appelOffre = appelOffre;
    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Enseignant getEnseignant() {
        return enseignant;
    }

    public void setEnseignant(Enseignant enseignant) {
        this.enseignant = enseignant;
    }

    public Ressource getRessource() {
        return ressource;
    }

    public void setRessource(Ressource ressource) {
        this.ressource = ressource;
    }
}
