/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.dto;

import com.textile.model.ChildQuality;

import java.io.Serializable;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


/**
 *
 * @author ch.mounika
 */
public class QualityRtve implements Serializable{
     private Integer id;
    // private Superviser superviser;
     private String date;
     private String date1;
     private String superName;
     private String shifts;
     private String mctype;
     

    public String getMctype() {
        return mctype;
    }

    public void setMctype(String mctype) {
        this.mctype = mctype;
    }
    
     private Set childQualities = new HashSet(0);
     private List<ChildQuality> list;

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

    public String getDate1() {
        return date1;
    }

    public void setDate1(String date1) {
        this.date1 = date1;
    }

    public String getSuperName() {
        return superName;
    }

    public void setSuperName(String superName) {
        this.superName = superName;
    }

    public String getShifts() {
        return shifts;
    }

    public void setShifts(String shifts) {
        this.shifts = shifts;
    }

    public Set getChildQualities() {
        return childQualities;
    }

    public void setChildQualities(Set childQualities) {
        this.childQualities = childQualities;
    }

    public List<ChildQuality> getList() {
        return list;
    }

    public void setList(List<ChildQuality> list) {
        this.list = list;
    }

  
    
   
    
     
     
     
     
     
     
}
