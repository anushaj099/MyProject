/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.struts;

import com.opensymphony.xwork2.ActionSupport;
import com.textile.dto.countform;
import com.textile.manager.AddPurchaseManager;
import com.textile.manager.CountManager;
import com.textile.model.Counts;
import java.util.List;

/**
 *
 * @author nsg
 */
public class CountAction extends ActionSupport{
    CountManager m=new CountManager();
    private String count;
    private countform l;
     private static List ulist;
      private static int id;
      private static int idm;
       private List year=null;
  private AddPurchaseManager apm=new AddPurchaseManager();
    public List getYear() {
        return year;
    }

    public void setYear(List year) {
        this.year = year;
    }

    public int getIdm() {
        return idm;
    }

    public void setIdm(int idm) {
        this.idm = idm;
    }
      
      List countlist;
      private static int id1;

    public int getId1() {
        return id1;
    }

    public void setId1(int id1) {
        this.id1 = id1;
    }
      

    public List getCountlist() {
        return countlist;
    }

    public void setCountlist(List countlist) {
        this.countlist = countlist;
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

    public countform getL() {
        return l;
    }

    public void setL(countform l) {
        this.l = l;
    }

    public CountManager getM() {
        return m;
    }

    public void setM(CountManager m) {
        this.m = m;
    }

    public String getCount() {
        return count;
    }

    public void setCount(String count) {
        this.count = count;
    }
  
    public String countsinsert(){
        Counts c=new Counts();
     System.out.println("insertion completed");
      this.ulist=m.settingsList1(getId());
        this.year=apm.getYear();
    
      try {
          System.out.println("<<<<<<<<<<<<<<<<<<<");
          String pepsi=l.getCount();
         int c1=0;
          //  int c1=9;
           System.out.println("poooooooooooooooooooo"+l.getCount());
           if(!pepsi.equals("")) {
                 c1=Integer.valueOf(pepsi);
           }
             
        //  this.countlist=m.retrieve();
       if(l.getCount().length()==0) {
               addFieldError("l.count","Please Enter Count");
          }
         else if(m.countvalidate(l.getCount())){
                addFieldError("l.count","Already exists");
          }
         else if(!(c1>2 && c1<40))
         {
             addFieldError("l.count","Count should be greater than 2 and lessthan 40");
         }
         
          else {
             System.out.println("jjjjjjjj");
                 m.insertcount(getL());
                 this.countlist=m.retrieve();
              
                return "success";
          }
        }
      catch(Exception e) {
          System.out.println("exceptionnnnnnnnnnnnn");
     }
    System.out.println("8888888888888888888888"+ulist);
     return "fail";
    }
    
    
    
    public String retrievecount(){
         this.year=apm.getYear();
        System.out.println(getId());
        try {
     this.ulist=m.settingsList1(getId());
     this.countlist=m.retrieve();
      System.out.println("data retrieved isssssss"+countlist);
       }
         catch(Exception e) {
             e.printStackTrace();
         }
     return "success";
     
 }
 
 public String deleteCount()
 {
  try {
  System.out.println("hhhhhhhh"+getId());
  this.ulist=m.settingsList1(getId());
    m.deletecount(getIdm());
  countlist=m.retrieve();
     System.out.println("pppppppppppp"+countlist);
      }
         catch(Exception e) {
             e.printStackTrace();
         }
     return "success";
 }

    

  
}


