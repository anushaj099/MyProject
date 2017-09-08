/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.manager;

import com.opensymphony.xwork2.ActionContext;
import com.textile.dto.PurchaseForm;
import com.textile.model.AvailableYears;
import com.textile.model.CurrentYear;
import com.textile.model.FinancialYearBackup;
import com.textile.model.GdPurchase;
import com.textile.model.GdSale;
import com.textile.model.GodownProduct;
import com.textile.model.Login;
import com.textile.model.ProductsSample;
import com.textile.util.HibernateUtil;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author nsg
 */
public class AddPurchaseManager {
    
    Session s=null;
    
    
    public PurchaseForm insert2(PurchaseForm f1){
        s=HibernateUtil.getSessionFactory().openSession();
        Transaction t=s.beginTransaction();
        GdPurchase g=new GdPurchase();
        try{
            
            System.out.println("++++++++++++++++jhgyttdfftftyfytffytf   inserted");
            String supplierName=f1.getSupplierName();
            String productType=f1.getProductType();
            String vehicleNo=f1.getVehicleNo();
            String remarks=f1.getRemarks();
            Float noOfBales=f1.getNoOfBales();
            Float grossWeight=f1.getGrossWeight();
            System.out.println("ddddddddddmmmmmmm-------==================="+grossWeight);
            Float netWeight=f1.getNetWeight();
            Float tareWeight=f1.getTareWeight();
            //Integer noOfKgs=f1.getNoOfKgs();
            String date=f1.getDate();
            SimpleDateFormat sf1 = new SimpleDateFormat("dd-MM-yy");
            Date doj1 = sf1.parse(date);
            g.setDate(doj1);
            g.setNoOfBales(noOfBales);
            // g.setNoOfKgs(noOfKgs);
            g.setProductType(productType);
            g.setGrossWeight(grossWeight);
            g.setNetWeight(netWeight);
            g.setTareWeight(tareWeight);
            g.setRemarks(remarks);
            g.setSupplierName(supplierName);
            g.setVehicleNo(vehicleNo);
            s.save(g);
            t.commit();
            System.out.println("inserted successfully"+g);
        }
        
        catch(HibernateException he){
            System.out.println("Catch hibernate exception"+he);
            he.printStackTrace();
        }
        catch(Exception e){
            System.out.println("Exception caught"+e);
            e.printStackTrace();
        }
        finally{
            s.close();
        }
        return f1;
    }

    public List purchaseList(PurchaseForm f1) {
        
        Session s=HibernateUtil.getSessionFactory().openSession();
        Transaction t=s.beginTransaction();
        String purchase="purchase";
        List<Login> list=null;
         System.out.println("list is-------------"+f1.getId());
        try {
            Criteria c=s.createCriteria(Login.class);
            c.add(Restrictions.eq("id",f1.getId()));         
            list = c.list();            
        }
        catch(Exception e) {
            
        }
        System.out.println("list is:------->>>>"+list);
        return list; 
    }
    
     public List purchaseList1(int id) 
     {
        Session s=HibernateUtil.getSessionFactory().openSession();
        Transaction t=s.beginTransaction();
        String purchase="purchase";
        List<Login> list=null;
        try {
            Criteria c=s.createCriteria(Login.class);
            c.add(Restrictions.eq("id",id));         
            list = c.list();            
        }
        catch(Exception e) {
            
        }
        System.out.println("list is:------->>>>"+list);
        return list; 
    }
     
    public List getProductList()
    {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<String> p=new ArrayList<>();
      /* List<GodownProduct> l=(List<GodownProduct>)s.createCriteria(GodownProduct.class).list();
       for(GodownProduct d : l)
       {
            p.add(d.getProduct());
       }*/
        String sql="select product_name from products_sample where partial_type like '%Purchase%'";
        SQLQuery query = s.createSQLQuery(sql);
        p=query.list();
        System.out.println("list issssssssssssssssss"+p);
         return p;
       
    }
     
