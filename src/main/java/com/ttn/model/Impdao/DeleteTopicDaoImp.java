package com.ttn.model.Impdao;

import com.sun.org.apache.regexp.internal.RE;
import com.ttn.beans.Resources;
import com.ttn.beans.Susbcription;
import com.ttn.beans.Topic;
import com.ttn.model.dao.DeleteTopicDao;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class DeleteTopicDaoImp implements DeleteTopicDao {
    @Autowired
    SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    protected Session getSession(){
        return sessionFactory.openSession();
    }
    public String deleteTopic(int tid) {
        Session session=getSession();
        session.beginTransaction();
        try
        {
            Topic topic=(Topic)session.get(Topic.class,tid);
            Query query=session.createQuery("delete Susbcription where topic.id=:tid");
            query.setParameter("tid",tid);
            query.executeUpdate();
            query=session.createQuery("from Resources where topic.id=:tid");
            query.setParameter("tid",tid);
            List<Resources> list=query.list();
            for(Resources resources:list)
            {
                Query query1=session.createQuery("delete ReadingItem where resources.id=:rid");
                query1.setParameter("rid",resources.getId());
                query1.executeUpdate();
            }
            query=session.createQuery("delete Resources where topic.id=:tid");
            query.setParameter("tid",tid);
            query.executeUpdate();
            session.delete(topic);
            session.getTransaction().commit();
            return "deleted successfully";

        }catch (Exception e)
        {
            System.out.println(e);
            return "error";
        }
        finally {
            session.close();
        }
    }
}
