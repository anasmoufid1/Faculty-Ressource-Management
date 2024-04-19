package com.loginservice.login.repositories;

import com.loginservice.login.models.AppelOffre;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AppelsOffreRepository extends JpaRepository<AppelOffre,Long> {
}
