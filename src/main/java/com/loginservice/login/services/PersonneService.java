package com.loginservice.login.services;

import com.loginservice.login.repositories.PersonneRepository;
import com.loginservice.login.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PersonneService{

    @Autowired
    private PersonneRepository PersonneRepository;

    @Autowired
    private UserRepository userRepository;
}
