/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.readymix.action;

import com.opensymphony.xwork2.ActionSupport;
import com.readymix.dto.TaxInvoiceDto;
import com.readymix.manager.LoginManager;
import com.readymix.manager.TaxIManager;
import com.readymix.model.Login;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Masrat
 */
public class TaxIAction extends ActionSupport{
    private TaxInvoiceDto tdto;
     private List glist=new ArrayList();
     private TaxIManager tim=new TaxIManager();
     private List ulist;
     private static int lid;
     private LoginManager umanager;
     private int invoi;
         private List invlist;
         private String words;

    public String getWords() {
        return words;
    }

    public void setWords(String words) {
        this.words = words;
    }

    public List getInvlist() {
        return invlist;
    }

    public void setInvlist(List invlist) {
        this.invlist = invlist;
    }

    public int getInvoi() {
        return invoi;
    }

    public void setInvoi(int invoi) {
        this.invoi = invoi;
    }
     
     

    public LoginManager getUmanager() {
        return umanager;
    }

    public void setUmanager(LoginManager umanager) {
        this.umanager = umanager;
    }

    public TaxIAction() {
        ulist=new ArrayList();
        umanager=new LoginManager();
        invlist=new ArrayList();
        tlist=new ArrayList();
         tlist1=new ArrayList();
          tlist2=new ArrayList();
           tlist3=new ArrayList();
            tlist4=new ArrayList();
             tlist5=new ArrayList();
              tlist6=new ArrayList();
               tlist7=new ArrayList();
                tlist8=new ArrayList();
                 tlist9=new ArrayList();
                  tlist10=new ArrayList();
                   tlist11=new ArrayList();
                    tlist12=new ArrayList();
                     tlist13=new ArrayList();
                      tlist14=new ArrayList();
                       tlist15=new ArrayList();
    }

    public List getUlist() {
        return ulist;
    }

    public void setUlist(List ulist) {
        this.ulist = ulist;
    }

    public int getLid() {
        return lid;
    }

    public void setLid(int lid) {
        this.lid = lid;
    }

    public List getGlist() {
        return glist;
    }

    public void setGlist(List glist) {
        this.glist = glist;
    }
     
     

    public TaxInvoiceDto getTdto() {
        return tdto;
    }

    public void setTdto(TaxInvoiceDto tdto) {
        this.tdto = tdto;
    }
    
    public String retrieveGrades(){
        System.out.println("the retrieve of grades action");
        try{
            invoi=tim.invoiceno();
            this.ulist=umanager.dataRetrieve(getLid());
            System.out.println("list issssssssssss"+ulist);
        this.glist=tim.getGrades();
        System.out.println("the grades list iss----------..----->"+glist);
        }catch(Exception n){
            System.out.println("the exception in Supply Invoice Action--..---->"+n);
        }
        return SUCCESS;
        
    }
    
     public String insertTaxInvoice(){
        System.out.println("\n..the insertion off supplymentry invoice action..");
        try{
              this.ulist=umanager.dataRetrieve(getLid());
            System.out.println("list issssssssssss"+ulist);
            System.out.println("the insertion in login form iss--->");
            System.out.println(getTdto().getBillToName());
            tim.insertTaxInvoice(getTdto());
            this.invlist=tim.invlist(tdto.getInvoiceNo());
            System.out.println("Invoice list isssssssss"+invlist);
            this.tlist=tim.invlistChild(tdto.getInvoiceNo());
            this.round_val=tim.getRound_val();
          this.words=tim.getWords();
             this.tlist1=tlist.subList(0,1);
             this.tlist2=tlist.subList(1,2);
             this.tlist3=tlist.subList(2,3);
             this.tlist4=tlist.subList(3,4);
              this.tlist5=tlist.subList(4,5);
               this.tlist6=tlist.subList(5,6);
                this.tlist7=tlist.subList(6,7);
                 this.tlist8=tlist.subList(7,8);
                  this.tlist9=tlist.subList(8,9);
                   this.tlist10=tlist.subList(9,10);
                    this.tlist11=tlist.subList(10,11);
                     this.tlist12=tlist.subList(11,12);
                      this.tlist13=tlist.subList(12,13);
                       this.tlist14=tlist.subList(13,14);
                        this.tlist15=tlist.subList(14,15);
                        
                      
        }catch(IndexOutOfBoundsException e){
            System.out.println("the exception in the insertion of supplymentry invoice iss----->"+e);
        }
        return SUCCESS;
    }
     
