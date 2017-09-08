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
public class PurchaseForm {
    
   private Integer id;
     private String date;
     private String supplierName;
      private String productType;
     private Float noOfBales;
     private Float grossWeight;
     private Float netWeight;
     private Float tareWeight;
     //private Integer noOfKgs;
     private String vehicleNo;
     private String remarks;
     private Integer idp;

    public Integer getIdp() {
        return idp;
    }

    public void setIdp(Integer idp) {
        this.idp = idp;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getSupplierName() {
        return supplierName;
    }

    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName;
    }

    public String getProductType() {
        return productType;
    }

    public void setProductType(String productType) {
        this.productType = productType;
    }

    public Float getNoOfBales() {
        return noOfBales;
    }

    public void setNoOfBales(Float noOfBales) {
        this.noOfBales = noOfBales;
    }

//    public Integer getNoOfKgs() {
//        return noOfKgs;
//    }
//
//    public void setNoOfKgs(Integer noOfKgs) {
//        this.noOfKgs = noOfKgs;
//    }

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
   
    public String getVehicleNo() {
        return vehicleNo;
    }

    public void setVehicleNo(String vehicleNo) {
        this.vehicleNo = vehicleNo;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }
    
    
}
