/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.struts;

import com.opensymphony.xwork2.ActionSupport;
import com.textile.manager.BackupManager;
import com.textile.manager.LoginManager;
import com.textile.manager.PackingManager;
import com.textile.manager.PowerManager;
import com.textile.manager.StockManager;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Swathi
 */
public class Backupaction extends ActionSupport{
    private List ulist=new ArrayList();
    private List ulist1=new ArrayList();
    private List list=new ArrayList();
    private List list1=new ArrayList();
    private List productlist=new ArrayList();
    private List countlist=new ArrayList();
    private static Date startdate,enddate;
    BackupManager bpm=new BackupManager();
    PowerManager pm=new PowerManager();
    private static int id;
    private String yearend,backupdate;
    private  String fyear;
    private  String module;
    private int purchaseid=0;
    private List superList=new ArrayList();
    private LoginManager umanager=new LoginManager();
    private StockManager sm=new StockManager();
    private PackingManager m = new PackingManager();


    public List getCountlist() {
        return countlist;
    }

    public void setCountlist(List countlist) {
        this.countlist = countlist;
    }

    public List getSuperList() {
        return superList;
    }

    public void setSuperList(List superList) {
        this.superList = superList;
    }

    public List getProductlist() {
        return productlist;
    }

    public void setProductlist(List productlist) {
        this.productlist = productlist;
    }

    public Date getStartdate() {
        return startdate;
    }

    public void setStartdate(Date startdate) {
        this.startdate = startdate;
    }

    public Date getEnddate() {
        return enddate;
    }

    public void setEnddate(Date enddate) {
        this.enddate = enddate;
    }

    public int getPurchaseid() {
        return purchaseid;
    }

    public void setPurchaseid(int purchaseid) {
        this.purchaseid = purchaseid;
    }

    public List getList1() {
        return list1;
    }

    public void setList1(List list1) {
        this.list1 = list1;
    }

    public List getList() {
        return list;
    }

    public void setList(List list) {
        this.list = list;
    }

    public String getFyear() {
        return fyear;
    }

    public void setFyear(String fyear) {
        this.fyear = fyear;
    }

    public String getModule() {
        return module;
    }

    public void setModule(String module) {
        this.module = module;
    }

    public List getUlist1() {
        return ulist1;
    }

    public void setUlist1(List ulist1) {
        this.ulist1 = ulist1;
    }

    public String getYearend() {
        return yearend;
    }

    public void setYearend(String yearend) {
        this.yearend = yearend;
    }

    public String getBackupdate() {
        return backupdate;
    }

