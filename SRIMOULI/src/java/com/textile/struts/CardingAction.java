/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.struts;

import com.opensymphony.xwork2.ActionSupport;
import com.textile.manager.CardingManager;

import com.textile.dto.PCarding;
import com.textile.manager.AddPurchaseManager;
import com.textile.manager.YearManager;
import com.textile.model.FinancialYearBackup;
import com.textile.model.Login;
import com.textile.model.ParentCarding;
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
 * @author Masrat
 */
public class CardingAction extends ActionSupport {

    private PCarding pcard;
    private CardingManager cm = new CardingManager();
    private AddPurchaseManager apm=new AddPurchaseManager();
     YearManager ym=new YearManager();
    private List ulist;
    private static int id;
    private List<String> superList = new ArrayList<>();
    private List glist1;
    private List glist2, glist3, glist4, glist5, glist6, glist7, glist8, glist9, glist10, glist11;
    private static int idc;
    private List<Integer> elist;
     private List year=null;

    public List getYear() {
        return year;
    }

    public void setYear(List year) {
        this.year = year;
    }

    public List<Integer> getElist() {
        return elist;
    }

    public void setElist(List<Integer> elist) {
        this.elist = elist;
    }

  

    public int getIdc() {
        return idc;
    }

    public void setIdc(int idc) {
        this.idc = idc;
    }

    public CardingManager getCm() {
        return cm;
    }

    public List getGlist11() {
        return glist11;
    }

    public void setGlist11(List glist11) {
        this.glist11 = glist11;
    }

    public void setCm(CardingManager cm) {
        this.cm = cm;
    }

    public List getGlist2() {
        return glist2;
    }

