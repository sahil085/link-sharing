package com.ttn.model.Impdao;

import com.ttn.beans.Constants.Visibility;
import com.ttn.model.dao.ShowGlobalTopicDao;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by user on 7/22/2017.
 */
@Component
public class ShowGlobalTopicDaoImp implements ShowGlobalTopicDao {


    @Autowired
    SessionFactory sessionFactory;
    /*  @Autowired
       User user;*/
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    protected Session getSession(){
        return sessionFactory.openSession();
    }

    public List<?> getResources(String topicname)
    {
        Session session=getSession();
        try
        {
            Query query=session.createQuery("from Resources  where topic.visibililty=:vis and topic.name=:tname");
            query.setString("tname",topicname);
            query.setParameter("vis", Visibility.Public);
            if(query.list().isEmpty())
            {
                Query query1=session.createQuery("from Topic where visibililty=:vis and name=:tname");
                query1.setParameter("vis",Visibility.Public);
                query1.setString("tname",topicname);
                if(query1.list().isEmpty())
                {
                    return null;
                }
                else
                {
                    return query1.list();
                }

            }
            return query.list();
        }
        catch (Exception e)
        {
            return null;
        }
        finally {
            session.close();
        }
    }
}
