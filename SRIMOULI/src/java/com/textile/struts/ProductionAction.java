/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.struts;

import com.opensymphony.xwork2.ActionSupport;
import com.textile.dto.PtProductionDto;
import com.textile.manager.AddPurchaseManager;
import com.textile.manager.ProductionManager;
import com.textile.manager.YearManager;
import com.textile.model.FinancialYearBackup;
import com.textile.model.Login;
import com.textile.model.ParentGdProduction;
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
public class ProductionAction extends ActionSupport {

    private PtProductionDto ptp;
    private ProductionManager pgm = new ProductionManager();
     YearManager ym=new YearManager();
    private List ulist;
    private List glist;
    private List glist1, productlist;
     private AddPurchaseManager apm=new AddPurchaseManager();
    private List year=null;

    public List getYear() {
        return year;
    }

    public void setYear(List year) {
        this.year = year;
    }
    

    public List getProductlist() {
        return productlist;
    }

    public void setProductlist(List productlist) {
        this.productlist = productlist;
    }
    private List list1, list2, list3, list4, list5, list6, list7, list8, list9, list10, list11, list12, list13, list14, list15;

    public List getList11() {
        return list11;
    }

    public void setList11(List list11) {
        this.list11 = list11;
    }

    public List getList12() {
        return list12;
    }

    public void setList12(List list12) {
        this.list12 = list12;
    }

    public List getList13() {
        return list13;
    }

    public void setList13(List list13) {
        this.list13 = list13;
    }

    public List getList14() {
        return list14;
    }

    public void setList14(List list14) {
        this.list14 = list14;
    }

    public List getList15() {
        return list15;
    }

    public void setList15(List list15) {
        this.list15 = list15;
    }

    public List getList10() {
        return list10;
    }

    public void setList10(List list10) {
        this.list10 = list10;
    }

    public List getList9() {
        return list9;
    }

    public void setList9(List list9) {
        this.list9 = list9;
    }

    public List getList2() {
        return list2;
    }

    public void setList2(List list2) {
        this.list2 = list2;
    }

    public List getList3() {
        return list3;
    }

    public void setList3(List list3) {
        this.list3 = list3;
    }

    public List getList4() {
        return list4;
    }

    public void setList4(List list4) {
        this.list4 = list4;
    }

    public List getList5() {
        return list5;
    }

    public void setList5(List list5) {
        this.list5 = list5;
    }

    public List getList6() {
        return list6;
    }

    public void setList6(List list6) {
        this.list6 = list6;
    }

    public List getList7() {
        return list7;
    }

    public void setList7(List list7) {
        this.list7 = list7;
    }

    public List getList8() {
        return list8;
    }

    public void setList8(List list8) {
        this.list8 = list8;
    }

    private List<String> superList = new ArrayList<>();
    private static int id;
    private static int idpp;

    public List getList1() {
        return list1;
    }

    public void setList1(List list1) {
        this.list1 = list1;
    }

    public List getGlist1() {
        return glist1;
    }

    public void setGlist1(List glist1) {
        this.glist1 = glist1;
    }

    public int getIdpp() {
        return idpp;
    }

    public void setIdpp(int idpp) {
        this.idpp = idpp;
    }

    public List getGlist() {
        return glist;
    }

