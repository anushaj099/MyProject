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
public class WastageDto {
    
     private int id;
     private String date;
     private String date1;
     private String receipt;
     private Float totalWeight;
    private Float totalBales;
    private Set childGdWastage = new HashSet(0);
      private List<String> variety;
     private List<Float> weight;
     private List<Float> noofBales;
     
     
     public WastageDto(){
         
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

    public String getDate1() {
        return date1;
    }

    public void setDate1(String date1) {
        this.date1 = date1;
    }

    public String getReceipt() {
        return receipt;
    }

    public void setReceipt(String receipt) {
        this.receipt = receipt;
    }

    public Float getTotalWeight() {
        return totalWeight;
    }

    public void setTotalWeight(Float totalWeight) {
        this.totalWeight = totalWeight;
    }

    public Float getTotalBales() {
        return totalBales;
    }

    public void setTotalBales(Float totalBales) {
        this.totalBales = totalBales;
    }

    public Set getChildGdWastage() {
        return childGdWastage;
    }

    public void setChildGdWastage(Set childGdWastage) {
        this.childGdWastage = childGdWastage;
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

    public List<Float> getNoofBales() {
        return noofBales;
    }

    public void setNoofBales(List<Float> noofBales) {
        this.noofBales = noofBales;
    }
    
     
}
