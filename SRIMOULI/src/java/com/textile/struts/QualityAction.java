/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.struts;

import com.opensymphony.xwork2.ActionSupport;
import com.textile.dto.ParentQualityForm;
import com.textile.manager.AddPurchaseManager;
import com.textile.manager.QualityManager;
import com.textile.manager.YearManager;
import com.textile.model.FinancialYearBackup;
import com.textile.model.Login;
import com.textile.model.ParentQuality;
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
 * @author NSG
 */
public class QualityAction extends ActionSupport {

    QualityManager qm = new QualityManager();
    private ParentQualityForm form;
    private List ulist;
    private List glist;
    private List glist1;
    private List clist;
    private List list;
    private List glist2, glist3, glist4, glist5, glist6, glist7, glist8, glist9, glist10;
    private List glist11, glist12, glist13, glist14, glist15, glist16, glist17, glist18, glist19, glist20;
    private List glist21, glist22, glist23;
     private AddPurchaseManager apm=new AddPurchaseManager();
      YearManager ym=new YearManager();
    private List year=null;

    public List getYear() {
        return year;
    }

    public void setYear(List year) {
        this.year = year;
    }

    private String status;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    private static String date, superviser, shifts;

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

    public ParentQualityForm getForm() {
        return form;
    }

    public void setForm(ParentQualityForm form) {
        this.form = form;
    }

    private List<String> superList = new ArrayList<>();
    private List<String> countList = new ArrayList<>();

    public List<String> getCountList() {
        return countList;
    }

