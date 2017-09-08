/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.manager;

import com.textile.dto.FinancialYear;
import com.textile.model.AvailableYears;
import com.textile.model.Counts;
import com.textile.model.CurrentYear;
import com.textile.model.Employee;
import com.textile.model.Login;
import com.textile.model.PackPatterns;
import com.textile.model.PackerName;
import com.textile.model.ProductsSample;
import com.textile.model.Stock;
import com.textile.model.Superviser;
import com.textile.util.HibernateUtil;
import java.io.File;
import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import net.sf.ehcache.search.aggregator.Count;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Masrat
 */
public class YearManager {
    
    static List login=null,superviser=null,count=null,emplee=null,pckptns=null,pkname=null,pdname=null,avblyrs=null;
    static List la=new ArrayList();
      static  Date dfrom=null,dto=null;
      private String decid=null;
      private String financ=null;
      String xt=null;
      
    public Date getDateFrom() {
        Date datefrom = null;
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List fromdt =null;
        try{
         System.out.println("-------------------ssssssssssss");
        String sql = "SELECT MIN(date) FROM gd_purchase UNION SELECT MIN(date) FROM gd_sale"
                + " UNION SELECT MIN(date) FROM packing_stockreport UNION SELECT MIN(date) FROM parent_carding"
                + " UNION SELECT MIN(date) FROM parent_drawing UNION SELECT MIN(date) FROM parent_gd_precleaning"
                + " UNION SELECT MIN(date) FROM parent_gd_production UNION SELECT MIN(date) FROM parent_gd_wastage"
                + " UNION SELECT MIN(date) FROM parent_openend UNION SELECT MIN(date) FROM parent_packing"
                + " UNION SELECT MIN(date) FROM parent_quality UNION SELECT MIN(date) FROM pk_dispatched"
                + " UNION SELECT MIN(date) FROM powerunits UNION SELECT MIN(date) FROM ready_to_pack"
                + " UNION SELECT MIN(date) FROM stock UNION SELECT MIN(date) FROM stock_report_a;";
        Query query = s.createSQLQuery(sql);
       fromdt = query.list();
        }catch(Exception e){
            System.out.println("the Exception is ------------- :"+e);
        }finally{
            t.commit();
            s.close();
        }
        //System.out.println("the date from isssssss--------------------------->"+fromdt);
        if(!fromdt.isEmpty()){
            for(int i=0;i<fromdt.size();i++){
                if(fromdt.get(i)==null)
                    fromdt.remove(i);
            }
        }
       // System.out.println("the date from isssssss---------000000000000------------------>"+fromdt);
         Collections.sort(fromdt, new Comparator<Date>() {
            @Override
            public int compare(Date o1, Date o2) {
                return o1.compareTo(o2);
            }
        });
         datefrom=(Date) fromdt.get(0);
         System.out.println("the dates areeeee-----------in getDateFrom of yearmanager--------"+fromdt+"................."+datefrom);
        return datefrom;
    }

    public Date getDateTo() {
         Date dateto = null;
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List todt=null;
        try{
         System.out.println("-------------------ssssssssssss");
        String sql = "SELECT MAX(date) FROM gd_purchase UNION SELECT MAX(date) FROM gd_sale"
                + " UNION SELECT MAX(date) FROM packing_stockreport UNION SELECT MAX(date) FROM parent_carding"
                + " UNION SELECT MAX(date) FROM parent_drawing UNION SELECT MAX(date) FROM parent_gd_precleaning"
                + " UNION SELECT MAX(date) FROM parent_gd_production UNION SELECT MAX(date) FROM parent_gd_wastage"
                + " UNION SELECT MAX(date) FROM parent_openend UNION SELECT MAX(date) FROM parent_packing"
                + " UNION SELECT MAX(date) FROM parent_quality UNION SELECT MAX(date) FROM pk_dispatched"
                + " UNION SELECT MAX(date) FROM powerunits UNION SELECT MAX(date) FROM ready_to_pack"
                + " UNION SELECT MAX(date) FROM stock UNION SELECT MAX(date) FROM stock_report_a;";
        Query query = s.createSQLQuery(sql);
        todt = query.list();
        //System.out.println("the date from isssssss--------------------------->"+fromdt);
        }
        catch(Exception e){
            System.out.println("the exception isssssssssss :"+e);
        }
        finally{
            t.commit();
            s.close();
        }
        if(!todt.isEmpty()){
            for(int i=0;i<todt.size();i++){
                if(todt.get(i)==null)
                    todt.remove(i);
            }
        }
       // System.out.println("the date from isssssss---------000000000000------------------>"+fromdt);
         Collections.sort(todt, new Comparator<Date>() {
            @Override
            public int compare(Date o1, Date o2) {
                return o1.compareTo(o2);
            }
        });
         dateto=(Date) todt.get(todt.size()-1);
        System.out.println("the dates areeeee---------------................"+todt+"..................."+dateto);
        return dateto;
    }

