package com.bs.pojo;
// Generated Oct 18, 2016 6:42:00 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Product generated by hbm2java
 */
public class Product  implements java.io.Serializable {


     private Integer proId;
     private String proName;
     private Integer stock;
     private Set saleses = new HashSet(0);
     private Set purchaseses = new HashSet(0);

    public Product() {
    }

    public Product(String proName, Integer stock, Set saleses, Set purchaseses) {
       this.proName = proName;
       this.stock = stock;
       this.saleses = saleses;
       this.purchaseses = purchaseses;
    }
   
    public Integer getProId() {
        return this.proId;
    }
    
    public void setProId(Integer proId) {
        this.proId = proId;
    }
    public String getProName() {
        return this.proName;
    }
    
    public void setProName(String proName) {
        this.proName = proName;
    }
    public Integer getStock() {
        return this.stock;
    }
    
    public void setStock(Integer stock) {
        this.stock = stock;
    }
    public Set getSaleses() {
        return this.saleses;
    }
    
    public void setSaleses(Set saleses) {
        this.saleses = saleses;
    }
    public Set getPurchaseses() {
        return this.purchaseses;
    }
    
    public void setPurchaseses(Set purchaseses) {
        this.purchaseses = purchaseses;
    }




}


