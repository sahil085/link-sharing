package com.ttn.model.service.ServiceInterface;

import org.springframework.stereotype.Service;

@Service
public interface ChangeTopicNameService {

    String changeTopicName(int tid,String newTopicName);

}