    public List getCurDate() {
        
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List cyars=null;
        try{
          Criteria c2 = s.createCriteria(CurrentYear.class);
            cyars = c2.list();
        //System.out.println("the date from isssssss--------------------------->"+fromdt);
          
        }
        catch(Exception e){
            System.out.println("the exception isssssssssss :"+e);
        }
        finally{
            t.commit();
            s.close();
        }
      
        return cyars;
    }

   

    public List getAvlYears() {
          Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List avlyrs=null;
        try{
            Criteria c = s.createCriteria(AvailableYears.class);
            c.setProjection(Projections.property("closedYears"));
            avlyrs = c.list();
        System.out.println("the date from isssssss-----avaailabele---------------------->"+avlyrs);
          
        }
        catch(Exception e){
            System.out.println("the exception isssssssssss :"+e);
        }
        finally{
            t.commit();
            s.close();
        }
     
        return avlyrs;
    }

    public int closeCurrntYr() {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
       int exitStatus=0;
        try{
            Criteria c = s.createCriteria(Login.class);
            login = c.list();
            System.out.println("the login issssss------------------------->"+login);
            Criteria c1 = s.createCriteria(Superviser.class);
            superviser = c1.list();
             System.out.println("the superviser issssss------------------------->"+superviser);
          Criteria c2 = s.createCriteria(Counts.class);
            count = c2.list();
            System.out.println("the superviser issssss------------------------->"+count);
             Criteria c3 = s.createCriteria(Employee.class);
            emplee = c3.list();      

            System.out.println("the superviser issssss------------------------->"+emplee);
            Criteria c4 = s.createCriteria(PackPatterns.class);
            pckptns = c4.list();  
            System.out.println("the superviser issssss------------------------->"+pckptns);
             Criteria c5 = s.createCriteria(PackerName.class);
            pkname = c5.list(); 
        
            System.out.println("the superviser issssss------------------------->"+pkname);
         Criteria c6 = s.createCriteria(ProductsSample.class);
            pdname = c6.list(); 
      
            System.out.println("the superviser issssss------------------------->"+pdname);
            
            
            dfrom=getDateFrom();
            dto=getDateTo();
           
      String ng=dfrom+" to "+dto;
         Criteria ca = s.createCriteria(AvailableYears.class);
         List l=ca.add(Restrictions.eq("closedYears", ng)).list();
         t.commit();
         s.close();
         
         if(l.isEmpty()){
    
     Session s1 = HibernateUtil.getSessionFactory().openSession();
        Transaction t1 = s1.beginTransaction();
    
        
  AvailableYears avb=new AvailableYears();
  avb.setClosedFrom(dfrom);
  avb.setClosedTo(dto);
  avb.setClosedYears(ng);
  java.sql.Date date = new java.sql.Date(System.currentTimeMillis());
 // Date date=new Date();
 System.out.println("the date is---------------------->"+date);
  avb.setDate(date);
  avb.setStatus("Closed");
        s1.save(avb);
        s1.flush();
        s1.clear();
      
         AvailableYears ava=new AvailableYears();
       Criteria ca1 = s1.createCriteria(AvailableYears.class);
       
        ava = (AvailableYears) ca1.add(Restrictions.eq("closedFrom", dfrom)).add(Restrictions.eq("status","Open")).uniqueResult();
       
         List l1=ca1.add(Restrictions.eq("closedFrom", dfrom)).add(Restrictions.eq("status","Open")).list();
             System.out.println("the size of list before deleting is---------------->"+l1.size());
         if(!l1.isEmpty()) {
        System.out.println("inside avaialble deleteing already existed form available------*******-----"+l1);
           
          String aqa = "delete from available_years where closed_from='"+dfrom+"' and status= 'Open';";
        Query qua = s1.createSQLQuery(aqa);
        qua.executeUpdate();
        s1.flush();s1.clear();
        
        
         // s1.delete(ava);
         //  s1.clear();
            t1.commit();
            
             System.out.println(".........****the year is deleted ---------------**********!");
             
        }
         System.out.println("the size of list after deleting is-------***--------->"+l1.size());
           System.out.println("the year is deleted !");
        if(t1.wasCommitted())
        t1=s1.beginTransaction();
     Criteria c7 = s1.createCriteria(AvailableYears.class);
             avblyrs=c7.list();
              t1.commit();
            s1.close();
            
        if(!l1.isEmpty()){
            
            String[] dateParts = dfrom.toString().split("-");
String day = dateParts[2];
        System.out.println("the day isssssssss ------------->"+day);
String month = dateParts[1];
 System.out.println("the month isssssssss -----*****-------->"+month);
String year = dateParts[0];
            
            String names=day+"_"+month+"_"+year+"_"+"continuing";
              String realname="srimouli2_"+names;   
              String copy="srimouli2_"+year+"-"+month+"-"+day+"_"+"continuing";
            
             Connection connection=null;
                 Statement stmt=null;
      Class.forName("com.mysql.jdbc.Driver");
      connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/srimouli2","root", "12345");
      stmt = connection.createStatement();
  
         ResultSet resultSet = connection.getMetaData().getCatalogs();

        while (resultSet.next()) {

          String databaseName = resultSet.getString(1);
           // System.out.println("the database names are------------**************--------------->"+databaseName);
            if(databaseName.equals(realname)){
               
               try{
                    System.out.println("-------the database already exists is deleting-----------------");
				
				String query = "DROP DATABASE "+realname;
				stmt.executeUpdate(query);
				System.out.println("DATABASE deleted successfully...");
		}
               catch(SQLException sq)
                {
                    System.out.println("Database not deleted ");		
                    sq.printStackTrace();
		 }
            }
        }
        stmt.close();
        resultSet.close();
        connection.close();
          
           System.out.println("the procedure call ---------------- ssssss ------,,,,,,,,,------------------");
           // System.out.println("the result set isssssss-------------->"+rs);
      connection.close();   
              
      
      
      File f = null;
      boolean bool = false;
            System.out.println("the name of copy of database iss------------"+copy);
      try {
      
         f = new File("C:\\ProgramData\\MySQL\\"+copy+".sql");
         bool = f.delete();
         System.out.println("File deleted:*********************-------- "+bool);
      }catch(Exception e){
          System.out.println("Exception in the file deletion is------------------------"+e);
      }
            
           }
            System.out.println("********-------------- closing date"+avblyrs);
            
             String name=dfrom+"_"+dto;
             System.out.println("the name of dbbbbbbbb issssss------------------------------->"+name);
             
             
    final File batchFile = new File("D:\\Batch\\562652.bat");

   // final File outputFile = new File(String.format("C:\\Users\\Masrat\\Desktop\\output_%tY%<tm%<td_%<tH%<tM%<tS.txt",
   //     System.currentTimeMillis()));
           
    final ProcessBuilder processBuilder = new ProcessBuilder(batchFile.getAbsolutePath(), name);
    
    processBuilder.redirectErrorStream(true);
   // processBuilder.redirectOutput(outputFile);
            
    final Process process = processBuilder.start();
    exitStatus = process.waitFor();
    System.out.println("Processed finished with status: " + exitStatus);
    
     Date dat = new Date();
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    
    
    System.out.println("the file name iss............--->"+dateFormat.format(date)+",----------------.....-----"+date);
    String nam=dateFormat.format(dat);
    
     Date da=dateFormat.parse(nam);
     Date oneDayBefore = new Date(da.getTime() - 2);
     String fmt=dateFormat.format(oneDayBefore);
    
    
    String fil="srimouli2_"+nam;
    String fl="srimouli2_"+fmt;
     File f = new File("C:\\ProgramData\\MySQL\\"+fil+".sql");

                if(f.exists()){
                        System.out.println("File existed");
                         boolean bool = f.delete();
                            System.out.println("File deleted:*******in todays date**************-------- "+bool);
                }
       File f2 = new File("C:\\ProgramData\\MySQL\\"+fl+".sql");

                if(f2.exists()){
                        System.out.println("File existed");
                         boolean bool = f2.delete();
                            System.out.println("File deleted:*************in previous date********-------- "+bool);
                }
            }
       }
        catch(Exception e){
            System.out.println("the exception isssssssssss :"+e);
        }
        finally{
           // t.commit();
            
        }
        return exitStatus;
    }