    public void setCountList(List<String> countList) {
        this.countList = countList;
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

    public List getGlist11() {
        return glist11;
    }

    public void setGlist11(List glist11) {
        this.glist11 = glist11;
    }

    public List getGlist12() {
        return glist12;
    }

    public void setGlist12(List glist12) {
        this.glist12 = glist12;
    }

    public List getGlist13() {
        return glist13;
    }

    public void setGlist13(List glist13) {
        this.glist13 = glist13;
    }

    public List getGlist14() {
        return glist14;
    }

    public void setGlist14(List glist14) {
        this.glist14 = glist14;
    }

    public List getGlist15() {
        return glist15;
    }

    public void setGlist15(List glist15) {
        this.glist15 = glist15;
    }

    public List getGlist16() {
        return glist16;
    }

    public void setGlist16(List glist16) {
        this.glist16 = glist16;
    }

    public List getGlist17() {
        return glist17;
    }

    public void setGlist17(List glist17) {
        this.glist17 = glist17;
    }

    public List getGlist18() {
        return glist18;
    }

    public void setGlist18(List glist18) {
        this.glist18 = glist18;
    }

    public List getGlist19() {
        return glist19;
    }

    public void setGlist19(List glist19) {
        this.glist19 = glist19;
    }

    public List getGlist20() {
        return glist20;
    }

    public void setGlist20(List glist20) {
        this.glist20 = glist20;
    }

    public List getGlist21() {
        return glist21;
    }

    public void setGlist21(List glist21) {
        this.glist21 = glist21;
    }

    public List getGlist22() {
        return glist22;
    }

    public void setGlist22(List glist22) {
        this.glist22 = glist22;
    }

    public List getGlist23() {
        return glist23;
    }

    public void setGlist23(List glist23) {
        this.glist23 = glist23;
    }

    public List getGlist1() {
        return glist1;
    }

    public void setGlist1(List glist1) {
        this.glist1 = glist1;
    }

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

    private static int id;
    private int id1;

    public List getGlist() {
        return glist;
    }

    public void setGlist(List glist) {
        this.glist = glist;
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

    public int getId1() {
        return id1;
    }

    public void setId1(int id1) {
        this.id1 = id1;
    }
    private int abcd;

    public int getAbcd() {
        return abcd;
    }

    public void setAbcd(int abcd) {
        this.abcd = abcd;
    }

    public List<String> getSuperList() {
        return superList;
    }

    public void setSuperList(List<String> superList) {
        this.superList = superList;
    }

    public QualityAction() {
        abcd = 4;
        qm = new QualityManager();
        clist = new ArrayList();
        superList = new ArrayList();
    }

    public String Superviser() {
        abcd = 4;
        superList = qm.getSuperviser();
        return "success";
    }

    public String qualityInsertion() {
         abcd = 4;
        String b = "Shift2";
        String a = "Shift1";
        String c = "Shift3";
        boolean val = false;
        ParentQuality pc=new ParentQuality();
        this.ulist = qm.qualityList1(id);
             superList = qm.getSuperviser();
             this.glist=qm.shiftExists();
              this.year=apm.getYear();
              shift_date=qm.getDd();
        try {
            
            
         if(form.getDate().length()==0) {
             status="12345";
             
             addFieldError("form.date", "Please Fill Date first");
           // this.clist=cm.packingvallist(getPcard());
        }
        
        else {

       //     val = qm.qualityInsVal(getForm());
       this.clist=qm.packingvallist(getForm());
        System.out.println("clist issssssss"+clist);
         this.year=apm.getYear();
       if(apm.dateCheck(form.getDate())){
           Date date=ym.getDateFrom();
           status="12345";
                       addFieldError("form.date","Year is already closed. Please select date from "+date);
       }
        if(!qm.check(getForm())){
               status="12345";
                       addFieldError("form.date","Please select Date linearly");
                  }
          if(!qm.qualityData(getForm())) {
            status="12345";
            addFieldError("form.date","Data Already exists with below fields");
        }
            for (Object o1 : clist) {
                pc = (ParentQuality) o1;
                System.out.println("data is---------------" + pc.getShifts());
            }
             this.ulist = qm.qualityList1(id);
            System.out.println("kdjgh------------dlgdj--kjhkh6464");
            if (form.getSuperViser().equals("-1")) {
                status = "12345";
                addFieldError("form.superViser", "Please Select Superviser");
            }
            if (form.getShifts().equals("-1")) {
                status = "12345";
                addFieldError("form.shifts", "Please Select Test Type");
            }
            if (clist.size()==0) {
                
               
                if (form.getShifts().equals(b)) {
                    status = "12345";
                    addFieldError("form.shifts", "Please Insert Shift1 First");
                }
                if (form.getShifts().equals(c)) {
                    status = "12345";
                    addFieldError("form.shifts", "Please Insert Shift1 First");
                }
            }
            
              else if (clist.size()==1) {
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
            
            else if(clist.size()==2) {
                 if(form.getShifts().equals(a)) {
                        status="12345";
                        addFieldError("form.shifts", "Shift1 already Exists");
                    }
                  if(form.getShifts().equals(b)) {
                        status="12345";
                        addFieldError("form.shifts", "Shift2 already Exists");
                    }
            }
            else if(clist.size()==3) {
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

        }
        
        if (status == null) {
            status = "123";
            date = form.getDate();
            superviser = form.getSuperViser();
            shifts = form.getShifts();
            System.out.println("kdjgh+dare" + date + superviser + shifts);
        }
        id = getId();
        }
        catch(Exception e) {
            
        }
        //dm.drawingInsert(getForm());
        //this.ulist=dm.drawingList(getForm());
        superList = qm.getSuperviser();
        countList = qm.count();
        this.ulist = qm.qualityList1(id);
        System.out.println("\n list is:" + getUlist());
        return "success";
    }

    public String InsertQualityReal() {
        // System.err.println("dkjgkg=======djglj"+getId());
        abcd = 4;
        id = form.getId();
        System.out.println("d456========ggfdg" + date + superviser + shifts);
        qm.insertQuality(getForm(), date, superviser, shifts, id);
        this.ulist = qm.qualityList1(id);
        glist = qm.display();
        System.out.println("iiiiiiiiiiiiiiiiiddddddddddddddddd" + getId());

        superList = qm.getSuperviser();
        return SUCCESS;
    }
private Date shift_date=null;

    public Date getShift_date() {
        return shift_date;
    }

    public void setShift_date(Date shift_date) {
        this.shift_date = shift_date;
    }
    public String qualityHome() {
        abcd = 4;
        this.year=apm.getYear();
        superList = qm.getSuperviser();
        this.ulist = qm.qualityList1(getId());
        countList = qm.count();
        this.glist=qm.shiftExists();
        shift_date=qm.getDd();
        for (Object o : ulist) {
            Login l = (Login) o;
            System.out.println("type is---------" + l.getLoginType());
            if (l.getLoginType().equals("quality")) {
                return "quality";
            } else if (l.getLoginType().equals("control")) {
                return "control";
            }

        }

        return "success";
    }
    private static int idq;

    public int getIdq() {
        return idq;
    }

    public void setIdq(int idq) {
        this.idq = idq;
    }

    public String qEdit() {
        abcd = 4;
        System.out.println("\n oooooooooooooooooooo" + id1);
        list = qm.editQuality(getIdq());
        this.ulist = qm.qualityList1(getId());
        glist = qm.display();
        glist1 = qm.displayChild(getIdq());
        int z = glist1.size();
        try {
            System.out.println("kdfjgh-----------------54654dkjhg--------------" + z);
            glist2 = (glist1.subList(0, 1));
            System.out.println("hhhhhhhhhhhhhh" + glist2);
            glist3 = (glist1.subList(1, 2));
            System.out.println("liiiiiiiiiiiiiiiiiisttttt"+glist3);
            glist4 = (glist1.subList(2, 3));
              System.out.println("anushaaaaaaaaaaaaa"+glist4);
            glist5 = (glist1.subList(3, 4));
              System.out.println("swathiiiiiiiiiiiiiiiii"+glist5);
            glist6 = (glist1.subList(4, 5));
              System.out.println("triveniiiiiiiiiiiiiiiiiii"+glist6);
            glist7 = (glist1.subList(5, 6));
              System.out.println("gaya333333333333333333333333"+glist7);
          
//            glist12 = (glist1.subList(10, 11));
//            glist13 = (glist1.subList(11, 12));
//            glist14 = (glist1.subList(12, 13));
//            glist15 = (glist1.subList(13, 14));
//            glist16 = (glist1.subList(14, 15));
//            glist17 = (glist1.subList(15, 16));
//            glist18 = (glist1.subList(16, 17));
//            glist19 = (glist1.subList(17, 18));
//            glist20 = (glist1.subList(18, 19));
//            glist21 = (glist1.subList(19, 20));
//            glist22 = (glist1.subList(20, 21));
           
        } catch (ArrayIndexOutOfBoundsException i) {
            System.out.println("error is:" + i.getMessage());
        }

        superList = qm.getSuperviser();
      countList = qm.count();
        System.out.println("count isssss" + countList);
        return "success";
    }

    public String qUpdate() throws ParseException {
        System.out.println("readyyyyyyyyyyyyyyy");
        abcd = 4;
        qm.updateQuality(getForm());
        System.out.println("hshfhfhjfhgffjjjhghg");
        glist = qm.display();
        //glist1=qm.displayChild();
        // System.out.println("pppppppppppppp"+glist);
//    list=qm.editQuality(getId1());
        this.ulist = qm.qualityList1(form.getId());
//     
//    superList=qm.getSuperviser();
      countList = qm.count();
        System.out.println("babuuuuuuuuuuuuuu"+countList);
        return "success";
    }

    public String qDelete() {

        qm.deletequality(getIdq());
        abcd = 4;
        glist = qm.display();
        this.ulist = qm.qualityList1(getId());
        return "success";
    }

    public String qualityView() {
        abcd = 4;
        this.year=apm.getYear();
        glist = qm.display();
        System.out.println("kkkkkkkkkkkkkkkkkkkkkkkkkk");
        this.ulist = qm.qualityList1(getId());
        return "success";
    }

}
