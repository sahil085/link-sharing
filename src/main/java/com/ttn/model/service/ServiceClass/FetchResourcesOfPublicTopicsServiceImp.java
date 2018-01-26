package com.ttn.model.service.ServiceClass;

import com.ttn.beans.Resources;
import com.ttn.beans.Topic;
import com.ttn.model.dao.FetchResourcesOfPublicTopicsDao;
import com.ttn.model.service.ServiceInterface.FetchResourcesOfPublicTopics;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FetchResourcesOfPublicTopicsServiceImp  implements FetchResourcesOfPublicTopics {
    @Autowired
    FetchResourcesOfPublicTopicsDao fetchResourcesOfPublicTopicsDao;
    public List<Resources> getResources(String topicname) {

        String topicName= topicname.substring(13, topicname.indexOf(","));
        String creatorOfTopic= topicname.substring(topicname.indexOf(",")+15);
        return fetchResourcesOfPublicTopicsDao.getResources(topicName,creatorOfTopic);
    }
}
