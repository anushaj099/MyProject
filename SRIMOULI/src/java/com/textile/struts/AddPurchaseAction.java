/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.struts;

import com.opensymphony.xwork2.ActionSupport;
import com.textile.dto.PurchaseForm;
import com.textile.manager.AddPurchaseManager;
import com.textile.manager.YearManager;
import com.textile.model.FinancialYearBackup;
import com.textile.model.Login;
import com.textile.util.HibernateUtil;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import static java.util.concurrent.TimeUnit.MILLISECONDS;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author nsg
 */
public class AddPurchaseAction extends ActionSupport{
    
    AddPurchaseManager pm=new AddPurchaseManager();
    YearManager ym=new YearManager();
    private String supplierName;
    private String productType;
    private String vehicleNo;
    private String remarks;
    private Integer noOfBales;
    //private int noOfKgs;
    private Float grossWeight;
    private Float netWeight;
    private Float tareWeight;
    private String date;
    private static int id;
    private static int idp;
    private static int a,b,c,d,e,f,g,h,i,check;
     public List year=new ArrayList();

    public List getYear() {
        return year;
    }

    public void setYear(List year) {
        this.year = year;
    }
     
     
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdp() {
        return idp;
    }

    public void setIdp(int idp) {
        this.idp = idp;
    }
    
    private   PurchaseForm f1;
    
    private List ulist,productlist;
    private static List glist;

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

    public List getProductlist() {
        return productlist;
    }

    public void setProductlist(List productlist) {
        this.productlist = productlist;
    }

    public  AddPurchaseAction(){
    ulist=new ArrayList<>();
    glist=new ArrayList();
}
    
    public PurchaseForm getF1() {
        return f1;
    }

    public void setF1(PurchaseForm f1) {
        this.f1 = f1;
    }

    public AddPurchaseManager getPm() {
        return pm;
    }

    public void setPm(AddPurchaseManager pm) {
        this.pm = pm;
    }

