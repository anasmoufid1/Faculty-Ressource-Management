package com.loginservice.login.repositories;

import com.loginservice.login.models.Affectation;
import com.loginservice.login.models.Ressource;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface AffectationRepository extends JpaRepository<Affectation,Long> {

    @Query("SELECT a FROM Affectation a WHERE a.enseignant.id = :enseignantID")
    List<Affectation> findAffectationById(Long enseignantID);




}