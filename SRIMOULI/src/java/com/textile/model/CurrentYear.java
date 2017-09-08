/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.model;

import java.util.Date;



/**
 *
 * @author Masrat
 */
public class CurrentYear {
    
     private Integer ids;
     private String dateFrom;
     private String dateTo;
     private String status;
     
     public CurrentYear(){
         
     }

    public CurrentYear(Integer ids, String dateFrom, String dateTo, String status) {
        this.ids = ids;
        this.dateFrom = dateFrom;
        this.dateTo = dateTo;
        this.status = status;
    }

     
    public Integer getIds() {
        return ids;
    }

    public void setIds(Integer ids) {
        this.ids = ids;
    }

    public String getDateFrom() {
        return dateFrom;
    }

    public void setDateFrom(String dateFrom) {
        this.dateFrom = dateFrom;
    }

    public String getDateTo() {
        return dateTo;
    }

    public void setDateTo(String dateTo) {
        this.dateTo = dateTo;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
     
}
