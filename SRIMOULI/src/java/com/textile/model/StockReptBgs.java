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
public class StockReptBgs {
    
     private Integer ids;
     private Date date;
     private Integer count;
     private String typeOfPack;
     private String packWt;
     private Float openStk;
     private Float packedBags;
     private Float dispatch;
     private Float closingStk;
     private Float closingStkKgs;

    public StockReptBgs() {
    }
     
     

    public StockReptBgs(Date date, Integer count, String typeOfPack, String packWt, Float openStk, Float packedBags, Float dispatch, Float closingStk, Float closingStkKgs) {
        this.date = date;
        this.count = count;
        this.typeOfPack = typeOfPack;
        this.packWt = packWt;
        this.openStk = openStk;
        this.packedBags = packedBags;
        this.dispatch = dispatch;
        this.closingStk = closingStk;
        this.closingStkKgs = closingStkKgs;
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

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public String getTypeOfPack() {
        return typeOfPack;
    }

    public void setTypeOfPack(String typeOfPack) {
        this.typeOfPack = typeOfPack;
    }

    public String getPackWt() {
        return packWt;
    }

    public void setPackWt(String packWt) {
        this.packWt = packWt;
    }

    public Float getOpenStk() {
        return openStk;
    }

    public void setOpenStk(Float openStk) {
        this.openStk = openStk;
    }

    public Float getPackedBags() {
        return packedBags;
    }

    public void setPackedBags(Float packedBags) {
        this.packedBags = packedBags;
    }

    public Float getDispatch() {
        return dispatch;
    }

    public void setDispatch(Float dispatch) {
        this.dispatch = dispatch;
    }

    public Float getClosingStk() {
        return closingStk;
    }

    public void setClosingStk(Float closingStk) {
        this.closingStk = closingStk;
    }

    public Float getClosingStkKgs() {
        return closingStkKgs;
    }

    public void setClosingStkKgs(Float closingStkKgs) {
        this.closingStkKgs = closingStkKgs;
    }
     
     
}
