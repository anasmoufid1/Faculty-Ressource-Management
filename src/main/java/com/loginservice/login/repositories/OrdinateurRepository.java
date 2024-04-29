package com.loginservice.login.repositories;

import com.loginservice.login.models.Ordinateur;
import com.loginservice.login.models.Ressource;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface OrdinateurRepository extends JpaRepository<Ordinateur,Long> {
    Ordinateur findByRessource(Ressource ressource);

    @Query("select o from Ordinateur o where o.ressource.id = :id")
    Ordinateur findByRessourceId(Long id);
}
