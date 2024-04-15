package com.loginservice.login.repositories;

import com.loginservice.login.models.ChefDepartement;
import com.loginservice.login.models.Enseignant;
import com.loginservice.login.models.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ChefDepartementRepository extends JpaRepository<ChefDepartement,Long> {
    ChefDepartement findByEnseignant(Enseignant enseignant);

}
