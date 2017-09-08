/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.readymix.dto;

import java.util.Date;
import java.util.List;


/**
 *
 * @author Masrat
 */
public class TaxInvoiceDto {
    
     private Integer ptId;
     private Integer invoiceNo;
     private String generatedby;
     private String editedby;
     private String invoiceDate;
     private String invoiceDate1;
     private String reverseCharge;
     private String state;
     private String code;
     private String transportMode;
     private String vehNo;
     private String dateOfSupply;
     private String placeOfSupply;
     private String billToName;
     private String billToAddress;
     private String billToGstin;
     private String billTostate;
     private String billToCode;
     private String shipToName;
     private String shipAddress;
     private String shipToGstin;
     private String shipToState;
     private String shipToCode;
     private Float prTotal;
     private String totalInWords;
     private String bankAc;
     private String bankIfsc;
     private String termsCond;
     private String autharizedSign;
     private Float totalQty;
     private Float totalValAtax;
     private Float totalValBtax;
     private Float totalTaxval;
     private Float totalCgstAmt;
     private Float totalSgstAmt;
     private Float totalInv;
     private Float gstReverseCharge;
     
     private String bankname;
     private List<String> grade;
     private String bankbranch;
     private String grades;
     private String mining;
     private String waybill;

    public String getGeneratedby() {
        return generatedby;
    }

    public void setGeneratedby(String generatedby) {
        this.generatedby = generatedby;
    }

    public String getEditedby() {
        return editedby;
    }

    public void setEditedby(String editedby) {
        this.editedby = editedby;
    }

     
     
    public String getMining() {
        return mining;
    }

    public void setMining(String mining) {
        this.mining = mining;
    }

    public String getWaybill() {
        return waybill;
    }

    public void setWaybill(String waybill) {
        this.waybill = waybill;
    }
         
     private List<String> uom;
     private List<String> productDesc;
     private List<String> hsnCode;
     private List<Float> qty;
     private List<Float> beforeTax;
     private List<Float> afterTax;
     private List<Float> taxableValue;
      private List<Float> cgRate;
      private List<Float> cgAmt;
      private List<Float> sgRate;
      private List<Float> sgAmt;
      private List<Float> chTotal;

    public List<String> getGrade() {
        return grade;
    }

    public void setGrade(List<String> grade) {
        this.grade = grade;
    }

   
      
    public List<String> getUom() {
        return uom;
    }

    public void setUom(List<String> uom) {
        this.uom = uom;
    }

      
      
    public String getGrades() {
        return grades;
    }

    public void setGrades(String grades) {
        this.grades = grades;
    }

      
      
    public String getInvoiceDate1() {
        return invoiceDate1;
    }

    public void setInvoiceDate1(String invoiceDate1) {
        this.invoiceDate1 = invoiceDate1;
    }
      

      
      
    public List<String> getProductDesc() {
        return productDesc;
    }

    public String getBankname() {
        return bankname;
    }

    public void setBankname(String bankname) {
        this.bankname = bankname;
    }

    public String getBankbranch() {
        return bankbranch;
    }

    public void setBankbranch(String bankbranch) {
        this.bankbranch = bankbranch;
    }

    public void setProductDesc(List<String> productDesc) {
        this.productDesc = productDesc;
    }

    public List<String> getHsnCode() {
        return hsnCode;
    }

    public void setHsnCode(List<String> hsnCode) {
        this.hsnCode = hsnCode;
    }

    public List<Float> getQty() {
        return qty;
    }

    public void setQty(List<Float> qty) {
        this.qty = qty;
    }

   
    public List<Float> getBeforeTax() {
        return beforeTax;
    }

    public void setBeforeTax(List<Float> beforeTax) {
        this.beforeTax = beforeTax;
    }

    public List<Float> getAfterTax() {
        return afterTax;
    }

    public void setAfterTax(List<Float> afterTax) {
        this.afterTax = afterTax;
    }

    public List<Float> getTaxableValue() {
        return taxableValue;
    }

    public void setTaxableValue(List<Float> taxableValue) {
        this.taxableValue = taxableValue;
    }

  

    public List<Float> getCgAmt() {
        return cgAmt;
    }

    public void setCgAmt(List<Float> cgAmt) {
        this.cgAmt = cgAmt;
    }

    public List<Float> getCgRate() {
        return cgRate;
    }

    public void setCgRate(List<Float> cgRate) {
        this.cgRate = cgRate;
    }

    public List<Float> getSgRate() {
        return sgRate;
    }

    public void setSgRate(List<Float> sgRate) {
        this.sgRate = sgRate;
    }

   

    public List<Float> getSgAmt() {
        return sgAmt;
    }

    public void setSgAmt(List<Float> sgAmt) {
        this.sgAmt = sgAmt;
    }

    public List<Float> getChTotal() {
        return chTotal;
    }

    public void setChTotal(List<Float> chTotal) {
        this.chTotal = chTotal;
    }

      

    public Float getTotalQty() {
        return totalQty;
    }

    public void setTotalQty(Float totalQty) {
        this.totalQty = totalQty;
    }

    public Float getTotalValAtax() {
        return totalValAtax;
    }

