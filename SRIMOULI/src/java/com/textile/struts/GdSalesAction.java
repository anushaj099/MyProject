/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.struts;

import com.opensymphony.xwork2.ActionSupport;
import com.textile.manager.GdSalesManager;
import com.textile.dto.GdSalesDto;
import com.textile.manager.AddPurchaseManager;
import com.textile.model.FinancialYearBackup;
import com.textile.model.Login;
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
 * @author ch.mounika
 */
public class GdSalesAction extends ActionSupport{
     GdSalesManager gm=new GdSalesManager();
     private AddPurchaseManager apm=new AddPurchaseManager();
    
    private GdSalesDto gsd;
    private List ulist;
    private static int id;
    private List glist,productlist;
    private static int ids;
     private List year=null;

    public List getYear() {
        return year;
    }

    public void setYear(List year) {
        this.year = year;
    }

    public int getIds() {
        return ids;
    }

    public void setIds(int ids) {
        this.ids = ids;
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

    public List getProductlist() {
        return productlist;
    }

    public void setProductlist(List productlist) {
        this.productlist = productlist;
    }
    
    

    public GdSalesManager getGm() {
        return gm;
    }

    public void setGm(GdSalesManager gm) {
        this.gm = gm;
    }

    public GdSalesDto getGsd() {
        return gsd;
    }

    public void setGsd(GdSalesDto gsd) {
        this.gsd = gsd;
    }

    public GdSalesAction() {
        glist=new ArrayList();
    }

   
  
    public String executesale(){
          this.ulist=gm.saleList1(getId());
         try {
             if(gsd.getDate()!=null) {
//                  if(!gm.check(getGsd())){
//                        addFieldError("gsd.date","Please select date linearly");
//                        return "input";
//                  }
        gm.insertSale(getGsd());
             }
        abcd=13;
        System.out.println("++++++======"+getGsd());
        this.glist=gm.saleList();
       
        for(Object o:ulist) {
            Login l=(Login)o;
             System.out.println("type is---------"+l.getLoginType());
          if(l.getLoginType().equals("godown"))
                return "success";
          if(l.getLoginType().equals("control"))
                return "success";
        }
         }
         catch(Exception e) {
             
         }
        return "fail";
    }
    
    private int abcd=0;

    public int getAbcd() {
        return abcd;
    }

    public void setAbcd(int abcd) {
        this.abcd = abcd;
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
      public String saleHome() {
       try {
            this.year=apm.getYear();
        this.ulist=gm.saleList1(getId());
        this.productlist=gm.getProductList();
        this.dlist=gm.shiftExists();
        shift_date=gm.getDd();
        abcd=13;
       for(Object o:ulist) {
            Login l=(Login)o;
             System.out.println("type is---------"+l.getLoginType());
          if(l.getLoginType().equals("godown"))
                return "sale";
          if(l.getLoginType().equals("control"))
                return "sale";
        }
       }
       catch(Exception e) {
           
       }
        return "success";
    }
      
      public String saleView() {
          try {
               this.year=apm.getYear();
          this.ulist=gm.saleList1(getId());
          this.glist=gm.saleList();
          abcd=13;
           }
         catch(Exception e) {
             e.printStackTrace();
         }
          return "success";
      }
      
      public String saleEdit() {
         
         this.ulist=gm.saleList1(getId());
        System.out.println("ids is==========="+getIds());
        try {
        this.glist=gm.editSale(getIds());
        this.productlist=gm.getProductList();
        abcd=13;
        for(Object o:ulist) {
            Login l=(Login)o;
             System.out.println("type is---------"+l.getLoginType());
         
          if(l.getLoginType().equals("control"))
                return "success";
        }
        }
        catch(Exception e) {
            
        }
        return null;
      }
      public String saleUpdate()
      {
          
           this.ulist=gm.saleList(getGsd());
       // System.out.println("idp is==========="+getIdp());
       try {
       gm.saleUpdate(getGsd());
        this.glist=gm.saleList();
        abcd=13;
        for(Object o:ulist) {
            Login l=(Login)o;
             System.out.println("type is---------"+l.getLoginType());
         
          if(l.getLoginType().equals("control"))
                return "success";
        }
       }
       catch(Exception e) {
           
       }
       return null;
      }  
      
      public String saleDelete() {
          abcd=13;
         gm.deletePurchase(getIds());
         this.ulist=gm.saleList1(getId());
         this.glist=gm.saleList();
         return "success";
      }
             
      
      private static int a,b,c,d,e,f,g,h,i,s, check;

    public static int getCheck() {
        return check;
    }

    public static void setCheck(int check) {
        GdSalesAction.check = check;
    }
      

    @Override
    public void validate() {

      try {
              this.ulist=gm.saleList1(getId());
              this.glist=gm.editSale(getIds());
              this.productlist=gm.getProductList();
               this.year=apm.getYear();
              shift_date=gm.getDd();
               abcd=13;
            System.out.println("zdhfffgdhdfhh");
             if (gsd.getDate().length() == 0) {
                       addFieldError("gsd.date", "Please Insert Date First");
            }
            
           
          
            else {
              if(!(gsd.getDate().length()==0 && gsd.getCname().length()==0 && gsd.getPtype().equals("-1")
                   && gsd.getNbales()==0 && gsd.getGrossWeight()==0 && gsd.getNetWeight()==0 &&
                    gsd.getTareWeight()==0 && gsd.getVno().length()==0 && gsd.getRemarks().length()==0)){
                
            if (gsd.getCname().length()== 0) {
                
                 b++;
                    if (b % 2 != 0) {
                         addFieldError("gsd.cname", "Customer Name is required");
                         
                    } else {
                        addFieldError("gsd.cname", "");
                       b = 0;
                    }
            } 
           if(gsd.getPtype().equals("-1")) {
               
                 c++;
                    if (c % 2 != 0) {
                         addFieldError("gsd.ptype", "Select ProductType");
                         
                    } else {
                        addFieldError("gsd.ptype", "");
                       c = 0;
                    }
            }
      
          if(gsd.getNbales()==null) {
               
                 d++;
                    if (d % 2 != 0) {
                         addFieldError("gsd.nbales", "Enter Number of Bales");
                         
                    } else {
                        addFieldError("gsd.nbales", "");
                       d = 0;
                    }
            }
          if(gsd.getGrossWeight()==null) {
               
                 e++;
                    if (e % 2 != 0) {
                         addFieldError("gsd.grossWeight", "Enter Gross Weight");
                         
                    } else {
                        addFieldError("gsd.grossWeight", "");
                       e= 0;
                    }
            }
         if(gsd.getNetWeight()==null) {
               
              h++;
                    if (h % 2 != 0) {
                         addFieldError("gsd.netWeight", "Enter Net Weight");
                         
                    } else {
                        addFieldError("gsd.netWeight", "");
                       h= 0;
                    }
            }
           if(gsd.getTareWeight()==null) {
               
                 i++;
                    if (i % 2 != 0) {
                         addFieldError("gsd.tareWeight", "Enter Tare Weight");
                         
                    } else {
                        addFieldError("gsd.tareWeight", "");
                       i= 0;
                    }
            }
          
         /*  if(gsd.getVno().length()==0) {
               
                 f++;
                    if (f % 2 != 0) {
                         addFieldError("gsd.vno", "Enter Vehicle Number");
                         
                    } else {
                        addFieldError("gsd.vno", "");
                       f= 0;
                    }
            }*/
            if(gsd.getGrossWeight()<gsd.getTareWeight())
           {
               s++;
                    if (s % 2 != 0) {
                         addFieldError("gsd.tareWeight", "Gross weight must be greaterthan Tare weight");
                         
                    } else {
                        addFieldError("gsd.tareWeight", "");
                       s= 0;
                    }
           }
           
              /*if (!(gsd.getVno().matches("^[A-Z]{2}[0-9]{2}[A-Z]{2}[0-9]{4}$"))) {
                       
                         f++;
                    if (f % 2 != 0) {
                         addFieldError("gsd.vno", "Please provide valid Vehicle Number");
                         
                    } else {
                        addFieldError("gsd.vno", "");
                       f = 0;
                    }
                    }*/
       if(gsd.getRemarks().length()==0) {
               
                 g++;
                    if (g % 2 != 0) {
                         addFieldError("gsd.remarks", "Enter Remarks");
                         
                    } else {
                        addFieldError("gsd.remarks", "");
                       g= 0;
                    }
            }
       
          }
        }
          
        }
       
        catch(Exception e) {
            
        }
     
    }
      
      
      
}
