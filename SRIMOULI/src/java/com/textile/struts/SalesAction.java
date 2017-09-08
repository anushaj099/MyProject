/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.struts;

import com.opensymphony.xwork2.ActionSupport;
import com.textile.dto.SalesDto;
import com.textile.manager.SalesManager;
import com.textile.model.FinancialYearBackup;
import com.textile.model.GdSale;
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
public class SalesAction extends ActionSupport {
    
   SalesManager sm=new SalesManager();
    private SalesDto sd;
    List<GdSale> list;
    List ulist;
    private  int purchaseid=0;

    public int getPurchaseid() {
        return purchaseid;
    }

    public void setPurchaseid(int purchaseid) {
        this.purchaseid = purchaseid;
    }

    
    private Date startdate,enddate;

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

    public List getUlist() {
        return ulist;
    }

    public void setUlist(List ulist) {
        this.ulist = ulist;
    }
    

    public SalesDto getSd() {
        return sd;
    }

    public void setSd(SalesDto sd) {
        this.sd = sd;
    }

    public SalesManager getSm() {
        return sm;
    }

    public void setSm(SalesManager sm) {
        this.sm = sm;
    }

    public List<GdSale> getList() {
        return list;
    }

    public void setList(List<GdSale> list) {
        this.list = list;
    }

   
    
    
    private String date;
    private String date1; 
    private static int id;
    private String ptype;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    

    public String getDate1() {
        return date1;
    }

    public void setDate1(String date1) {
        this.date1 = date1;
    }
    
   

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getPtype() {
        return ptype;
    }

    public void setPtype(String ptype) {
        this.ptype = ptype;
    }
  private List productlist=new ArrayList();

    public List getProductlist() {
        return productlist;
    }

    public void setProductlist(List productlist) {
        this.productlist = productlist;
    }
  
    
   public SalesAction()
   {
       sm=new SalesManager();
   }

   private int abcd=0;

    public int getAbcd() {
        return abcd;
    }

    public void setAbcd(int abcd) {
        this.abcd = abcd;
    }
     public String retrievesale() throws ParseException {
          this.ulist=sm.saleList1(getId());
          this.productlist=sm.getProductList();
           abcd=13;
       try
      {
        
        
         System.out.println("+++++++++"+getSd());
        
         System.out.println("================"+list);
         if(sd.getDate().length()==0) {
                addFieldError("sd.date","From date Should not be Empty"); 
            }
            if(sd.getDate1().length()==0) {
                addFieldError("sd.date1","To date Should not be Empty"); 
            }
         list=sm.RetriveGds(getSd());
        
         System.out.println("jhdgfrgrfhrjh//////====++++++"+sd);
         Date d1 = new SimpleDateFormat("dd-MM-yyyy").parse(sd.getDate());
         Date d2 = new SimpleDateFormat("dd-MM-yyyy").parse(sd.getDate1());
         if(d1.after(d2))
         {
             addFieldError("sd.date1","From date must be lessthan To date"); 
         }
         else if(list.isEmpty()){
           addFieldError("sd.date"," Data not Exists");
        }
      }
      catch(Exception e)
      {
          
      }
      return "success";
     }
     
      public String retrievesale1() throws ParseException {
           this.ulist=sm.saleList1(getId());
          this.productlist=sm.getProductList();
           abcd=13;
       try
      {
        
        
         System.out.println("+++++++++"+getSd());
        
         System.out.println("================"+list);
         if(sd.getDate().length()==0) {
                addFieldError("sd.date","From date Should not be Empty"); 
            }
            if(sd.getDate1().length()==0) {
                addFieldError("sd.date1","To date Should not be Empty"); 
            }
         
        list=sm.MiniRetriveGds(sd);
         System.out.println("jhdgfrgrfhrjh//////====++++++"+sd);
         Date d1 = new SimpleDateFormat("dd-MM-yyyy").parse(sd.getDate());
         Date d2 = new SimpleDateFormat("dd-MM-yyyy").parse(sd.getDate1());
         if(d1.after(d2))
         {
             addFieldError("sd.date1","From date must be lessthan To date"); 
         }
         if(sd.getPtype().length()==0) {
                addFieldError("sd.ptype","select atleast one check box"); 
            }
          else if(list.isEmpty()){
           addFieldError("sd.date"," Data not Exists");
        }
      }
      catch(Exception e)
      {
          
      }
      return "success";
     }
     
     
       
}
