/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.dto;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 *
 * @author ch.mounika
 */

/**
 * ParentGdProduction generated by hbm2java
 */
public class ptcleaningDto  implements java.io.Serializable{
     private int id;
    
     private String date;
    
     private String shifts;
     private String superviser;
     private Float totalWeight;
     private Float totalMixing;
     private Float totalTotalBales;
     private String mixingNumber;
     private int issueNumber;
     private Set childGdPrecleaning = new HashSet(0);
      private List<String> variety;
     private List<Float> weight;
     private List<Float> mixing;
     private List<Float> TotalBales;
     private String productName;

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }
     
     public ptcleaningDto(){
         
     }
  
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

   
    

    public String getShifts() {
        return shifts;
    }

    public void setShifts(String shifts) {
        this.shifts = shifts;
    }

    public String getSuperviser() {
        return superviser;
    }

    public void setSuperviser(String superviser) {
        this.superviser = superviser;
    }

    public String getMixingNumber() {
        return mixingNumber;
    }

    public void setMixingNumber(String mixingNumber) {
        this.mixingNumber = mixingNumber;
    }

    public int getIssueNumber() {
        return issueNumber;
    }

    public void setIssueNumber(int issueNumber) {
        this.issueNumber = issueNumber;
    }

   
    

   

    public Float getTotalWeight() {
        return totalWeight;
    }

    public void setTotalWeight(Float totalWeight) {
        this.totalWeight = totalWeight;
    }

    public Float getTotalMixing() {
        return totalMixing;
    }

    public void setTotalMixing(Float totalMixing) {
        this.totalMixing = totalMixing;
    }

   

    public Float getTotalTotalBales() {
        return totalTotalBales;
    }

    public void setTotalTotalBales(Float totalTotalBales) {
        this.totalTotalBales = totalTotalBales;
    }

    public Set getChildGdPrecleaning() {
        return childGdPrecleaning;
    }

    public void setChildGdProductions(Set childGdPrecleaning) {
        this.childGdPrecleaning = childGdPrecleaning;
    }

    public List<String> getVariety() {
        return variety;
    }

    public void setVariety(List<String> variety) {
        this.variety = variety;
    }

    public List<Float> getWeight() {
        return weight;
    }

    public void setWeight(List<Float> weight) {
        this.weight = weight;
    }

    public List<Float> getMixing() {
        return mixing;
    }

    public void setMixing(List<Float> mixing) {
        this.mixing = mixing;
    }

   
   

    public List<Float> getTotalBales() {
        return TotalBales;
    }

    public void setTotalBales(List<Float> TotalBales) {
        this.TotalBales = TotalBales;
    }

   
    
}
