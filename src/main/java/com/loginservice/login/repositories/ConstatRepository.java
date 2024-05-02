package com.loginservice.login.repositories;

import com.loginservice.login.models.Besoin;
import com.loginservice.login.models.Constat;
import com.loginservice.login.models.Panne;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ConstatRepository extends JpaRepository<Constat, Long> {
    Constat findById(long id);
}
