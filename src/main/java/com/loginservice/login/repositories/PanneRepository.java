package com.loginservice.login.repositories;

import com.loginservice.login.models.Panne;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.data.jpa.repository.Modifying;

@Repository
public interface PanneRepository extends JpaRepository<Panne, Long> {
    Panne findById(long id);

    @Query("SELECT p FROM Panne p WHERE p.technicien IS NULL")
    List<Panne> findPanneByTechnicienNonAffecte();

    @Query("SELECT p FROM Panne p WHERE p.technicien.id = :technicienId")
    List<Panne> findPanneByTechnicienId(@Param("technicienId") long technicienId);

    @Transactional
    @Modifying
    @Query("UPDATE Panne p SET p.technicien.id = :techId WHERE p.id = :id")
    void affecterTechnicienById(@Param("id") long id, @Param("techId") long technId);
}

