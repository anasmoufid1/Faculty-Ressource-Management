package com.loginservice.login.repositories;
import com.loginservice.login.models.Responsable;
import com.loginservice.login.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ResponsableRepository extends JpaRepository<Responsable,Long> {
    Responsable findByUser(User user);
}

