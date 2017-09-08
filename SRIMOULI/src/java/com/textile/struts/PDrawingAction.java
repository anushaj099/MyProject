/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.struts;

import com.opensymphony.xwork2.ActionSupport;
import com.textile.dto.ParentDrawingForm;
import com.textile.manager.PDrawingManager;
import com.textile.model.ChildDrawing;
import com.textile.model.FinancialYearBackup;
import com.textile.model.ParentDrawing;
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
 * @author NSG
 */
public class PDrawingAction extends ActionSupport {
    
    
    private PDrawingManager pdm;
    private ParentDrawingForm form1;
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
   
    
      private static int id;

    public ParentDrawingForm getForm1() {
        return form1;
    }

    public void setForm1(ParentDrawingForm form1) {
        this.form1 = form1;
    }

 

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
      
      private List<String> superList=new ArrayList<>();

    public List<String> getSuperList() {
        return superList;
    }

    public void setSuperList(List<String> superList) {
        this.superList = superList;
    }
      List<ParentDrawing> list;
      List<ChildDrawing> list1;

    public List<ChildDrawing> getList1() {
        return list1;
    }

    public void setList1(List<ChildDrawing> list1) {
        this.list1 = list1;
    }

   
      
      List ulist;

    public List getUlist() {
        return ulist;
    }

    public void setUlist(List ulist) {
        this.ulist = ulist;
    }

   
      
    private String employeeId;
    private String date,date1,machines;
    private String shifts;

    public String getMachines() {
        return machines;
    }

    public void setMachines(String machines) {
        this.machines = machines;
    }

    
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

    public PDrawingManager getPdm() {
        return pdm;
    }

    public void setPdm(PDrawingManager pdm) {
        this.pdm = pdm;
    }

    public List<ParentDrawing> getList() {
        return list;
    }

    public void setList(List<ParentDrawing> list) {
        this.list = list;
    }

       private int abcd=0;

    public int getAbcd() {
        return abcd;
    }

    public void setAbcd(int abcd) {
        this.abcd = abcd;
    }
    
    public PDrawingAction() {
        pdm=new PDrawingManager();
        ulist=new ArrayList();
    }
    
    public String drawingRetrieve() throws ParseException{
         superList=pdm.getSuperviser();
        this.ulist=pdm.drawingList1(getId());
          abcd=2;
         try
        {
      
        System.out.println("++++++++++++++++++++++++++++++++++++++++++++>" +list);
       
         System.out.println("is is"+getId());
         if(form1.getDate().length()==0) {
                addFieldError("form1.date","From date Should not be Empty"); 
            }
            if(form1.getDate1().length()==0) {
                addFieldError("form1.date1","To date Should not be Empty"); 
            }
          list=pdm.DrawingRetrieve(getForm1());   
         Date d1 = new SimpleDateFormat("dd-MM-yyyy").parse(form1.getDate());
         Date d2 = new SimpleDateFormat("dd-MM-yyyy").parse(form1.getDate1());
         if(d1.after(d2))
         {
             addFieldError("form1.date1","From date must be lessthan To date"); 
         }
         
         else  if(form1.getShifts().equals("-1")) {
                addFieldError("form1.shifts","Shift should not be empty"); 
            }
        else if(list.isEmpty()){
           addFieldError("form1.date"," Data not Exists");
        }
        }
        catch(Exception e)
        {
            
        }
        return "success";
    }
    public String drawingRetrievemain() throws ParseException{
         superList=pdm.getSuperviser();
        this.ulist=pdm.drawingList1(getId());
          abcd=2;
         try
        {
      
        System.out.println("++++++++++++++++++++++++++++++++++++++++++++>" +list);
       
         System.out.println("is is"+getId());
         if(form1.getDate().length()==0) {
                addFieldError("form1.date","From date Should not be Empty"); 
            }
            if(form1.getDate1().length()==0) {
                addFieldError("form1.date1","To date Should not be Empty"); 
            }
          list1=pdm.DrawingRetrieveMain(getForm1(),getMachines()); 
          list=pdm.DrawingParent(getForm1());
          
            System.out.println("kjdfhh----------djk.......ldkjg----------"+list1);
            System.out.println("\n cvvcvcvvvcvcv"+getMachines());
          
         Date d1 = new SimpleDateFormat("dd-MM-yyyy").parse(form1.getDate());
         Date d2 = new SimpleDateFormat("dd-MM-yyyy").parse(form1.getDate1());
         if(d1.after(d2))
         {
             addFieldError("form1.date1","From date must be lessthan To date"); 
         }
         else if(getMachines().equals("-1"))
         {
             addFieldError("machines","Please Select Machine");
         }
         else if(form1.getShifts().equals("-1"))
         {
             addFieldError("form1.shifts","Please Select Shift"); 
         }
        else if(list1.isEmpty()){
           addFieldError("form1.date"," Data not Exists");
        }
        }
        catch(Exception e)
        {
            
        }
        return "success";
    }
    
   
}
