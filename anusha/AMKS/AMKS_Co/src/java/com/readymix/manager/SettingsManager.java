/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.readymix.manager;

import com.readymix.dto.gradedto;
import com.readymix.dto.gstdto;
import com.readymix.model.Grades;
import com.readymix.model.Login;
import com.readymix.model.Uom;
import com.readymix.util.HibernateUtil;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Swathi
 */
public class SettingsManager {
    
      public List<Login> dataRetrieve(int id) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<Login> list = new ArrayList<>();
        try {
            System.out.println("Data in Manager is==========="+id);

            Criteria c = s.createCriteria(Login.class);
            c.add(Restrictions.eq("lid", id));
            list = c.list();
            System.out.println("list issssss"+list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("list is:------->>>>" + list);
        return list;
     }
      
       public gradedto insertGrade(gradedto form){
         Session s=HibernateUtil.getSessionFactory().openSession();
         Transaction t=s.beginTransaction();
         Grades l=new Grades();
         System.out.println("startttttttttt");
          String grade1=form.getGrade1();
       //   String rate=form.getRate();
           
              System.out.println("ddddddd::"+grade1);
         //      System.out.println("nnnnnnnnn::"+rate);
            
         try{
            
       //      float f1=Float.valueOf(rate);
             l.setGrade(grade1);
         //    l.setRate(f1);
            
             s.save(l);
             t.commit();
             System.out.println("inserted successfullyyyyyyyyy.............");
             
         }
         catch(Exception e){
             System.out.println(e);
             s.close();
         }
         return form;
     }
       
        public List<Grades> gradeRetrieve() {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<Grades> list = new ArrayList<>();
        try {
           Criteria c = s.createCriteria(Grades.class);
            list = c.list();
            System.out.println("list issssss"+list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("list is:------->>>>" + list);
        return list;
     }
         public List quantRetrieve()
          {
              Session s = HibernateUtil.getSessionFactory().openSession();
               Transaction t = s.beginTransaction();
               List l=new ArrayList();
               try 
               {
                   Criteria c=s.createCriteria(Uom.class);
                   l=c.list();
               }
               catch(Exception e)
               {
                   
               }
               return l;
          }
         
         public boolean validateUser1(gradedto l) {
        System.out.println("validdddddddddoooooooooooooooo");

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();

        System.out.println("checkinggggggggggggggggg");
        String userName = l.getGrade1();
       
         String number = l.getRate();
//        String sql = "select * from grades  where  login_id=:loginId or  mobile_no=:mobileNo";
//        Query query = session.createSQLQuery(sql);
//        query.setParameter("loginId", userName);
//       
//        query.setParameter("mobileNo", number);

        Criteria c=session.createCriteria(Grades.class);
        c.add(Restrictions.eq("grade",userName));
        List<Grades> list = c.list();
         System.out.println("????????????");

        if (list.size() > 0) {
            //session.close();
            return false;
        }
        t.commit();
        session.close();

        //session.getTransaction().rollback();
        return true;

    }
        public boolean validateUser3(gstdto l) {
        System.out.println("validdddddddddoooooooooooooooo");

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();

        System.out.println("checkinggggggggggggggggg");
        String u = l.getUnits();
       
         Float f1 = l.getQuant();


        Criteria c=session.createCriteria(Uom.class);
        c.add(Restrictions.eq("uom",u));
        c.add(Restrictions.eq("quantity",f1));
       
        List<Uom> list = c.list();
         System.out.println("????????????");

        if (list.size() > 0) {
            //session.close();
            return false;
        }
        t.commit();
        session.close();

        //session.getTransaction().rollback();
        return true;

    }   
        
           
       public void deleteUser(int id) {
            Session s = HibernateUtil.getSessionFactory().openSession();
            Transaction t = s.beginTransaction();
        try {

           Grades pq=new Grades();
            Criteria cr = s.createCriteria(Grades.class);
            pq = (Grades) cr.add(Restrictions.eq("gid", id)).uniqueResult();
            s.delete(pq);
            t.commit();
            System.out.println("/n deleted successfully");

        } catch (HibernateException he) {
            System.out.println("hibernate exception caught during delete" + he);

        } catch (Exception e) {
            System.out.println("Exception during delete is caught" + e);
        }

       }
       
         public boolean validatePwd(gradedto l) {
        System.out.println("validdddddddddoooooooooooooooo");

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();

        System.out.println("checkinggggggggggggggggg");
        String pwd = l.getPassword();
        int lid=l.getLid();
       
         String number = l.getRate();
//        String sql = "select * from grades  where  login_id=:loginId or  mobile_no=:mobileNo";
//        Query query = session.createSQLQuery(sql);
//        query.setParameter("loginId", userName);
//       
//        query.setParameter("mobileNo", number);

        Criteria c=session.createCriteria(Login.class);
        c.add(Restrictions.eq("lid",lid));
        List<Login> list = c.list();
         System.out.println("????????????");
         String pwd2=null;
         for(Object o:list) {
             Login l1=(Login) o;
              pwd2=l1.getPassword();
         }

        if (pwd.equals(pwd2)) {
            //session.close();
            return false;
        }
        t.commit();
        session.close();

        //session.getTransaction().rollback();
        return true;
        }
           public boolean validateUser2(gstdto l) {
        System.out.println("validdddddddddoooooooooooooooo");

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();

        System.out.println("checkinggggggggggggggggg");
        String u = l.getUnits();
        Float f2=l.getBasicrate();
         Float f1 = l.getQuant();


        Criteria c=session.createCriteria(Uom.class);
        c.add(Restrictions.eq("uom",u));
        c.add(Restrictions.eq("quantity",f1));
        c.add(Restrictions.eq("basicVal",f2));
        List<Uom> list = c.list();
         System.out.println("????????????");

        if (list.size() > 0) {
            //session.close();
            return false;
        }
        t.commit();
        session.close();

        //session.getTransaction().rollback();
        return true;

    }
            public gradedto insertQuant(gstdto g1)
          {
               Session s1 = HibernateUtil.getSessionFactory().openSession();
               Transaction t1 = s1.beginTransaction();
               try 
               {
                  String uom=g1.getUnits();
                  Float q=g1.getQuant();
                  Float q1=g1.getBasicrate();
                  
                  Uom u=new Uom();
                  u.setUom(uom);
                  u.setQuantity(q);
                  u.setBasicVal(q1);
                  s1.save(u);
                  t1.commit();
               }
               catch(Exception e)
               {
                   System.out.println(e);
               }
               finally
               {
                   s1.close();
               }
               return null;
          }
         
          public void updatePwd(gradedto logindto) {
           Session s1 = HibernateUtil.getSessionFactory().openSession();
        Transaction t1 = s1.beginTransaction();
        int lid=logindto.getLid();
        String pwd=logindto.getNewpwd();
      
          System.out.println(lid+pwd+"*******");
           
           try {
              
              Login l=new Login();
              l=(Login) s1.get(Login.class,lid);
              l.setPassword(pwd);
           
              s1.update(l);
              t1.commit();
           }
           catch(Exception e) {
               e.printStackTrace();
           }
       }
}
