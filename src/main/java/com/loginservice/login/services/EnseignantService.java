package com.loginservice.login.services;

import com.loginservice.login.models.Enseignant;
import com.loginservice.login.models.User;
import com.loginservice.login.repositories.EnseignantRepository;
import com.loginservice.login.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EnseignantService{

    @Autowired
    private EnseignantRepository enseignantRepository;

    @Autowired
    private UserRepository userRepository;

    public Enseignant getEnseignantByUser(User user) {
        return enseignantRepository.findByUser(user);
    }
}