     public String disDahboard() {
         
          try{
              String ltype=null;
            this.ulist=umanager.dataRetrieve(getLid());
            System.out.println("list issssssssssss"+ulist);
             for(Object o:ulist) {
                Login l=(Login) o;
                 ltype=l.getLType();
                 System.out.println("login type iss"+ltype);
            }
            if(ltype.equals("control")) {
                return "control";
            }
            else {
                return "user";
            }
       
        }catch(Exception n){
            System.out.println("the exception in Supply Invoice Action--..---->"+n);
        }
         return "404err";
     }
     
     
     public String viewInvoice() {
         
         try {
             System.out.println(lid+"&&&&&&&&&&&&&&&"+getInvoiceNo());
            this.ulist=umanager.dataRetrieve(getLid());
            System.out.println("list issssssssssss"+ulist);
             this.invlist=tim.invlist(getInvoiceNo());
            System.out.println("Invoice list isssssssss"+invlist);
            this.tlist=tim.invlistChild(getInvoiceNo());
             this.round_val=tim.getRound_val();
          this.words=tim.getWords();
           this.tlist1=tlist.subList(0,1);
             System.out.println("the sublist sis98734755(*&*(&------------->"+tlist1);
             this.tlist2=tlist.subList(1,2);
              System.out.println("the sublist sis98----**---*-734755(*&*(&------------->"+tlist2);
             this.tlist3=tlist.subList(2,3);
             this.tlist4=tlist.subList(3,4);
              this.tlist5=tlist.subList(4,5);
               this.tlist6=tlist.subList(5,6);
                this.tlist7=tlist.subList(6,7);
                 this.tlist8=tlist.subList(7,8);
                  this.tlist9=tlist.subList(8,9);
                   this.tlist10=tlist.subList(9,10);
                    this.tlist11=tlist.subList(10,11);
                     this.tlist12=tlist.subList(11,12);
                      this.tlist13=tlist.subList(12,13);
                       this.tlist14=tlist.subList(13,14);
                        this.tlist15=tlist.subList(14,15);
         }
         catch(Exception e) {
             
         }
         return "success";
     }
     
     public String editInvoice() {
          try {
             System.out.println(lid+"&&&&&&&&&&&&&&&"+getInvoiceNo());
            this.ulist=umanager.dataRetrieve(getLid());
            System.out.println("list issssssssssss"+ulist);
             this.invlist=tim.invlist(getInvoiceNo());
            System.out.println("Invoice list isssssssss"+invlist);
            this.tlist=tim.invlistChild(getInvoiceNo());
            this.glist=tim.getGrades();
          this.words=tim.getWords();
           this.tlist1=tlist.subList(0,1);
             this.tlist2=tlist.subList(1,2);
             this.tlist3=tlist.subList(2,3);
             this.tlist4=tlist.subList(3,4);
              this.tlist5=tlist.subList(4,5);
               this.tlist6=tlist.subList(5,6);
                this.tlist7=tlist.subList(6,7);
                 this.tlist8=tlist.subList(7,8);
                  this.tlist9=tlist.subList(8,9);
                   this.tlist10=tlist.subList(9,10);
                    this.tlist11=tlist.subList(10,11);
                     this.tlist12=tlist.subList(11,12);
                      this.tlist13=tlist.subList(12,13);
                       this.tlist14=tlist.subList(13,14);
                        this.tlist15=tlist.subList(14,15);
         }
         catch(IndexOutOfBoundsException e) {
             
         }
         return "success";
     }
     
     public String updateInvoice() throws ParseException {
         
          System.out.println("\n..the insertion off supplymentry invoice action..");
        try{
              this.ulist=umanager.dataRetrieve(getLid());
            System.out.println("list issssssssssss"+ulist);
            System.out.println("the insertion in login form iss--->");
            System.out.println(getTdto().getBillToName());
            tim.deleteTax(getTdto());
             tim.insertTaxInvoice(getTdto());
          //  tim.updateTax(getTdto());
            this.invlist=tim.invlist(tdto.getInvoiceNo());
            System.out.println("Invoice list isssssssss"+invlist);
            this.tlist=tim.invlistChild(tdto.getInvoiceNo());
             this.round_val=tim.getRound_val();
          this.words=tim.getWords();
             this.tlist1=tlist.subList(0,1);
             this.tlist2=tlist.subList(1,2);
             this.tlist3=tlist.subList(2,3);
             this.tlist4=tlist.subList(3,4);
              this.tlist5=tlist.subList(4,5);
               this.tlist6=tlist.subList(5,6);
                this.tlist7=tlist.subList(6,7);
                 this.tlist8=tlist.subList(7,8);
                  this.tlist9=tlist.subList(8,9);
                   this.tlist10=tlist.subList(9,10);
                    this.tlist11=tlist.subList(10,11);
                     this.tlist12=tlist.subList(11,12);
                      this.tlist13=tlist.subList(12,13);
                       this.tlist14=tlist.subList(13,14);
                        this.tlist15=tlist.subList(14,15);
                        
                      
        }catch(IndexOutOfBoundsException e){
            System.out.println("the exception in the insertion of supplymentry invoice iss----->"+e);
        }
         return "success";
     }
     
     
     
