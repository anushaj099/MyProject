package com.readymix.model;
// Generated Aug 17, 2017 10:31:58 AM by Hibernate Tools 4.3.1



/**
 * ChTaxIntra generated by hbm2java
 */
public class ChTaxIntra  implements java.io.Serializable {


     private Integer srNo;
     private PrTaxIntra prTaxIntra;
     private String productDesc;
     private String hsnCode;
     private Float qty;
     private String uom;
     private Float beforeTax;
     private Float afterTax;
     private Float rate;
     private Float amount;
     private Float taxableValue;
     private Float cgRate;
     private Float cgAmt;
     private Float sgRate;
     private Float sgAmt;
     private Float chTotal;

    public ChTaxIntra() {
    }

    public ChTaxIntra(PrTaxIntra prTaxIntra, String productDesc, String hsnCode, Float qty, String uom, Float beforeTax, Float afterTax, Float rate, Float amount, Float taxableValue, Float cgRate, Float cgAmt, Float sgRate, Float sgAmt, Float chTotal) {
       this.prTaxIntra = prTaxIntra;
       this.productDesc = productDesc;
       this.hsnCode = hsnCode;
       this.qty = qty;
       this.uom = uom;
       this.beforeTax = beforeTax;
       this.afterTax = afterTax;
       this.rate = rate;
       this.amount = amount;
       this.taxableValue = taxableValue;
       this.cgRate = cgRate;
       this.cgAmt = cgAmt;
       this.sgRate = sgRate;
       this.sgAmt = sgAmt;
       this.chTotal = chTotal;
    }
   
    public Integer getSrNo() {
        return this.srNo;
    }
    
    public void setSrNo(Integer srNo) {
        this.srNo = srNo;
    }
    public PrTaxIntra getPrTaxIntra() {
        return this.prTaxIntra;
    }
    
    public void setPrTaxIntra(PrTaxIntra prTaxIntra) {
        this.prTaxIntra = prTaxIntra;
    }
    public String getProductDesc() {
        return this.productDesc;
    }
    
    public void setProductDesc(String productDesc) {
        this.productDesc = productDesc;
    }
    public String getHsnCode() {
        return this.hsnCode;
    }
    
    public void setHsnCode(String hsnCode) {
        this.hsnCode = hsnCode;
    }
    public Float getQty() {
        return this.qty;
    }
    
    public void setQty(Float qty) {
        this.qty = qty;
    }
    public String getUom() {
        return this.uom;
    }
    
    public void setUom(String uom) {
        this.uom = uom;
    }
    public Float getBeforeTax() {
        return this.beforeTax;
    }
    
    public void setBeforeTax(Float beforeTax) {
        this.beforeTax = beforeTax;
    }
    public Float getAfterTax() {
        return this.afterTax;
    }
    
    public void setAfterTax(Float afterTax) {
        this.afterTax = afterTax;
    }
    public Float getRate() {
        return this.rate;
    }
    
    public void setRate(Float rate) {
        this.rate = rate;
    }
    public Float getAmount() {
        return this.amount;
    }
    
    public void setAmount(Float amount) {
        this.amount = amount;
    }
    public Float getTaxableValue() {
        return this.taxableValue;
    }
    
    public void setTaxableValue(Float taxableValue) {
        this.taxableValue = taxableValue;
    }
    public Float getCgRate() {
        return this.cgRate;
    }
    
    public void setCgRate(Float cgRate) {
        this.cgRate = cgRate;
    }
    public Float getCgAmt() {
        return this.cgAmt;
    }
    
    public void setCgAmt(Float cgAmt) {
        this.cgAmt = cgAmt;
    }
    public Float getSgRate() {
        return this.sgRate;
    }
    
    public void setSgRate(Float sgRate) {
        this.sgRate = sgRate;
    }
    public Float getSgAmt() {
        return this.sgAmt;
    }
    
    public void setSgAmt(Float sgAmt) {
        this.sgAmt = sgAmt;
    }
    public Float getChTotal() {
        return this.chTotal;
    }
    
    public void setChTotal(Float chTotal) {
        this.chTotal = chTotal;
    }




}


