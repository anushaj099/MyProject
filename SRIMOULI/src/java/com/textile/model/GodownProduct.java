package com.textile.model;
// Generated Apr 3, 2017 2:59:45 PM by Hibernate Tools 4.3.1



/**
 * GodownProduct generated by hbm2java
 */
public class GodownProduct  implements java.io.Serializable {


     private Integer id;
     private String product;

    public GodownProduct() {
    }

    public GodownProduct(String product) {
       this.product = product;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public String getProduct() {
        return this.product;
    }
    
    public void setProduct(String product) {
        this.product = product;
    }




}


