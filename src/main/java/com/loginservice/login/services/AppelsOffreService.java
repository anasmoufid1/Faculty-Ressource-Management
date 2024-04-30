package com.loginservice.login.services;

import com.loginservice.login.models.AppelOffre;
import com.loginservice.login.repositories.AppelsOffreRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class AppelsOffreService {
    @Autowired
    private AppelsOffreRepository appelOffreRepository;

    public Optional<AppelOffre> getAppelOffreById(long id){
        return appelOffreRepository.findById(id);
    }
    public List<AppelOffre> getAllAppelsOffre() {
        return appelOffreRepository.findAll();
    }

    public AppelOffre insertAppelOffre(AppelOffre appelOffre)
    {
        return appelOffreRepository.save(appelOffre);
    }
    public Long GetAppelOffreID(Date Debut , Date fin , Long respoId)
    {
        return appelOffreRepository.getIdByInformations(Debut , fin , respoId);
    }
    public void deleteAppelOffre(AppelOffre appelOffre){
        appelOffreRepository.deleteById(appelOffre.getId());
    }
}
