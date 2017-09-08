/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.dto;

/**
 *
 * @author Swathi
 */
public class StockReportDto {
    private String date;
    private String date1;
    private String ptype;
    private Integer quantity;
    private Float kgs;

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getDate1() {
        return date1;
    }

    public void setDate1(String date1) {
        this.date1 = date1;
    }

    public String getPtype() {
        return ptype;
    }

    public void setPtype(String ptype) {
        this.ptype = ptype;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Float getKgs() {
        return kgs;
    }

    public void setKgs(Float kgs) {
        this.kgs = kgs;
    }
    
}
