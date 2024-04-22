package com.loginservice.login.repositories;

import com.loginservice.login.models.CollecteBesoin;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface CollecteBesoinRepository extends JpaRepository<CollecteBesoin , Integer> {
    @Query(" SELECT COUNT(c) FROM CollecteBesoin c WHERE c.dateExpiration>CURRENT_TIMESTAMP AND c.chefDep.id IN (SELECT cd.id FROM ChefDepartement cd WHERE cd.enseignant.id IN (SELECT e.id FROM Enseignant e WHERE e.Dep.id =:id))")
    int getcountCollect(Long id);

    CollecteBesoin findBesoinById(Long id);

}