    public String truncTables() throws ClassNotFoundException, SQLException {
        System.out.println("inside truncate-------------- tables---------------");
        String x=null;
        try{
         Connection connection=null;
      Class.forName("com.mysql.jdbc.Driver");
      connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/srimouli2","root", "12345");
  
        CallableStatement st=null;
      String sql = "{call srimouli2.trunctables('srimouli2')}";
            System.out.println("the procedure call ---------------- ssssss ------------------------");
          st=connection.prepareCall(sql);
           System.out.println("the procedure call ---------------- ssssss ----nnnnnnnnnn--------------------");
         st.execute();
           System.out.println("the procedure call ---------------- ssssss ------,,,,,,,,,------------------");
           // System.out.println("the result set isssssss-------------->"+rs);
           st.close();
      connection.close();
        }catch(Exception e){
            x=e.toString();
            System.out.println("exception inside truncate---------------**********-----------------"+e);
        }
        return x;
    
    }

    public String insertInitials() {
        String s=null;
        System.out.println("inside the insertion of initialssssssss------------"+dto);
         Session s2 = HibernateUtil.getSessionFactory().openSession();
        Transaction t2 = s2.beginTransaction();
            
            if(!login.isEmpty()){
                for(Object o:login){
                    Login l=(Login)o;
                    Login lg=new Login();
                    lg.setUserName(l.getUserName());
                    lg.setPassword(l.getPassword());
                    lg.setLoginType(l.getLoginType());
                    lg.setDesignation(l.getDesignation());
                    lg.setPartialType(l.getPartialType());
                    s2.save(lg);
                    s2.flush();
                    s2.clear();
                }
            }
            System.out.println("login inserted---------------------*");
             if(!avblyrs.isEmpty()){
                for(Object o:avblyrs){
                    AvailableYears l=(AvailableYears)o;
                    AvailableYears av=new AvailableYears();
                   av.setClosedFrom(l.getClosedFrom());
                   av.setClosedTo(l.getClosedTo());
                   av.setClosedYears(l.getClosedYears());
                   av.setStatus(l.getStatus());
                    s2.save(av);
                    s2.flush();
                    s2.clear();
                }
            }
             
              if(!superviser.isEmpty()){
                for(Object o:superviser){
                    Superviser l=(Superviser)o;
                    Superviser av=new Superviser();
                   av.setName(l.getName());
                  // av.setParentQualities(l.getParentQualities());
                    s2.save(av);
                    s2.flush();
                    s2.clear();
                }
            }
             
               if(!count.isEmpty()){
                for(Object o:count){
                    Counts l=(Counts)o;
                    Counts av=new Counts();
                   av.setCount(l.getCount());
                    s2.save(av);
                    s2.flush();
                    s2.clear();
                }
            }
               
               if(!emplee.isEmpty()){
                for(Object o:emplee){
                    Employee l=(Employee)o;
                    Employee av=new Employee();
                  av.setEmpId(l.getEmpId());
                  av.setEmpName(l.getEmpName());
                  av.setDesignation(l.getDesignation());
                    s2.save(av);
                    s2.flush();
                    s2.clear();
                }
            }
               
                if(!pckptns.isEmpty()){
                for(Object o:pckptns){
                    PackPatterns l=(PackPatterns)o;
                    PackPatterns av=new PackPatterns();
                  av.setConWeight(l.getConWeight());
                  av.setNoOfCones(l.getNoOfCones());
                  av.setTareWeight(l.getTareWeight());
                  av.setWeight(l.getWeight());
                    s2.save(av);
                    s2.flush();
                    s2.clear();
                }
            }
                if(!pkname.isEmpty()){
                for(Object o:pkname){
                    PackerName l=(PackerName)o;
                    PackerName av=new PackerName();
                  av.setPackerName(l.getPackerName());
                 
                    s2.save(av);
                    s2.flush();
                    s2.clear();
                }
            }
                
                 if(!pdname.isEmpty()){
                for(Object o:pdname){
                    ProductsSample l=(ProductsSample)o;
                    ProductsSample av=new ProductsSample();
                 av.setPartialType(l.getPartialType());
                 av.setProductName(l.getProductName());
                    s2.save(av);
                    s2.flush();
                    s2.clear();
                }
            }
     SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
Calendar cal = Calendar.getInstance();
cal.setTime(dto);
System.out.println(simpleDateFormat1.format(cal.getTime()));
cal.add(Calendar.DATE, 1);
System.out.println("The next date iss---------"+simpleDateFormat1.format(cal.getTime()));
Date d=cal.getTime();

     if(!pdname.isEmpty()){
          for(Object o:pdname){
               ProductsSample l=(ProductsSample)o;
              Stock st=new Stock();
              st.setDate(d);
              st.setVariety(l.getProductName());
              s2.save(st);
              s2.flush();
              s2.clear();
          }
     }
            System.out.println("saved inside stock as opening---------------------");     
            t2.commit();
            s2.close();
       
       
        Session s1 = HibernateUtil.getSessionFactory().openSession();
        Transaction t1 = s1.beginTransaction();
         Criteria c1 = s1.createCriteria(AvailableYears.class);
         List l1=c1.add(Restrictions.eq("closedFrom", dfrom)).list();
        
         t1.commit();
         s1.close();
       
       s="Initials are inserted";
       
       return s;
    }

