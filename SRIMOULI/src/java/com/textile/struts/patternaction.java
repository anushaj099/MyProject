/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.struts;

import com.opensymphony.xwork2.ActionSupport;
import com.textile.dto.patternform;
import com.textile.manager.AddPurchaseManager;
import com.textile.manager.patternmanager;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author nsg
 */
public class patternaction extends ActionSupport{
    private patternmanager pm=new patternmanager();

     private patternform form;
     private  static int a,b,c,d,e,f;
     private  List ulist=new ArrayList();
    private static int idp;
     private AddPurchaseManager apm=new AddPurchaseManager();
    private List year=null;

    public List getYear() {
        return year;
    }

    public void setYear(List year) {
        this.year = year;
    }
    public int getIdp() {
        return idp;
    }

    public void setIdp(int idp) {
        this.idp = idp;
    }
    


    public List getUlist() {
        return ulist;
    }

    public void setUlist(List ulist) {
        this.ulist = ulist;
    }
     private List patternlist=new ArrayList();

    public List getPatternlist() {
        return patternlist;
    }

    public void setPatternlist(List patternlist) {
        this.patternlist = patternlist;
    }
     private static  int id;
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

   

    public patternform getForm() {
        return form;
    }

    public void setForm(patternform form) {
        this.form = form;
    }

   

    public patternmanager getPm() {
        return pm;
    }

    public void setPm(patternmanager pm) {
        this.pm = pm;
    }
    public patternaction(){
        pm=new patternmanager();
    }
  
    
    public String patterninsert(){
        System.out.println("fsdghfdhHJDGahg");
       this.ulist=pm.settingsList1(getId());
        try{
            this.ulist=pm.settingsList1(getId());
            patternlist=pm.editpatterns(idp);
            if(getForm().getConWeight()==null){
                a++;
                if(a%2!=0){
                    addFieldError("form.conWeight","please enter con weight");
                }
                else{
                    addFieldError("form.conWeight","");
                    a=0;
                }
            }
            if(form.getNoOfCones()==null){
                   b++;
                if(b%2!=0){
                    addFieldError("form.noOfCones","please enter  no of cones ");
                }
                else{
                    addFieldError("form.noOfCones","");
                    b=0;
                }
            }
            if(form.getWeight()==null){
                    d++;
                    if(d%2!=0){
                        addFieldError("form.Weight","Please enter weight");
                    }
                    else{
                        addFieldError("form.Weight","");
                        d=0;
                    }
            }
            if(form.getTareWeight()==null){
                   
                    
                    c++;
                if(c%2!=0){
                    addFieldError("form.tareWeight","please enter  Tare weight");
                }
                else{
                    addFieldError("form.tareWeight","");
                    c=0;
                }
                
                    
                }
            
             if(form.getPackType().equals("")){
                   
                    
                    e++;
                if(e%2!=0){
                    addFieldError("form.packType","please enter  Pack Type");
                }
                else{
                    addFieldError("form.packType","");
                    e=0;
                }
                
                    
                }
           
          
           
          
            
            pm.insertp(getForm());
            this.patternlist=pm.retrieve();
            return "success";
        }
        catch(Exception e){
            System.out.println("Exception caught"+e);
        }
        return "input";
     }
    
    public String retrievepattern()
    {
        this.year=apm.getYear();
        System.out.println("))))))))))))))))"+getId());
        this.ulist=pm.settingsList1(getId());
        System.out.println("***************"+ulist);
        this.patternlist=pm.retrieve();
        System.out.println("PPPPPPPPPPPPPPPPPPPPPPPP"+getId());
        return "success";
    }
    
    public String deletepattern()
    {
         this.ulist=pm.settingsList1(getId());
         pm.delete1(getIdp());
         patternlist=pm.retrieve();
         return "success";
    }
    
   public String editpattern()
   {
        this.ulist=pm.settingsList1(getId());
       patternlist=pm.editpatterns(idp);
       System.out.println("\n idp is:"+idp);
       return "success";
   }
    
    public String updatep()
    {
        try{
        pm.updatepattern(getForm(),getIdp());
        this.ulist=pm.settingsList1(getId());
        patternlist=pm.retrieve();
        }
        catch(Exception e)
        {
            
        }
        return "success";
        
    }
    
    
    
    public void validate(){
        try{
            this.ulist=pm.settingsList1(getId());
            patternlist=pm.editpatterns(idp);
              this.year=apm.getYear();
            if(getForm().getConWeight()==null){
                
                a++;
                if(a%2!=0){
                    addFieldError("form.conWeight","please enter con weight");
                }
                else{
                    addFieldError("form.conWeight","");
                    a=0;
                }
            }
               
                if(form.getNoOfCones()==null){
                   
                    
                    b++;
                if(b%2!=0){
                    addFieldError("form.noOfCones","please enter  no of cones ");
                }
                else{
                    addFieldError("form.noOfCones","");
                    b=0;
                }
                
                    
                }
                
                
                if(form.getWeight()==null){
                    d++;
                    if(d%2!=0){
                        addFieldError("form.Weight","Please enter weight");
                    }
                    else{
                        addFieldError("form.Weight","");
                        d=0;
                    }
                }
                
               if(form.getTareWeight()==null){
                   
                    
                    c++;
                if(c%2!=0){
                    addFieldError("form.tareWeight","please enter  Tare weight");
                }
                else{
                    addFieldError("form.tareWeight","");
                    c=0;
                }
                
                    
                }
               
                if(form.getPackType().equals("")){
                   
                    
                    e++;
                if(e%2!=0){
                    addFieldError("form.packType","please enter  Pack Type");
                }
                else{
                    addFieldError("form.packType","");
                    e=0;
                }
                
                    
                }
                
                
                 if(!pm.exists(getForm())){
                   
                    
                    f++;
                if(f%2!=0){
                    addFieldError("form.conWeight","Pattern already exists. Please choose another one");
                }
                else{
                    addFieldError("form.conWeight","");
                    f=0;
                }
                
                    
                }
           
          
           
          
            
        }
        catch(Exception e){
            System.out.println("Exception caught"+e);
        }
        
        
    }
    
    
}
