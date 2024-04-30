package com.loginservice.login.services;

import com.loginservice.login.models.Besoin;
import com.loginservice.login.repositories.BesoinRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BesoinService {

    @Autowired
    private BesoinRepository besoinRepository;
    public List<com.loginservice.login.models.Besoin> getAllBesoin(long id)
    {
        return besoinRepository.findBesoinByChefDepId(id);
    }

    public List<Besoin> getAll()
    {
        return besoinRepository.findAll();
    }

    public void saveAlll(List<Besoin> listBesoin) {
        besoinRepository.saveAll(listBesoin);
    }

    public void deleteBesoin(Besoin bes){
        besoinRepository.deleteById(bes.getId());
    }


}
