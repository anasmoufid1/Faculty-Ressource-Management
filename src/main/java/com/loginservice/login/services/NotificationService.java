package com.loginservice.login.services;

import com.loginservice.login.models.Notification;
import com.loginservice.login.repositories.NotificationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class NotificationService {
    @Autowired
    private NotificationRepository notificationRepository;
    public void updatenotifetat(Long id){
        Optional<Notification> notification = notificationRepository.findById(id);
        if (notification.isPresent()){
            notification.get().setStatus(true);
            notificationRepository.save(notification.get());
        }
    }
}
