package com.ttn.model.Impdao;

import com.ttn.model.dao.ChangeTopicNameDao;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ChnageTopicNameDaoImp implements ChangeTopicNameDao {
    @Autowired
    SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    protected Session getSession(){
        return sessionFactory.openSession();
    }

    public String changetopicName(int tid,String newTopicname) {
        Session session=getSession();
        try
        {
            Query query=session.createQuery("update Topic set name = :newTopicName where id= :oldTopicId");
            query.setParameter("newTopicName",newTopicname);
            query.setParameter("oldTopicId",tid);
            if(query.executeUpdate()>0)
            {
                return "Topic Name Changed Successfully";
            }
            else
            {
                return "Try Again";
            }

        }catch (Exception e)
        {
            System.out.println(e);
            return "error";
        }finally {
            session.close();
        }
    }
}
