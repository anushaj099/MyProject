package com.textile.model;
// Generated Apr 3, 2017 2:59:45 PM by Hibernate Tools 4.3.1



/**
 * Counts generated by hbm2java
 */
public class Counts  implements java.io.Serializable {


     private Integer idm;
     private String count;
     private Float openStock;

    public Counts() {
    }

    public Counts(String count) {
       this.count = count;
    }
   
    public Integer getIdm() {
        return this.idm;
    }
    
    public void setIdm(Integer idm) {
        this.idm = idm;
    }
    public String getCount() {
        return this.count;
    }
    
    public void setCount(String count) {
        this.count = count;
    }

    public Float getOpenStock() {
        return openStock;
    }

    public void setOpenStock(Float openStock) {
        this.openStock = openStock;
    }

   




}

