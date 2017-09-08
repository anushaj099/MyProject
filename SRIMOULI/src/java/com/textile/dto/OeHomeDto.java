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
public class OeHomeDto {
     private int id;
     private int ido;
     private String date;
     private String date1;
     private String shifts;
     private String superviser;
     private Float totalEp;
     private Float totalAp;
     private float totalEfcy;
     // private String totalBkg;
     private float totalHpEfcy;
     private Set childOpenend = new HashSet(0);
     
     private List<String> openEnd;
     private List<Integer> count;
     private List<Float> countMaintain;
     private List<Double> mcSpeed;
     private List<Float> tm;
     private List<Double> mcRunning;
     private List<Float> expectedProduction;
     private List<Float> actualProduction;
     private List<Float> efficiency;
     private List<String> breakeges;
     private List<Float> hundredPercentEfcy;
     private List<String> remarks;
     private List<Integer> empId;

    public int getIdo() {
        return ido;
    }

    public void setIdo(int ido) {
        this.ido = ido;
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

    public float getTotalEfcy() {
        return totalEfcy;
    }

    public void setTotalEfcy(float totalEfcy) {
        this.totalEfcy = totalEfcy;
    }

   

    public float getTotalHpEfcy() {
        return totalHpEfcy;
    }

    public void setTotalHpEfcy(float totalHpEfcy) {
        this.totalHpEfcy = totalHpEfcy;
    }

    public Set getChildOpenend() {
        return childOpenend;
    }

    public void setChildOpenend(Set childOpenend) {
        this.childOpenend = childOpenend;
    }

    public List<String> getOpenEnd() {
        return openEnd;
    }

    public void setOpenEnd(List<String> openEnd) {
        this.openEnd = openEnd;
    }

    public List<Integer> getCount() {
        return count;
    }

    public void setCount(List<Integer> count) {
        this.count = count;
    }

    public List<Float> getCountMaintain() {
        return countMaintain;
    }

    public void setCountMaintain(List<Float> countMaintain) {
        this.countMaintain = countMaintain;
    }

    public List<Double> getMcSpeed() {
        return mcSpeed;
    }

    public void setMcSpeed(List<Double> mcSpeed) {
        this.mcSpeed = mcSpeed;
    }

    public List<Float> getTm() {
        return tm;
    }

    public void setTm(List<Float> tm) {
        this.tm = tm;
    }

    public List<Double> getMcRunning() {
        return mcRunning;
    }

    public void setMcRunning(List<Double> mcRunning) {
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

    public List<String> getBreakeges() {
        return breakeges;
    }

    public void setBreakeges(List<String> breakeges) {
        this.breakeges = breakeges;
    }

    public List<Float> getHundredPercentEfcy() {
        return hundredPercentEfcy;
    }

    public void setHundredPercentEfcy(List<Float> hundredPercentEfcy) {
        this.hundredPercentEfcy = hundredPercentEfcy;
    }

    public List<String> getRemarks() {
        return remarks;
    }

    public void setRemarks(List<String> remarks) {
        this.remarks = remarks;
    }

    public List<Integer> getEmpId() {
        return empId;
    }

    public void setEmpId(List<Integer> empId) {
        this.empId = empId;
    }

   
    
     
     
     
    
}
