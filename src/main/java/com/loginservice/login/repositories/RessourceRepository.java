package com.loginservice.login.repositories;

import com.loginservice.login.models.Ressource;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface RessourceRepository extends JpaRepository<Ressource,Long> {

    @Query("SELECT r FROM Ressource r where r.id NOT IN (SELECT b.ressource.id FROM Besoin b )")
    List<Ressource> getRessourcDisponible();

    @Query(value = "SELECT r from Ressource r where r.id = :id")
    Ressource getRessourceById(Long id);
}
