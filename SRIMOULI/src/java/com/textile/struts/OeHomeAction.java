/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.struts;

import com.opensymphony.xwork2.ActionSupport;
import com.textile.dto.OeHomeDto;
import com.textile.manager.AddPurchaseManager;
import com.textile.manager.OeHomeManager;
import com.textile.manager.YearManager;
import com.textile.model.FinancialYearBackup;
import com.textile.model.Login;
import com.textile.model.ParentOpenend;
import com.textile.util.HibernateUtil;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author ch.mounika
 */
public class OeHomeAction  extends ActionSupport{
      private OeHomeDto oe;
    private OeHomeManager om=new OeHomeManager();
    private List ulist;
     private List list;
     private List glist;
      private List glist0t;
    private List<String> superList=new ArrayList<>();
    private static int id;
    private int id1;
    private static int ido;
     private AddPurchaseManager apm=new AddPurchaseManager();
     YearManager ym=new YearManager();
    private List year=null;

    public List getYear() {
        return year;
    }

    public void setYear(List year) {
        this.year = year;
    }

    public int getIdo() {
        return ido;
    }

    public void setIdo(int ido) {
        this.ido = ido;
    }
    
     List glist3,glist4,glist5,glist6,glist1,glist2;

    public List getGlist0t() {
        return glist0t;
    }

    public void setGlist0t(List glist0t) {
        this.glist0t = glist0t;
    }

    public List getGlist3() {
        return glist3;
    }

    public void setGlist3(List glist3) {
        this.glist3 = glist3;
    }

    public List getGlist4() {
        return glist4;
    }

    public void setGlist4(List glist4) {
        this.glist4 = glist4;
    }

    public List getGlist5() {
        return glist5;
    }

    public void setGlist5(List glist5) {
        this.glist5 = glist5;
    }

    public List getGlist6() {
        return glist6;
    }

    public void setGlist6(List glist6) {
        this.glist6 = glist6;
    }

    public List getGlist2() {
        return glist2;
    }

    public void setGlist2(List glist2) {
        this.glist2 = glist2;
    }

    public List getList() {
        return list;
    }

    public void setList(List list) {
        this.list = list;
    }

    public int getId1() {
        return id1;
    }

    public void setId1(int id1) {
        this.id1 = id1;
    }

    
    
    
    
    
    public List getGlist() {
        return glist;
    }

    public void setGlist(List glist) {
        this.glist = glist;
    }

    
    public List getGlist1() {
        return glist1;
    }

    public void setGlist1(List glist1) {
        this.glist1 = glist1;
    }
   
    
    
    
    public OeHomeDto getOe() {
        return oe;
    }

    public void setOe(OeHomeDto oe) {
        this.oe = oe;
    }

    public OeHomeManager getOm() {
        return om;
    }

