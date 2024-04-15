package com.loginservice.login.services;

import com.loginservice.login.models.Technicien;
import com.loginservice.login.models.User;
import com.loginservice.login.repositories.TechnicienRepository;
import com.loginservice.login.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TechnicienService{

    @Autowired
    private TechnicienRepository technicienRepository;

    @Autowired
    private UserRepository userRepository;

    public Technicien getTechnicienByUser(User user) {
        return technicienRepository.findByUser(user);
    }
}
