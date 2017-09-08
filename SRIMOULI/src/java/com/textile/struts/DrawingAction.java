/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.struts;


import com.textile.dto.ParentDrawingForm;
import com.textile.manager.DrawingManager;
import com.opensymphony.xwork2.ActionSupport;
import com.textile.manager.AddPurchaseManager;
import com.textile.manager.YearManager;
import com.textile.model.FinancialYearBackup;
import com.textile.model.Login;
import com.textile.model.ParentDrawing;
import com.textile.util.HibernateUtil;
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
 * @author NSG
 */
public class DrawingAction extends ActionSupport 
{
    DrawingManager d=new DrawingManager();
    private DrawingManager dm;
    private List<String> superList=new ArrayList<>();
    private List dlist,dlist1,dlist2,dlist3,dlist4,dlist5;
    private static int idd;
     private AddPurchaseManager apm=new AddPurchaseManager();
      YearManager ym=new YearManager();
    private List year=null;

    public List getYear() {
        return year;
    }

    public void setYear(List year) {
        this.year = year;
    }

    public int getIdd() {
        return idd;
    }

    public void setIdd(int idd) {
        this.idd = idd;
    }

    public List getDlist() {
        return dlist;
    }

    public void setDlist(List dlist) {
        this.dlist = dlist;
    }

    public List getDlist1() {
        return dlist1;
    }

    public void setDlist1(List dlist1) {
        this.dlist1 = dlist1;
    }

    public List getDlist2() {
        return dlist2;
    }

    public void setDlist2(List dlist2) {
        this.dlist2 = dlist2;
    }

    public List getDlist3() {
        return dlist3;
    }

    public void setDlist3(List dlist3) {
        this.dlist3 = dlist3;
    }

    public List getDlist4() {
        return dlist4;
    }

    public void setDlist4(List dlist4) {
        this.dlist4 = dlist4;
    }

    public List getDlist5() {
        return dlist5;
    }

    public void setDlist5(List dlist5) {
        this.dlist5 = dlist5;
    }
    
     private List clist1;

    public List getClist1() {
        return clist1;
    }

    public void setClist1(List clist1) {
        this.clist1 = clist1;
    }

   
     

    public List<String> getSuperList() {
        return superList;
    }

    public void setSuperList(List<String> superList) {
        this.superList = superList;
    }
    
    public DrawingManager getDm() {
        return dm;
    }
    public void setDm(DrawingManager dm) {
        this.dm = dm;
    }
    
    public DrawingAction() {
        dm=new DrawingManager();
        glist=new ArrayList();
    }
    
    private ParentDrawingForm form;
    private static int id;
    private  int id1;
    private List glist;

    public List getGlist() {
        return glist;
    }

    public void setGlist(List glist) {
        this.glist = glist;
    }

    public int getId1() {
        return id1;
    }

    public void setId1(int id1) {
        this.id1 = id1;
    }
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    
    public ParentDrawingForm getForm() {
        return form;
    }
    public void setForm(ParentDrawingForm form) {
        this.form = form;
    } 
    
    private List ulist;

    public DrawingManager getD() {
        return d;
    }

    public void setD(DrawingManager d) {
        this.d = d;
    }

    public List getUlist() {
        return ulist;
    }

    public void setUlist(List ulist) {
        this.ulist = ulist;
    }
    
private String status;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
  private static String date,superv,shift;

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getSuperv() {
        return superv;
    }

    public void setSuperv(String superv) {
        this.superv = superv;
    }

    public String getShift() {
        return shift;
    }

    public void setShift(String shift) {
        this.shift = shift;
    }
    private List elist=new ArrayList();

    public List getElist() {
        return elist;
    }

    public void setElist(List elist) {
        this.elist = elist;
    }
    private List datelist=new ArrayList();

    public List getDatelist() {
        return datelist;
    }

    public void setDatelist(List datelist) {
        this.datelist = datelist;
    }
    private Date shift_date=null;

    public Date getShift_date() {
        return shift_date;
    }

