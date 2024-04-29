package com.loginservice.login.repositories;

import com.loginservice.login.models.Imprimante;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface ImprimanteRepository extends JpaRepository<Imprimante,Long> {

    @Query("select i from Imprimante i where i.ressource.id = :id")
    Imprimante findByRessourceId(Long id);
}
