/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.dto;

import java.util.Date;
import java.util.List;

/**
 *
 * @author ch.mounika
 */
public class StockDTO {
    private Integer ids;
     private String date;
    // private String variety;
     private Integer receivedQuantity;
     private Float receivedKgs;
     private Integer issueQuantity;
     private Float issueKgs;
    // private Integer stockQuantity;
     //private Float stockKgs;
     private List<String> variety;
     private List<Float> stockQuantity;
     private List<Float> stockKgs;

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public List<String> getVariety() {
        return variety;
    }

    public void setVariety(List<String> variety) {
        this.variety = variety;
    }

    public List<Float> getStockQuantity() {
        return stockQuantity;
    }

    public void setStockQuantity(List<Float> stockQuantity) {
        this.stockQuantity = stockQuantity;
    }

  

    public List<Float> getStockKgs() {
        return stockKgs;
    }

    public void setStockKgs(List<Float> stockKgs) {
        this.stockKgs = stockKgs;
    }
     

    public Integer getIds() {
        return ids;
    }

    public void setIds(Integer ids) {
        this.ids = ids;
    }

   

    
    public Integer getReceivedQuantity() {
        return receivedQuantity;
    }

    public void setReceivedQuantity(Integer receivedQuantity) {
        this.receivedQuantity = receivedQuantity;
    }

    public Float getReceivedKgs() {
        return receivedKgs;
    }

    public void setReceivedKgs(Float receivedKgs) {
        this.receivedKgs = receivedKgs;
    }

    public Integer getIssueQuantity() {
        return issueQuantity;
    }

    public void setIssueQuantity(Integer issueQuantity) {
        this.issueQuantity = issueQuantity;
    }

    public Float getIssueKgs() {
        return issueKgs;
    }

    public void setIssueKgs(Float issueKgs) {
        this.issueKgs = issueKgs;
    }

    
   
    
}
