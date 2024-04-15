package com.loginservice.login.repositories;

import com.loginservice.login.models.Departement;
import com.loginservice.login.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DepartementRepository extends JpaRepository<Departement,Long> {
}
