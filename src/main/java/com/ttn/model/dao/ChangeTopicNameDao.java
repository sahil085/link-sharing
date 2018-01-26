package com.ttn.model.dao;

import org.springframework.stereotype.Component;

@Component
public interface ChangeTopicNameDao  {
    String changetopicName(int tid,String newTopicName);
}
