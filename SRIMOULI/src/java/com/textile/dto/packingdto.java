/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.dto;

import java.util.Date;
import java.util.List;

/**
 *
 * @author anusha
 */
public class packingdto {
     private Integer id;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Float getOpeningStock() {
        return openingStock;
    }

    public void setOpeningStock(Float openingStock) {
        this.openingStock = openingStock;
    }

    public Float getPackedBags() {
        return packedBags;
    }

    public void setPackedBags(Float packedBags) {
        this.packedBags = packedBags;
    }

    public Float getDispatch() {
        return dispatch;
    }

    public void setDispatch(Float dispatch) {
        this.dispatch = dispatch;
    }

    public Float getClosing() {
        return closing;
    }

    public void setClosing(Float closing) {
        this.closing = closing;
    }

    public Float getTotalOpeningStock() {
        return totalOpeningStock;
    }

    public void setTotalOpeningStock(Float totalOpeningStock) {
        this.totalOpeningStock = totalOpeningStock;
    }
     private Integer idpq;
     private String date;
     private String shifts;
     private String superviser;
     private String supervisor;

    public String getSupervisor() {
        return supervisor;
    }

    public void setSupervisor(String supervisor) {
        this.supervisor = supervisor;
    }
     
     private String date1;

    public String getDate1() {
        return date1;
    }

    public void setDate1(String date1) {
        this.date1 = date1;
    }
     
    public String getSuperviser() {
        return superviser;
    }

    public void setSuperviser(String superviser) {
        this.superviser = superviser;
    }

    public Integer getIdpq() {
        return idpq;
    }

    public void setIdpq(Integer idpq) {
        this.idpq = idpq;
    }

     private String evocher;

    public String getEvocher() {
        return evocher;
    }

    public void setEvocher(String evocher) {
        this.evocher = evocher;
    }
     
     private String count;
     private Float openingStock;
     private Float packedBags;
     private List<Float> noofKgsPacked;
     private Float dispatch;
     private Float closing;
     private Float totalOpeningStock;
     private Float totalPackedBags;
     private Float totalNoofkgsPacked;
     private Float totalDispatch;
     private Float totalDisclose;
     private List<Float> dis;
     private List<String> count1;
     private List<Float> open;
     private List<Float> pack;
     private List<Float> close;
     private List<Integer> countdb;
     private List<String> boxtype;
     private List<String> weight;
     private String pattern;

    public String getPattern() {
        return pattern;
    }

    public void setPattern(String pattern) {
        this.pattern = pattern;
    }

    public List<Integer> getCountdb() {
        return countdb;
    }

    public void setCountdb(List<Integer> countdb) {
        this.countdb = countdb;
    }

    public List<String> getBoxtype() {
        return boxtype;
    }

    public void setBoxtype(List<String> boxtype) {
        this.boxtype = boxtype;
    }

    public List<String> getWeight() {
        return weight;
    }

    public void setWeight(List<String> weight) {
        this.weight = weight;
    }
    public List<Float> getDis() {
        return dis;
    }

    public void setDis(List<Float> dis) {
        this.dis = dis;
    }

    public List<String> getCount1() {
        return count1;
    }

    public void setCount1(List<String> count1) {
        this.count1 = count1;
    }

    public List<Float> getOpen() {
        return open;
    }

    public void setOpen(List<Float> open) {
        this.open = open;
    }

    public List<Float> getPack() {
        return pack;
    }

    public void setPack(List<Float> pack) {
        this.pack = pack;
    }

    public List<Float> getClose() {
        return close;
    }

    public void setClose(List<Float> close) {
        this.close = close;
    }

    public List<Float> getNoofKgsPacked() {
        return noofKgsPacked;
    }

    public void setNoofKgsPacked(List<Float> noofKgsPacked) {
        this.noofKgsPacked = noofKgsPacked;
    }


    public Float getTotalPackedBags() {
        return totalPackedBags;
    }

    public void setTotalPackedBags(Float totalPackedBags) {
        this.totalPackedBags = totalPackedBags;
    }

    public Float getTotalNoofkgsPacked() {
        return totalNoofkgsPacked;
    }

    public void setTotalNoofkgsPacked(Float totalNoofkgsPacked) {
        this.totalNoofkgsPacked = totalNoofkgsPacked;
    }
   
    public Float getTotalDispatch() {
        return totalDispatch;
    }

    public void setTotalDispatch(Float totalDispatch) {
        this.totalDispatch = totalDispatch;
    }

    public Float getTotalDisclose() {
        return totalDisclose;
    }

    public void setTotalDisclose(Float totalDisclose) {
        this.totalDisclose = totalDisclose;
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

   

    public String getCount() {
        return count;
    }

    public void setCount(String count) {
        this.count = count;
    }

   
    
}
