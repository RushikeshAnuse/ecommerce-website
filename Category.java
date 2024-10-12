package com.ecommerce.entities;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Category {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int cId;
    private String cName;
    @Column(length = 1500)
    private String cDescription;

    @OneToMany(mappedBy = "category")
    private List<Product> products = new ArrayList<>();
    
    public Category(int cId, String cName, String cDescription) {
        this.cId = cId;
        this.cName = cName;
        this.cDescription = cDescription;
    }

    public Category(String cName, String cDescription,List<Product> products) {
        this.cName = cName;
        this.cDescription = cDescription;
        this.products = products;
    }

    public Category() {
    }

    public int getcId() {
        return cId;
    }

    public void setcId(int cId) {
        this.cId = cId;
    }

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName;
    }

    public String getcDescription() {
        return cDescription;
    }

    public void setcDescription(String cDescription) {
        this.cDescription = cDescription;
    }

    public List<Product> getProducts() {
        return products;
    }
    
    

    @Override
    public String toString() {
        return "Category{" + "cId=" + cId + ", cName=" + cName + ", cDescription=" + cDescription + '}';
    }
    
    
    
}