    public void setShift_date(Date shift_date) {
        this.shift_date = shift_date;
    }
    public String InsertDrawing()
    {
         abcd=2;
        
        String b = "Shift2";
        String a = "Shift1";
        String c = "Shift3";
        boolean val = false;
        this.ulist=dm.drawingList(getId());
        this.elist=dm.getEmployees();
        superList = dm.getSuperviser();
        this.datelist=dm.shiftExists();
          this.year=apm.getYear();
       try {
               
           
         
        ParentDrawing pc=new ParentDrawing();
        if(form.getDate().length()==0) {
             status="12345";
             addFieldError("form.date", "Please Fill Date first");
           // this.clist=cm.packingvallist(getPcard());
        }
        else {
            
              String d1=form.getDate();
             SimpleDateFormat sf1= new SimpleDateFormat("dd-MM-yy");
            Date doj1=sf1.parse(d1);
            System.out.println("MMMMMMMMMMMM"+doj1);
          shift_date=dm.getDd();
                 System.out.println("NNNNNNNNNNNNN"+shift_date);
                 //inserted date is after shift date
                  if(shift_date!=null){
             if((doj1.compareTo(shift_date)>0) && (datelist.size()==1 || datelist.size()==2) ) {
                 status = "12345";
              addFieldError("form.date", "Please enter previous date Shifts");
                   }
                  }
           
             
            this.clist1 = dm.drawingvallist(getForm());
            for (Object o1 : clist1) {
                pc = (ParentDrawing) o1;
                System.out.println("data is---------------" + pc.getShifts());

            }
            
             this.year=apm.getYear();
       if(apm.dateCheck(form.getDate())){
           Date date=ym.getDateFrom();
                       addFieldError("form.date","Year is already closed. Please select date from "+date);
                        return "input";
       }
            
             if(!dm.check(getForm())){
               status="12345";
                       addFieldError("form.date","Please select Date linearly");
                  }
            this.ulist=dm.drawingList(getId());
         /*    val=dm.drawingInsVal(getForm());*/
            System.out.println("kdjgh------------dlgdj--kjhkh6464");
            if(form.getDate().length()==0){
                status="12345";
                 addFieldError("form.date","Please Select Date");
            }
            if(form.getSuperviser().equals("-1")){
                status="12345";
                addFieldError("form.superviser","Please Select Superviser");
            }
             if(form.getShifts().equals("-1")){
                status="12345";
                addFieldError("form.shifts","Please Select Shift");
            }
             
             
             if (clist1.isEmpty()) {
                 System.out.println("im coming''''''''''''''");
                if (form.getShifts().equals(b)) {
                    status = "12345";
                    addFieldError("form.shifts", "Please Insert Shift1 First");
                }
                if (form.getShifts().equals(c)) {
                    status = "12345";
                    addFieldError("form.shifts", "Please Insert Shift1 First");
                }
            }
             
              else if (clist1.size()==1) {
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
             
              else if(clist1.size()==2) {
                 if(form.getShifts().equals(a)) {
                        status="12345";
                        addFieldError("form.shifts", "Shift1 already Exists");
                    }
                  if(form.getShifts().equals(b)) {
                        status="12345";
                        addFieldError("form.shifts", "Shift2 already Exists");
                    }
            }
             
              else if(clist1.size()==3) {
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
//            addFieldError("form.shifts","Shift already exists");
//            
//        }
        id=getId();
            System.out.println("dhgkhre-------------fhf"+status+id);
            
        }
     if(status==null){
            status="123";
            date=form.getDate();
            superv=form.getSuperviser();
            shift=form.getShifts();
            System.out.println("kdjgh+dare"+date+superv+shift);
        }
       }
       catch(Exception e) {
           
       }
      //dm.drawingInsert(getForm());
      //this.ulist=dm.drawingList(getForm());
       // superList=dm.getSuperviser();
       System.out.println("\n list is:"+ getUlist());
        return "input";
    }
    public String drawingInReal()
    {
        try {
        System.out.println("321321..............34......................245");
        abcd=2;
          System.out.println("dkjgkg===......................====djglj");
        System.out.println("d456========ggfdg"+date+superv+shift);
        dm.drawingInsert(getForm(),date,superv,shift);
      this.ulist=dm.drawingList(id);
         superList=dm.getSuperviser();
         dlist=dm.displayDrawing();
         for(Object o:ulist) {
            Login l=(Login)o;
             System.out.println("type is---------"+l.getLoginType());
            if(l.getLoginType().equals("drawing"))
                return "drawingView";
            else  if(l.getLoginType().equals("control"))
                return "drawingView";

        }
          }
         catch(Exception e) {
             e.printStackTrace();
         }
        return SUCCESS;
    }
    private int abcd=0;

    public int getAbcd() {
        return abcd;
    }

    public void setAbcd(int abcd) {
        this.abcd = abcd;
    }
     public String drawingHome() {
         try {
         abcd=2;
          this.year=apm.getYear();
       superList=dm.getSuperviser();
        this.ulist=dm.drawingList1(getId());
         this.datelist=dm.shiftExists();
         shift_date=dm.getDd();
        for(Object o:ulist) {
            Login l=(Login)o;
             System.out.println("type is---------"+l.getLoginType());
            if(l.getLoginType().equals("drawing"))
                return "drawing";
            else  if(l.getLoginType().equals("control"))
                return "drawing";

        }
        }
         catch(Exception e) {
             e.printStackTrace();
         }
        return "success";
    }
     
     public String drawingEdit()
     {
         
         abcd=2;
         superList=dm.getSuperviser();
          this.ulist=dm.drawingList(getId());
           this.elist=dm.getEmployees();
         try { 
         dlist=dm.pdrawingEdit(getIdd());
         //dlist=dm.displayDrawing();
         clist1=dm.cdrawingEdit(getIdd());
         int z=clist1.size();
        
        System.out.println("kdfjgh-----------------54654dkjhg--------------"+z);
        dlist1=(clist1.subList(0, 1));
        dlist2=(clist1.subList(1, 2));
        dlist3=(clist1.subList(2, 3));
        dlist4=(clist1.subList(3, 4));
        dlist5=(clist1.subList(4, 5));
         }
         catch(ArrayIndexOutOfBoundsException i) {
             System.out.println("exception is"+i.getMessage());
         }
        System.out.println("fkljh6540000000000ooooooooooooooo"+clist1);
         return "success";
     }

     public String drawingUpdate()
     {
         try {
         abcd=2;
         superList=dm.getSuperviser();
         this.ulist=dm.drawingList(id);
         this.elist=dm.getEmployees();
         try {
        dm.drawingUpdate(getForm(),idd);
         }
         catch(Exception e) {
             
         }
         this.dlist=dm.displayDrawing();
          }
         catch(Exception e) {
             e.printStackTrace();
         }
         return "success";
         
     }
     public String drawingDelete()
     {
         try {
         abcd=2;
         superList=dm.getSuperviser();
         this.ulist=dm.drawingList(id);
         dm.drawingDelete(getIdd());
          this.dlist=dm.displayDrawing();
           }
         catch(Exception e) {
             e.printStackTrace();
         }
         return "success";
     }
     public String drawingView() {
         try {
         abcd=2;
         this.year=apm.getYear();
          this.dlist=dm.displayDrawing();
          this.ulist=dm.drawingList(getId());
           }
         catch(Exception e) {
             e.printStackTrace();
         }
         return "success";
     }
}
