package com.loginservice.login.repositories;

import com.loginservice.login.models.Enseignant;
import com.loginservice.login.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EnseignantRepository extends JpaRepository<Enseignant,Long> {
    Enseignant findByUser(User user);
}
