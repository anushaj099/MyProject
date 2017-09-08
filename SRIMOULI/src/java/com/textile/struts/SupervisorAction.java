/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.struts;

import com.opensymphony.xwork2.ActionSupport;
import com.textile.dto.SupervisorForm;
import com.textile.manager.AddPurchaseManager;
import com.textile.manager.SupervisorManager;
import com.textile.model.Login;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author nsg
 */
public class SupervisorAction extends ActionSupport{
    SupervisorManager smm=new SupervisorManager();
    private String name;
    private SupervisorForm form;
    private List ulist;
    private List superviserlist;
    private int id1;
     private AddPurchaseManager apm=new AddPurchaseManager();
    private List year=null;

    public List getYear() {
        return year;
    }

    public void setYear(List year) {
        this.year = year;
    }

    public int getId1() {
        return id1;
    }

    public void setId1(int id1) {
        this.id1 = id1;
    }
    

    public List getSuperviserlist() {
        return superviserlist;
    }

    public void setSuperviserlist(List superviserlist) {
        this.superviserlist = superviserlist;
    }
    

    public List getUlist() {
        return ulist;
    }

    public void setUlist(List ulist) {
        this.ulist = ulist;
    }

   

    public SupervisorManager getSmm() {
        return smm;
    }

    public void setSmm(SupervisorManager smm) {
        this.smm = smm;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public SupervisorForm getForm() {
        return form;
    }

    public void setForm(SupervisorForm form) {
        this.form = form;
    }

    public SupervisorAction() {
        ulist=new ArrayList();
    }
    private static int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    
    public String insertsupervisor(){
       
        this.ulist=smm.settingsList1(getId());
         this.year=apm.getYear();
        System.out.println("9999999999999999999999999" +ulist);
        
        System.out.println("77777777777777777777777777777777" +getId());
        try {
        if(form.getName().length()==0) {
            
       addFieldError("form.name","Please Enter Name");
        }
         else if(smm.countvalidate(form.getName())){
                addFieldError("form.name","Already exists");
          }
        
       
        
      /*  else if(!(form.getName().matches("^[a-zA-Z]*$"))){
            addFieldError("form.name","Please Enter only alphabets");
        }*/
        
        else {
        smm.insert2(getForm());
        this.superviserlist=smm.retrieve1(getId()); 
        return "success";
        }
        }
        catch(NullPointerException e) {
            
        }
        return "fail";
    }
    public String goback()
    {
        this.ulist=smm.settingsList1(getId());
        System.out.println(getId());
        System.out.println(ulist);
        return "success";
    } 
    
    public String settingsHome() {
        
      // loginTypeList= m.getLoginTypeList();
        this.ulist=smm.settingsList1(getId());
        this.year=apm.getYear();
        for(Object o:ulist) {
            Login l=(Login)o;
             System.out.println("type is---------"+l.getLoginType());
          if(l.getLoginType().equals("control"))
                        return "control";
          
        }
       
        return "success";
    }
    
     public String usersettingsHome() {
        
      // loginTypeList= m.getLoginTypeList();
         System.out.println("inside the new user superviser action-----------");
        this.ulist=smm.settingsList1(getId());
        this.year=apm.getYear();
        for(Object o:ulist) {
            Login l=(Login)o;
             System.out.println("type is---------"+l.getLoginType());
          if(l.getLoginType().equals("control"))
                        return "control";
          
        }
       
        return "success";
    }
    

  
    public String retrievesuperviser(){
         this.year=apm.getYear();
        smm.insert2(getForm());
        this.ulist=smm.settingsList1(getId());
        System.out.println("vcdxgbcfg"+getId());
        this.superviserlist=smm.retrieve1(getId());
        System.out.println("tdyutadfuy"+getId());
        return "success";
    }
  
    

    
    public String deletesuperviser(){
       
        System.out.println("hgdfahgsfgh"+getId1());
        
      
        smm.delete1(getId1());
         this.superviserlist=smm.retrieve1(getId());
        this.ulist=smm.settingsList1(getId());
        return "success";
    
    }
     public String Reset()  {
        super.clearErrorsAndMessages(); 
        return "success";
    }
    
    
    
    
}
