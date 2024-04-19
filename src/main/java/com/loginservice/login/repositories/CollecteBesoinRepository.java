package com.loginservice.login.repositories;

import com.loginservice.login.models.CollecteBesoin;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CollecteBesoinRepository extends JpaRepository<CollecteBesoin , Integer> {
}
