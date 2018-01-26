package com.ttn.model.Impdao;

import com.ttn.beans.Resources;

import com.ttn.model.dao.FetchResourcesOfPublicTopicsDao;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
@Component
public class FetchResourcesOfPublicTopicsDaoImp implements FetchResourcesOfPublicTopicsDao {
    @Autowired
    SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    protected Session getSession() {
        return sessionFactory.openSession();
    }

    public List<Resources> getResources(String topicName, String userName) {
        Session session = getSession();
        try {
            String query = "from Resources where topic.name=:tname and topic.createdBy.username=:uname";
            Query query1 = session.createQuery(query);
            query1.setParameter("tname", topicName);
            query1.setParameter("uname", userName);
            List<Resources> list = query1.list();
            return list;
        } catch (Exception e) {
            System.out.println(e);
            return null;
        } finally {
            session.close();
        }

    }
}
