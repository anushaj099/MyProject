/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.dto;

/**
 *
 * @author nsg
 */
public class countform {
    
    private int idm;
     private String count;
     private Float openStock;
     private int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
     

    public int getIdm() {
        return idm;
    }

    public void setIdm(int idm) {
        this.idm = idm;
    }

    public String getCount() {
        return count;
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
