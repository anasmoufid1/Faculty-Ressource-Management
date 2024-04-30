package com.loginservice.login.services;

import com.loginservice.login.models.Panne;
import com.loginservice.login.repositories.PanneRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PanneService {

    @Autowired
    private PanneRepository panneRepository;

    public List<Panne> getAll() {

        return panneRepository.findAll();

    }

    public Panne getPanneById(long id) {
        return panneRepository.findById(id);
    }
}
