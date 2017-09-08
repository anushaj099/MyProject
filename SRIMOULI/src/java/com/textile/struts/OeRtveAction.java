/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.struts;

import com.opensymphony.xwork2.ActionSupport;
import com.textile.dto.OeHomeDto;

import com.textile.manager.OeRtveManager;
import com.textile.model.ChildOpenend;
import com.textile.model.FinancialYearBackup;

import com.textile.model.ParentOpenend;
import com.textile.util.HibernateUtil;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author ch.mounika
 */
public class OeRtveAction extends ActionSupport {

    OeRtveManager orm = new OeRtveManager();
    private OeHomeDto ort;
    List<ParentOpenend> list;
    List<ChildOpenend> list1 = new ArrayList();
    private int purchaseid = 0;
    private Date startdate, enddate;

    public List<ChildOpenend> getList1() {
        return list1;
    }

    public int getPurchaseid() {
        return purchaseid;
    }

    public void setPurchaseid(int purchaseid) {
        this.purchaseid = purchaseid;
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

    public void setList1(List<ChildOpenend> list1) {
        this.list1 = list1;
    }

    List ulist;

    public List getUlist() {
        return ulist;
    }

    public void setUlist(List ulist) {
        this.ulist = ulist;
    }

    private String date, date1;
    private String employeeId;
    private String shifts, count;
    private static int id;
    private List countlist = new ArrayList();

    public List getCountlist() {
        return countlist;
    }

    public void setCountlist(List countlist) {
        this.countlist = countlist;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCount() {
        return count;
    }

    public void setCount(String count) {
        this.count = count;
    }

    public OeRtveManager getOrm() {
        return orm;
    }

    public void setOrm(OeRtveManager orm) {
        this.orm = orm;
    }

    public OeHomeDto getOrt() {
        return ort;
    }

    public String getDate1() {
        return date1;
    }

    public void setDate1(String date1) {
        this.date1 = date1;
    }

    public void setOrt(OeHomeDto ort) {
        this.ort = ort;
    }

    public List<ParentOpenend> getList() {
        return list;
    }

    public void setList(List<ParentOpenend> list) {
        this.list = list;
    }

    public String getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(String employeeId) {
        this.employeeId = employeeId;
    }

    public String getShifts() {
        return shifts;
    }

    public void setShifts(String shifts) {
        this.shifts = shifts;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public OeRtveAction() {
        orm = new OeRtveManager();

    }

    private int abcd = 0;

    public int getAbcd() {
        return abcd;
    }

    public void setAbcd(int abcd) {
        this.abcd = abcd;
    }

    public String retrieveOe() throws ParseException {

        this.ulist=orm.openendList1(getId());
        
          abcd=3;
          try
         {
        
        
         System.out.println("+++++++++"+getOrt());
         System.out.println("================"+list);
         
         
         if(ort.getDate().length()==0) {
                addFieldError("ort.date","From date Should not be Empty"); 
            }
            if(ort.getDate1().length()==0) {
                addFieldError("ort.date1","To date Should not be Empty"); 
            }
         list=orm.RetriveOe(getOrt());
         System.out.println("list issssssss pppppppppppp");
        // list1=orm.RetrieveOe1(getOrt());
         // System.out.println("list issssssss pppppppppppp"+list1);
         Date d1 = new SimpleDateFormat("dd-MM-yyyy").parse(ort.getDate());
         Date d2 = new SimpleDateFormat("dd-MM-yyyy").parse(ort.getDate1());
         if(d1.after(d2))
         {
             addFieldError("ort.date1","From date must be lessthan To date"); 
         }
         else  if(ort.getShifts().equals("-1")) {
                addFieldError("ort.shifts","Shift should not be empty"); 
            }
        else if(list.isEmpty()){
           addFieldError("ort.date"," Data not Exists");
        }
         
         }
         catch(Exception e)
         {
          System.out.println("Exception caught"+e); 
         }
         return "success";
    }

    private String machines;

    public String getMachines() {
        return machines;
    }

    public void setMachines(String machines) {
        this.machines = machines;
    }

    public String retrieveOe1() throws ParseException {

       this.ulist=orm.openendList1(getId());
         countlist=orm.getCount();System.out.println("\n gjdasgdihwdkwsd"+countlist);
        abcd=3;
          try
         {
        
        
         System.out.println("+++++++++"+getOrt());
         System.out.println("================"+list);
         
         
         if(ort.getDate().length()==0) {
                addFieldError("ort.date","From date Should not be Empty"); 
            }
            if(ort.getDate1().length()==0) {
                addFieldError("ort.date1","To date Should not be Empty"); 
            }
        list1=orm.retrievemain1(getOrt(),getMachines(),getCount());
        list=orm.DrawingParent(ort);
         System.out.println("list issssssss pppppppppppp");
        // list1=orm.RetrieveOe1(getOrt());
         // System.out.println("list issssssss pppppppppppp"+list1);
         Date d1 = new SimpleDateFormat("dd-MM-yyyy").parse(ort.getDate());
         Date d2 = new SimpleDateFormat("dd-MM-yyyy").parse(ort.getDate1());
         if(d1.after(d2))
         {
             addFieldError("ort.date1","From date must be lessthan To date"); 
         }
//         else  if(getMachines().equals("-1")) 
//         {
//                addFieldError("machines","Please Choose A Machine"); 
//         }
        if(ort.getShifts().equals("-1"))
         {
              addFieldError("ort.shifts","Shift should not be empty"); 
         }
         if(getCount().equals("-1"))
         {
             addFieldError("count", "Please select count");
         }
        else if(list.isEmpty() || list1.isEmpty()){
           addFieldError("ort.date"," Data not Exists");
        }
         
         }
         catch(Exception e)
         {
          System.out.println("Exception caught"+e); 
          e.printStackTrace();
         }
        
        
         System.out.println("list issss"+list1);
         
         
         
         
         return "success";
    }

}
