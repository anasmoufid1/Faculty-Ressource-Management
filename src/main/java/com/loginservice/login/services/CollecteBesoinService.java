package com.loginservice.login.services;

import com.loginservice.login.models.CollecteBesoin;
import com.loginservice.login.repositories.BesoinRepository;
import com.loginservice.login.repositories.CollecteBesoinRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CollecteBesoinService {
    @Autowired
    private CollecteBesoinRepository collecteBesoinRepository;


    public CollecteBesoin insertDemandeBesoin( CollecteBesoin c)
    {
        return collecteBesoinRepository.save(c);
    }

    public CollecteBesoin getBesoinById(Long Id){ return collecteBesoinRepository.findBesoinById(Id);}


    public int GetCountCollectBesoin(Long id){ return  collecteBesoinRepository.getcountCollect(id);}


}