    public void setBackupdate(String backupdate) {
        this.backupdate = backupdate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public List getUlist() {
        return ulist;
    }

    public void setUlist(List ulist) {
        this.ulist = ulist;
    }
    
    public String endyear()
    {
        this.ulist=bpm.ulist(getId());
        System.out.println("id isssssss**********"+getId());
        return "success";
    }
    private Date shiftexists;
    private int xyz=0;

    public int getXyz() {
        return xyz;
    }

    public void setXyz(int xyz) {
        this.xyz = xyz;
    }
    public Date getShiftexists() {
        return shiftexists;
    }

    public void setShiftexists(Date shiftexists) {
        this.shiftexists = shiftexists;
    }
    public String endDate()
    {
          xyz=456;
          try {
        this.ulist=bpm.ulist(getId());
        this.ulist1=bpm.shiftExists();
        shiftexists=bpm.getDd();
        System.out.println("&&&&&&&&&&&&&&&"+shiftexists);
        if(yearend.length()!=0) {
            bpm.deleteyearEnd();
        bpm.endYear(getYearend());
        return "success";
        }
          }
          catch(Exception e) {
              
          }
        return "input";
    }
    public String backtab() {
        this.ulist=bpm.ulist(getId());
        System.out.println("id isssssss**********"+getId());
        return "success";
    }
    public String backdate() {
    try {
        this.ulist=bpm.ulist(getId());
        System.out.println("id isssssss**********"+getId());
        this.ulist1=bpm.shiftExists();
        shiftexists=bpm.getDd();
        System.out.println("&&&&&&&&&&&&&&&"+shiftexists);
     }
         catch(Exception e) {
             e.printStackTrace();
         }
    
        return "success";
    }
    
    public String yearlyTab() {
        try {
         this.ulist=bpm.ulist(getId());
         this.ulist1=bpm.Dates();
         }
         catch(Exception e) {
             e.printStackTrace();
         }
        return "success";
    }

    public String yearRt() {
           this.ulist=bpm.ulist(getId());
         System.out.println("kkkkkkkkkk");
           this.ulist1=bpm.Dates();
           try {
            bpm.yearRt(getFyear(),getModule());
              startdate=bpm.getStartdate();
            enddate=bpm.getEnddate();
          if(fyear.equals("-1") || module.equals("-1")) {
              if(fyear.equals("-1")) {
              addFieldError("fyear","Please select Year");
              }
              else if(module.equals("-1")) {
                 addFieldError("module","Please select a module");  
              }
           }
          
          else {  
         if(module.equals("Purchase")) {
             purchaseid=8;
           
            System.out.println("starting year is"+startdate);
            return "purchase";
         }
         else if(module.equals("Issue to Department")) {
              purchaseid=8;
             
            System.out.println("starting year is"+startdate);
             return "department";
         }
         else if(module.equals("Issue to Precleaning")) {
              purchaseid=8;
            System.out.println("starting year is"+startdate);
             return "preclean";
         }
          else if(module.equals("Wastage")) {
              purchaseid=8;
            System.out.println("starting year is"+startdate);
             return "waste";
         }
          else if(module.equals("Sale")) {
            purchaseid=8;
            System.out.println("starting year is"+startdate);
             return "sale";
         }
          else if(module.equals("Stock Report")) {
            purchaseid=8;
              productlist=sm.getProductlist();
            System.out.println("starting year is"+startdate);
             return "stock";
         }
          else if(module.equals("Carding")) {
              purchaseid=8;
            superList = umanager.getSuperviser();
            System.out.println("starting year is"+startdate);
             return "carding";
         }
         else if(module.equals("Drawing")) {
              purchaseid=8;
            superList = umanager.getSuperviser();
            System.out.println("starting year is"+startdate);
             return "drawing";
         }
          else if(module.equals("Open End")) {
            purchaseid=8;
             countlist = umanager.getCount();
            System.out.println("starting year is"+startdate);
             return "oe";
         }
          else if(module.equals("Quality")) {
            purchaseid=8;
             countlist = umanager.getCount();
            System.out.println("starting year is"+startdate);
             return "quality";
         }
         else if(module.equals("Power")) {
            purchaseid=8;
              superList=pm.getSuperviser();
            System.out.println("starting year is"+startdate);
             return "power";
         }
          else if(module.equals("Packing")) {
              purchaseid=8;
             this.superList = m.packerList();
            countlist = m.countList1();
            System.out.println("starting year is"+startdate);
             return "Packing";
         }
          else if(module.equals("Dispatch")) {
              purchaseid=8;
              countlist = m.countList1();
            System.out.println("starting year is"+startdate);
             return "dispatch";
         }
          else if(module.equals("Packing StockReport")) {
            purchaseid=8;
            countlist = m.countList1();
            System.out.println("count list isss"+countlist);
            System.out.println("starting year is"+startdate);
            return "packstock";
         } 
         else if(module.equals("Ready to Pack")) {
            purchaseid=8;
            countlist = m.countList1();
            System.out.println("count list isss"+countlist);
            System.out.println("starting year is"+startdate);
            return "readypack";
         }
          }
           }
           catch(Exception e) {
               
           }
           return "success";
        }
    
    //Bakcup startsssssssssssss
    
    public  String BackupTab() throws IOException  {
        try {
         this.ulist=bpm.ulist(getId());
         bpm.backuppurchase();
         bpm.backupHiber();
         bpm.dataBackup();
       
         System.out.println("ddddddddddd");
        }
        catch(Exception e) {
            
        }
        return "success";
    }
    
    public String backupInsert() {
       try {
           this.ulist=bpm.ulist(getId());
          if (backupdate.length() == 0) {
                addFieldError("backupdate", "Please  select Date");
            }
          else {
              bpm.deletebackupYear();
              bpm.backupYear(getBackupdate());
              purchaseid=44;
              return "backup";
          }
       }
       catch(Exception e) {
           
       }
        return "success";
    }
    
    
    
    
    
    
    
    
    
    
    @Override
    public void validate() {
        try {
             this.ulist1=bpm.shiftExists();
             shiftexists=bpm.getDd();
              if (yearend.length() == 0) {
                addFieldError("yearend", "Please  select Date");
            }
        }
        catch(Exception e) {
            
        }
     
    }
    
}
