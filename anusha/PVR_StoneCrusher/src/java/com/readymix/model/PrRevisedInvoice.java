package com.readymix.model;
// Generated Jul 7, 2017 7:26:56 PM by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * PrRevisedInvoice generated by hbm2java
 */
public class PrRevisedInvoice  implements java.io.Serializable {


     private Integer prvId;
     private Integer documentNo;
     private Date dateOfIssue;
     private String state;
     private String code;
     private String againstInvoice;
     private Date dateOfInvoice;
     private String billToName;
     private String billToAddress;
     private String billToGstin;
     private String billToState;
     private String billToCode;
     private String shipToName;
     private String shipToAddress;
     private String shipToGstin;
     private String shipToState;
     private String shipToCode;
     private Float prTotal;
     private String totalInWords;
     private String bankAc;
     private String bankIfsc;
     private String termsCond;
     private Set chRevisedInvoices = new HashSet(0);

    public PrRevisedInvoice() {
    }

    public PrRevisedInvoice(Integer documentNo, Date dateOfIssue, String state, String code, String againstInvoice, Date dateOfInvoice, String billToName, String billToAddress, String billToGstin, String billToState, String billToCode, String shipToName, String shipToAddress, String shipToGstin, String shipToState, String shipToCode, Float prTotal, String totalInWords, String bankAc, String bankIfsc, String termsCond, Set chRevisedInvoices) {
       this.documentNo = documentNo;
       this.dateOfIssue = dateOfIssue;
       this.state = state;
       this.code = code;
       this.againstInvoice = againstInvoice;
       this.dateOfInvoice = dateOfInvoice;
       this.billToName = billToName;
       this.billToAddress = billToAddress;
       this.billToGstin = billToGstin;
       this.billToState = billToState;
       this.billToCode = billToCode;
       this.shipToName = shipToName;
       this.shipToAddress = shipToAddress;
       this.shipToGstin = shipToGstin;
       this.shipToState = shipToState;
       this.shipToCode = shipToCode;
       this.prTotal = prTotal;
       this.totalInWords = totalInWords;
       this.bankAc = bankAc;
       this.bankIfsc = bankIfsc;
       this.termsCond = termsCond;
       this.chRevisedInvoices = chRevisedInvoices;
    }
   
    public Integer getPrvId() {
        return this.prvId;
    }
    
    public void setPrvId(Integer prvId) {
        this.prvId = prvId;
    }
    public Integer getDocumentNo() {
        return this.documentNo;
    }
    
    public void setDocumentNo(Integer documentNo) {
        this.documentNo = documentNo;
    }
    public Date getDateOfIssue() {
        return this.dateOfIssue;
    }
    
    public void setDateOfIssue(Date dateOfIssue) {
        this.dateOfIssue = dateOfIssue;
    }
    public String getState() {
        return this.state;
    }
    
    public void setState(String state) {
        this.state = state;
    }
    public String getCode() {
        return this.code;
    }
    
    public void setCode(String code) {
        this.code = code;
    }
    public String getAgainstInvoice() {
        return this.againstInvoice;
    }
    
    public void setAgainstInvoice(String againstInvoice) {
        this.againstInvoice = againstInvoice;
    }
    public Date getDateOfInvoice() {
        return this.dateOfInvoice;
    }
    
    public void setDateOfInvoice(Date dateOfInvoice) {
        this.dateOfInvoice = dateOfInvoice;
    }
    public String getBillToName() {
        return this.billToName;
    }
    
    public void setBillToName(String billToName) {
        this.billToName = billToName;
    }
    public String getBillToAddress() {
        return this.billToAddress;
    }
    
    public void setBillToAddress(String billToAddress) {
        this.billToAddress = billToAddress;
    }
    public String getBillToGstin() {
        return this.billToGstin;
    }
    
    public void setBillToGstin(String billToGstin) {
        this.billToGstin = billToGstin;
    }
    public String getBillToState() {
        return this.billToState;
    }
    
    public void setBillToState(String billToState) {
        this.billToState = billToState;
    }
    public String getBillToCode() {
        return this.billToCode;
    }
    
    public void setBillToCode(String billToCode) {
        this.billToCode = billToCode;
    }
    public String getShipToName() {
        return this.shipToName;
    }
    
    public void setShipToName(String shipToName) {
        this.shipToName = shipToName;
    }
    public String getShipToAddress() {
        return this.shipToAddress;
    }
    
    public void setShipToAddress(String shipToAddress) {
        this.shipToAddress = shipToAddress;
    }
    public String getShipToGstin() {
        return this.shipToGstin;
    }
    
    public void setShipToGstin(String shipToGstin) {
        this.shipToGstin = shipToGstin;
    }
    public String getShipToState() {
        return this.shipToState;
    }
    
    public void setShipToState(String shipToState) {
        this.shipToState = shipToState;
    }
    public String getShipToCode() {
        return this.shipToCode;
    }
    
    public void setShipToCode(String shipToCode) {
        this.shipToCode = shipToCode;
    }
    public Float getPrTotal() {
        return this.prTotal;
    }
    
    public void setPrTotal(Float prTotal) {
        this.prTotal = prTotal;
    }
    public String getTotalInWords() {
        return this.totalInWords;
    }
    
    public void setTotalInWords(String totalInWords) {
        this.totalInWords = totalInWords;
    }
    public String getBankAc() {
        return this.bankAc;
    }
    
    public void setBankAc(String bankAc) {
        this.bankAc = bankAc;
    }
    public String getBankIfsc() {
        return this.bankIfsc;
    }
    
    public void setBankIfsc(String bankIfsc) {
        this.bankIfsc = bankIfsc;
    }
    public String getTermsCond() {
        return this.termsCond;
    }
    
    public void setTermsCond(String termsCond) {
        this.termsCond = termsCond;
    }
    public Set getChRevisedInvoices() {
        return this.chRevisedInvoices;
    }
    
    public void setChRevisedInvoices(Set chRevisedInvoices) {
        this.chRevisedInvoices = chRevisedInvoices;
    }




}


