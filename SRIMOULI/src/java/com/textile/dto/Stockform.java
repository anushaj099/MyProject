/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.dto;

import java.util.Date;

/**
 *
 * @author Saranya
 */
public class Stockform 
{
    
    private Integer ids;
     private String date;
     private String variety;
     private Float stockQuantity;
     private Float stockKgs;
     private Float stockAvg;

    public Integer getIds() {
        return ids;
    }

    public void setIds(Integer ids) {
        this.ids = ids;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getVariety() {
        return variety;
    }

    public void setVariety(String variety) {
        this.variety = variety;
    }

    public Float getStockQuantity() {
        return stockQuantity;
    }

    public void setStockQuantity(Float stockQuantity) {
        this.stockQuantity = stockQuantity;
    }

    public Float getStockKgs() {
        return stockKgs;
    }

    public void setStockKgs(Float stockKgs) {
        this.stockKgs = stockKgs;
    }

    public Float getStockAvg() {
        return stockAvg;
    }

    public void setStockAvg(Float stockAvg) {
        this.stockAvg = stockAvg;
    }
     
}
