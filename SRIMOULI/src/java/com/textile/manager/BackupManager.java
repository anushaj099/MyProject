/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.manager;

import com.textile.model.ChildGdProduction;
import com.textile.model.FinancialYearBackup;
import com.textile.model.GdPurchase;
import com.textile.model.Login;
import com.textile.model.ParentGdProduction;
import com.textile.util.HibernateUtil;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import org.apache.tomcat.util.log.SystemLogHandler;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Swathi
 */
public class BackupManager {
    
    public void endYear(String a1) {
       Session  s=HibernateUtil.getSessionFactory().openSession();
       Transaction t=s.beginTransaction();
        try {
            SimpleDateFormat sf=new SimpleDateFormat("dd-MM-yy");
            Date endyear=sf.parse(a1);
          //  Date backup=sf.parse(a2);
         //   System.out.println(endyear+"%%%%%%%%%%%%%%%%"+backup);
            FinancialYearBackup f=new FinancialYearBackup();
         //   f.setBackupDate(backup);
            f.setYearendDate(endyear);
            s.save(f);
            t.commit();
        }
        catch(Exception e) {
            t.rollback();
        }
    }
    
    public void backupYear(String a1) {
       Session  s=HibernateUtil.getSessionFactory().openSession();
       Transaction t=s.beginTransaction();
        try {
            SimpleDateFormat sf=new SimpleDateFormat("dd-MM-yy");
            Date backupyear=sf.parse(a1);
          //  Date backup=sf.parse(a2);
         //   System.out.println(endyear+"%%%%%%%%%%%%%%%%"+backup);
            FinancialYearBackup f=new FinancialYearBackup();
         //   f.setBackupDate(backup);
           f.setBackupDate(backupyear);
            s.save(f);
            t.commit();
        }
        catch(Exception e) {
            t.rollback();
        }
    }
    
    public void endYear1(String a2) {
       Session  s=HibernateUtil.getSessionFactory().openSession();
       Transaction t=s.beginTransaction();
        try {
            SimpleDateFormat sf=new SimpleDateFormat("dd-MM-yy");
          //  Date endyear=sf.parse(a1);
            Date backup=sf.parse(a2);
         //   System.out.println(endyear+"%%%%%%%%%%%%%%%%"+backup);
            FinancialYearBackup f=new FinancialYearBackup();
            f.setBackupDate(backup);
       //     f.setYearendDate(endyear);
            s.save(f);
            t.commit();
        }
        catch(Exception e) {
            t.rollback();
        }
    }
    