      public String viewTaxList() {
         try {
             this.ulist=umanager.dataRetrieve(getLid());
             for(Object o:ulist) {
                 Login l=(Login) o;
                 System.out.println("LOGIN TYPPW ISSSSSSSSSS"+l.getLType());
             }
            System.out.println("list issssssssssss"+ulist);
            this.glist=tim.getTaxList();
         }
         catch(Exception e) {
             
         }
         return "success";
     }
     
     
     
     
     
     
     
     
     private List tlist;
     private List tlist1,tlist2,tlist3,tlist4,tlist5,tlist6,tlist7,tlist8,tlist9,tlist10,tlist11,tlist12,tlist13,tlist14,tlist15;
     
     private int invoiceNo;
     private Double round_val;

    public Double getRound_val() {
        return round_val;
    }

    public void setRound_val(Double round_val) {
        this.round_val = round_val;
    }

    public int getInvoiceNo() {
        return invoiceNo;
    }

    public void setInvoiceNo(int invoiceNo) {
        this.invoiceNo = invoiceNo;
    }
    public List getTlist() {
        return tlist;
    }

    public void setTlist(List tlist) {
        this.tlist = tlist;
    }

    public List getTlist1() {
        return tlist1;
    }

    public void setTlist1(List tlist1) {
        this.tlist1 = tlist1;
    }

    public List getTlist2() {
        return tlist2;
    }

    public void setTlist2(List tlist2) {
        this.tlist2 = tlist2;
    }

    public List getTlist3() {
        return tlist3;
    }

    public void setTlist3(List tlist3) {
        this.tlist3 = tlist3;
    }

    public List getTlist4() {
        return tlist4;
    }

    public void setTlist4(List tlist4) {
        this.tlist4 = tlist4;
    }

    public List getTlist5() {
        return tlist5;
    }

    public void setTlist5(List tlist5) {
        this.tlist5 = tlist5;
    }

    public List getTlist6() {
        return tlist6;
    }

    public void setTlist6(List tlist6) {
        this.tlist6 = tlist6;
    }

    public List getTlist7() {
        return tlist7;
    }

    public void setTlist7(List tlist7) {
        this.tlist7 = tlist7;
    }

    public List getTlist8() {
        return tlist8;
    }

    public void setTlist8(List tlist8) {
        this.tlist8 = tlist8;
    }

    public List getTlist9() {
        return tlist9;
    }

    public void setTlist9(List tlist9) {
        this.tlist9 = tlist9;
    }

    public List getTlist10() {
        return tlist10;
    }

    public void setTlist10(List tlist10) {
        this.tlist10 = tlist10;
    }

    public List getTlist11() {
        return tlist11;
    }

    public void setTlist11(List tlist11) {
        this.tlist11 = tlist11;
    }

    public List getTlist12() {
        return tlist12;
    }

    public void setTlist12(List tlist12) {
        this.tlist12 = tlist12;
    }

    public List getTlist13() {
        return tlist13;
    }

    public void setTlist13(List tlist13) {
        this.tlist13 = tlist13;
    }

    public List getTlist14() {
        return tlist14;
    }

    public void setTlist14(List tlist14) {
        this.tlist14 = tlist14;
    }

    public List getTlist15() {
        return tlist15;
    }

    public void setTlist15(List tlist15) {
        this.tlist15 = tlist15;
    }
     public String deleteVoice() {
         try {
             this.ulist=umanager.dataRetrieve(getLid());
             for(Object o:ulist) {
                 Login l=(Login) o;
                 System.out.println("LOGIN TYPPW ISSSSSSSSSS"+l.getLType());
             }
            System.out.println("list issssssssssss"+ulist);
            tim.deleteTax1(getInvoiceNo());
             this.glist=tim.getTaxList();
         }
         catch(Exception e) {
             
         }
         return "success";
     }
     
}
