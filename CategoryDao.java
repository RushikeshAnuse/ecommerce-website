
package com.ecommerce.dao;

import com.ecommerce.entities.Category;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class CategoryDao {
    
    private SessionFactory factory;

    public CategoryDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    public int saveCategoryData(Category cat){
        
        Session session = this.factory.openSession();
        Transaction tx = session.beginTransaction();
        
        int cid = (int)session.save(cat);
        
        tx.commit();
        session.close();
        return cid;
    }
    
    //fetch data in multiple
    public List<Category> getCategoriesList(){
        
        Session session = this.factory.openSession();
        Query q = session.createQuery("from Category");
        List<Category> list = q.getResultList();
        
        session.close();
        return list;
    }
    
    //fetch data in sigle 
    public Category getCategoryById(int cid){
        Category cat = null;
        try {
            
            Session session = this.factory.openSession();
            cat = session.get(Category.class, cid);
            
            
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return cat;
    }
    
    
    //find the total count of categories
    public long getCategoriesCount(){
        
        long count = 0;

        try (Session session = factory.openSession()) {
            // Create an HQL query to count the number of users
            String hql = "SELECT COUNT(c.cId) FROM Category c";
            Query query = session.createQuery(hql);
            
            // Get the count from the query result
            count = (Long) query.getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
        
    }
    
}
