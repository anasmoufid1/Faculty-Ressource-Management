package com.loginservice.login.repositories;

import com.loginservice.login.models.Ressource;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RessourceRepository extends JpaRepository<Ressource,Long> {
}
