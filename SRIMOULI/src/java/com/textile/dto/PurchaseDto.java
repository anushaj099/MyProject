/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.dto;

/**
 *
 * @author ch.mounika
 */
public class PurchaseDto {
    int id;
   String date;
   String date1;
    String sname;
    String ptype;
    int bales;
    float gwt;
    float nwt;
    float tarewt;
    //int kgs;
    String vno;
    String remarks;
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

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

    
    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getPtype() {
        return ptype;
    }

    public void setPtype(String ptype) {
        this.ptype = ptype;
    }

    public int getBales() {
        return bales;
    }

    public void setBales(int bales) {
        this.bales = bales;
    }

    public float getGwt() {
        return gwt;
    }

    public void setGwt(float gwt) {
        this.gwt = gwt;
    }

    public float getNwt() {
        return nwt;
    }

    public void setNwt(float nwt) {
        this.nwt = nwt;
    }

    public float getTarewt() {
        return tarewt;
    }

    public void setTarewt(float tarewt) {
        this.tarewt = tarewt;
    }
  
    
//    public int getKgs() {
//        return kgs;
//    }
//
//    public void setKgs(int kgs) {
//        this.kgs = kgs;
//    }

    public String getVno() {
        return vno;
    }

    public void setVno(String vno) {
        this.vno = vno;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }
    
    
    
}
