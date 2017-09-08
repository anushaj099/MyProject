package com.readymix.model;
// Generated Jul 7, 2017 7:26:56 PM by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * PrReceiptVoucher generated by hbm2java
 */
public class PrReceiptVoucher  implements java.io.Serializable {


     private Integer prcId;
     private String vocherNo;
     private Date vocherDate;
     private String placeeOfSupply;
     private String reverseCharge;
     private String state;
     private String code;
     private String receiverName;
     private String receiverAddress;
     private String receiverGstin;
     private String receiverState;
     private String receiverCode;
     private Float prTotal;
     private String totalInWords;
     private String authorizedSignatory;
     private Set chReceiptVouchers = new HashSet(0);

    public PrReceiptVoucher() {
    }

    public PrReceiptVoucher(String vocherNo, Date vocherDate, String placeeOfSupply, String reverseCharge, String state, String code, String receiverName, String receiverAddress, String receiverGstin, String receiverState, String receiverCode, Float prTotal, String totalInWords, String authorizedSignatory, Set chReceiptVouchers) {
       this.vocherNo = vocherNo;
       this.vocherDate = vocherDate;
       this.placeeOfSupply = placeeOfSupply;
       this.reverseCharge = reverseCharge;
       this.state = state;
       this.code = code;
       this.receiverName = receiverName;
       this.receiverAddress = receiverAddress;
       this.receiverGstin = receiverGstin;
       this.receiverState = receiverState;
       this.receiverCode = receiverCode;
       this.prTotal = prTotal;
       this.totalInWords = totalInWords;
       this.authorizedSignatory = authorizedSignatory;
       this.chReceiptVouchers = chReceiptVouchers;
    }
   
    public Integer getPrcId() {
        return this.prcId;
    }
    
    public void setPrcId(Integer prcId) {
        this.prcId = prcId;
    }
    public String getVocherNo() {
        return this.vocherNo;
    }
    
    public void setVocherNo(String vocherNo) {
        this.vocherNo = vocherNo;
    }
    public Date getVocherDate() {
        return this.vocherDate;
    }
    
    public void setVocherDate(Date vocherDate) {
        this.vocherDate = vocherDate;
    }
    public String getPlaceeOfSupply() {
        return this.placeeOfSupply;
    }
    
    public void setPlaceeOfSupply(String placeeOfSupply) {
        this.placeeOfSupply = placeeOfSupply;
    }
    public String getReverseCharge() {
        return this.reverseCharge;
    }
    
    public void setReverseCharge(String reverseCharge) {
        this.reverseCharge = reverseCharge;
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
    public String getReceiverName() {
        return this.receiverName;
    }
    
    public void setReceiverName(String receiverName) {
        this.receiverName = receiverName;
    }
    public String getReceiverAddress() {
        return this.receiverAddress;
    }
    
    public void setReceiverAddress(String receiverAddress) {
        this.receiverAddress = receiverAddress;
    }
    public String getReceiverGstin() {
        return this.receiverGstin;
    }
    
    public void setReceiverGstin(String receiverGstin) {
        this.receiverGstin = receiverGstin;
    }
    public String getReceiverState() {
        return this.receiverState;
    }
    
    public void setReceiverState(String receiverState) {
        this.receiverState = receiverState;
    }
    public String getReceiverCode() {
        return this.receiverCode;
    }
    
    public void setReceiverCode(String receiverCode) {
        this.receiverCode = receiverCode;
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
    public String getAuthorizedSignatory() {
        return this.authorizedSignatory;
    }
    
    public void setAuthorizedSignatory(String authorizedSignatory) {
        this.authorizedSignatory = authorizedSignatory;
    }
    public Set getChReceiptVouchers() {
        return this.chReceiptVouchers;
    }
    
    public void setChReceiptVouchers(Set chReceiptVouchers) {
        this.chReceiptVouchers = chReceiptVouchers;
    }




}


