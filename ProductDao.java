package com.ecommerce.dao;

import com.ecommerce.entities.Product;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class ProductDao {
    
    private SessionFactory factory;

    public ProductDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    public boolean saveProduct(Product product){
        boolean f = false;
        
        try {
            Session session = this.factory.openSession();
            Transaction tx = session.beginTransaction();
        
            session.save(product);
      
            tx.commit();
            session.close();
            f=true;
            
        } catch (Exception e) {
            e.printStackTrace();
            f = false;
        }
        
        return f;
    }
    
    
    //fetch data of all products
    public List<Product> getAllData(){
        
        Session s = this.factory.openSession();
        
        Query q = s.createQuery("from Product");
        
        List<Product> plist = q.getResultList();
        
        
        s.close();
        
        return plist;
    }
    
    public long getProductCount(){
        
        long count = 0;

        try (Session session = factory.openSession()) {
            // Create an HQL query to count the number of users
            String hql = "SELECT COUNT(p.pId) FROM Product p";
            Query query = session.createQuery(hql);
            
            // Get the count from the query result
            count = (Long) query.getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
        
    }
    
    //fetch data of all by using category id
    public List<Product> getAllDataById(int cid){
        
        Session s = this.factory.openSession();
        
        Query q = s.createQuery("from Product as p where p.category.cId =:id");
        q.setParameter("id", cid);
        
        List<Product> plist = q.getResultList();
        
        
        s.close();
        
        return plist;
    }
    
    
    
    
}
