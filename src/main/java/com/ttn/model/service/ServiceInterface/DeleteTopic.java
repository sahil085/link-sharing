package com.ttn.model.service.ServiceInterface;

import org.springframework.stereotype.Service;

@Service
public interface DeleteTopic {
    String deleteTopic(int tid);
}
