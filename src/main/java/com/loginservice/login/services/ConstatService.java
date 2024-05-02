package com.loginservice.login.services;

import com.loginservice.login.models.Constat;
import com.loginservice.login.models.Panne;
import com.loginservice.login.repositories.ConstatRepository;
import com.loginservice.login.repositories.OrdinateurRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ConstatService {

    @Autowired
    private ConstatRepository constatRepository;


    public List<Constat> getAll(){
        return constatRepository.findAll();
    }

    public Constat getConstatById(long id) {
        return constatRepository.findById(id);
    }

    public void supprimerConstat(Constat constat) {
        constatRepository.delete(constat);
    }
}
