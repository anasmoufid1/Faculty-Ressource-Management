package com.loginservice.login.services;

import com.loginservice.login.repositories.BesoinRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BesoinService {

    @Autowired
    private BesoinRepository besoin;

    public List<com.loginservice.login.models.Besoin> getAllBesoin(long id)
    {
        return besoin.findBesoinByChefDepId(id);
    }


}
