package com.loginservice.login.repositories;

import com.loginservice.login.models.PrixBesoinProposition;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PrixBesoinPropositionRepository extends JpaRepository<PrixBesoinProposition,Long> {
}