    public void setOm(OeHomeManager om) {
        this.om = om;
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

    public List<String> getSuperList() {
        return superList;
    }

    public void setSuperList(List<String> superList) {
        this.superList = superList;
    }
    private String status;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
private int abcd=0;

    public int getAbcd() {
        return abcd;
    }

    public void setAbcd(int abcd) {
        this.abcd = abcd;
    }
    
     private static String date,superviser,shifts;

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getSuperviser() {
        return superviser;
    }

    public void setSuperviser(String superviser) {
        this.superviser = superviser;
    }

    public String getShifts() {
        return shifts;
    }

    public void setShifts(String shifts) {
        this.shifts = shifts;
    }
    
   private List elist=new ArrayList();
   private List colist=new ArrayList();

    public List getColist() {
        return colist;
    }

    public void setColist(List colist) {
        this.colist = colist;
    }
   

    public List getElist() {
        return elist;
    }

    public void setElist(List elist) {
        this.elist = elist;
    }
    private List dlist=new  ArrayList();

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
    public String openendInsert() throws ParseException{
      

     
        abcd=3;
        String b = "Shift 2";
        String a = "Shift 1";
        String c = "Shift 3";
        ParentOpenend pc=new ParentOpenend();
        boolean val = false;
         this.ulist=om.openendList(getId());
         this.elist=om.getEmployees();
         this.colist=om.getCounts();
             superList = om.getSuperviser();
             this.dlist=om.shiftExists();  
              this.year=apm.getYear();
        try {
         if(oe.getDate().length()==0) {
             status="12345";
             addFieldError("oe.date", "Please Fill Date first");
           // this.clist=cm.packingvallist(getPcard());
        }
         else {
             
                 String d1=oe.getDate();
             SimpleDateFormat sf1= new SimpleDateFormat("dd-MM-yy");
            Date doj1=sf1.parse(d1);
            System.out.println("MMMMMMMMMMMM"+doj1);
            shift_date=om.getDd();
                 System.out.println("NNNNNNNNNNNNN"+shift_date);
                 //inserted date is after shift date
                  if(shift_date!=null){
             if((doj1.compareTo(shift_date)>0) && (dlist.size()==1 || dlist.size()==2) ) {
                 status = "12345";
              addFieldError("oe.date", "Please enter previous date Shifts");
             }   
             }
             
            this.glist = om.oevallist(getOe());
            
             this.year=apm.getYear();
       if(apm.dateCheck(oe.getDate())){
           Date date=ym.getDateFrom();
           status="12345";
                       addFieldError("oe.date","Year is already closed. Please select date from "+date);
                       
       }
            
             if(!om.check(getOe())) 
            {
                status="12345";
                addFieldError("oe.date", "Please select Date linearly");
            }
            System.out.println("llllllllllllllll"+glist);
            for (Object o1 : glist) {
                pc = (ParentOpenend) o1;
                System.out.println("data is---------------" + pc.getShifts());

            }
            this.ulist=om.openendList(getId());
          //   val=om.openendInsVal(getOe());
            System.out.println("kdjgh------------dlgdj--kjhkh6464");
            if(oe.getDate().length()==0){
                status="12345";
                 addFieldError("oe.date","Please Select Date");
            }
            if(oe.getSuperviser().equals("-1")){
                status="12345";
                addFieldError("oe.superviser","Please Select Superviser");
            }
             if(oe.getShifts().equals("-1")){
                status="12345";
                addFieldError("oe.shifts","Please Select Shift");
            }
            if (glist.isEmpty()) {
                if (oe.getShifts().equals(b)) {
                    status = "12345";
                    addFieldError("oe.shifts", "Please Insert Shift1 First");
                }
                if (oe.getShifts().equals(c)) {
                    status = "12345";
                    addFieldError("oe.shifts", "Please Insert Shift1 First");
                }
            }
              else if (glist.size()==1) {
            
                if (pc.getShifts().equals(a)) {
                    if(oe.getShifts().equals(c)) {
                        status="12345";
                        addFieldError("oe.shifts", "Please Insert Shift2 First");
                    }
                    if(oe.getShifts().equals(a)) {
                        status="12345";
                        addFieldError("oe.shifts", "Shift1 already Exists");
                    }
                }
                if(pc.getShifts().equals(b)) {
                    if(oe.getShifts().equals(c)) {
                        status="12345";
                        addFieldError("oe.shifts", "Please Insert Shift2 First");
                    }
                     if(oe.getShifts().equals(b)) {
                        status="12345";
                        addFieldError("oe.shifts", "Shift1 already Exists");
                    }
                }
            }
            else if(glist.size()==2) {
                 if(oe.getShifts().equals(a)) {
                        status="12345";
                        addFieldError("oe.shifts", "Shift1 already Exists");
                    }
                  if(oe.getShifts().equals(b)) {
                        status="12345";
                        addFieldError("oe.shifts", "Shift2 already Exists");
                    }
            }
             else if(glist.size()==3) {
                 if(oe.getShifts().equals(a)) {
                        status="12345";
                        addFieldError("oe.shifts", "Shift1 already Exists");
                    }
                  if(oe.getShifts().equals(b)) {
                        status="12345";
                        addFieldError("oe.shifts", "Shift2 already Exists");
                    }
                  if(oe.getShifts().equals(c)) {
                        status="12345";
                        addFieldError("oe.shifts", "Shift3 already Exists");
                    }
           }
            
           
             
           
//        if(val){
//            status="12345";
//            addFieldError("oe.shifts","Shift already exists");
//            
//        }


        id=getId();
            System.out.println("dhgkhre-------------fhf"+status+id);
            
        }
     if(status==null){
            status="123";
            date=oe.getDate();
            superviser=oe.getSuperviser();
            shifts=oe.getShifts();
            System.out.println("kdjgh+dare"+date+superviser+shifts);
        }
        }
        catch(Exception e) {
            
        }
      //dm.drawingInsert(getForm());
      //this.ulist=dm.drawingList(getForm());
        superList=om.getSuperviser();
       System.out.println("\n list is:"+ getUlist());
        return "success";

    }

    public OeHomeAction() {
        try {
        om=new OeHomeManager();
        ulist=new ArrayList();
         }
         catch(Exception e) {
             e.printStackTrace();
         }
    }
    public String oeview() {
        try {
             this.year=apm.getYear();
         this.ulist=om.openendList(id);
         this.glist=om.display();
         abcd=3;
          }
         catch(Exception e) {
             e.printStackTrace();
         }
        return "success";
    }
    
    public String InsertOpenendReal() throws ParseException{
         // System.err.println("dkjgkg=======djglj"+getId());
         try {
         System.out.println("kjsh----------kjhf-----------sjfkh----------");
        System.out.println("d456========ggfdg"+getDate()+superviser+shifts);
        om.insertOe(getOe(),date,superviser,shifts);
        abcd=3;
         this.ulist=om.openendList(id);
         this.glist=om.display();
         superList=om.getSuperviser();
          }
         catch(Exception e) {
             e.printStackTrace();
         }
        return SUCCESS;
    }
    public String openendHome(){
        try {
             this.year=apm.getYear();
        superList=om.getSuperviser();
        this.ulist=om.openendList1(getId());
          this.dlist=om.shiftExists();  
          shift_date=om.getDd();
        abcd=3;
        for(Object o:ulist) {
            Login l=(Login)o;
             System.out.println("type is---------"+l.getLoginType());
            if(l.getLoginType().equals("openend"))
                return "openend";
             if(l.getLoginType().equals("control"))
                return "openend";
        }
        }
         catch(Exception e) {
             e.printStackTrace();
         }
        return "success";
    }
    
    public String oEdit()
   {
    System.out.println("\n oooooooooooooooooooo"+id1);
    abcd=3;
    list=om.editOpenend(getIdo());
    
     this.ulist=om.openendList1(getId());
       this.colist=om.getCounts();
       this.elist=om.getEmployees();
     glist=om.display(); 
     glist0t=om.displayChild(ido);
     try {
      int z=glist0t.size();
        System.out.println("kdfjgh-----------------54654dkjhg--------------"+z);
        glist1=(glist0t.subList(0, 1));
        System.out.println("fkljh6540000000000ooooooooooooooo"+glist1);
       glist2=(glist0t.subList(1, 2));
        glist3=(glist0t.subList(2, 3));
        glist4=(glist0t.subList(3, 4));
          glist5=(glist0t.subList(4, 5));
           glist6=(glist0t.subList(5, 6));
           System.out.println("fgh324-------------in action-------21-------------------"+glist2+glist3+"cxgdg----------"+glist4+glist5+"djhg23-----------24dfgd"+glist6);
     }
     catch(IndexOutOfBoundsException i) {
         System.out.println("\n triveniiiiiiiiiiiiiii");
     }
    superList=om.getSuperviser();
     return "success";
}

public String oUpdate() throws ParseException
{
    try {
     om.updateOpenend(getOe());
     abcd=3;
     this.ulist=om.openendList1(getId());
      this.glist=om.display(); 
    System.out.println("hshfhfhjfhgffjjjhghg");
  }
         catch(Exception e) {
             e.printStackTrace();
         }
    return "success";
}


 public String oDelete() throws ParseException{
     try {
        om.deleteOe(getIdo());
        abcd=3;
         this.ulist=om.openendList1(getId());
      this.glist=om.display(); 
       }
         catch(Exception e) {
             e.printStackTrace();
         }
        //list = om.display();
        return "success";
    }

   }
 

