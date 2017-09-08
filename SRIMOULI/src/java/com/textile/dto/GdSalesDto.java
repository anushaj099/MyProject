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
public class GdSalesDto implements java.io.Serializable{
    
    private Integer id;
    private Integer ids;
    private String date;
    private String cname;
    private String ptype;
    private Float nbales;
    private Float grossWeight;
     private Float netWeight;
     private Float tareWeight;
    //private Integer nkgs;
    private String vno;
    private String remarks;

    public Float getNbales() {
        return nbales;
    }

    public void setNbales(Float nbales) {
        this.nbales = nbales;
    }

//    public Integer getNkgs() {
//        return nkgs;
//    }
//
//    public void setNkgs(Integer nkgs) {
//        this.nkgs = nkgs;
//    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

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

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getPtype() {
        return ptype;
    }

    public void setPtype(String ptype) {
        this.ptype = ptype;
    }

    public Float getGrossWeight() {
        return grossWeight;
    }

    public void setGrossWeight(Float grossWeight) {
        this.grossWeight = grossWeight;
    }

    public Float getNetWeight() {
        return netWeight;
    }

    public void setNetWeight(Float netWeight) {
        this.netWeight = netWeight;
    }

    public Float getTareWeight() {
        return tareWeight;
    }

    public void setTareWeight(Float tareWeight) {
        this.tareWeight = tareWeight;
    }

   

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
