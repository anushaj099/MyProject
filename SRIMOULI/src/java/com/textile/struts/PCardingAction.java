/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.struts;

import com.opensymphony.xwork2.ActionSupport;
import com.textile.dto.ParentCardingDTO;
import com.textile.manager.PCardingManager;
import com.textile.model.FinancialYearBackup;
import java.text.ParseException;
import com.textile.model.ParentCarding;
import com.textile.util.HibernateUtil;
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
 * @author anusha
 */
public class PCardingAction  extends ActionSupport
{
    PCardingManager m;
    private ParentCardingDTO form;
   private List<String> superList=new ArrayList<>();
   private List list1=new ArrayList<>();
   private int purchaseid=0;
   private Date startdate,enddate;

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

    public List getList1() {
        return list1;
    }

    public void setList1(List list1) {
        this.list1 = list1;
    }

    public List<String> getSuperList() {
        return superList;
    }

    public void setSuperList(List<String> superList) {
        this.superList = superList;
    }
   
   
    private static int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public ParentCardingDTO getForm() {
        return form;
    }

    public void setForm(ParentCardingDTO form) {
        this.form = form;
    }
    
    List<ParentCarding> list;
    List ulist;

    public List getUlist() {
        return ulist;
    }

    public void setUlist(List ulist) {
        this.ulist = ulist;
    }
    private String employeeId;
    private String date;
    private String date1;
    private String shifts;

    public String getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(String employeeId) {
        this.employeeId = employeeId;
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

    
    public String getShifts() {
        return shifts;
    }

    public void setShifts(String shifts) {
        this.shifts = shifts;
    }
    

    public List<ParentCarding> getList() {
        return list;
    }

    public void setList(List<ParentCarding> list) {
        this.list = list;
    }
    
    
    public PCardingManager getM() {
        return m;
    }

    public void setM(PCardingManager m) {
        this.m = m;
    }
    public PCardingAction()
    {
        m=new PCardingManager();
        
        ulist=new ArrayList();
    }
    private int abcd=0;

    public int getAbcd() {
        return abcd;
    }

    public void setAbcd(int abcd) {
        this.abcd = abcd;
    }
    public String retrieve() throws ParseException
    {
          abcd=1;
        this.ulist=m.cardingList1(getId());
         try
       {
       System.out.println("++++++++++++++++++++++++++++++++++++++++++++>" +list);
        superList=m.getSuperviser();
       
        System.out.println("is is"+getId());
         if(form.getDate().length()==0) {
                addFieldError("form.date","From date Should not be Empty"); 
            }
            if(form.getDate1().length()==0) {
                addFieldError("form.date1","To date Should not be Empty"); 
            }
         list=m.Retrieve(getForm());    
        Date d1 = new SimpleDateFormat("dd-MM-yyyy").parse(form.getDate());
        Date d2 = new SimpleDateFormat("dd-MM-yyyy").parse(form.getDate1());
         if(d1.after(d2))
         {
             addFieldError("form.date1","From date must be lessthan To date"); 
         }
         
       else  if(form.getShifts().equals("-1")) {
                addFieldError("form.shifts","Shift should not be empty"); 
            }
        else if(list.isEmpty()){
           addFieldError("form.date"," Data not Exists");
        }
       }
       catch(Exception e)
       {
           
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
    
    
    public String retrievemain() throws ParseException{
         abcd=1;
         System.out.println("listtttttttt isssssssss"+list1);
       superList=m.getSuperviser();
       System.out.println("listtt of supervisor  issss"+superList);
       System.out.println("");
         this.ulist=m.cardingList1(getId());
       try{
        
       if(form.getDate().length()==0) {
                addFieldError("form.date","From date Should not be Empty"); 
            }
            if(form.getDate1().length()==0) {
                addFieldError("form.date1","To date Should not be Empty"); 
            }
        list=m.CardingParent(getForm());   
        list1=m.retrievemain1(getForm(),getMachines());
         
        Date d1 = new SimpleDateFormat("dd-MM-yyyy").parse(form.getDate());
        Date d2 = new SimpleDateFormat("dd-MM-yyyy").parse(form.getDate1());
         if(d1.after(d2))
         {
             addFieldError("form.date1","From date must be lessthan To date"); 
         }
         
         
         
      
        else if(list.isEmpty()){
           addFieldError("form.date"," Data not Exists");
        }
       }
       catch(Exception e){
           
       }
       
        
       // System.out.println("listttt off carding"+superList);
        
        return "success";
    }
    
    
    
    
}
