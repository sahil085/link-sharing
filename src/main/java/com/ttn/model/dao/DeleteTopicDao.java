package com.ttn.model.dao;

import org.springframework.stereotype.Component;

@Component
public interface DeleteTopicDao {
    String deleteTopic(int tid);
}
