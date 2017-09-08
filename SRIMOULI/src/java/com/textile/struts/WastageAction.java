/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.struts;

import com.opensymphony.xwork2.ActionSupport;
import com.textile.dto.WastageDto;
import com.textile.manager.AddPurchaseManager;
import com.textile.manager.WastageManager;
import com.textile.manager.YearManager;
import com.textile.model.FinancialYearBackup;
import com.textile.model.Login;
import com.textile.model.ParentGdWastage;
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
public class WastageAction extends ActionSupport{
     private WastageManager pcm=new WastageManager();
      private AddPurchaseManager apm=new AddPurchaseManager();
       YearManager ym=new YearManager();
     private WastageDto form;
     private List ulist;
     private static  int id;
     private List plist,glist,glist1;
     private List<String> superList = new ArrayList<>();
     private List<String> productlist = new ArrayList<>();
     private List dlist=new ArrayList();
     private String status;
       private List year=null;

    public List getYear() {
        return year;
    }

    public void setYear(List year) {
        this.year = year;
    }

    public WastageManager getPcm() {
        return pcm;
    }

    public void setPcm(WastageManager pcm) {
        this.pcm = pcm;
    }

    public WastageDto getForm() {
        return form;
    }

    public void setForm(WastageDto form) {
        this.form = form;
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

    

    public List getPlist() {
        return plist;
    }

    public void setPlist(List plist) {
        this.plist = plist;
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

    public List<String> getSuperList() {
        return superList;
    }

    public void setSuperList(List<String> superList) {
        this.superList = superList;
    }

    public List<String> getProductlist() {
        return productlist;
    }

    public void setProductlist(List<String> productlist) {
        this.productlist = productlist;
    }

    
    public List getDlist() {
        return dlist;
    }

    public void setDlist(List dlist) {
        this.dlist = dlist;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
     
     public WastageAction(){
     pcm=new WastageManager();
     ulist = new ArrayList();
        glist = new ArrayList();
        glist1 = new ArrayList();
 } 
    
    
     
     private int abcd = 0;
      private Date shift_date=null;

    public int getAbcd() {
        return abcd;
    }

    public void setAbcd(int abcd) {
        this.abcd = abcd;
    }

    public Date getShift_date() {
        return shift_date;
    }

    public void setShift_date(Date shift_date) {
        this.shift_date = shift_date;
    }
    private static String date, receipt;
   
    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public static String getReceipt() {
        return receipt;
    }

    public static void setReceipt(String receipt) {
        WastageAction.receipt = receipt;
    }

   

    
      
 public String wastageHome(){
     this.year=apm.getYear();
       this.ulist=pcm.wastageList(getId());
       System.out.println("sfdrgfdgf=====12345============="+getId());
       this.dlist=pcm.shiftExists();
          shift_date=pcm.getDd();
         abcd=14;
         for(Object o:ulist) {
            Login l=(Login)o;
             System.out.println("type is---------"+l.getLoginType());
          if(l.getLoginType().equals("godown"))
                return "wastage";
          if(l.getLoginType().equals("control"))
                return "wastage";
        }
       
        return "success";
}
 
 public String wastageInsert(){

        abcd = 14;
        boolean val = false;
        this.ulist = pcm.wastageList(getId());
        this.productlist=pcm.getProductList();
        shift_date=pcm.getDd();
         this.dlist=pcm.shiftExists();
         this.year=apm.getYear();
          shift_date=pcm.getDd();
        try {
           
            ParentGdWastage pc = new ParentGdWastage();
            if (form.getDate().length() == 0) {
                status = "12345";
               
                addFieldError("form.date", "Please Fill Date first");
            } else {
                //this.glist = pcm.wastagevallist(getForm());
               
                for (Object o1 : glist) {
                    pc = (ParentGdWastage) o1;
                }
                this.ulist = pcm.wastageList(getId());
                //   val=pgm.productionInsVal(getPtp());
                System.out.println("kdjgh------------dlgdj--kjhkh6464");
                  this.year=apm.getYear();
       if(apm.dateCheck(form.getDate())){
           Date date=ym.getDateFrom();
                       addFieldError("form.date","Year is already closed. Please select date from "+date);
                        return "input";
       }
//                if(!pcm.check(getForm())){
//                    status = "12345";
//                    addFieldError("form.date", "Please select date linearly"); 
//                }
               
                 if(form.getReceipt().length()==0){
                     status = "12345";
                    addFieldError("form.receipt", "Please enter receipt Number");
                }
                  if(pcm.validateData(getForm())){
                     status = "12345";
                    addFieldError("form.date", "Data already exists with below date");
                }
                id = getId();
                System.out.println("dhgkhre-------------fhf" + status + id);

            }
            System.out.println("111111111111111hgvhjvbjjjjjjjjjjh" +status);
            if (status == null) {
                status = "123";
                date = form.getDate();
               receipt = form.getReceipt();
                System.out.println("kdjgh+dare" + date + receipt);
            }
        } catch (Exception e) {

        }
        System.out.println("\n list is:" + getUlist());
        return "input";
    }
     
    public String WastageInsertReal() throws ParseException  {
        this.ulist = pcm.wastageList(id);
        abcd = 14;
        System.out.println("d456========ggfdg" + date );
        pcm.insertWastage(getForm(), date, receipt);
        this.productlist=pcm.getProductList();
        return "success";
    }
    
    private static int id1;

    public static int getId1() {
        return id1;
    }

    public static void setId1(int id1) {
        WastageAction.id1 = id1;
    }
    
    
    public String viewWastage() {
        this.year=apm.getYear();
         abcd = 14;
        this.ulist = pcm.wastageList(getId());
        this.productlist=pcm.getProductList();
        System.out.println("asdfghjkl-------------"+getId());
        System.out.println("asdfghjkl========"+ulist);
        this.glist = pcm.displayWastage();
       
        return "success";
    }
    
    private static int idw;

    public int getIdw() {
        return idw;
    }

    public void setIdw(int idw) {
        this.idw = idw;
    }
    private List list1,list2,list3,list4,list5,list6,list7,list8,list9,list10,list11,list12,list13,list14,list15;

    public List getList1() {
        return list1;
    }

    public void setList1(List list1) {
        this.list1 = list1;
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

    public List getList9() {
        return list9;
    }

    public void setList9(List list9) {
        this.list9 = list9;
    }

    public List getList10() {
        return list10;
    }

    public void setList10(List list10) {
        this.list10 = list10;
    }

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
    
    
    
     public String WastageDelete() 
     {
         abcd = 14;
         this.ulist = pcm.wastageList(id);
        this.productlist=pcm.getProductList();
        pcm.deletewastage(idw);
        
        glist = pcm.displayWastage();
        
        return "success";
    }
    public String WastageEdit() {
       
        this.ulist = pcm.wastageList(id);
         productlist=pcm.getProductList();
        abcd = 14;
        try {
            this.glist = pcm.editWastage(getIdw());
            id1 = getIdw();
            System.out.println("dkjghfk-------------------" + getIdw());
            this.glist1 = pcm.editWastage1(getIdw());
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
             list9 = (glist1.subList(9,10));
             list11=(glist1.subList(10,11));
             list12=(glist1.subList(11,12));
             list13=(glist1.subList(12,13));
            list14= (glist1.subList(13,14));
            list15=(glist1.subList(14,15));
     

        } catch (Exception e) {

        }
        return "success";
    }
     
    public String WastageUpdate() throws ParseException {

        abcd = 12;
        this.ulist = pcm.wastageList(getId());
        pcm.updateWastage(getForm(), idw);
        this.glist = pcm.displayWastage();
        return "success";
    } 
 
}
