/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.readymix.manager;

import com.readymix.dto.TaxInvoiceDto;
import com.readymix.model.ChTaxIntra;
import com.readymix.model.Grades;
import com.readymix.model.PrTaxIntra;
import com.readymix.util.HibernateUtil;
import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Month;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import org.apache.commons.net.ntp.NTPUDPClient;
import org.apache.commons.net.ntp.TimeInfo;
import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Swathi
 */
public class ReportsManager {

    public List dailyReport() {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List l = new ArrayList();
        try {
            Date d = new Date();
            System.out.println("Today's date is-------------->>>>>>>>" + d);
            PrTaxIntra pr = new PrTaxIntra();
            Criteria c = s.createCriteria(PrTaxIntra.class);
            c.add(Restrictions.eq("invoiceDate", d));
            l = c.list();
            System.out.println("List is ------>>>>>>--------->>>>>>>>" + l);
        } catch (Exception e) {

        }
        return l;
    }
    private List<String> monlist;

    public List<String> getMonlist() {
        return monlist;
    }

    public void setMonlist(List<String> monlist) {
        this.monlist = monlist;
    }

 
    public List monthlyReport() {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List l = new ArrayList();
        List<String> l3 = new ArrayList();
        List<Date> l2 = new ArrayList();
        String n1 = null;
        monlist=new ArrayList();
        try {

            Criteria c = s.createCriteria(PrTaxIntra.class);
            l = c.list();
            for (Object o : l) {
                PrTaxIntra pr = (PrTaxIntra) o;
                l2.add(pr.getInvoiceDate());
                System.out.println("date is" + pr.getInvoiceDate());
            }
            for (int i = 0; i < l2.size(); i++) {
                Calendar cal = Calendar.getInstance();
                cal.setTime(l2.get(i));
                int month = cal.get(Calendar.MONTH);
                n1 = Month.of(month+1).name();
                monlist.add(n1);
                String n2 = "'" + n1 + "'";
                System.out.println("string iss" + n2);
                if (!(l3.contains(n2))) {
                    l3.add(n2);
                 //   System.out.println("value in final list iss" + l3.get(i));
                }

            }

            System.out.println(n1 + "List of Dates are: ------>>>>>>--------->>>>>>>>" + l2);
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            s.close();
        }
        System.out.println(n1 + "List of Months are: ------>>>>>>--------->>>>>>>>" + l3);
        return l3;
    }

