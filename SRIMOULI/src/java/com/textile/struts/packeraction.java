/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.struts;

import com.opensymphony.xwork2.ActionSupport;
import com.textile.dto.packernameform;
import com.textile.manager.AddPurchaseManager;
import com.textile.manager.PackerManager;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author nsg
 */
public class packeraction  extends ActionSupport{
    
    PackerManager p=new PackerManager();
    private String packerName;
    private packernameform form;
    private List ulist;
    private List packerlist;
    private static int c,d;
     private AddPurchaseManager apm=new AddPurchaseManager();
    private List year=null;

    public List getYear() {
        return year;
    }

    public void setYear(List year) {
        this.year = year;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    private static int id;

    public PackerManager getP() {
        return p;
    }

    public void setP(PackerManager p) {
        this.p = p;
    }

    public String getPackerName() {
        return packerName;
    }

    public void setPackerName(String packerName) {
        this.packerName = packerName;
    }

    public packernameform getForm() {
        return form;
    }

    public void setForm(packernameform form) {
        this.form = form;
    }

    public List getUlist() {
        return ulist;
    }

    public void setUlist(List ulist) {
        this.ulist = ulist;
    }

    public List getPackerlist() {
        return packerlist;
    }

    public void setPackerlist(List packerlist) {
        this.packerlist = packerlist;
    }

    public int getIdn() {
        return idn;
    }

    public void setIdn(int idn) {
        this.idn = idn;
    }
    private int idn;
    
    
    
    public packeraction(){
        
        ulist=new ArrayList();
    }
    
    public String insertpacker(){
        
         this.ulist=p.settingsList1(getId());
          this.year=apm.getYear();
         try{
              //this.ulist=p.settingsList1(getId());
               if(!p.exists(getForm())){
               d++;
                    if (d % 2 != 0) {
                        addFieldError("form.packerName","Packer already exists");
                         
                    } else {
                        addFieldError("form.packerName", "");
                       d = 0;
                    }
              
          } 
         else if(form.getPackerName().length()==0){
               c++;
                    if (c % 2 != 0) {
                        addFieldError("form.packerName","Please Enter packer name");
                         
                    } else {
                        addFieldError("form.packerName", "");
                       c = 0;
                    }
              
          } 
          else{
              
              
       
        p.insert2(getForm());
        System.out.println("xsghfsaghda"+idn);
        this.packerlist=p.retrieve1();
        return "success";
         }
         }
         catch(Exception e){
             System.out.println("Exception caught"+e);
         }
         return "input";
         
    }
    
    public String retrievepacker(){
           this.year=apm.getYear();
        p.insert2(getForm());
        this.ulist=p.settingsList1(getId());
        System.out.println("vcdxgbcfg"+getId());
        this.packerlist=p.retrieve1();
        System.out.println("tdyutadfuy"+getId());
        return "success";
    }
  
     public String deletepacker(){
       
        this.ulist=p.settingsList1(getId());
        p.delete1(getIdn());
        packerlist=p.retrieve1();
        return "success";
    
    }
     
     
    
    
    
}
