package com.ttn.model.service.ServiceInterface;

import com.ttn.beans.Resources;
import com.ttn.beans.Topic;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface FetchResourcesOfPublicTopics {
    List<Resources> getResources(String topicName);
}