    public List gradeList() {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<String> l=new ArrayList<>();
        try {
            Criteria c = s.createCriteria(Grades.class);
           // c.setProjection(Projections.property("grade"));
             // c.setProjection(Projections.property("uom"));
              List<String>  l2=c.list();
              for(Object o:l2) {
                  Grades gs=(Grades)o;
                  String ss="'"+gs.getGrade()+" ("+gs.getUom()+")"+"'";
                  l.add(ss);
              }
            System.out.println("list sssssssss++++++++++"+l);
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        finally {
            s.close();
        }
        return l;
    }
    
    
      public List gradeUom() {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<String> l=new ArrayList<>();
        try {
            Criteria c = s.createCriteria(Grades.class);
            c.setProjection(Projections.property("uom"));
              List<String>  l2=c.list();
              for(int i=0;i<l2.size();i++) {
                  String ss="'"+l2.get(i)+"'";
                  l.add(ss);
              }
            System.out.println("uommmm sssssssss++++++++++"+l);
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        finally {
            s.close();
        }
        return l;
    }
    
      public String getDate() throws UnknownHostException, IOException 
    {
        String TIME_SERVER = "time-a.nist.gov";   
        NTPUDPClient timeClient = new NTPUDPClient();
        InetAddress inetAddress = InetAddress.getByName(TIME_SERVER);
        TimeInfo timeInfo = timeClient.getTime(inetAddress);
        long returnTime = timeInfo.getMessage().getTransmitTimeStamp().getTime();
        Date time = new Date(returnTime);
        
  
        System.out.println("Time from " + TIME_SERVER + ": " + time);
        DateFormat d=new SimpleDateFormat("dd/MM/yyyy");
        String date=d.format(time);
        System.out.println("Current date isssssss"+date);
        return date;
    }
      
      
    public List invCount() {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List l = new ArrayList();
        List<String> l3 = new ArrayList();
        List<Date> l2 = new ArrayList();
        List<String> l4=new ArrayList();
        List<Integer> l5=new ArrayList();
        String n1 = null;
        try {
            Calendar cal = Calendar.getInstance();

            Criteria c = s.createCriteria(PrTaxIntra.class);
            l = c.list();
            for (Object o : l) {
                PrTaxIntra pr = (PrTaxIntra) o;
                l2.add(pr.getInvoiceDate());
                System.out.println("date is" + pr.getInvoiceDate());
            }
            for (int i = 0; i < l2.size(); i++) {

                cal.setTime(l2.get(i));
                int month = cal.get(Calendar.MONTH);
                n1 = Month.of(month+1).name();
                System.out.println("month isssssssss"+n1);
              
                String n2 = "'" + n1 + "'";
                System.out.println("string iss" + n2);
                if (!(l3.contains(n2))) {
                    l3.add(n2);
                      l4.add(n1);
                //    System.out.println("value in final list iss" + l3.get(i));
                }
                System.out.println("list size iss" + l3.size());
            }

            for (int z = 0; z < l4.size(); z++) {
               
                String invoiceDate = l4.get(z);
                 System.out.println("***************************"+invoiceDate);
              String sql = "select count(p.invoice_no) from pr_tax_intra p where monthname(p.invoice_date)=:invoiceDate";
                 SQLQuery query = s.createSQLQuery(sql);
                
                query.setParameter("invoiceDate", invoiceDate);
               List l6 = query.list();
                l5.addAll(l6);
                System.out.println("Invoice in" + invoiceDate + "are:------>>>>>>" + l5);
            }

            System.out.println(n1 + "List of Dates are: ------>>>>>>--------->>>>>>>>" + l2);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(n1 + "List of Months are: ------>>>>>>--------->>>>>>>>" + l5);
        return l5;
    }
    
    public List gradeCount() {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List l = new ArrayList();
        List<Integer>  glist=new ArrayList();
       try {
           String da=getDate();
           System.out.println("current date isssss"+da);
            DateFormat df=new SimpleDateFormat("dd/MM/yyyy");
            Date d=df.parse(da);
        
           Calendar cal = Calendar.getInstance();
           cal.setTime(d);
           int month2 = cal.get(Calendar.MONTH);
           String month=Month.of(month2+1).name();
           System.out.println("month isssssssss"+month);
           
            Criteria c = s.createCriteria(Grades.class);
            c.setProjection(Projections.property("grade"));
              List<String>  grades=c.list();
              
           
           glist=new ArrayList();
           System.out.println("grades list iss"+grades);
           for(int i=0;i<grades.size();i++) 
           {
               System.out.println("grade isss"+grades.get(i));
               String productDesc=grades.get(i);
               String invoiceDate=month;
               String sql="select count(p.invoice_no) from pr_tax_intra p,ch_tax_intra c where c.product_desc=:productDesc and monthname(p.invoice_date)=:invoiceDate AND p.pt_id=c.ptc_id"; 
                SQLQuery query = s.createSQLQuery(sql);
                query.setParameter("productDesc", productDesc);
                query.setParameter("invoiceDate", invoiceDate);
                List list=query.list();
                System.out.println("list in grade"+list);
               glist.addAll(list);
               
           }
           
            
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println( "List of Months are: ------>>>>>>--------->>>>>>>>" + glist);
        return glist;
    }
   
public List getGrades() {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<Grades> list = new ArrayList<>();
      
        try {
            Criteria c = s.createCriteria(Grades.class);
           c.setProjection(Projections.distinct(Projections.property("grade")));
            list = c.list();
        } catch (Exception e) {
            System.out.println("the error in retrieving grades in taximanager is------>"+e);

        }finally{
            t.commit();
            s.close();
        }
        System.out.println("Grades list is:------->>>>" + list);
        return list;
    }
    
    public List getNames() {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<Grades> list = new ArrayList<>();
      
        try {
            Criteria c = s.createCriteria(PrTaxIntra.class);
            c.setProjection(Projections.distinct(Projections.property("billToName")));
            list = c.list();
        } catch (Exception e) {
            System.out.println("the error in retrieving namessssssssss in taximanager is------>"+e);

        }finally{
            t.commit();
            s.close();
        }
        System.out.println("supplier namessssssssss list is:------->>>>" + list);
        return list;
    }
    
    
      public List getSupplierMost() 
    {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<String> l = new ArrayList();
        try 
        {
            System.out.println("*******************");
          String sql="select bill_to_name from pr_tax_intra group by bill_to_name order by count(*) desc"; 
          SQLQuery query = s.createSQLQuery(sql);
         List  l1=query.list();
            System.out.println("&&&&&&&&&&&&&&&&&&&&&"+l1.size());
         for(int i=0;i<l1.size();i++) 
         {
             System.out.println("value in list iss"+l1.get(i));
             l.add("'"+l1.get(i)+"'");
         }
            System.out.println("list isssssss"+l);
        }
        catch(Exception e)
        {
            
        }
        return l;
    }
    
    public List getSupplierMostCount() 
    {
         Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List l = new ArrayList();
        try 
        {
            System.out.println("++++++++++++++++++++++++++++++++++");
          String sql="select count(*) from pr_tax_intra group by bill_to_name order by count(*) desc"; 
          SQLQuery query = s.createSQLQuery(sql);
         List  l1=query.list();
          System.out.println("count list isssssss"+l1);
         for(int i=0;i<l1.size();i++) 
         {
             System.out.println("value in list iss"+l1.get(i));
             l.add("'"+l1.get(i)+"'");
         }
          
        }
        catch(Exception e)
        {
            
        }
        return l;
    }
    
 public List ParentList(TaxInvoiceDto form) throws ParseException 
    {
          Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List list = new ArrayList<>();
         List list1 = new ArrayList<>(); 
        
         try{    
        String d=form.getInvoiceDate();
        String d1=form.getInvoiceDate1();
        SimpleDateFormat sf = new SimpleDateFormat("dd/MM/yyyy");
        Date date = sf.parse(d);
        Date date1 = sf.parse(d1);
        System.out.println("\n the form details are...,,,,,,,,------------------->"+d+".........."+d1+"-----");
       String grades="";
        String bname="";
        bname=form.getBillToName();
         System.out.println("partyyyyyyy Nameeeeeeeeee:::"+bname);
        grades=form.getGrades();
         System.out.println("gradesssssss:::"+"::::"+grades);
        Integer num=null;
        num=form.getInvoiceNo();
        System.out.println("invoiceeeeeeeeee::"+num);
          if(num==null&&bname.equals("")&&grades.equals("")){
            Criteria c=s.createCriteria(PrTaxIntra.class);
             c.add(Restrictions.between("invoiceDate",date,date1));
             list=c.list();
             System.out.println("333333333 listttttttttttt"+list);
              }
          else if(bname.equals("")&&grades.equals("")){
               Criteria c=s.createCriteria(PrTaxIntra.class);
             c.add(Restrictions.between("invoiceDate",date,date1)).add(Restrictions.eq("invoiceNo",num));
             list=c.list();
             System.out.println("2222222222 listttttttttttt"+list);
          }
          else if(num==null&&grades.equals("")){
                   Criteria c=s.createCriteria(PrTaxIntra.class);
             c.add(Restrictions.between("invoiceDate",date,date1)).add(Restrictions.eq("billToName",bname));
             list=c.list();
             System.out.println("333333333 listttttttttttt"+list);
              }
          else if(num==null&&bname.equals("")){
             Criteria c=s.createCriteria(PrTaxIntra.class);
             c.add(Restrictions.between("invoiceDate",date,date1));
             list=c.list();
             System.out.println("333333333 listttttttttttt"+list);
              }
            else if(num==null){
             Criteria c=s.createCriteria(PrTaxIntra.class);
             c.add(Restrictions.between("invoiceDate",date,date1)).add(Restrictions.eq("billToName",bname));
             list=c.list();
             System.out.println("333333333 listttttttttttt"+list);
              }
         }
         catch(Exception e){
             e.printStackTrace();
             System.out.println(e);
         }
        return list;
    }
    
    
    
    public List ChildList(TaxInvoiceDto form) throws ParseException{
          Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List list = new ArrayList<>();
         List list1 = new ArrayList<>(); 
        
        try{     
        String d=form.getInvoiceDate();
        String d1=form.getInvoiceDate1();
        SimpleDateFormat sf = new SimpleDateFormat("dd/MM/yyyy");
        Date date = sf.parse(d);
        Date date1 = sf.parse(d1);
        System.out.println("\n the form details are...,,,,,,,,------------------->"+d+".........."+d1+"-----");
       String grades="";
        String bname="";
        bname=form.getBillToName();
         System.out.println("partyyyyyyy Nameeeeeeeeee:::"+bname);
        grades=form.getGrades();
         System.out.println("gradesssssss:::"+"::::"+grades);
        Integer num=null;
        num=form.getInvoiceNo();
        System.out.println("invoiceeeeeeeeee::"+num);
          if(num==null&&bname.equals("")&&grades.equals("")){
             Criteria c=s.createCriteria(PrTaxIntra.class);
             c.add(Restrictions.between("invoiceDate",date,date1));
             list=c.list();
              int id;
        for (Object o : list) {
            List lst=null;
            PrTaxIntra pq = (PrTaxIntra) o;
            id = pq.getPtId();
            Criteria c1 = s.createCriteria(ChTaxIntra.class);
             System.out.println("paaaaaaareeee listttt"+list);
             c1.add(Restrictions.eq("prTaxIntra.ptId",id));
             lst=c1.list();
              
                    list1.addAll(lst);
                  
           }
          System.out.println("childddddd listttttt"+list1);
        t.commit();
              s.close();
        }
          
          
          
          else if(bname.equals("")&&grades.equals("")){
             Criteria c=s.createCriteria(PrTaxIntra.class);
             c.add(Restrictions.between("invoiceDate",date,date1)).add(Restrictions.eq("invoiceNo",num));
             list=c.list();
              int id;
        for (Object o : list) {
            List lst=null;
            PrTaxIntra pq = (PrTaxIntra) o;
            id = pq.getPtId();
            Criteria c1 = s.createCriteria(ChTaxIntra.class);
             System.out.println("paaaaaaareeee listttt"+list);
             c1.add(Restrictions.eq("prTaxIntra.ptId",id));
             lst=c1.list();
             
                    list1.addAll(lst);
                   
         }
          System.out.println("childddddd listttttt"+list1);
        t.commit();
              s.close();
        }
          
          
          
          
            else if(num==null&&grades.equals("")){
             Criteria c=s.createCriteria(PrTaxIntra.class);
             c.add(Restrictions.between("invoiceDate",date,date1)).add(Restrictions.eq("billToName",bname));
             list=c.list();
              int id;
        for (Object o : list) {
            List lst=null;
            PrTaxIntra pq = (PrTaxIntra) o;
            id = pq.getPtId();
            Criteria c1 = s.createCriteria(ChTaxIntra.class);
             System.out.println("paaaaaaareeee listttt"+list);
             c1.add(Restrictions.eq("prTaxIntra.ptId",id));
             lst=c1.list();
             list1.addAll(lst);
                 
         }
          System.out.println("childddddd listttttt"+list1);
        t.commit();
              s.close();
        }
          
          
          
          
            else if(num==null&&bname.equals("")){
             Criteria c=s.createCriteria(PrTaxIntra.class);
             c.add(Restrictions.between("invoiceDate",date,date1));
             list=c.list();
              int id;
        for (Object o : list) {
            List lst=null;
            PrTaxIntra pq = (PrTaxIntra) o;
            id = pq.getPtId();
            Criteria c1 = s.createCriteria(ChTaxIntra.class);
             System.out.println("paaaaaaareeee listttt"+list);
             c1.add(Restrictions.eq("prTaxIntra.ptId",id)).add(Restrictions.eq("productDesc",grades));
             lst=c1.list();
              list1.addAll(lst);
                   
           }
          System.out.println("childddddd listttttt"+list1);
        t.commit();
              s.close();
        }
          
          
          
          
           else if(num==null){
             Criteria c=s.createCriteria(PrTaxIntra.class);
             c.add(Restrictions.between("invoiceDate",date,date1)).add(Restrictions.eq("billToName",bname));
             list=c.list();
              int id;
        for (Object o : list) {
            List lst=null;
            PrTaxIntra pq = (PrTaxIntra) o;
            id = pq.getPtId();
            Criteria c1 = s.createCriteria(ChTaxIntra.class);
             System.out.println("paaaaaaareeee listttt"+list);
             c1.add(Restrictions.eq("prTaxIntra.ptId",id)).add(Restrictions.eq("productDesc",grades));
             lst=c1.list();
             list1.addAll(lst);
                   
           }
          System.out.println("childddddd listttttt"+list1);
        t.commit();
              s.close();
        }
        }
        catch(Exception e){
            e.printStackTrace();
            System.out.println(e);
        }
            
        return list1;
    }
    
    
    
}