    public int createCopy() throws IOException, InterruptedException, ClassNotFoundException, SQLException {
        System.out.println("inside creatioin of copy of a database---------------");
        int exitStatus = 123;
        try{
          dfrom=getDateFrom();
          dto=getDateTo();
          
          String day=null,month=null,year=null,da=null,mont=null,yea=null,names=null;
         
            String from=dfrom.toString();
            String to=dto.toString();
            String check=dfrom+" to "+dto;
            
             Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
         Criteria c = s.createCriteria(AvailableYears.class);
         List l=c.add(Restrictions.eq("closedTo", dto)).list();
         t.commit();
         s.close();
         
         if(l.isEmpty()){
           System.out.println("the from date is in copying is------------->"+from+"------*******-----------------"+to);
String[] dateParts = from.split("-");
day = dateParts[2];
        System.out.println("the day isssssssss ------------->"+day);
month = dateParts[1];
 System.out.println("the month isssssssss -----*****-------->"+month);
year = dateParts[0];
 System.out.println("the year isssssssss ------.....------->"+year+"*************............*************----"+decid);
 
 if(decid==null){
     
    String[] datePts = to.split("-");
da = datePts[2];
mont = datePts[1];
yea = datePts[0];
 names=day+"_"+month+"_"+year+"_"+da+"_"+mont+"_"+yea;
 
          }
 else{
     System.out.println("from the creation of yarly reports-----------------------");
     names=day+"_"+month+"_"+year+"_"+"continuing";
     xt=dfrom+" to "+"continuing";
     String copi=dfrom+"_"+"continuing";
     System.out.println("the fjinancial year name is that --------------------------->"+financ);
     
        Session sc = HibernateUtil.getSessionFactory().openSession();
        Transaction tc = sc.beginTransaction();
       System.out.println("the to date is------****---------------******------"+dto);
         Criteria cc = sc.createCriteria(AvailableYears.class);
         List lc=cc.add(Restrictions.eq("closedTo", dto)).list();
         System.out.println("-------the list issssssssss------------------"+lc);
         tc.commit();
         sc.close();
          String realname="srimouli2_"+names;
            if(lc.isEmpty()){
                System.out.println("the new database is ceating--------------***------"+realname);
                
                 Connection connection=null;
                 Statement stmt=null;
      Class.forName("com.mysql.jdbc.Driver");
      connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/srimouli2","root", "12345");
      stmt = connection.createStatement();
  
         ResultSet resultSet = connection.getMetaData().getCatalogs();

        while (resultSet.next()) {

          String databaseName = resultSet.getString(1);
            //System.out.println("the database names are------------**************--------------->"+databaseName);
            if(databaseName.equals(realname)){
               
               try{
                    System.out.println("-------the database already exists is deleting-----------------");
				
				String query = "DROP DATABASE "+realname;
				stmt.executeUpdate(query);
				System.out.println("DATABASE deleted successfully...");
		}
               catch(SQLException sq)
                {
                    System.out.println("Database not deleted ");		
                    sq.printStackTrace();
		 }
            }
        }
        stmt.close();
        resultSet.close();
        connection.close();
          
           System.out.println("the procedure call ---------------- ssssss ------,,,,,,,,,------------------");
           // System.out.println("the result set isssssss-------------->"+rs);
      connection.close();
      
 }
           
         final File batch = new File("D:\\Batch\\562652.bat");

  //  final File outputFile = new File(String.format("C:\\Users\\Masrat\\Desktop\\out_%tY%<tm%<td_%<tH%<tM%<tS.txt",
  //      System.currentTimeMillis()));
           
    final ProcessBuilder processBuilder = new ProcessBuilder(batch.getAbsolutePath(), copi);
    
    processBuilder.redirectErrorStream(true);
  //  processBuilder.redirectOutput(outputFile);
            
    final Process process = processBuilder.start();
    exitStatus = process.waitFor();
    System.out.println("Processed finished with status: " + exitStatus);
     
    
      Session s1 = HibernateUtil.getSessionFactory().openSession();
        Transaction t1 = s1.beginTransaction();
         Criteria c1 = s1.createCriteria(AvailableYears.class);
         List l1=c1.add(Restrictions.eq("closedTo", dto)).list();
        
         t1.commit();
         s1.close();
         
         if(l.isEmpty()){
              Session s3 = HibernateUtil.getSessionFactory().openSession();
             Transaction t3= s3.beginTransaction();
             
                  Criteria c2 = s3.createCriteria(AvailableYears.class);
                   List l2=c2.add(Restrictions.eq("closedYears",xt)).list();
                   if(!l2.isEmpty()){
                       for(Object o:l2){
                           AvailableYears ay=(AvailableYears)o;
                           s3.delete(ay);
                       }
               }
                   s3.flush();
                   s3.clear();
         
         AvailableYears avb=new AvailableYears();
  avb.setClosedFrom(dfrom);
 // avb.setClosedTo(dto);
  avb.setClosedYears(xt);
  
  //java.sql.Date date = new java.sql.Date(System.currentTimeMillis());
  Date date=new Date();
 System.out.println("the date is---------------------->"+date);
  avb.setDate(date);
   avb.setStatus("Open");
 
        s3.save(avb);
         t3.commit();
         s3.close();
             System.out.println("the value is saved in available years************");
            
 }
 }             
             System.out.println("the name of dbbbbbbbb issssss---------------in copyyyyyyyyyy---------------->"+names);
            
    final File batch = new File("D:\\Batch\\copydb.bat");

  //  final File outputFile = new File(String.format("C:\\Users\\Masrat\\Desktop\\out_%tY%<tm%<td_%<tH%<tM%<tS.txt",
   //     System.currentTimeMillis()));
           
    final ProcessBuilder processBuilder = new ProcessBuilder(batch.getAbsolutePath(), names);
    
    processBuilder.redirectErrorStream(true);
   // processBuilder.redirectOutput(outputFile);
            
    final Process process = processBuilder.start();
    exitStatus = process.waitFor();
    System.out.println("Processed finished with status: " + exitStatus);
    
    
     Session s2 = HibernateUtil.getSessionFactory().openSession();
        Transaction t2 = s2.beginTransaction();
    Criteria ca = s2.createCriteria(AvailableYears.class);
         la=ca.list();
         t2.commit();
         s2.close();
     
         }
        }catch(Exception e){
            System.out.println("the exception in the year manager of create copy-------------------->"+e);
        }
        return exitStatus;
    }
    

