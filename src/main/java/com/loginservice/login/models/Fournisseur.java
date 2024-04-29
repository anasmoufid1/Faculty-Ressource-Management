package com.loginservice.login.models;

import jakarta.persistence.*;

import java.util.List;

@Entity
public class Fournisseur {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String companyName;
    private boolean estListeNoire;
    private String adresse;
    private String gerantName;
    private String siteInternet;
    @OneToOne
    @JoinColumn(name = "user_id")
    private User user;
    @OneToMany(mappedBy = "fournisseur", cascade = CascadeType.ALL ,fetch = FetchType.EAGER)
    private List<Proposition> propositionList;

    @OneToMany(mappedBy = "fournisseur", cascade = CascadeType.ALL ,fetch = FetchType.EAGER)
    private List<Notification> notificationList;

    public List<Proposition> getPropositionList() {
        return propositionList;
    }

    public void setPropositionList(List<Proposition> propositionList) {
        this.propositionList = propositionList;
    }
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public boolean isEstListeNoire() {
        return estListeNoire;
    }

    public void setEstListeNoire(boolean estListeNoire) {
        this.estListeNoire = estListeNoire;
    }

    public String getAdresse() {
        return adresse;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    public String getGerantName() {
        return gerantName;
    }

    public void setGerantName(String gerantName) {
        this.gerantName = gerantName;
    }

    public String getSiteInternet() {
        return siteInternet;
    }

    public List<Notification> getNotificationList() {
        return notificationList;
    }

    public void setNotificationList(List<Notification> notificationList) {
        this.notificationList = notificationList;
    }

    public void setSiteInternet(String siteInternet) {
        this.siteInternet = siteInternet;
    }
}
