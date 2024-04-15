package com.loginservice.login.models;

import jakarta.persistence.*;

@Entity
public class Ordinateur {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String Cpu;
    private String DisqueDure;
    private String Ecran;
    private String ram;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCpu() {
        return Cpu;
    }

    public void setCpu(String cpu) {
        Cpu = cpu;
    }

    public String getDisqueDure() {
        return DisqueDure;
    }

    public void setDisqueDure(String disqueDure) {
        DisqueDure = disqueDure;
    }

    public String getEcran() {
        return Ecran;
    }

    public void setEcran(String ecran) {
        Ecran = ecran;
    }

    public String getRam() {
        return ram;
    }

    public void setRam(String ram) {
        this.ram = ram;
    }
}
