package com.ttn.model.service.ServiceClass;

import com.ttn.model.dao.DeleteTopicDao;
import com.ttn.model.service.ServiceInterface.DeleteTopic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DeleteTopicServiceImp implements DeleteTopic {
    @Autowired
    DeleteTopicDao deleteTopicDao;
    public String deleteTopic(int tid) {
    return deleteTopicDao.deleteTopic(tid);
    }
    }
