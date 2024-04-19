package com.loginservice.login.models;

import jakarta.persistence.*;

import java.util.Date;
import java.util.List;

@Entity
public class AppelOffre {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Date dateDebut;
    private Date dateFin;

    @OneToOne
    @JoinColumn(name = "responsable_id")
    private Responsable responsable;


    @OneToMany(mappedBy = "appelOffre", cascade = CascadeType.ALL)
    private List<Besoin> besoins;



    public List<Besoin> getBesoins() {
        return besoins;
    }

    public void setBesoins(List<Besoin> besoins) {
        this.besoins = besoins;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getDateDebut() {
        return dateDebut;
    }

    public void setDateDebut(Date dateDebut) {
        this.dateDebut = dateDebut;
    }

    public Date getDateFin() {
        return dateFin;
    }

    public void setDateFin(Date dateFin) {
        this.dateFin = dateFin;
    }

    public Responsable getResponsable() {
        return responsable;
    }

    public void setResponsable(Responsable responsable) {
        this.responsable = responsable;
    }


}
