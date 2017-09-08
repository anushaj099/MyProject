package com.readymix.model;
// Generated Jul 28, 2017 4:51:08 PM by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * PrTaxIntra generated by hbm2java
 */
public class PrTaxIntra  implements java.io.Serializable {


     private Integer ptId;
     private Integer invoiceNo;
     private Date invoiceDate;
     private String reverseCharge;
     private String state;
     private String code;
     private String transportMode;
     private String vehNo;
     private Date dateOfSupply;
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
     private Float totalValBtax;
     private Float totalValAtax;
     private Float totalTaxval;
     private Float totalCgstAmt;
     private Float totalSgstAmt;
     private Float gstReverseCharge;
     private Float totalInv;
     private String bankName;
     private String bankBranch;
     private Integer invTot;
     private Set chTaxIntras = new HashSet(0);

    public PrTaxIntra() {
    }

    public PrTaxIntra(Integer invoiceNo, Date invoiceDate, String reverseCharge, String state, String code, String transportMode, String vehNo, Date dateOfSupply, String placeOfSupply, String billToName, String billToAddress, String billToGstin, String billTostate, String billToCode, String shipToName, String shipAddress, String shipToGstin, String shipToState, String shipToCode, Float prTotal, String totalInWords, String bankAc, String bankIfsc, String termsCond, String autharizedSign, Float totalQty, Float totalValBtax, Float totalValAtax, Float totalTaxval, Float totalCgstAmt, Float totalSgstAmt, Float gstReverseCharge, Float totalInv, String bankName, String bankBranch, Integer invTot, Set chTaxIntras) {
       this.invoiceNo = invoiceNo;
       this.invoiceDate = invoiceDate;
       this.reverseCharge = reverseCharge;
       this.state = state;
       this.code = code;
       this.transportMode = transportMode;
       this.vehNo = vehNo;
       this.dateOfSupply = dateOfSupply;
       this.placeOfSupply = placeOfSupply;
       this.billToName = billToName;
       this.billToAddress = billToAddress;
       this.billToGstin = billToGstin;
       this.billTostate = billTostate;
       this.billToCode = billToCode;
       this.shipToName = shipToName;
       this.shipAddress = shipAddress;
       this.shipToGstin = shipToGstin;
       this.shipToState = shipToState;
       this.shipToCode = shipToCode;
       this.prTotal = prTotal;
       this.totalInWords = totalInWords;
       this.bankAc = bankAc;
       this.bankIfsc = bankIfsc;
       this.termsCond = termsCond;
       this.autharizedSign = autharizedSign;
       this.totalQty = totalQty;
       this.totalValBtax = totalValBtax;
       this.totalValAtax = totalValAtax;
       this.totalTaxval = totalTaxval;
       this.totalCgstAmt = totalCgstAmt;
       this.totalSgstAmt = totalSgstAmt;
       this.gstReverseCharge = gstReverseCharge;
       this.totalInv = totalInv;
       this.bankName = bankName;
       this.bankBranch = bankBranch;
       this.invTot = invTot;
       this.chTaxIntras = chTaxIntras;
    }
   
    public Integer getPtId() {
        return this.ptId;
    }
    
    public void setPtId(Integer ptId) {
        this.ptId = ptId;
    }
    public Integer getInvoiceNo() {
        return this.invoiceNo;
    }
    
    public void setInvoiceNo(Integer invoiceNo) {
        this.invoiceNo = invoiceNo;
    }
    public Date getInvoiceDate() {
        return this.invoiceDate;
    }
    
    public void setInvoiceDate(Date invoiceDate) {
        this.invoiceDate = invoiceDate;
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
    public String getTransportMode() {
        return this.transportMode;
    }
    
    public void setTransportMode(String transportMode) {
        this.transportMode = transportMode;
    }
    public String getVehNo() {
        return this.vehNo;
    }
    
    public void setVehNo(String vehNo) {
        this.vehNo = vehNo;
    }
    public Date getDateOfSupply() {
        return this.dateOfSupply;
    }
    
    public void setDateOfSupply(Date dateOfSupply) {
        this.dateOfSupply = dateOfSupply;
    }
    public String getPlaceOfSupply() {
        return this.placeOfSupply;
    }
    
    public void setPlaceOfSupply(String placeOfSupply) {
        this.placeOfSupply = placeOfSupply;
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
    public String getBillTostate() {
        return this.billTostate;
    }
    
    public void setBillTostate(String billTostate) {
        this.billTostate = billTostate;
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
    public String getShipAddress() {
        return this.shipAddress;
    }
    
    public void setShipAddress(String shipAddress) {
        this.shipAddress = shipAddress;
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
    public String getAutharizedSign() {
        return this.autharizedSign;
    }
    
    public void setAutharizedSign(String autharizedSign) {
        this.autharizedSign = autharizedSign;
    }
    public Float getTotalQty() {
        return this.totalQty;
    }
    
    public void setTotalQty(Float totalQty) {
        this.totalQty = totalQty;
    }
    public Float getTotalValBtax() {
        return this.totalValBtax;
    }
    
    public void setTotalValBtax(Float totalValBtax) {
        this.totalValBtax = totalValBtax;
    }
    public Float getTotalValAtax() {
        return this.totalValAtax;
    }
    
    public void setTotalValAtax(Float totalValAtax) {
        this.totalValAtax = totalValAtax;
    }
    public Float getTotalTaxval() {
        return this.totalTaxval;
    }
    
    public void setTotalTaxval(Float totalTaxval) {
        this.totalTaxval = totalTaxval;
    }
    public Float getTotalCgstAmt() {
        return this.totalCgstAmt;
    }
    
    public void setTotalCgstAmt(Float totalCgstAmt) {
        this.totalCgstAmt = totalCgstAmt;
    }
    public Float getTotalSgstAmt() {
        return this.totalSgstAmt;
    }
    
    public void setTotalSgstAmt(Float totalSgstAmt) {
        this.totalSgstAmt = totalSgstAmt;
    }
    public Float getGstReverseCharge() {
        return this.gstReverseCharge;
    }
    
    public void setGstReverseCharge(Float gstReverseCharge) {
        this.gstReverseCharge = gstReverseCharge;
    }
    public Float getTotalInv() {
        return this.totalInv;
    }
    
    public void setTotalInv(Float totalInv) {
        this.totalInv = totalInv;
    }
    public String getBankName() {
        return this.bankName;
    }
    
    public void setBankName(String bankName) {
        this.bankName = bankName;
    }
    public String getBankBranch() {
        return this.bankBranch;
    }
    
    public void setBankBranch(String bankBranch) {
        this.bankBranch = bankBranch;
    }
    public Integer getInvTot() {
        return this.invTot;
    }
    
    public void setInvTot(Integer invTot) {
        this.invTot = invTot;
    }
    public Set getChTaxIntras() {
        return this.chTaxIntras;
    }
    
    public void setChTaxIntras(Set chTaxIntras) {
        this.chTaxIntras = chTaxIntras;
    }




}


