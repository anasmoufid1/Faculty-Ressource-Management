package com.loginservice.login.repositories;

import com.loginservice.login.models.CollecteBesoin;
import com.loginservice.login.models.Enseignant;
import com.loginservice.login.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EnseignantRepository extends JpaRepository<Enseignant,Long> {
    Enseignant findByUser(User user);
    @Query("SELECT E FROM Enseignant E WHERE E.Dep.id = :departementId")
    List<Enseignant> getEnseignantByDepartementId(@Param("departementId") Long departementId);

    @Query("SELECT c FROM CollecteBesoin c WHERE c.chefDep.id IN (SELECT cd.id FROM ChefDepartement cd WHERE cd.enseignant.id IN (SELECT e.id FROM Enseignant e WHERE e.Dep.id = :depId))ORDER BY c.dateDemande DESC ")
    List<CollecteBesoin> getCollectBesoinByDepartementId(Long depId);




}