    public List puchaseList()
    {
       Session s=HibernateUtil.getSessionFactory().openSession();
        Transaction t=s.beginTransaction();
        List<GdPurchase> l=new ArrayList<>();
        try {
          Criteria c=s.createCriteria(GdPurchase.class);
          l=c.list();
        }
        catch(Exception e) {
            
        }
         System.out.println("List in Godown Purchase is -------"+l);
         t.commit();
         s.close();
        return l;
    }
    public List editPurchase(int idp) {
        Session s=HibernateUtil.getSessionFactory().openSession();
        Transaction t=s.beginTransaction();
        List<GdPurchase> l=new ArrayList<>();
         System.out.println("idp is"+idp);
        try {
          Criteria c=s.createCriteria(GdPurchase.class);
          c.add(Restrictions.eq("idp",idp));
          l=c.list();
        }
        catch(Exception e) {
            
        }
         System.out.println("List in Godown Purchase is -------"+l);
        return l;
     }

    public PurchaseForm purchaseUpdate(PurchaseForm f1) {
        Session s=HibernateUtil.getSessionFactory().openSession();
        Transaction t=s.beginTransaction();
       
        try {
      //   GdPurchase gd=new GdPurchase();
            System.out.println("IDP ISSSSSSSSSSSSSS"+f1.getIdp());
         String supplierName=f1.getSupplierName();
            String productType=f1.getProductType();
            String vehicleNo=f1.getVehicleNo();
            String remarks=f1.getRemarks();
            Float noOfBales=f1.getNoOfBales();
            Float grossWeight=f1.getGrossWeight();
            System.out.println("ddddddddddmmmmmmm-------==================="+grossWeight);
            Float netWeight=f1.getNetWeight();
            Float tareWeight=f1.getTareWeight();
            //int noOfKgs=f1.getNoOfKgs();
            String date=f1.getDate();
            SimpleDateFormat sf1= new SimpleDateFormat("dd-MM-yy");
            Date doj1=sf1.parse(date);
            int idp=f1.getIdp();
            
           GdPurchase gd=(GdPurchase)s.get(GdPurchase.class,idp);
           // gd=(GdPurchase) c.add(Restrictions.eq("idp",idp));
            gd.setDate(doj1);
            gd.setIdp(idp);
            gd.setSupplierName(supplierName);
            gd.setProductType(productType);
            gd.setNoOfBales(noOfBales);
            gd.setVehicleNo(vehicleNo);
            gd.setGrossWeight(grossWeight);
            gd.setNetWeight(netWeight);
            gd.setTareWeight(tareWeight);
            //gd.setNoOfKgs(noOfKgs);
            gd.setRemarks(remarks);
            s.update(gd);
            t.commit();
         
        }
        catch(Exception e) {
            s.close();
        }
        return f1;
    }

    public void deletePurchase(int idp) 
    {
        Session s=HibernateUtil.getSessionFactory().openSession();
        Transaction t=s.beginTransaction();
        try 
        {
         GdPurchase gd=(GdPurchase) s.get(GdPurchase.class,idp);
         s.delete(gd);
         t.commit();
        }
        catch(Exception e)
        {
            s.close();
        }
    }
    
    public boolean check(PurchaseForm gsd) throws ParseException 
    {
        s=HibernateUtil.getSessionFactory().openSession();
        Transaction t=s.beginTransaction();
        boolean succ=true;
        try
        {
           List<GdSale> l=new ArrayList<>();
           String dd=gsd.getDate();
           SimpleDateFormat sf1= new SimpleDateFormat("dd-MM-yy");
           Date doj1=sf1.parse(dd);
           System.out.println("sjhfj999999999..,,,,,,"+dd);
           Date oneDayBefore = new Date(doj1.getTime() - 2);
           System.out.println("shgtfjerhgt........++++++++=//////////............"+oneDayBefore);
           Criteria c=s.createCriteria(GdPurchase.class);
           l=c.list();
           // c.add(Restrictions.eq("date",oneDayBefore));
           Date d = null;
           for(Object o:l){
              GdPurchase gd=(GdPurchase)o;
                d=gd.getDate();
           } 
           Calendar cal = Calendar.getInstance();
           cal.setTime(d);
           cal.add( Calendar.DATE, 1 );
           Date dt = cal.getTime();  
           System.out.println("..............date..................."+dt);
           if(dt.getTime()==doj1.getTime()||d.getTime()==doj1.getTime()){
              succ=true;
           }
        else
          {
             succ = false;
          }
        }
        catch(NullPointerException p){
            System.out.println("............. in purchase ....."+p);
        }
        t.commit();
        s.close();
        System.out.println("........................"+succ);
        return succ; 
    }
    