    public List ulist(int id) {
       Session s=HibernateUtil.getSessionFactory().openSession();
        Transaction t=s.beginTransaction();
        String purchase="purchase";
        List<Login> list=null;
         System.out.println("list is-------------"+id);
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
    
  public void deleteyearEnd() {
      Session s=HibernateUtil.getSessionFactory().openSession();
        Transaction t=s.beginTransaction();
        try {
//            String hql = String.format("delete from FinancialYearBackup");
//              Query query = s.createQuery(hql);
//              query.executeUpdate(); 
   System.out.println("enteredddddddddddddddddddddddd");
             Criteria c=s.createCriteria(FinancialYearBackup.class).add(Restrictions.isNotNull("yearendDate"));
//            Criteria c=s.createCriteria(FinancialYearBackup.class).setProjection(Projections.projectionList().add(Projections.property("yearendDate")));
            List l=c.list();
             System.out.println("List size isss"+l.size());
            for(Object o:l) {
                FinancialYearBackup f=(FinancialYearBackup) o;
                int idf=f.getIdf();
                System.out.println("id issssssss"+idf);
                Query q = s.createQuery("delete FinancialYearBackup where idf =:idf");
                q.setParameter("idf", idf);
                q.executeUpdate();
            }
            t.commit();
        }
        catch(Exception e) {
            
        }
  }
  
   public void deletebackupYear() {
      Session s=HibernateUtil.getSessionFactory().openSession();
        Transaction t=s.beginTransaction();
        try {
//            String hql = String.format("delete from FinancialYearBackup");
//              Query query = s.createQuery(hql);
//              query.executeUpdate(); 
         
            Criteria c=s.createCriteria(FinancialYearBackup.class).add(Restrictions.isNotNull("backupDate"));
            List l=c.list();
            System.out.println("List size isss"+l);
            for(Object o:l) {
                FinancialYearBackup f=(FinancialYearBackup) o;
                int idf=f.getIdf();
                System.out.println("id issssssss"+idf);
                Query q = s.createQuery("delete FinancialYearBackup where idf =:idf");
                q.setParameter("idf", idf);
                q.executeUpdate();
            }
            t.commit();
        }
        catch(Exception e) {
            
        }
  }
  
  public List Dates() {
      List<String> l2=new ArrayList<>();
       Session s=HibernateUtil.getSessionFactory().openSession();
       Transaction t=s.beginTransaction();
       int year=0,year21=0;
       List<Integer> l1=new ArrayList();
      try {
           Criteria c=s.createCriteria(GdPurchase.class);
             List l=c.list();
             for(Object o:l) {
                 GdPurchase g=(GdPurchase) o;
                 Date d=g.getDate();
                  Calendar cal = Calendar.getInstance();
                  cal.setTime(d);
                   year = cal.get(Calendar.YEAR);
                  System.out.println("year iss"+year);
               
                 if(!(l1.contains(year))) {
                      l1.add(year);
                 }
//               cal.add(Calendar.YEAR, 1);
//               Date year2=cal.getTime();
//               Calendar cal1 = Calendar.getInstance();
//                  cal1.setTime(year2);
//                   year21 = cal1.get(Calendar.YEAR);
//                  System.out.println("incremented year issss"+year21); 
             }
              Collections.sort(l1, Collections.reverseOrder()); 
              for(int i=0;i<l1.size();i++) {
                  int a1=l1.get(i);
                  int a2=a1++;
                   String k = Integer.toString(a2)+"-"+Integer.toString(a1);
                   l2.add(k);
              }
           
      }
      catch(Exception e) {
          
      }
      System.out.println("dates areee"+l2);
      return l2;
  }
  
   private Date dd = null;

    public Date getDd() {
        return dd;
    }

    public void setDd(Date dd) {
        this.dd = dd;
    }

    public List shiftExists() {
        System.out.println("Enetered in to shifts");
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<Date> l = null;
        Date d = null;
        List l1 = null, l2 = new ArrayList();
        try {
            Criteria c = s.createCriteria(FinancialYearBackup.class).setProjection(Projections.projectionList().add(Projections.max("yearendDate")));;
            l = c.list();
            System.out.println("//////////////" + l);
            for (int i = 0; i < l.size(); i++) {
                d = l.get(i);
                dd = d;
            }

        } catch (Exception e) {

        }
        System.out.println(">>>>>>>>>>>>>>>>" + l2);
        System.out.println("<<<<<<<<<<<<<<<<" + l2.size());
        return l2;
    }
    
    
    //Back up Data
    
    public void backuppurchase()  {
         Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List l=new ArrayList();
        Date d=new Date();
          File file1 = new File("D:\\Databackup"+d.getDate()+"-"+d.getMonth()+"-"+d.getYear());   
            if (!file1.exists()) {
            if (file1.mkdir()) {
                System.out.println("Directory is created!");
            } else {
                System.out.println("Failed to create directory!");
            }
        } 
            System.out.println("file name isss"+file1);
            
        try (PrintWriter writer = new PrintWriter(new BufferedWriter(new FileWriter(file1+"/gdpurchase1.txt")))) {
            Query q=s.createQuery("from GdPurchase g");
            l=q.list();
           
            System.out.println("list in purchase iss"+l);
            System.out.println("Total Number Of Records : "+((java.util.List) l).size());
             writer.print("ID");
                  writer.append(",");
                  writer.print("DATE");
                  writer.append(",");
                  writer.print("SUPPLIER NAME");
                  writer.append(",");
                  writer.print("PRODUCT TYPE");
                  writer.append(",");
                  writer.print("NUMBER OF BALES");
                  writer.append(",");
                  writer.print("GROSS WEIGHT");
                  writer.append(",");
                  writer.print("TARE WEIGHT");
                  writer.append(",");
                  writer.print("NET WEIGHT");
                  writer.append(",");
                  writer.print("VEHICLE NO");
                  writer.append(",");
                  writer.println("REMARKS");
                 
                  
            for(Object o:l) {
               GdPurchase g1=(GdPurchase) o;
                  System.out.println("oooooooooooooo");
                System.out.println("PPPPPPPPPP"+g1.getIdp());
                writer.print(g1.getIdp());
               writer.append(",");
               writer.print(g1.getDate());
                 writer.append(",");
                writer.print(g1.getSupplierName());
                  writer.append(",");
                  writer.print(g1.getProductType());
                  writer.append(",");
                  writer.print(g1.getNoOfBales());
                  writer.append(",");
                  writer.print(g1.getGrossWeight());
                  writer.append(",");
                  writer.print(g1.getTareWeight());
                  writer.append(",");
                   writer.print(g1.getNetWeight());
                  writer.append(",");
                  writer.print(g1.getVehicleNo());
                  writer.append(",");
                  writer.println(g1.getRemarks());
                 
                }
        }
        catch(Exception e) {
            
        }
    }
    
    public  void backupHiber() throws FileNotFoundException, IOException {
        System.out.println("entered into hibernate");
        Session session = HibernateUtil.getSessionFactory().openSession();
// for every table, have the bean implement Serializable and use the next 4 lines
List <GdPurchase> tblCollection = session.createCriteria(GdPurchase.class).list();
FileOutputStream backup = new FileOutputStream("D:/backupOfgdpurchase"+".dat");
ObjectOutputStream backupWriter = new ObjectOutputStream(backup);
backupWriter.writeObject(tblCollection);
    }
    public void dataBackup() {
         System.out.println("entered into databackuppppppppppp");
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx=session.beginTransaction();
        try {
//            Query q=session.createSQLQuery("create database HRMS1");
//            q.executeUpdate();
//            Query q1=session.createSQLQuery("use HRMS1");
//            q1.executeUpdate();
//            System.out.println("completedddddddd---------->>>>>>>>>>>>");
//            Query q2=session.createSQLQuery("source D:/HRMS1.sql");
//            List l=q2.list();
//            tx.commit();
    
        }
        catch(Exception e) {
            
        }
    }
    
    
    
    
    
    
    
   
    //Financial Reports
    
    private  Date startdate, enddate;

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
    public void yearRt(String year,String module) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        System.out.println("hellooooooo");
        Transaction t = s.beginTransaction();
         Date d1=null,dd=null,d2=null;
         List l=new ArrayList();
        try {
             System.out.println("date isss---->>>---"+year);
             String[] ect=year.split("-");
             String year1=ect[0];
             String year2=ect[1];
             int date1=Integer.parseInt(year1);
              int date2=Integer.parseInt(year2);
              Criteria c23=s.createCriteria(FinancialYearBackup.class);
            List list23=c23.list();
            for(Object o:list23 ){
              FinancialYearBackup fbp=(FinancialYearBackup) o;
              d1=fbp.getYearendDate();
              System.out.println("date issss!!!!!!!!!!!!!!!"+d1);
           }
             Calendar cal = Calendar.getInstance();
              cal.setTime(d1);
              int const_year = cal.get(Calendar.YEAR);
              int const_month=cal.get(Calendar.MONTH)+1;
             cal.add(Calendar.DATE,1);
           Date  df=cal.getTime();
             System.out.println("######"+df);
             
              if(date1<=const_year) {
                  System.out.println("yesssssssss");
                  int difference=const_year-date1;
                  cal.add(Calendar.YEAR, -difference);
                  d2=cal.getTime();
                  System.out.println("start date isssss"+d2);
                  startdate=d2;
                  
                  int difference2=const_year-date2;
                  System.out.println("heyyyy"+difference2);
                  cal.setTime(df);
                  cal.add(Calendar.YEAR, -difference2);
                  dd=cal.getTime();
                  System.out.println("end date isssss"+dd);
                  enddate=dd;
               }
              
          System.out.println("module isss---->>>---"+startdate+"***_____________-----------"+enddate);
        }
        catch(Exception e) {
            
        }
        
    }
    
    
}
