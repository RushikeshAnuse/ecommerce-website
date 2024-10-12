
package com.ecommerce.dao;

import com.ecommerce.entities.User;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class UserDao {
    
    private SessionFactory factory;

    public UserDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    
    public User getUserEmailandPassword(String email, String password){
        
        User user = null;
        
        try {
            
            String query = "from User where userEmail =: e and userPassword =: p";
            Session session = this.factory.openSession();
            

            Query q = session.createQuery(query);
            q.setParameter("e",email);
            q.setParameter("p",password);

            user = (User)q.getSingleResult();
            System.out.println(user);
            session.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        return user;
    }
    
     public long getUserCount() {
        long count = 0;

        try (Session session = factory.openSession()) {
            // Create an HQL query to count the number of users
            String hql = "SELECT COUNT(u.userId) FROM User u";
            Query query = session.createQuery(hql);
            
            // Get the count from the query result
            count = (Long) query.getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return count;
     }
    
}