    public void setTotalValAtax(Float totalValAtax) {
        this.totalValAtax = totalValAtax;
    }

    public Float getTotalValBtax() {
        return totalValBtax;
    }

    public void setTotalValBtax(Float totalValBtax) {
        this.totalValBtax = totalValBtax;
    }

    public Float getTotalTaxval() {
        return totalTaxval;
    }

    public void setTotalTaxval(Float totalTaxval) {
        this.totalTaxval = totalTaxval;
    }

    public Float getTotalCgstAmt() {
        return totalCgstAmt;
    }

    public void setTotalCgstAmt(Float totalCgstAmt) {
        this.totalCgstAmt = totalCgstAmt;
    }

    public Float getTotalSgstAmt() {
        return totalSgstAmt;
    }

    public void setTotalSgstAmt(Float totalSgstAmt) {
        this.totalSgstAmt = totalSgstAmt;
    }

    public Float getTotalInv() {
        return totalInv;
    }

    public void setTotalInv(Float totalInv) {
        this.totalInv = totalInv;
    }

    public Float getGstReverseCharge() {
        return gstReverseCharge;
    }

    public void setGstReverseCharge(Float gstReverseCharge) {
        this.gstReverseCharge = gstReverseCharge;
    }

     
    public TaxInvoiceDto() {
    }

    public TaxInvoiceDto(Integer ptId) {
        this.ptId = ptId;
    }

     
    public Integer getPtId() {
        return ptId;
    }

    public void setPtId(Integer ptId) {
        this.ptId = ptId;
    }

    public Integer getInvoiceNo() {
        return invoiceNo;
    }

    public void setInvoiceNo(Integer invoiceNo) {
        this.invoiceNo = invoiceNo;
    }

    public String getInvoiceDate() {
        return invoiceDate;
    }

    public void setInvoiceDate(String invoiceDate) {
        this.invoiceDate = invoiceDate;
    }

    public String getReverseCharge() {
        return reverseCharge;
    }

    public void setReverseCharge(String reverseCharge) {
        this.reverseCharge = reverseCharge;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getTransportMode() {
        return transportMode;
    }

    public void setTransportMode(String transportMode) {
        this.transportMode = transportMode;
    }

    public String getVehNo() {
        return vehNo;
    }

    public void setVehNo(String vehNo) {
        this.vehNo = vehNo;
    }

    public String getDateOfSupply() {
        return dateOfSupply;
    }

    public void setDateOfSupply(String dateOfSupply) {
        this.dateOfSupply = dateOfSupply;
    }

    public String getPlaceOfSupply() {
        return placeOfSupply;
    }

    public void setPlaceOfSupply(String placeOfSupply) {
        this.placeOfSupply = placeOfSupply;
    }

    public String getBillToName() {
        return billToName;
    }

    public void setBillToName(String billToName) {
        this.billToName = billToName;
    }

    public String getBillToAddress() {
        return billToAddress;
    }

    public void setBillToAddress(String billToAddress) {
        this.billToAddress = billToAddress;
    }

    public String getBillToGstin() {
        return billToGstin;
    }

    public void setBillToGstin(String billToGstin) {
        this.billToGstin = billToGstin;
    }

    public String getBillTostate() {
        return billTostate;
    }

    public void setBillTostate(String billTostate) {
        this.billTostate = billTostate;
    }

    public String getBillToCode() {
        return billToCode;
    }

    public void setBillToCode(String billToCode) {
        this.billToCode = billToCode;
    }

    public String getShipToName() {
        return shipToName;
    }

    public void setShipToName(String shipToName) {
        this.shipToName = shipToName;
    }

    public String getShipAddress() {
        return shipAddress;
    }

    public void setShipAddress(String shipAddress) {
        this.shipAddress = shipAddress;
    }

    public String getShipToGstin() {
        return shipToGstin;
    }

    public void setShipToGstin(String shipToGstin) {
        this.shipToGstin = shipToGstin;
    }

    public String getShipToState() {
        return shipToState;
    }

    public void setShipToState(String shipToState) {
        this.shipToState = shipToState;
    }

    public String getShipToCode() {
        return shipToCode;
    }

    public void setShipToCode(String shipToCode) {
        this.shipToCode = shipToCode;
    }

    public Float getPrTotal() {
        return prTotal;
    }

    public void setPrTotal(Float prTotal) {
        this.prTotal = prTotal;
    }

    public String getTotalInWords() {
        return totalInWords;
    }

    public void setTotalInWords(String totalInWords) {
        this.totalInWords = totalInWords;
    }

    public String getBankAc() {
        return bankAc;
    }

    public void setBankAc(String bankAc) {
        this.bankAc = bankAc;
    }

    public String getBankIfsc() {
        return bankIfsc;
    }

    public void setBankIfsc(String bankIfsc) {
        this.bankIfsc = bankIfsc;
    }

    public String getTermsCond() {
        return termsCond;
    }

    public void setTermsCond(String termsCond) {
        this.termsCond = termsCond;
    }

    public String getAutharizedSign() {
        return autharizedSign;
    }

    public void setAutharizedSign(String autharizedSign) {
        this.autharizedSign = autharizedSign;
    }
    
     
     
}
