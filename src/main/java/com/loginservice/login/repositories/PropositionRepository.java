package com.loginservice.login.repositories;

import com.loginservice.login.models.Proposition;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PropositionRepository extends JpaRepository<Proposition,Long> {
}
