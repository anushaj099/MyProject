package com.textile.model;
// Generated Apr 1, 2017 4:28:55 PM by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * PackingStockreport generated by hbm2java
 */
public class PackingStockreport  implements java.io.Serializable {


     private Integer idp;
     private Date date;
     private Integer count;
     private String packingType;
     private String packingWeight;
     private Float openingStock;
     private Float packedBags;
     private Float dispatch;
     private Float closingStock;
     private Float closingStockKgs;

    public PackingStockreport() {
    }

    public PackingStockreport(Date date, Integer count, String packingType, String packingWeight, Float openingStock, Float packedBags, Float dispatch, Float closingStock, Float closingStockKgs) {
       this.date = date;
       this.count = count;
       this.packingType = packingType;
       this.packingWeight = packingWeight;
       this.openingStock = openingStock;
       this.packedBags = packedBags;
       this.dispatch = dispatch;
       this.closingStock = closingStock;
       this.closingStockKgs = closingStockKgs;
    }
   
    public Integer getIdp() {
        return this.idp;
    }
    
    public void setIdp(Integer idp) {
        this.idp = idp;
    }
    public Date getDate() {
        return this.date;
    }
    
    public void setDate(Date date) {
        this.date = date;
    }
    public Integer getCount() {
        return this.count;
    }
    
    public void setCount(Integer count) {
        this.count = count;
    }
    public String getPackingType() {
        return this.packingType;
    }
    
    public void setPackingType(String packingType) {
        this.packingType = packingType;
    }
    public String getPackingWeight() {
        return this.packingWeight;
    }
    
    public void setPackingWeight(String packingWeight) {
        this.packingWeight = packingWeight;
    }
    public Float getOpeningStock() {
        return this.openingStock;
    }
    
    public void setOpeningStock(Float openingStock) {
        this.openingStock = openingStock;
    }
    public Float getPackedBags() {
        return this.packedBags;
    }
    
    public void setPackedBags(Float packedBags) {
        this.packedBags = packedBags;
    }
    public Float getDispatch() {
        return this.dispatch;
    }
    
    public void setDispatch(Float dispatch) {
        this.dispatch = dispatch;
    }
    public Float getClosingStock() {
        return this.closingStock;
    }
    
    public void setClosingStock(Float closingStock) {
        this.closingStock = closingStock;
    }
    public Float getClosingStockKgs() {
        return this.closingStockKgs;
    }
    
    public void setClosingStockKgs(Float closingStockKgs) {
        this.closingStockKgs = closingStockKgs;
    }




}