    public int yearlyReports(FinancialYear fy) throws IOException, InterruptedException, ClassNotFoundException, SQLException {
        decid="createCont";
        String s1=fy.getFinyear();
         String sg[]=fy.getFinyear().split(" ");
        String from=sg[0];
        String to=sg[2];
        financ=from+"_"+to;
         
//        Session s = HibernateUtil.getSessionFactory().openSession();
//        Transaction t = s.beginTransaction();
//         Criteria c = s.createCriteria(AvailableYears.class);
//         List l=c.add(Restrictions.eq("closedYears", s1)).list();
//         t.commit();
//         s.close();
//         
//         String g = null;
//         if(!l.isEmpty())
//         for(Object o:l){
//             AvailableYears av=(AvailableYears)o;
//             g=av.getStatus();
//         }
//                 
//        if(!"Closed".equals(g)){        
            createCopy();
       // }
        
        System.out.println("in manager of financial year..........."+fy.getFinyear()+"*********************--"+financ);
       
        System.out.println("the dates are------in fin reports-------------->"+from+"--------"+to);
       
       
         final File batch = new File("D:\\Batch\\yeardump.bat");
 //   final File outputFile = new File(String.format("C:\\Users\\Masrat\\Desktop\\finan_%tY%<tm%<td_%<tH%<tM%<tS.txt",
  //      System.currentTimeMillis()));
         
    final ProcessBuilder processBuilder = new ProcessBuilder(batch.getAbsolutePath(), financ);
    
    processBuilder.redirectErrorStream(true);
   // processBuilder.redirectOutput(outputFile);
            
    final Process process = processBuilder.start();
    final int exitStatus = process.waitFor();
    System.out.println("Processed finished with status: " + exitStatus);
    
     Session s2 = HibernateUtil.getSessionFactory().openSession();
        Transaction t2 = s2.beginTransaction();
        
         String aq = "delete from current_year;";
        Query qu = s2.createSQLQuery(aq);
        qu.executeUpdate();
        s2.flush();s2.clear();
       
        if(!sg[2].equals("continuing")){
        System.out.println("the operations in current year=--------------");
        CurrentYear cy=new CurrentYear();
        cy.setDateFrom(from);
        cy.setDateTo(to);
        cy.setStatus("closed");
        s2.save(cy);
        s2.flush();
        s2.clear();
        }
        
        try{
          if(!la.isEmpty()){
              
        String aqa = "delete from available_years;";
        Query qua = s2.createSQLQuery(aqa);
        qua.executeUpdate();
        s2.flush();
        s2.clear();
             
                for(Object o:la){
                    
                    AvailableYears l=(AvailableYears)o;
                    AvailableYears av=new AvailableYears();
                   av.setClosedFrom(l.getClosedFrom());
                   av.setClosedTo(l.getClosedTo());
                   av.setClosedYears(l.getClosedYears());
                   av.setStatus(l.getStatus());
                    s2.save(av);
                    s2.flush();
                    s2.clear();
                 
                }
                System.out.println("the avaaialble years table is updated*************-------");
            }        
        }catch(Exception e){
            System.out.println("the exceptin is -------------------"+e);
    }
         t2.commit();
         s2.close();
         return exitStatus;
         
    }   
    }
 