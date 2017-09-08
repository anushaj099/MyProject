/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.struts;

import com.opensymphony.xwork2.ActionSupport;
import com.textile.dto.Settingsdto;
import com.textile.manager.AddPurchaseManager;
import com.textile.manager.SettingsManager;
import com.textile.model.Login;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


public class SettingsAction extends ActionSupport{
    
    SettingsManager m=new SettingsManager();
     private static List ulist;
     private List list,total,total2,total3,list2,list3,glist;
    private static int id;
    private  List<String> loginTypeList = new ArrayList<>();
    private Settingsdto rf;
    private String sample[];
	 private static int ids;
         private int days;
           private AddPurchaseManager apm=new AddPurchaseManager();
    private List year=null;

    public List getYear() {
        return year;
    }

    public void setYear(List year) {
        this.year = year;
    }


    public int getDays() {
        return days;
    }

    public void setDays(int days) {
        this.days = days;
    }

    public List getGlist() {
        return glist;
    }

    public void setGlist(List glist) {
        this.glist = glist;
    }

    public String[] getSample() {
        return sample;
    }

    public void setSample(String[] sample) {
        this.sample = sample;
    }

    public int getIds() {
        return ids;
    }

    public void setIds(int ids) {
        this.ids = ids;
    }

    public List getTotal() {
        return total;
    }

    public List getTotal2() {
        return total2;
    }

    public void setTotal2(List total2) {
        this.total2 = total2;
    }

    public List getTotal3() {
        return total3;
    }

    public void setTotal3(List total3) {
        this.total3 = total3;
    }

    public List getList2() {
        return list2;
    }

    public void setList2(List list2) {
        this.list2 = list2;
    }

    public List getList3() {
        return list3;
    }

    public void setList3(List list3) {
        this.list3 = list3;
    }

    public void setTotal(List total) {
        this.total = total;
    }

    public List getList() {
        return list;
    }

    public void setList(List list) {
        this.list = list;
    }

    public List<String> getLoginTypeList() {
        return loginTypeList;
    }

    public void setLoginTypeList(List<String> loginTypeList) {
        this.loginTypeList = loginTypeList;
    }

    
    
    public Settingsdto getRf() {
        return rf;
    }

    public void setRf(Settingsdto rf) {
        this.rf = rf;
    }
    

    public SettingsManager getM() {
        return m;
    }

    public void setM(SettingsManager m) {
        this.m = m;
    }

    public List getUlist() {
        return ulist;
    }

