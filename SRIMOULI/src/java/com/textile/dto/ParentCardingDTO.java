/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.dto;

/**
 *
 * @author anusha
 */
public class ParentCardingDTO 
{
    private int id;
    private int idc;

    public int getIdc() {
        return idc;
    }

    public void setIdc(int idc) {
        this.idc = idc;
    }
     private String date;
     private String date1;
     private String shifts;
     private Float totalActualProduction;
     private Float totalExpectedProduction;
     private Float totalEfficiency;
     private String day;
     private String superviser;

    public String getSuperviser() {
        return superviser;
    }

    public void setSuperviser(String superviser) {
        this.superviser = superviser;
    }
     

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
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

    public Float getTotalActualProduction() {
        return totalActualProduction;
    }

    public void setTotalActualProduction(Float totalActualProduction) {
        this.totalActualProduction = totalActualProduction;
    }

    public Float getTotalExpectedProduction() {
        return totalExpectedProduction;
    }

    public void setTotalExpectedProduction(Float totalExpectedProduction) {
        this.totalExpectedProduction = totalExpectedProduction;
    }

    


    public Float getTotalEfficiency() {
        return totalEfficiency;
    }

    public void setTotalEfficiency(Float totalEfficiency) {
        this.totalEfficiency = totalEfficiency;
    }
     
    
}
