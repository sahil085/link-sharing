package com.ttn.model.dao;

import com.ttn.beans.Resources;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface FetchResourcesOfPublicTopicsDao {
    List<Resources> getResources(String topicName,String userName);
}