    public String getSupplierName() {
        return supplierName;
    }

    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName;
    }

    public String getProductType() {
        return productType;
    }

    public void setProductType(String productType) {
        this.productType = productType;
    }

    public String getVehicleNo() {
        return vehicleNo;
    }

    public void setVehicleNo(String vehicleNo) {
        this.vehicleNo = vehicleNo;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public Integer getNoOfBales() {
        return noOfBales;
    }

    public void setNoOfBales(Integer noOfBales) {
        this.noOfBales = noOfBales;
    }

    public Float getGrossWeight() {
        return grossWeight;
    }

    public void setGrossWeight(Float grossWeight) {
        this.grossWeight = grossWeight;
    }

    public Float getNetWeight() {
        return netWeight;
    }

    public void setNetWeight(Float netWeight) {
        this.netWeight = netWeight;
    }

    public Float getTareWeight() {
        return tareWeight;
    }

    public void setTareWeight(Float tareWeight) {
        this.tareWeight = tareWeight;
    }

   
   
//    public int getNoOfKgs() {
//        return noOfKgs;
//    }
//
//    public void setNoOfKgs(int noOfKgs) {
//        this.noOfKgs = noOfKgs;
//    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
    
    public String purchase() throws ParseException{
         
          
        try {
             System.out.println("<<<<<<the list of year is in purchase of addpurchaseaction*****..........-------"+year.size());
            this.year=pm.getYear();
            
            System.out.println("the list of year is in purchase of after addpurchaseaction*****..........-------"+year.size());
             this.dlist=pm.shiftExists();
             this.productlist=pm.getProductList();
        shift_date=pm.getDd();
            if(f1.getDate()!=null){
                System.out.println("]]]]]]]]]...........]]]]]]]]]]]]]]]"+f1.getDate());
                
       if(pm.dateCheck(f1.getDate())){
           Date date=ym.getDateFrom();
                       addFieldError("f1.date","Year is already closed. Please select date from "+date);
                        return "input";
       }
              
//                if(!pm.check(getF1())){
//                      System.out.println("]]]]]]]]]...........]]]]]]]]]]]]]]]"+getF1());
//                        addFieldError("f1.date","Please fill date value linearly");
//                        return "input";
//                  }
             
                pm.insert2(getF1());
            }
       this.ulist=pm.purchaseList1(getId());
          this.glist=pm.puchaseList();
       
        for(Object o:ulist) {
            Login l=(Login)o;
             System.out.println("type is---------"+l.getLoginType());
          if(l.getLoginType().equals("godown"))
                return "view";
          if(l.getLoginType().equals("control"))
                return "view";
        }
        }
        catch(NullPointerException e) {
            
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
  private Date shift_date=null;
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
    public String purchaseHome() {
       try {
           
        this.ulist=pm.purchaseList1(getId());
        this.productlist=pm.getProductList();
        this.dlist=pm.shiftExists();
        this.productlist=pm.getProductList();
         this.year=pm.getYear();
        shift_date=pm.getDd();
        abcd=11;
        for(Object o:ulist) {
            Login l=(Login)o;
             System.out.println("type is---------"+l.getLoginType());
          if(l.getLoginType().equals("godown"))
                return "purchase";
          if(l.getLoginType().equals("control"))
                return "purchase";
        }
       }
       catch(Exception e) {
           e.printStackTrace();
       }
        return "success";
    }
    
    
    public String editPurchase() {
        try {
        this.ulist=pm.purchaseList1(getId());
        System.out.println("idp is==========="+getIdp());
        this.glist=pm.editPurchase(getIdp());
         this.productlist=pm.getProductList();
        abcd=11;
        for(Object o:ulist) {
            Login l=(Login)o;
             System.out.println("type is---------"+l.getLoginType());
         
          if(l.getLoginType().equals("control"))
                return "success";
        }
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        return null;
       
    }
     public String updatePurchase() {
        try {
        this.ulist=pm.purchaseList(getF1());
        this.productlist=pm.getProductList();
        System.out.println("idp is==========="+getIdp());
       pm.purchaseUpdate(getF1());
        this.glist=pm.puchaseList();
        abcd=11;
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
     public String deletePurchase() 
     {
         try {
         abcd=1;
         pm.deletePurchase(getIdp());
         this.ulist=pm.purchaseList1(getId());
         this.productlist=pm.getProductList();
         this.glist=pm.puchaseList();
         }
         catch(Exception e) {
             e.printStackTrace();
         }
         return "success";
     }
     public String purchaseView()
     {
         try {
           this.year=pm.getYear();
          System.out.println("in the view of aaaaapruchase action -----------"+year);
         abcd=11;
         this.ulist=pm.purchaseList1(getId());
         this.productlist=pm.getProductList();
         this.glist=pm.puchaseList();
          }
         catch(Exception e) {
             e.printStackTrace();
         }
        return "success";
     }
     private static int s;
    @Override
  public void validate() {
        try {
             this.year=pm.getYear();
              this.ulist=pm.purchaseList1(getId()); 
              this.glist=pm.editPurchase(getIdp());
              this.productlist=pm.getProductList();
               this.dlist=pm.shiftExists();
                this.productlist=pm.getProductList();
        shift_date=pm.getDd();
               abcd=11;
            System.out.println("zdhfffgdh-----------.......-------------///////////dfhh"+f1);
            if(getF1()!=null)
          
           if(f1.getDate().length() == 0 || f1.getDate()==null) {
                
                a++;
                System.out.println("lkfhj-------------fjj----------"+a);
                    if (a % 2 != 0) {
                         addFieldError("f1.date", "Please Fill Date First");
                         
                    } else {
                        addFieldError("f1.date", "");
                       a = 0;
                    }
            }
           
            else {
              if(!(f1.getDate().length()==0 && f1.getSupplierName().length()==0 && f1.getProductType().equals("-1")
                   && f1.getNoOfBales()==0 && f1.getGrossWeight()==0 && f1.getNetWeight()==0 && 
                      f1.getTareWeight()==0 && f1.getVehicleNo().length()==0 && f1.getRemarks().length()==0)){
               
                   
           
            if (f1.getSupplierName().length()== 0) {
                
                 b++;
                    if (b % 2 != 0) {
                         addFieldError("f1.supplierName", "Supplier Name is required");
                         
                    } else {
                        addFieldError("f1.supplierName", "");
                       b = 0;
                    }
            } 
           if(f1.getProductType().equals("-1")) {
               
                 c++;
                    if (c % 2 != 0) {
                         addFieldError("f1.productType", "Select ProductType");
                         
                    } else {
                        addFieldError("f1.productType", "");
                       c = 0;
                    }
            }
      
          if(f1.getNoOfBales()==null) {
               
                 d++;
                    if (d % 2 != 0) {
                         addFieldError("f1.noOfBales", "Enter Number of Bales");
                         
                    } else {
                        addFieldError("f1.noOfBales", "");
                       d = 0;
                    }
            }
          if(f1.getGrossWeight()==null) {
               
                 e++;
                    if (e % 2 != 0) {
                         addFieldError("f1.grossWeight", "Enter Gross Weight");
                         
                    } else {
                        addFieldError("f1.grossWeight", "");
                       e= 0;
                    }
            }
//          if(f1.getGrossWeight()>4) {
//               
//                 e++;
//                    if (e % 2 != 0) {
//                         addFieldError("f1.grossWeight", "Gross weight must be less than 4 digits");
//                         
//                    } else {
//                        addFieldError("f1.grossWeight", "");
//                       e= 0;
//                    }
//            }
          if(f1.getNetWeight()==null) {
               
                 h++;
                    if (h % 2 != 0) {
                         addFieldError("f1.netWeight", "Enter Net Weight");
                         
                    } else {
                        addFieldError("f1.netWeight", "");
                       h= 0;
                    }
            }
          
          if(f1.getTareWeight()==null) {
               
                 i++;
                    if (i % 2 != 0) {
                         addFieldError("f1.tareWeight", "Enter Tare Weight");
                         
                    } else {
                        addFieldError("f1.tareWeight", "");
                       i= 0;
                    }
            }
         
       /*    if(f1.getVehicleNo().length()==0) {
               
                 f++;
                    if (f % 2 != 0) {
                         addFieldError("f1.vehicleNo", "Enter Vehicle Number");
                         
                    } else {
                        addFieldError("f1.vehicleNo", "");
                       f= 0;
                    }
            }
        else    if (!(f1.getVehicleNo().matches("^[A-Z]{2}[0-9]{2}[A-Z]{2}[0-9]{4}$"))) {
                       
                         f++;
                    if (f % 2 != 0) {
                         addFieldError("f1.vehicleNo", "Please provide valid Vehicle Number");
                         
                    } else {
                        addFieldError("f1.vehicleNo", "");
                       f = 0;
                    }
                    } */
           if(f1.getGrossWeight()<f1.getTareWeight())
           {
               s++;
                    if (s % 2 != 0) {
                         addFieldError("f1.tareWeight", "Gross weight must be greaterthan Tare weight");
                         
                    } else {
                        addFieldError("f1.tareWeight", "");
                       s= 0;
                    }
           }
       if(f1.getRemarks().length()==0) {
               
                 g++;
                    if (g % 2 != 0) {
                         addFieldError("f1.remarks", "Enter Remarks");
                         
                    } else {
                        addFieldError("f1.remarks", "");
                       g= 0;
                    }
            }
       
          }
        }
       
        }
       
        catch(NullPointerException e) {
            System.out.println("validate in purchase----------------"+e);
        } 
      
         
    }
    
    }