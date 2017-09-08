/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.dto;

import java.util.List;

/**
 *
 * @author ch.mounika
 */
public class pcleaning {
     private int id;
    private String date;
    private String date1;
    private String shifts;
    private String superviser;
    private int totalWeight;
    private int totalMixing;
    private int totalBales;
     private List<Integer> list;
     private String wholeday;
       private String mixingNumber;
     private String issueNumber;
     
     
     
      private List<String> variety;
      private List<Integer> weight;

    public List<Integer> getWeight() {
        return weight;
    }

    public void setWeight(List<Integer> weight) {
        this.weight = weight;
    }
      
      

    public List<String> getVariety() {
        return variety;
    }

    public void setVariety(List<String> variety) {
        this.variety = variety;
    }
      

    public String getMixingNumber() {
        return mixingNumber;
    }

    public void setMixingNumber(String mixingNumber) {
        this.mixingNumber = mixingNumber;
    }

    public String getIssueNumber() {
        return issueNumber;
    }

    public void setIssueNumber(String issueNumber) {
        this.issueNumber = issueNumber;
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

    

    public int getTotalWeight() {
        return totalWeight;
    }

    public void setTotalWeight(int totalWeight) {
        this.totalWeight = totalWeight;
    }

    public int getTotalMixing() {
        return totalMixing;
    }

    public void setTotalMixing(int totalMixing) {
        this.totalMixing = totalMixing;
    }

    public int getTotalBales() {
        return totalBales;
    }

    public void setTotalBales(int totalBales) {
        this.totalBales = totalBales;
    }

    public List<Integer> getList() {
        return list;
    }

    public void setList(List<Integer> list) {
        this.list = list;
    }

    public String getWholeday() {
        return wholeday;
    }

    public void setWholeday(String wholeday) {
        this.wholeday = wholeday;
    }
     
     
     
}
