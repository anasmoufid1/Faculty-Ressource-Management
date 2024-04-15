package com.loginservice.login.models;

import jakarta.persistence.*;

@Entity
public class Enseignant {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String Specialte;

    @OneToOne
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne
    @JoinColumn(name = "dep_id")
    private Departement Dep;

    @OneToOne
    @JoinColumn(name = "prs_id")
    private Personne Personne;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getSpecialte() {
        return Specialte;
    }

    public void setSpecialte(String specialte) {
        Specialte = specialte;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Departement getDep() {
        return Dep;
    }

    public void setDep(Departement dep) {
        Dep = dep;
    }

    public com.loginservice.login.models.Personne getPersonne() {
        return Personne;
    }

    public void setPersonne(com.loginservice.login.models.Personne personne) {
        Personne = personne;
    }
}