    public void setGlist(List glist) {
        this.glist = glist;
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
    private static int id1;

    public int getId1() {
        return id1;
    }

    public void setId1(int id1) {
        this.id1 = id1;
    }

    public PtProductionDto getPtp() {
        return ptp;
    }

    public void setPtp(PtProductionDto ptp) {
        this.ptp = ptp;
    }
    private String status;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    private static String date, superviser, shifts;
    private static int issueNumber;
    private static String mixingNumber;

    public int getIssueNumber() {
        return issueNumber;
    }

    public void setIssueNumber(int issueNumber) {
        this.issueNumber = issueNumber;
    }

    public String getMixingNumber() {
        return mixingNumber;
    }

    public void setMixingNumber(String mixingNumber) {
        this.mixingNumber = mixingNumber;
    }

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

    private int abcd = 0, sized = 0;

    public int getSized() {
        return sized;
    }

    public void setSized(int sized) {
        this.sized = sized;
    }

    public int getAbcd() {
        return abcd;
    }

    public void setAbcd(int abcd) {
        this.abcd = abcd;
    }

    public String productionInsert() throws ParseException {

         abcd = 12;
//        String b = "Shift2";
//        String a = "Shift1";
//        String c = "Shift3";
        boolean val = false;
        //   this.ulist=pgm.productionList(id);
        //   System.out.println("2222222222222222" +ulist);
        this.ulist = pgm.productionList(getId());
        superList = pgm.getSuperviser();
        this.dlist = pgm.shiftExists();
        shift_date = pgm.getDd();
        productlist=pgm.getProductList();
          this.year=apm.getYear();
        this.sized = 24;
        try {
            System.out.println("date is uuuuuuuuuuuuu"+ptp.getDate());
            ParentGdProduction pc = new ParentGdProduction();
            if (ptp.getDate().length() == 0) {
                status = "12345";

                superList = pgm.getSuperviser();
                addFieldError("ptp.date", "Please Fill Date first");
                // this.clist=cm.packingvallist(getPcard());
            }
            else {
                this.glist = pgm.packingvallist(getPtp());
                System.out.println("clist issssssss" + glist);
                for (Object o1 : glist) {
                    pc = (ParentGdProduction) o1;
                    System.out.println("data is---------------" + pc.getShifts());
                }
                this.ulist = pgm.productionList(getId());
                //   val=pgm.productionInsVal(getPtp());
                System.out.println("kdjgh------------dlgdj--kjhkh6464");
                 this.year=apm.getYear();
                 if(apm.dateCheck(ptp.getDate())){
           Date date=ym.getDateFrom();
                       addFieldError("ptp.date","Year is already closed. Please select date from "+date);
                        return "input";
       }
                
                
//                if (!pgm.check(getPtp())) {
//                    status = "12345";
//                    addFieldError("ptp.date", "Please select date linearly");
//                }
                if (ptp.getSuperviser().equals("-1")) {
                    status = "12345";
                    addFieldError("ptp.superviser", "Please Select Godown Keeper");
                }

                if (ptp.getMixingNumber().equals("-1")) {
                    status = "12345";
                    addFieldError("ptp.mixingNumber", "Please Select Mixing Number");
                }
                if (ptp.getIssueNumber() == -1) {
                    status = "12345";
                    addFieldError("ptp.issueNumber", "Please Select Issue Number");
                }
                Date d=new Date();
                System.out.println("LLLLLLLLLLLLLLLLL"+d);
                SimpleDateFormat sf1= new SimpleDateFormat("yyyy-MM-dd");
                     Date fdate=sf1.parse(ptp.getDate());
                     if(d.before(fdate)){
                        status = "12345";
                    addFieldError("ptp.date", "Future Dates are not allowed");   
                     }
                if (pgm.validateData(getPtp())) {
                    status = "12345";
                    addFieldError("ptp.date", "Data already exists with below data");
                }

                id = getId();
                System.out.println("dhgkhre-------------fhf" + status + id);

            }
            System.out.println("111111111111111hgvhjvbjjjjjjjjjjh" + status);
            if (status == null) {
                status = "123";
                date = ptp.getDate();
                superviser = ptp.getSuperviser();
                // shifts=ptp.getShifts();
                issueNumber = ptp.getIssueNumber();
                mixingNumber = ptp.getMixingNumber();
                System.out.println("9999PPFXGDXFTRYDYY" + date + superviser + mixingNumber + issueNumber);
                System.out.println("kdjgh+dare" + date + superviser + shifts);
            }
        } catch (Exception e) {

        }
        System.out.println("\n list is:" + getUlist());
        return "input";
    }

    public String InsertProductionReal() throws ParseException {
        this.ulist = pgm.productionList(id);
        abcd = 12;
        superList = pgm.getSuperviser();
        System.out.println("d456========ggfdg" + date + superviser + mixingNumber + issueNumber);
        pgm.insertProduction(getPtp(), date, superviser, mixingNumber, issueNumber);
        return "success";
    }
    private List dlist = new ArrayList();
    private Date shift_date = null;

    public List getDlist() {
        return dlist;
    }

    public void setDlist(List dlist) {
        this.dlist = dlist;
    }

    public Date getShift_date() {
        return shift_date;
    }

    public void setShift_date(Date shift_date) {
        this.shift_date = shift_date;
    }

    public String productionHome() {
        try {
            this.year=apm.getYear();
        productlist = pgm.getProductList();
        this.ulist = pgm.productionList1(getId());
        superList = pgm.getSuperviser();
        this.dlist = pgm.shiftExists();
        shift_date = pgm.getDd();
        abcd = 12;
        for (Object o : ulist) {
            Login l = (Login) o;
            System.out.println("type is---------" + l.getLoginType());
            if (l.getLoginType().equals("godown")) {
                return "production";
            }
            if (l.getLoginType().equals("control")) {
                return "production";
            }
        }
 }
         catch(Exception e) {
             e.printStackTrace();
         }
        return "success";
    }

    public ProductionAction() {
        ulist = new ArrayList();
        glist = new ArrayList();
        glist1 = new ArrayList();
        list1 = new ArrayList();
        list9 = new ArrayList();
    }

    public String viewProduction() {
        try {
            this.year=apm.getYear();
        this.ulist = pgm.productionList(getId());
        this.glist = pgm.displayProduction();
        abcd = 12;
         }
         catch(Exception e) {
             e.printStackTrace();
         }
        return "success";
    }

    public String editProduction() {
        superList = pgm.getSuperviser();
        this.ulist = pgm.productionList(getId());
        productlist = pgm.getProductList();
        abcd = 12;
        try {
            this.glist = pgm.productionEdit(getIdpp());
            id1 = getIdpp();
            System.out.println("dkjghfk-------------------" + getIdpp());
            this.glist1 = pgm.productionEdit1(getIdpp());
            System.out.println("1111111111111111111111" + glist1);
            int z = glist1.size();
            System.out.println("9999999999555555555555555555555555555555555555" + z);
            list1 = (glist1.subList(0, 1));
            list2 = (glist1.subList(1, 2));
            list3 = (glist1.subList(2, 3));
            list4 = (glist1.subList(3, 4));
            list5 = (glist1.subList(4, 5));
            list6 = (glist1.subList(5, 6));
            list7 = (glist1.subList(6, 7));
            list8 = (glist1.subList(7, 8));

            list10 = (glist1.subList(8, 9));
            list9 = (glist1.subList(9, 10));
            list11 = (glist1.subList(10, 11));
            list12 = (glist1.subList(11, 12));
            list13 = (glist1.subList(12, 13));
            list14 = (glist1.subList(13, 14));
            list15 = (glist1.subList(14, 15));
            System.out.println("<<<<<<<<<<<<<" + list9);

        } catch (Exception e) {

        }
        return "success";
    }

    public String updateProduction() throws ParseException {
try {
        abcd = 12;
        this.ulist = pgm.productionList(getId());
        pgm.productionUpdate(getPtp(), id1);
        this.glist = pgm.displayProduction();
         }
         catch(Exception e) {
             e.printStackTrace();
         }
        return "success";
    }

    public String deleteProduction() {
        try {
        abcd = 12;
        System.out.println("33333333333333333333333333" + id1);
        this.ulist = pgm.productionList(getId());

        pgm.productionDelete(id1);
        this.glist = pgm.displayProduction();
         }
         catch(Exception e) {
             e.printStackTrace();
         }
        return "success";
    }

}
