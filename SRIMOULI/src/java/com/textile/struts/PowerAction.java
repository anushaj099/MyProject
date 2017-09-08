/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.struts;

import com.opensymphony.xwork2.ActionSupport;
import com.textile.dto.PowerDTO;
import com.textile.manager.AddPurchaseManager;
import com.textile.manager.PowerManager;
import com.textile.manager.YearManager;
import com.textile.model.FinancialYearBackup;
import com.textile.model.Login;
import com.textile.model.Powerunits;
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
 * @author anusha
 */
public class PowerAction extends ActionSupport{
    private List plist;
    private PowerDTO form;
    private PowerManager pm;
    private List superList;
    private static int idp;
    private static int id;
    private Date startdate,enddate;
      private AddPurchaseManager apm=new AddPurchaseManager();
       YearManager ym=new YearManager();
    private List year=null;

    public List getYear() {
        return year;
    }

    public void setYear(List year) {
        this.year = year;
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
   
    private List ulist;

    public List getUlist() {
        return ulist;
    }

    public void setUlist(List ulist) {
        this.ulist = ulist;
    }
    

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

   
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    

    public int getIdp() {
        return idp;
    }

    public void setIdp(int idp) {
        this.idp = idp;
    }

    public List getSuperList() {
        return superList;
    }

    public void setSuperList(List superList) {
        this.superList = superList;
    }
    

    
    

    public List getPlist() {
        return plist;
    }

    public void setPlist(List plist) {
        this.plist = plist;
    }

    public PowerDTO getForm() {
        return form;
    }

    public void setForm(PowerDTO form) {
        this.form = form;
    }

    public PowerManager getPm() {
        return pm;
    }

    public void setPm(PowerManager pm) {
        this.pm = pm;
    }
    private static String date,superv,shift;

    public static String getSuperv() {
        return superv;
    }

    public static void setSuperv(String superv) {
        PowerAction.superv = superv;
    }

    public static String getShift() {
        return shift;
    }

    public static void setShift(String shift) {
        PowerAction.shift = shift;
    }
    
    public PowerAction()
    {
        plist=new ArrayList();
        pm=new PowerManager();
        list=new ArrayList();
    }
    private int purchaseid=0;

    public int getPurchaseid() {
        return purchaseid;
    }

    public void setPurchaseid(int purchaseid) {
        this.purchaseid = purchaseid;
    }
    public String retrievePower()
    {
        try {
        abcd=6;
         this.year=apm.getYear();
        this.ulist=pm.powerList(getId());
        plist=pm.retrieve();
        purchaseid=1000;
        System.out.println("list issssssss"+plist);
        superList=pm.getSuperviser();
         }
         catch(Exception e) {
             e.printStackTrace();
         }
        return "success";
    }
   
    public String deletePower()
    {
      try {
       abcd=6;
        pm.delete(getIde());
        this.ulist=pm.powerList(getId());
         plist=pm.retrieve();
          }
         catch(Exception e) {
             e.printStackTrace();
         }
        return "success";
    }
    private String status;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
   
     private static String shifts;
     private static String superviser;

    public static String getShifts() {
        return shifts;
    }

    public static void setShifts(String shifts) {
        PowerAction.shifts = shifts;
    }

    public static String getSuperviser() {
        return superviser;
    }

    public static void setSuperviser(String superviser) {
        PowerAction.superviser = superviser;
    }
    int abcd;

    public int getAbcd() {
        return abcd;
    }

    public void setAbcd(int abcd) {
        this.abcd = abcd;
    }
    private static int ide;

    public int getIde() {
        return ide;
    }

    public void setIde(int ide) {
        this.ide = ide;
    }
    
     private List dlist=new ArrayList();

    public List getDlist() {
        return dlist;
    }

    public void setDlist(List dlist) {
        this.dlist = dlist;
    }
    private Date shift_date=null;

    public Date getShift_date() {
        return shift_date;
    }

    public void setShift_date(Date shift_date) {
        this.shift_date = shift_date;
    }
 public String executepower() throws ParseException
    {
        
       abcd = 6;
          String b = "Shift 2";
        String a = "Shift 1";
        String c = "Shift 3";
         System.out.println(getId());
         this.ulist=pm.powerList(getId());
         Powerunits pc=new Powerunits();
         superList = pm.getSuperviser();
         this.dlist=pm.shiftExists();
          this.year=apm.getYear();
        boolean val = false;
        try {
        if(form.getDate().length()==0) {
             status="12345";
            this.ulist=pm.powerList(getId());
             superList = pm.getSuperviser();
             addFieldError("form.date", "Please Fill Date first");
           // this.clist=cm.packingvallist(getPcard());
        }
        
        else {
            
            String d1=form.getDate();
            SimpleDateFormat sf1= new SimpleDateFormat("dd-MM-yy");
            Date doj1=sf1.parse(d1);
            System.out.println("MMMMMMMMMMMM"+doj1);
          shift_date=pm.getDd();
                 System.out.println("NNNNNNNNNNNNN"+shift_date);
                 //inserted date is after shift date
                  if(shift_date!=null){
             if((doj1.compareTo(shift_date)>0) && (dlist.size()==1 || dlist.size()==2) ) {
                 status = "12345";
              addFieldError("form.date", "Please enter previous date Shifts");
                   }
                  }
            this.list = pm.powervallist(getForm());
            System.out.println("kdjgh------------dlgdj--kjhkh6464");
            if(form.getDate().length() == 0){
                status="12345";
                 addFieldError("form.date","Please Select Date");
            }
             this.year=apm.getYear();
       if(apm.dateCheck(form.getDate())){
           Date date=ym.getDateFrom();
            status="12345";
                       addFieldError("form.date","Year is already closed. Please select date from "+date);
                        
       }
            if(!pm.check(getForm())){
                status="12345";
                 addFieldError("form.date","Please select Date linearly");
            }
            if(form.getSuperviser().equals("-1")){
                status="12345";
                addFieldError("form.superviser","Please Select Superviser");
            }
             if(form.getShifts().equals("-1")){
                status="12345";
                addFieldError("form.shifts","Please Select Shift");
            }
             
             System.out.println("list is---------------" + list);
            for (Object o2 : list) {
                pc = (Powerunits) o2;
                System.out.println("data is---------------" + pc.getShifts());

            }
           
              if (list.isEmpty()) {
                  System.out.println("i am empty");
                if (form.getShifts().equals(b)) {
                    status = "12345";
                    addFieldError("form.shifts", "Please Insert Shift1 First");
                }
                if (form.getShifts().equals(c)) {
                    status = "12345";
                    addFieldError("form.shifts", "Please Insert Shift1 First");
                }
            }
              
            else if (list.size()==1) {
                if (pc.getShifts().equals(a)) {
                    if(form.getShifts().equals(c)) {
                        status="12345";
                        addFieldError("form.shifts", "Please Insert Shift2 First");
                    }
                    if(form.getShifts().equals(a)) {
                        status="12345";
                        addFieldError("form.shifts", "Shift1 already Exists");
                    }
                }
                if(pc.getShifts().equals(b)) {
                    if(form.getShifts().equals(c)) {
                        status="12345";
                        addFieldError("form.shifts", "Please Insert Shift2 First");
                    }
                     if(form.getShifts().equals(b)) {
                        status="12345";
                        addFieldError("form.shifts", "Shift1 already Exists");
                    }
                }
            }   
              
              else if(list.size()==2) {
                 if(form.getShifts().equals(a)) {
                        status="12345";
                        addFieldError("form.shifts", "Shift1 already Exists");
                    }
                  if(form.getShifts().equals(b)) {
                        status="12345";
                        addFieldError("form.shifts", "Shift2 already Exists");
                    }
            } 
              
               else if(list.size()==3) {
                 if(form.getShifts().equals(a)) {
                        status="12345";
                        addFieldError("form.shifts", "Shift1 already Exists");
                    }
                  if(form.getShifts().equals(b)) {
                        status="12345";
                        addFieldError("form.shifts", "Shift2 already Exists");
                    }
                  if(form.getShifts().equals(c)) {
                        status="12345";
                        addFieldError("form.shifts", "Shift3 already Exists");
                    }
           }
              
             
//        if(val){
//            status="12345";
//            System.out.println("\n bbbbbbbbbbbbb");
//            addFieldError("form.shifts","Shift already exists");
//            
//        }
        id=getId();
            System.out.println("dhgkhre-------------fhf"+status+id);
            
        }
     if(status==null){
            status="123";
           date=form.getDate();
           superviser=form.getSuperviser();
           shifts=form.getShifts();
           System.out.println("kdjgh+dare"+date+superviser+shifts);
        }
        }
        catch(Exception e) {
            
        }
        superList=pm.getSuperviser();
        return "input";
    }
    public String InsertPowerReal() throws ParseException{
        try {
         abcd=6;
         this.ulist=pm.powerList(getId());
       pm.insertPower(getForm(),date,superviser,shifts);
        plist=pm.retrieve();
        System.out.println("d456========ggfdg"+date+superviser+shifts);
        
        superList=pm.getSuperviser();
         }
         catch(Exception e) {
             e.printStackTrace();
         }
        return "success";
        
        
    }
    
    public String inReal(){
        try {
               this.year=apm.getYear();
     this.ulist=pm.powerList(getId());
     this.dlist=pm.shiftExists();
     shift_date=pm.getDd();
     abcd=6;
    superList=pm.getSuperviser();
     }
         catch(Exception e) {
             e.printStackTrace();
         }
    return "success";
}
 
    List list;
    private static int pow;

    public int getPow() {
        return pow;
    }

    public void setPow(int pow) {
        this.pow = pow;
    }

    public List getList() {
        return list;
    }

    public void setList(List list) {
        this.list = list;
    }
    
    public String editPower()
    {
        try {
        this.ulist=pm.powerList(getId());
        abcd=6;
        list=pm.editPower(getIde());
    //    pow=getId();
        superList=pm.getSuperviser();
         }
         catch(Exception e) {
             e.printStackTrace();
         }
        return "success";
    }
    public String updatePower()
    {
        try {
        abcd=6;
        this.ulist=pm.powerList(getId());
        System.out.println("kkkkkkkkkkkkkkkkkkkk");
        pm.powerUpdate(getForm(),getIde());
         superList=pm.getSuperviser();
          plist=pm.retrieve();
        System.out.println("llllllllllllll");
         }
         catch(Exception e) {
             e.printStackTrace();
         }
        return "success";
    }
    
    public String retrPower() throws ParseException {
        
        superList=pm.getSuperviser();
         abcd=6;
         this.ulist=pm.powerList(getId());
        try {
        
         if(form.getDate().length()==0 ){
                status="12345";
                 addFieldError("form.date","Please Select Valid From Date");
            }
         
         if(form.getDate1().length()==0 ){
                status="12345";
                 addFieldError("form.date1","Please Select Valid To Date");
            }
         list=pm.RetrivePower(getForm());
          Date d1 = new SimpleDateFormat("dd-MM-yyyy").parse(form.getDate());
            Date d2 = new SimpleDateFormat("dd-MM-yyyy").parse(form.getDate1());
            if(d1.after(d2))
            {
                  addFieldError("form.date1","From date must be less than To date"); 
            }
            
           else if(form.getShifts().equals("-1")) {
                addFieldError("form.shifts","Shift should not be empty"); 
            }
        else if(list.isEmpty()){
           addFieldError("form.date"," Data not Exists");
        } 
        }
        catch(Exception e) {
            
        }
          
         System.out.println("+++++++++"+getForm());
         System.out.println("================"+list);
         return "success";
     }
    
    public String retrievepower() {
        System.out.println("......-------******inside retrieve view power");
        purchaseid=1000;
          this.year=apm.getYear();
          System.out.println("*********--------the year in retrieve power is"+year);
         this.ulist=pm.powerList(getId());
         abcd=6;
          superList=pm.getSuperviser();
         return "success";
    }
    
    public String powerHome() {
        try {
        this.ulist=pm.powerList(getId());
        this.dlist=pm.shiftExists();
       shift_date=pm.getDd();
        for(Object o:ulist) {
            Login l=(Login)o;
             System.out.println("type is---------"+l.getLoginType());
            if(l.getLoginType().equals("electricity"))
                return "success";
            else  if(l.getLoginType().equals("control"))
                return "success";

        }
         }
         catch(Exception e) {
             e.printStackTrace();
         }
       return null;
    }

    
}
