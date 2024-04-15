package com.loginservice.login.repositories;
import com.loginservice.login.models.Technicien;
import com.loginservice.login.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TechnicienRepository extends JpaRepository<Technicien,Long> {
    Technicien findByUser(User user);
}
