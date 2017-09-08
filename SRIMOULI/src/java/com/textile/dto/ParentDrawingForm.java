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
 * @author NSG
 */
public class ParentDrawingForm 
{
    private Integer id;
    private Integer idd;
     private String date;
     private String date1;
     private String shifts;
     private String superviser;
     private Float totalEp;
     private Float totalAp;
     private Float totalEfficiency;
     private Set childDrawings = new HashSet(0);
     private List<String> carding;
     private List<Float> deliveryHank;
     private List<Float> mcSpeed;
     private List<Float> mcRunning;
     private List<Float> expectedProduction;
     private List<Float> actualProduction;
     private List<Float> efficiency;
     private List<String> breakedInShifts;
     private List<String> remarks;
     private List<Integer> empId;

    public Integer getIdd() {
        return idd;
    }

    public void setIdd(Integer idd) {
        this.idd = idd;
    }

    public List<String> getCarding() {
        return carding;
    }

    public void setCarding(List<String> carding) {
        this.carding = carding;
    }

    public String getDate1() {
        return date1;
    }

    public void setDate1(String date1) {
        this.date1 = date1;
    }

    
    public List<Float> getDeliveryHank() {
        return deliveryHank;
    }

    public void setDeliveryHank(List<Float> deliveryHank) {
        this.deliveryHank = deliveryHank;
    }
  
    public List<Float> getMcSpeed() {
        return mcSpeed;
    }

    public void setMcSpeed(List<Float> mcSpeed) {
        this.mcSpeed = mcSpeed;
    }

    public List<Float> getMcRunning() {
        return mcRunning;
    }

    public void setMcRunning(List<Float> mcRunning) {
        this.mcRunning = mcRunning;
    }

    public List<Float> getExpectedProduction() {
        return expectedProduction;
    }

    public void setExpectedProduction(List<Float> expectedProduction) {
        this.expectedProduction = expectedProduction;
    }

    

    public List<Float> getActualProduction() {
        return actualProduction;
    }

    public void setActualProduction(List<Float> actualProduction) {
        this.actualProduction = actualProduction;
    }

    public List<Float> getEfficiency() {
        return efficiency;
    }

    public void setEfficiency(List<Float> efficiency) {
        this.efficiency = efficiency;
    }

    public List<String> getBreakedInShifts() {
        return breakedInShifts;
    }

    public void setBreakedInShifts(List<String> breakedInShifts) {
        this.breakedInShifts = breakedInShifts;
    }

    public List<String> getRemarks() {
        return remarks;
    }

    public void setRemarks(List<String> remarks) {
        this.remarks = remarks;
    }

    public String getSuperviser() {
        return superviser;
    }

    public void setSuperviser(String superviser) {
        this.superviser = superviser;
    }

    public List<Integer> getEmpId() {
        return empId;
    }

    public void setEmpId(List<Integer> empId) {
        this.empId = empId;
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

    

    public String getShifts() {
        return shifts;
    }

    public void setShifts(String shifts) {
        this.shifts = shifts;
    }

    public Float getTotalEp() {
        return totalEp;
    }

    public void setTotalEp(Float totalEp) {
        this.totalEp = totalEp;
    }

    

    public Float getTotalAp() {
        return totalAp;
    }

    public void setTotalAp(Float totalAp) {
        this.totalAp = totalAp;
    }

    

    

    public Float getTotalEfficiency() {
        return totalEfficiency;
    }

    public void setTotalEfficiency(Float totalEfficiency) {
        this.totalEfficiency = totalEfficiency;
    }

    public Set getChildDrawings() {
        return childDrawings;
    }

    public void setChildDrawings(Set childDrawings) {
        this.childDrawings = childDrawings;
    }
     
     
}
