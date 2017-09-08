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
public class AvailableYears {
    
     private Integer ids;
     private Date date;
     private String closedYears;
     private Date closedFrom;
     private Date closedTo;
     private String status;

   public AvailableYears(){
         
     }
    public AvailableYears(Integer ids, Date date, String closedYears, Date closedFrom, Date closedTo, String status) {
        this.ids = ids;
        this.date = date;
        this.closedYears = closedYears;
        this.closedFrom = closedFrom;
        this.closedTo = closedTo;
        this.status = status;
    }

    public Integer getIds() {
        return ids;
    }

    public void setIds(Integer ids) {
        this.ids = ids;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getClosedYears() {
        return closedYears;
    }

    public void setClosedYears(String closedYears) {
        this.closedYears = closedYears;
    }

    public Date getClosedFrom() {
        return closedFrom;
    }

    public void setClosedFrom(Date closedFrom) {
        this.closedFrom = closedFrom;
    }

    public Date getClosedTo() {
        return closedTo;
    }

    public void setClosedTo(Date closedTo) {
        this.closedTo = closedTo;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
     
        
}
