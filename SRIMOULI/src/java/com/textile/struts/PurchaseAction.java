/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.struts;

import com.opensymphony.xwork2.ActionSupport;
import com.textile.dto.PurchaseDto;
import com.textile.manager.PurchaseManager;
import com.textile.manager.BackupManager;
import com.textile.model.FinancialYearBackup;
import com.textile.model.GdPurchase;
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
 * @author ch.mounika
 */
public class PurchaseAction extends ActionSupport {

    PurchaseManager pur = new PurchaseManager();
    BackupManager bpm=new BackupManager();
    private PurchaseDto pd;
    List<GdPurchase> list;
    List ulist;
    private static int id;
    private int purchaseid=0;
    private Date startdate,enddate;

    public Date getEnddate() {
        return enddate;
    }

    public void setEnddate(Date enddate) {
        this.enddate = enddate;
    }

    public Date getStartdate() {
        return startdate;
    }

    public void setStartdate(Date startdate) {
        this.startdate = startdate;
    }
    public BackupManager getBpm() {
        return bpm;
    }

    public void setBpm(BackupManager bpm) {
        this.bpm = bpm;
    }

    public int getPurchaseid() {
        return purchaseid;
    }

    public void setPurchaseid(int purchaseid) {
        this.purchaseid = purchaseid;
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

    public PurchaseManager getPur() {
        return pur;
    }

    public void setPur(PurchaseManager pur) {
        this.pur = pur;
    }

    public PurchaseDto getPd() {
        return pd;
    }

    public void setPd(PurchaseDto pd) {
        this.pd = pd;
    }

    private String date;
    private String date1;
    private String ptype;

    public String getPtype() {
        return ptype;
    }

    public void setPtype(String ptype) {
        this.ptype = ptype;
    }

    public String getDate1() {
        return date1;
    }

    public void setDate1(String date1) {
        this.date1 = date1;
    }

    public List<GdPurchase> getList() {
        return list;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public PurchaseAction() {
        pur = new PurchaseManager();
        ulist = new ArrayList();
    }
    private int abcd = 0;

    public int getAbcd() {
        return abcd;
    }

    public void setAbcd(int abcd) {
        this.abcd = abcd;
    }

    private List productlist = new ArrayList();

    public List getProductlist() {
        return productlist;
    }

    public void setProductlist(List productlist) {
        this.productlist = productlist;
    }

    public String retrievepur() throws ParseException {

         this.ulist=pur.purchaseList1(getId());
            //this.productlist=pur.getProductList();
           abcd=11;
         try
         {
        
            System.out.println("+++++++++"+getPd());
           
            System.out.println("================"+ulist);
            
            if(pd.getDate().length()==0 || pd.getDate()==null) {
                 System.out.println("+++++++++"+getPd());
                addFieldError("pd.date","From date Should not be Empty"); 
            }
            if(pd.getDate1().length()==0) {
                addFieldError("pd.date1","To date Should not be Empty"); 
            }
           
              list=pur.RetriveGdp(getPd());
             
              System.out.println("sgrghetgr"+pd);
            Date d1 = new SimpleDateFormat("dd-MM-yyyy").parse(pd.getDate());
            Date d2 = new SimpleDateFormat("dd-MM-yyyy").parse(pd.getDate1());
            if(d1.after(d2))
            {
                 addFieldError("pd.date1","From date must be lessthan To date"); 
            }

           else if(list.isEmpty()){
           addFieldError("pd.date"," Data not Exists");
           }
              }
         catch(Exception e)
         {
             
         }
         return "success";
    }

    public String retrievepur1() throws ParseException {

        this.ulist=pur.purchaseList1(getId());
            this.productlist=pur.getProductList();
            System.out.println("\n saranyaaaaaaaaaaaaaaaaaaa"+productlist);
           abcd=11;
         try
         {
        
            System.out.println("+++++++++"+getPd());
           
            System.out.println("================"+ulist);
            
            if(pd.getDate().length()==0 || pd.getDate()==null) {
                 System.out.println("+++++++++"+getPd());
                addFieldError("pd.date","From date Should not be Empty"); 
            }
            if(pd.getDate1().length()==0) {
                addFieldError("pd.date1","To date Should not be Empty"); 
            }
           
              list=pur.MiniRetriveGdp(pd);
              System.out.println("sgrghetgr"+pd);
            Date d1 = new SimpleDateFormat("dd-MM-yyyy").parse(pd.getDate());
            Date d2 = new SimpleDateFormat("dd-MM-yyyy").parse(pd.getDate1());
            if(d1.after(d2))
            {
                 addFieldError("pd.date1","From date must be lessthan To date"); 
            }
             if(pd.getPtype().length()==0){
               addFieldError("pd.ptype","Select atleast one checkbox");
           }
           else if(list.isEmpty()){
           addFieldError("pd.date"," Data not Exists");
           }
              }
         catch(Exception e)
         {
             
         }
         return "success";
     }
}
