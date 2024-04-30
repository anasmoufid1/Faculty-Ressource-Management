package com.loginservice.login.services;

import com.loginservice.login.models.Constat;
import com.loginservice.login.models.Panne;
import com.loginservice.login.models.Technicien;
import com.loginservice.login.models.User;
import com.loginservice.login.repositories.ConstatRepository;
import com.loginservice.login.repositories.PanneRepository;
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

    @Autowired
    private PanneRepository panneRepository;

    @Autowired
    private ConstatRepository constatRepository;

    public Technicien getTechnicienByUser(User user) {
        return technicienRepository.findByUser(user);
    }

    public void enregistrerConstat(Constat constat) {
        constatRepository.save(constat);
    }

    public void supprimerPanne(Panne panne) {
        panneRepository.delete(panne);
    }
}
