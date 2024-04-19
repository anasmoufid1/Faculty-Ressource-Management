package com.loginservice.login.models;
import jakarta.persistence.*;

import java.util.Date;

@Entity
public class CollecteBesoin {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "date_Demande")
    private Date dateDemande;


    @Column(name = "date_Expiration")
    private Date dateExpiration;

    @ManyToOne
    @JoinColumn(name = "chef_dep_id")
    private ChefDepartement chefDep;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getDateDemande() {
        return dateDemande;
    }

    public void setDateDemande(Date dateDemande) {
        this.dateDemande = dateDemande;
    }

    public Date getDateExpiration() {
        return dateExpiration;
    }

    public void setDateExpiration(Date dateExpiration) {
        this.dateExpiration = dateExpiration;
    }

    public ChefDepartement getChefDep() {
        return chefDep;
    }

    public void setChefDep(ChefDepartement chefDep) {
        this.chefDep = chefDep;
    }



}