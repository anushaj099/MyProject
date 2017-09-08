/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.dto;

import com.textile.model.Superviser;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;




/**
 *
 * @author NSG
 */
public class ParentQualityForm 
{
    private Integer id;
   private Integer idq;
     private Superviser superviser;
     private String date;
     private String superViser;
     private String shifts;
     private String testType;
     private Set childQualities = new HashSet(0);
     private List<String> machines;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
      
      
     private List<Integer> count;
     private List<Float> countmaintained;
     private List<Float> csp;
     private List<Float> cv;
     private List<Float> strengthCv;
     private List<Float> minus50EveryDay;
     private List<Float> plus50EveryDay;
     private List<Float> plus280everyDay;
     private List<Float> ipi;
     private List<String> remarks;

  
    public Integer getIdq() {
        return idq;
    }

    public void setIdq(Integer idq) {
        this.idq = idq;
    }

    public Superviser getSuperviser() {
        return superviser;
    }

    public void setSuperviser(Superviser superviser) {
        this.superviser = superviser;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getSuperViser() {
        return superViser;
    }

    public void setSuperViser(String superViser) {
        this.superViser = superViser;
    }

    public String getShifts() {
        return shifts;
    }

    public void setShifts(String shifts) {
        this.shifts = shifts;
    }

    public String getTestType() {
        return testType;
    }

    public void setTestType(String testType) {
        this.testType = testType;
    }

    public Set getChildQualities() {
        return childQualities;
    }

    public void setChildQualities(Set childQualities) {
        this.childQualities = childQualities;
    }

    public List<String> getMachines() {
        return machines;
    }

    public void setMachines(List<String> machines) {
        this.machines = machines;
    }

    public List<Integer> getCount() {
        return count;
    }

    public void setCount(List<Integer> count) {
        this.count = count;
    }

   
    public List<Float> getCountmaintained() {
        return countmaintained;
    }

    public void setCountmaintained(List<Float> countmaintained) {
        this.countmaintained = countmaintained;
    }

    public List<Float> getCsp() {
        return csp;
    }

    public void setCsp(List<Float> csp) {
        this.csp = csp;
    }

    public List<Float> getCv() {
        return cv;
    }

    public void setCv(List<Float> cv) {
        this.cv = cv;
    }

    public List<Float> getStrengthCv() {
        return strengthCv;
    }

    public void setStrengthCv(List<Float> strengthCv) {
        this.strengthCv = strengthCv;
    }

    public List<Float> getMinus50EveryDay() {
        return minus50EveryDay;
    }

    public void setMinus50EveryDay(List<Float> minus50EveryDay) {
        this.minus50EveryDay = minus50EveryDay;
    }

    public List<Float> getPlus50EveryDay() {
        return plus50EveryDay;
    }

    public void setPlus50EveryDay(List<Float> plus50EveryDay) {
        this.plus50EveryDay = plus50EveryDay;
    }

    public List<Float> getPlus280everyDay() {
        return plus280everyDay;
    }

    public void setPlus280everyDay(List<Float> plus280everyDay) {
        this.plus280everyDay = plus280everyDay;
    }

    public List<Float> getIpi() {
        return ipi;
    }

    public void setIpi(List<Float> ipi) {
        this.ipi = ipi;
    }

    public List<String> getRemarks() {
        return remarks;
    }

    public void setRemarks(List<String> remarks) {
        this.remarks = remarks;
    }

             
}
