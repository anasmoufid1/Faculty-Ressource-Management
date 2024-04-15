package com.loginservice.login.services;

import com.loginservice.login.models.Fournisseur;
import com.loginservice.login.models.Responsable;
import com.loginservice.login.models.User;
import com.loginservice.login.repositories.ResponsableRepository;
import com.loginservice.login.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ResponsableService{

    @Autowired
    private ResponsableRepository ResponsableRepository;

    @Autowired
    private UserRepository userRepository;

    public Responsable getResponsableByUser(User user) {
        return ResponsableRepository.findByUser(user);
    }
}
