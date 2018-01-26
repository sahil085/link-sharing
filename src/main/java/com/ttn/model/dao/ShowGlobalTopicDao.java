package com.ttn.model.dao;

import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by user on 7/22/2017.
 */
@Component
public interface ShowGlobalTopicDao {
    List<?> getResources(String topicname);
}
