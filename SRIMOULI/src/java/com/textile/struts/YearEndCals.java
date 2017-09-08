/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.struts;

import com.opensymphony.xwork2.ActionSupport;
import com.textile.dto.FinancialYear;

import com.textile.manager.YearManager;
import com.textile.model.CurrentYear;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


/**
 *
 * @author Masrat
 */
public class YearEndCals extends ActionSupport{
    
    YearManager ym=new YearManager();
    FinancialYear fy=new FinancialYear();
   
    private Date datefrom,dateto;
    private String curdfrom,curdto;
    private List cyars=new ArrayList();
    private List avlyrs=new ArrayList();
    private String dtto,statuss;
    
    
     private static int id;

    public String getStatuss() {
        return statuss;
    }

    public void setStatuss(String statuss) {
        this.statuss = statuss;
    }

    public FinancialYear getFy() {
        return fy;
    }

    public void setFy(FinancialYear fy) {
        this.fy = fy;
    }
     
     

    public List getAvlyrs() {
        return avlyrs;
    }

    public void setAvlyrs(List avlyrs) {
        this.avlyrs = avlyrs;
    }
     
     

    public String getDtto() {
        return dtto;
    }

    public void setDtto(String dtto) {
        this.dtto = dtto;
    }

    

    public String getCurdfrom() {
        return curdfrom;
    }

    public void setCurdfrom(String curdfrom) {
        this.curdfrom = curdfrom;
    }

    public String getCurdto() {
        return curdto;
    }

    public void setCurdto(String curdto) {
        this.curdto = curdto;
    }

   
  
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
  

    public Date getDatefrom() {
        return datefrom;
    }

    public void setDatefrom(Date datefrom) {
        this.datefrom = datefrom;
    }

   
    public Date getDateto() {
        return dateto;
    }

    public void setDateto(Date dateto) {
        this.dateto = dateto;
    }

    public String avlbleYears() throws ParseException {
        try{
        this.cyars=ym.getCurDate();
        if(!cyars.isEmpty()){
            for(Object o:cyars){
                CurrentYear cy=(CurrentYear)o;
                this.curdfrom=cy.getDateFrom();
                this.curdto=cy.getDateTo();
                this.statuss=cy.getStatus();
                System.out.println("the status is-offf dddbbbbbb------------------------->"+statuss);
            }
        }
        else{
            this.curdfrom = ym.getDateFrom().toString();
            this.dtto="Continuing........";
            System.out.println("the date isssssssss in action of yeas is----------------.....----->"+curdfrom);
        }
       
        }catch(Exception e){
            System.out.println("the Exception in year end cals of available years-------------------->"+e);
        }
         this.avlyrs=ym.getAvlYears();
          String sg=curdfrom+" to continuing";
         if(cyars.isEmpty()){
                for(int i=0;i<avlyrs.size();i++){
                        String s=avlyrs.get(i).toString();
                        if(s.equals(sg)){
                            avlyrs.remove(i);
                              System.out.println("********---removing the year**********");
                        }
                }
              
         }
        
        
        
       // this.datefrom = ym.getDateFrom();
      //  this.dateto=ym.getDateTo();
        return "success";
    }
    public String closeCurrntYear() throws ClassNotFoundException, SQLException, IOException, InterruptedException{
       int x=123,y=123;String t=null,i=null;
        try{
            x=ym.createCopy();
            y=ym.closeCurrntYr();
            t=ym.truncTables();
            i=ym.insertInitials();
        }catch(Exception e){
            System.out.println("the Exception in year end cals of close current years-------------------->"+e);
        }
        if(x==0 && y==0 && t.equals("java.sql.SQLException: No data - zero rows fetched, selected, or processed") && i.equals("Initials are inserted"))
            return "forward";
        return "success";
    }
    public String yearlyRepts() throws IOException, InterruptedException, ClassNotFoundException, SQLException, ParseException{
        System.out.println("inside the yearly reports action--------------"+fy.getFinyear());
        int x=123;
        if(fy.getFinyear().equals("0")){
            avlbleYears();
             addFieldError("fy.finyear", " Please select Year to go to particular Financial Year ");
               return "fail";
        }
        if(getFy()!=null)
        x=ym.yearlyReports(getFy());
        if(x==0)
            return "forward";
      
        return "success";
    }
    
     @Override
     public String execute(){
         return "success";
     }
}
