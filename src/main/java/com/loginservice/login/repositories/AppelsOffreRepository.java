package com.loginservice.login.repositories;

import com.loginservice.login.models.AppelOffre;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;

@Repository
public interface AppelsOffreRepository extends JpaRepository<AppelOffre,Long> {

    @Query("SELECT DISTINCT (a.id) from AppelOffre a where a.dateDebut=:debut And a.dateFin =:fin and a.responsable.id =:respoId")
    Long getIdByInformations(@Param("debut") Date debut, @Param("fin")Date fin, @Param("respoId")Long respoId);

}