    public void setGlist2(List glist2) {
        this.glist2 = glist2;
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

    public List getGlist7() {
        return glist7;
    }

    public void setGlist7(List glist7) {
        this.glist7 = glist7;
    }

    public List getGlist8() {
        return glist8;
    }

    public void setGlist8(List glist8) {
        this.glist8 = glist8;
    }

    public List getGlist9() {
        return glist9;
    }

    public void setGlist9(List glist9) {
        this.glist9 = glist9;
    }

    public List getGlist10() {
        return glist10;
    }

    public void setGlist10(List glist10) {
        this.glist10 = glist10;
    }

    public List getGlist1() {
        return glist1;
    }

    public void setGlist1(List glist1) {
        this.glist1 = glist1;
    }

    public List<String> getSuperList() {
        return superList;
    }

    public void setSuperList(List<String> superList) {
        this.superList = superList;
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
    private String status;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public PCarding getPcard() {
        return pcard;
    }

    public void setPcard(PCarding pcard) {
        this.pcard = pcard;
    }

    private static String dat, superviser, shifts;

    public String getDat() {
        return dat;
    }

    public void setDat(String dat) {
        this.dat = dat;
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
    private List clist;
    private List list;

    public List getList() {
        return list;
    }

    public void setList(List list) {
        this.list = list;
    }

    public List getClist() {
        return clist;
    }

    public void setClist(List clist) {
        this.clist = clist;
    }
    private static int id1;

    public int getId1() {
        return id1;
    }

    public void setId1(int id1) {
        this.id1 = id1;
    }
    private List dlist=new ArrayList();

    public List getDlist() {
        return dlist;
    }

    public void setDlist(List dlist) {
        this.dlist = dlist;
    }
   
    public String cardingInsert() throws ParseException {

        abcd = 1;
        String b = "Shift2";
        String a = "Shift1";
        String c = "Shift3";
        boolean val = false;
        this.ulist = cm.cardingList(getId());
        this.elist=cm.getEmployees();
        System.out.println("Action '''''''''''''''''''"+elist);
        superList = cm.getSuperviser();
         this.year=apm.getYear();
       this.dlist=cm.shiftExists();
        //   this.ulist = cm.cardingList(getPcard());
        try {

            ParentCarding pc = new ParentCarding();
            
            /*if(!cm.check(getPcard())){
                        addFieldError("pcard.date","First fill previous day values");

                  }*/
           
            
            if (pcard.getDat().length() == 0) {
                status = "12345";

                addFieldError("pcard.dat", "Please Fill Date first");
                // this.clist=cm.packingvallist(getPcard());
            } 
            else {
                
                   String d1=pcard.getDat();
             SimpleDateFormat sf1= new SimpleDateFormat("dd-MM-yy");
            Date doj1=sf1.parse(d1);
            System.out.println("MMMMMMMMMMMM"+doj1);
             shift_date=cm.getDd();
                 System.out.println("NNNNNNNNNNNNN"+shift_date+dlist);
                 //inserted date is after shift date
                 if(shift_date!=null&& dlist.size()!=0){
             if((doj1.compareTo(shift_date)>0) && (dlist.size()==1 || dlist.size()==2) ) {
                 status = "12345";
              addFieldError("pcard.dat", "Please enter previous date Shifts");
                   }
                 }
                this.clist = cm.packingvallist(getPcard());
                System.out.println("clist issssssss" + clist);
                
                this.year=apm.getYear();
       if(apm.dateCheck(pcard.getDat())){
           Date date=ym.getDateFrom();
                       addFieldError("pcard.dat","Year is already closed. Please select date from "+date);
                        return "input";
       }
                 if (!cm.check(getPcard())) {
                    status = "12345";
                    addFieldError("pcard.dat", "Please select Date linearly");
                }
                 else {
                for (Object o1 : clist) {
                    pc = (ParentCarding) o1;
                    System.out.println("data is---------------" + pc.getShifts());
                }
                this.ulist = cm.cardingList(getId());
                //   val = cm.cardingInsVal(getPcard());
                System.out.println("kdjgh------------dlgdj--kjhkh6464");
                
                
              
                if (pcard.getSuperviser().equals("-1")) {
                    status = "12345";

                    addFieldError("pcard.superviser", "Please Select Superviser");
                }
                if (pcard.getShifts().equals("-1")) {
                    status = "12345";

                    addFieldError("pcard.shifts", "Please Select Shift");
                }
                
                if (clist.size() == 0) {

                    if (pcard.getShifts().equals(b)) {
                        status = "12345";
                        addFieldError("pcard.shifts", "Please Insert Shift1 First");
                    }
                    if (pcard.getShifts().equals(c)) {
                        status = "12345";
                        addFieldError("pcard.shifts", "Please Insert Shift1 First");
                    }
                } else if (clist.size() == 1) {
                    if (pc.getShifts().equals(a)) {
                        if (pcard.getShifts().equals(c)) {
                            status = "12345";
                            addFieldError("pcard.shifts", "Please Insert Shift2 First");
                        }
                        if (pcard.getShifts().equals(a)) {
                            status = "12345";
                            addFieldError("pcard.shifts", "Shift1 already Exists");
                        }
                    }
                    if (pc.getShifts().equals(b)) {
                        if (pcard.getShifts().equals(c)) {
                            status = "12345";
                            addFieldError("pcard.shifts", "Please Insert Shift2 First");
                        }
                        if (pcard.getShifts().equals(b)) {
                            status = "12345";
                            addFieldError("pcard.shifts", "Shift1 already Exists");
                        }
                    }
                } else if (clist.size() == 2) {
                    if (pcard.getShifts().equals(a)) {
                        status = "12345";
                        addFieldError("pcard.shifts", "Shift1 already Exists");
                    }
                    if (pcard.getShifts().equals(b)) {
                        status = "12345";
                        addFieldError("pcard.shifts", "Shift2 already Exists");
                    }
                } else if (clist.size() == 3) {
                    if (pcard.getShifts().equals(a)) {
                        status = "12345";

                        addFieldError("pcard.shifts", "Shift1 already Exists");
                    }
                    if (pcard.getShifts().equals(b)) {
                        status = "12345";
                        addFieldError("pcard.shifts", "Shift2 already Exists");
                    }
                    if (pcard.getShifts().equals(c)) {
                        status = "12345";
                        addFieldError("pcard.shifts", "Shift3 already Exists");
                    }
                }
                
            
                 }
                
            }
            
            

//            if (val) {
//                status = "12345";
//                System.out.println("\n bbbbbbbbbbbbb");
//                addFieldError("pcard.shifts", "Shift already exists");
//            }
            id = getId();
            System.out.println("dhgkhre-------------fhf" + status + id);

            if (status == null) {
                status = "123";
                dat = pcard.getDat();
                superviser = pcard.getSuperviser();
                shifts = pcard.getShifts();
                System.out.println("kdjgh+dare" + dat + superviser + shifts);
            }
            //dm.drawingInsert(getForm());
            //this.ulist=dm.drawingList(getForm());
        } catch (NullPointerException e) {

        }
        superList = cm.getSuperviser();

        System.out.println("\n list is:" + getUlist());

        return "input";
    }

    public String InsertCardingReal() throws ParseException {
        try {
             this.ulist = cm.cardingList(id);
            abcd = 1;
            // System.err.println("dkjgkg=======djglj"+getId());
            System.out.println("d456========ggfdg" + dat + superviser + shifts);
            cm.insertCarding(getPcard(), dat, superviser, shifts);
            
            clist = cm.retrieve();
           
            superList = cm.getSuperviser();
        } catch (NullPointerException e) {

        }

        return "success";
    }
    private Date shift_date=null;

    public Date getShift_date() {
        return shift_date;
    }

    public void setShift_date(Date shift_date) {
        this.shift_date = shift_date;
    }
    
    public String cardingHome() {
        abcd = 1;
        superList = cm.getSuperviser();
        this.ulist = cm.cardingList1(getId());
        this.year=apm.getYear();
        try {
            this.dlist=cm.shiftExists();
           shift_date=cm.getDd();  
        for (Object o : ulist) {
            Login l = (Login) o;
            System.out.println("type is---------" + l.getLoginType());
            if (l.getLoginType().equals("carding")) {
                return "carding";
            } else if (l.getLoginType().equals("control")) {
                return "carding";
            }
        }
        }
        catch(Exception e) {
            
        }
        return "success";
    }

    public CardingAction() {
        ulist = new ArrayList();
        elist=new ArrayList();
        cm = new CardingManager();
    }

    private int abcd = 0;

    public int getAbcd() {
        return abcd;
    }

    public void setAbcd(int abcd) {
        this.abcd = abcd;
    }

    public String cardingRetrieve() {
        abcd = 1;
        clist = cm.retrieve();
         this.year=apm.getYear();
        try {
        this.ulist = cm.cardingList1(getId());
         }
         catch(Exception e) {
             e.printStackTrace();
         }
        //glist1 = cm.childRetrieve(id1);
        return "success";
    }

    public String cEdit() {
        // glist1=cm.editCarding(getId1());
         this.ulist = cm.cardingList1(getId());
          this.elist=cm.getEmployees();
             abcd = 1;
        try {
        list = cm.editCarding(getIdc());
       superList = cm.getSuperviser();
       glist1 = cm.childRetrieve(getIdc());
        int z = glist1.size();
         System.out.println("kdfjgh-----------------54654dkjhg--------------" + z);
            glist2 = (glist1.subList(0, 1));
            System.out.println("fkljh6540000000000ooooooooooooooo" + glist1);
            glist3 = (glist1.subList(1, 2));
            glist4 = (glist1.subList(2, 3));
            glist5 = (glist1.subList(3, 4));
            glist6 = (glist1.subList(4, 5));
            glist7 = (glist1.subList(5, 6));
            glist8 = (glist1.subList(6, 7));
            glist9 = (glist1.subList(7, 8));
            glist10 = (glist1.subList(8, 9));
            glist11 = (glist1.subList(9, 10));
        }
        catch (IndexOutOfBoundsException i) {
            System.out.println("error issssssssssssss" + i.getMessage());
        }
        return "success";
    }

    public String cUpdate() throws ParseException {
        abcd = 1;
        this.ulist = cm.cardingList1(getId());
       // this.elist=cm.getEmployees();
        try {
        cm.updateCarding(getPcard(), idc);
        
        System.out.println("idc isssssssssss" + pcard.getIdc());
        this.clist = cm.retrieve();
        }
        catch(Exception e) {
            
        }
        //list=cm.editCarding(getId1());
        return "success";

    }

    public String cDelete() {
        try {
        abcd = 1;
        cm.deletecarding(getIdc());
        clist = cm.retrieve();
        this.ulist = cm.cardingList1(getId());
         }
         catch(Exception e) {
             e.printStackTrace();
         }
        return "success";
    }
    
   

}