    public List checkit() 
    {
         Session s=HibernateUtil.getSessionFactory().openSession();
         Transaction t=s.beginTransaction();
         List l=null;
         try 
         {
             Criteria c=s.createCriteria(GdPurchase.class);
             l=c.list(); 
         }
         catch(Exception e) {
         }
         return l;
    }
    private  Date dd=null;

    public  Date getDd() {
        return dd;
    }

    public void setDd(Date dd) {
        this.dd = dd;
    }
    public List shiftExists() 
    {
         System.out.println("Enetered in to shifts");
         Session s=HibernateUtil.getSessionFactory().openSession();
         Transaction t=s.beginTransaction();
         List<Date> l=null; Date d=null;
         List l1=null,l2=new ArrayList();
         try 
         {
            Criteria c=s.createCriteria(GdPurchase.class).setProjection(Projections.projectionList().add(Projections.max("date")));;
            l=c.list();
            System.out.println("//////////////"+l);
            for(int i=0;i<l.size();i++) {
                d=l.get(i);
                dd=d;
            }
        
         }
        catch(Exception e) {
        }
            System.out.println(">>>>>>>>>>>>>>>>"+l2);
            System.out.println("<<<<<<<<<<<<<<<<"+l2.size());
        return l2;
     }   
     public List getYear() {
        System.out.println("the year is---------*******----------");
       List year=null;
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
       
        try{
            
            Criteria c = s.createCriteria(CurrentYear.class);
            year = c.list();
            t.commit();
            s.close();
            
        }catch(Exception e){
            System.out.println("the exception in current year is------------------------- of production"+e);
        }
       return year;
    }

    public boolean dateCheck(String date) throws ParseException {
        boolean bol=false;
        System.out.println(",,,,,,,,,,,<<<<<<<<<<<.....the passed date is---------------*******-----------"+date);
         
        String actionName = ActionContext.getContext().getName();
        System.out.println("----........----this is calleed from actioin class called----.........----------"+actionName+"------name is-----------------------");
        Date doj1=null;
        if(actionName.equals("Production")||actionName.equals("precleaninginsert")){
             SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
             doj1=simpleDateFormat1.parse(date);
             System.out.println("------------Inside add purchase action with new date picker--------");
        }
        else{
        System.out.println("Inside add purchase action with old date picker");
        SimpleDateFormat sf1 = new SimpleDateFormat("dd-MM-yy");
          doj1 = sf1.parse(date);
        }
            System.out.println("<<<<<<<<<<.................the date after parsing is------"+doj1);
          
          SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
Calendar cal = Calendar.getInstance();

cal.setTime(doj1);
System.out.println(simpleDateFormat1.format(cal.getTime()));
//cal.add(Calendar.DATE, 1);
System.out.println("The argument date vy CAlander iss---------"+simpleDateFormat1.format(cal.getTime()));
Date dl=cal.getTime();
//Date dl=simpleDateFormat1.parse(date);
System.out.println("The argument date iss----.......**********.............-----"+dl);
if(doj1.equals(dl)){
    System.out.println("the dates are parsed correctly'''''''''''.................'''''''''''''..");
}

           
           System.out.println("the given date is----------->"+doj1+"**********------------*************-------"+dl);
           List avlyrs=new ArrayList();
            Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
          try{
            Criteria c = s.createCriteria(AvailableYears.class);
           
            avlyrs = c.list();
        System.out.println("the date from isssssss-----avaailabele---------------------->"+avlyrs);
        if(!avlyrs.isEmpty()){
           for(Object o:avlyrs){
               AvailableYears ay=(AvailableYears)o;
               Date d=ay.getClosedTo();
               System.out.println("the to date in available year is*****---------////----------->"+d);
               if(dl.before(d) || dl.equals(d)){
                   bol=true;
               System.out.println("this is before date of closed years");
               }
           }
        }
          
        }
        catch(Exception e){
            System.out.println("the exception isssssssssss :"+e);
        }
        finally{
            t.commit();
            s.close();
        }
        return bol;
    }

  
}