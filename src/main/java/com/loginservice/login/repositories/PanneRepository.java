package com.loginservice.login.repositories;

import com.loginservice.login.models.Panne;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface PanneRepository extends JpaRepository<Panne , Long> {
    Panne findById(long id);
}