    public void setUlist(List ulist) {
        this.ulist = ulist;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    public SettingsAction()
    {
        m=new SettingsManager();
        ulist=new ArrayList<>();
        loginTypeList=new ArrayList<>();
    }
    public String example()
    {
        System.out.println("\n llllllllllllllll");
        loginTypeList= m.getLoginTypeList();
        return "success";
    }
   
    public String insertLogin()
    {
       
        try {
        if(rf.getUserName()!=null) {
            System.out.println("kgjg------------------................dfgg..................,---------------"+rf.getLoginType());
        m.insertLogin(getRf());
         glist=m.display();
        return "success";
        }
        }
        catch(NullPointerException e) {
            
        }
        //loginTypeList= m.getLoginTypeList();
        this.ulist=m.settingsList1(getId());
        return "fail";
    }
    public String efficiency(){
         try {
         this.ulist=m.settingsList1(getId());
         }
        catch(NullPointerException e) {
            
        }
        return "success";
    }
     public String getEfficy() throws ParseException{
          this.ulist=m.settingsList1(getId());
         try{
              if(rf.getDate().length()==0) {
                  System.out.println("the date in efficiendy...........");
                addFieldError("rf.date","From date should not be empty"); 
            }
               if(rf.getDate2().length()==0) {
                addFieldError("rf.date2","To date should not be empty"); 
            }
                if(rf.getEmpid()==null) {
                addFieldError("rf.empid","Employee Id should not be empty"); 
            }
                 if(rf.getPercent()==null) {
                addFieldError("rf.percent","Please enter Efficiency Percentage"); 
            }
                  if(rf.getModule().length()==0) {
                addFieldError("rf.module","Choose atleast one module"); 
            }
                 if(!m.empValidate(getRf())) {
                addFieldError("rf.empid","Please enter a valid Employee Id"); 
            }
                 Date d1 = new SimpleDateFormat("dd-MM-yyyy").parse(rf.getDate());
        Date d2 = new SimpleDateFormat("dd-MM-yyyy").parse(rf.getDate2());
         
         this.ulist=m.settingsList1(getId());
         String var[]=rf.getModule().split(", ");
         for(int i=0;i<var.length;i++){
             if(var[i].equals("Carding")){
                
         this.total=m.getParentEff(getRf());
         this.list=m.getEfficiency(getRf(),rf.getPercent());
         
             }
             if(var[i].equals("Drawing")){
         this.total2=m.getPatentEff2(getRf());
         this.list2=m.getEfficiency2(getRf(),rf.getPercent());
       
             }
             if(var[i].equals("Openend")){
          this.total3=m.getPatentEff3(getRf());
         this.list3=m.getEfficiency3(getRf(),rf.getPercent());
         
             }
         }
         this.days=m.getTotalDays(getRf(),rf.getPercent(),var);
             System.out.println("the total days are------------------>"+days);
         if(d1.after(d2))
         {
             addFieldError("rf.date2","From date must be less than To date"); 
         }
         else if(list.isEmpty()&&list2.isEmpty()&&list3.isEmpty()){
           addFieldError("rf.date"," Data not Exists");
         }
         }catch(Exception e){
             System.out.println("js----------------------------fjh"+e);
         }
         return "success";
     }
    
      public String settingsHome() {
           this.year=apm.getYear();
       loginTypeList= m.getLoginTypeList();
        this.ulist=m.settingsList1(getId());
        for(Object o:ulist) {
            Login l=(Login)o;
             System.out.println("type is---------"+l.getLoginType());
          if(l.getLoginType().equals("control"))
                        return "control";
          
        }
       
        return "success";
    }
      
    public String viewLogin()
    {
         this.year=apm.getYear();
       ulist=m.settingsList1(getId());
        System.out.println("\n bbbbbbbbbbbbbbbb"+getId());
       glist=m.display();
        return "success";
    }
          private static int idd;

    public  int getIdd() {
        return idd;
    }

    public void setIdd(int idd) {
        this.idd = idd;
    }
    
     public String editLogin()
    {
      System.out.println("\n bbbbbbbbbb..........bbbbbb"+getId());
        ulist=m.settingsList1(getId());
      System.out.println("\n bbbbbbbbbb.....row.....bbbbbb"+getIds());
         glist= m.editLogin(getIds());
          for (Object sub :  glist) 
                {
                    Login ep = (Login) sub;
                    String x=ep.getPartialType();
                     System.out.println("jksfh-----------...............------------"+x);
                     if(x!=null){
                     sample= x.split(", ");
                     }
                }
     
        return "success";
    }
     public String LoginDelete() 
    {
        ulist=m.settingsList1(getId());
        System.out.println("\n fffffffffffffffffff"+getId());
        m.deleteLgn(getIds()) ;
        glist=m.display();
        return "success";
    }
    
    private static int idm;

    public int getIdm() {
        return idm;
    }

    public void setIdm(int idm) {
        this.idm = idm;
    }
     
      public String loginUpdate()
    {
        System.out.println("\n kkkkkkkkkkkkkkkkkk"+getIds()+getId());
        ulist=m.settingsList1(getIdm());
        for(Object o:ulist) {
            Login l=(Login) o;
            System.out.println("#################"+l.getId());
        }
        System.out.println("Real ID isssssss"+idm);
        m.updateL(getRf());
        glist=m.display();
        return "success";
    }
    
      
      
      
private static int a,b,c,d,e;
    @Override
    public void validate() {
       
        this.ulist=m.settingsList1(getId());
         this.year=apm.getYear();
          glist= m.editLogin(getIds());
        try {
        System.out.println(".............................--fgh--.................."+rf.getLoginType());
        if(rf.getUserName().length() == 0 || rf.getUserName()==null) {
                
                a++;
                System.out.println("lkfhj-------------fjj----------"+rf.getUserName());
                    if (a % 2 != 0) {
                         addFieldError("rf.userName", "Please fill Username First");
                         
                    } else {
                        addFieldError("rf.userName", "");
                       a = 0;
                    }
            }
        
        else {

            if (rf.getPassword().length()== 0) {
                System.out.println("FFFFFFFFFFFFFFFFF");
                
                 b++;
                    if (b % 2 != 0) {
                         addFieldError("rf.password", "Password is required");
                         
                    } else {
                        addFieldError("rf.password", "");
                       b = 0;
                    }
            }
            
            if(rf.getLoginType().length()== 0) {
               
                 c++;
                    if (c % 2 != 0) {
                         addFieldError("rf.loginType", "Please select Login Type");
                         
                    } else {
                        addFieldError("rf.loginType", "");
                       c = 0;
                    }
            }
      
             if(rf.getDesignation().length()==0) {
               
                 d++;
                    if (d % 2 != 0) {
                         addFieldError("rf.designation", "Please select Designation");
                         
                    } else {
                        addFieldError("rf.designation", "");
                       d = 0;
                    }
            }
        }
        }
        catch(NullPointerException e) {
            
        }
        
    }
      
}
