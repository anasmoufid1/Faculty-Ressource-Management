package com.loginservice.login.repositories;

import com.loginservice.login.models.Besoin;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BesoinRepository extends JpaRepository<Besoin,Long> {
    @Query("SELECT b FROM Besoin b WHERE b.collecteBesoin.id IN (SELECT cb.id FROM CollecteBesoin cb WHERE cb.chefDep.id = :chefDepId)")
    List<Besoin> findBesoinByChefDepId(Long chefDepId);


}
