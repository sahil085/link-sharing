package com.ttn.model.service.ServiceClass;

import com.ttn.model.dao.ChangeTopicNameDao;
import com.ttn.model.service.ServiceInterface.ChangeTopicNameService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChangeTopicNameServiceImp implements ChangeTopicNameService {
    @Autowired
    ChangeTopicNameDao changeTopicNameDao;
    public String changeTopicName(int tid,String newTopicName) {
        return changeTopicNameDao.changetopicName(tid,newTopicName);
    }
}
