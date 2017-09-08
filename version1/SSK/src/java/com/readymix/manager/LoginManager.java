/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.readymix.manager;

import com.readymix.dto.LoginDto;

import com.readymix.model.Login;
import com.readymix.model.PrTaxIntra;

import com.readymix.util.HibernateUtil;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Swathi
 */
public class LoginManager {
    
    boolean status = false;
    public String words;

    public String getWords() {
        return words;
    }

    public void setWords(String words) {
        this.words = words;
    }
    
     public boolean validateUser(LoginDto l) {
        System.out.println("---------home----??????????------------");

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();

        System.out.println("-------------------ssssssssssss");
        String userName = l.getLoginid();
        String password = l.getPassword();
        String sql = "select * from login  where binary login_id=:loginId and binary password=:password";
        Query query = session.createSQLQuery(sql);
        query.setParameter("loginId", userName);
        query.setParameter("password", password);
        List<Login> list = query.list();


        if (list.size() > 0) {
            //session.close();
            return false;
        }
        t.commit();
        session.close();

        //session.getTransaction().rollback();
        return true;

    }
    
      public List<Login> loginmanager(String loginid, String password) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<Login> list = new ArrayList<>();
        try {
            System.out.println("Data in Manager is==========="+loginid+password);

            Criteria c = s.createCriteria(Login.class);
            c.add(Restrictions.eq("loginId", loginid));
            c.add(Restrictions.eq("password", password));
            list = c.list();
            System.out.println("list issssss"+list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("list is:------->>>>" + list);
        return list;

    }
      
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
      
      public int countLogin() {
          Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
          int i=0;
        try {
            System.out.println("***********");
            Criteria c=s.createCriteria(Login.class);
            c.add(Restrictions.eq("LType", "user"));
            c.setProjection(Projections.rowCount());
           Long  l=(Long) c.uniqueResult();
           i=l.intValue();
           
            System.out.println("number of rows in login are::::::::"+l);
            
        }
        catch(Exception e) {
            
        }
        return i;
      }
      
      public int countCommonInvoice() {
          Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
          int i=0;
        try {
            System.out.println("***********");
            Criteria c=s.createCriteria(PrTaxIntra.class);
            c.setProjection(Projections.rowCount());
           Long  l=(Long) c.uniqueResult();
           i=l.intValue();
           
            System.out.println("number of rows in Common invoice are::::::::"+l);
            
        }
        catch(Exception e) {
            
        }
        return i;
      }
      

       
      
      public List commonInvoiceList() {
          Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<PrTaxIntra> list = new ArrayList<>();
        try {
          
            Criteria c = s.createCriteria(PrTaxIntra.class);
           c.addOrder(Order.desc("invoiceDate"));
           c.setMaxResults(20);
            list = c.list();
            System.out.println("list issssss"+list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("list is:------->>>>" + list);
        return list;
      }
      
//       public List supplyInvoiceList() {
//          Session s = HibernateUtil.getSessionFactory().openSession();
//        Transaction t = s.beginTransaction();
//        List<CommonInvoice> list = new ArrayList<>();
//        try {
//          
//            Criteria c = s.createCriteria(SupplyInvoice.class);
//           c.addOrder(Order.desc("supplyTime"));
//           c.setMaxResults(10);
//            list = c.list();
//            System.out.println("list issssss"+list);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        System.out.println("list is:------->>>>" + list);
//        return list;
//      }
//      
      public List<Login> dataRetrieve() {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<Login> list = new ArrayList<>();
        try {
           Criteria c = s.createCriteria(Login.class);
            list = c.list();
            System.out.println("list issssss"+list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("list is:------->>>>" + list);
        return list;
     }
      
       public LoginDto insertLogin(LoginDto form){
         Session s=HibernateUtil.getSessionFactory().openSession();
         Transaction t=s.beginTransaction();
         Login l=new Login();
         System.out.println("startttttttttt");
          String fname=form.getFullName();
             String desg=form.getDesignation();
             String number=form.getMobileNo();
             String uname=form.getLoginid();
             String ltype=form.getLType();
             String pwd=form.getPassword();
             String email=form.getEmail();
              System.out.println("ddddddd::"+desg);
               System.out.println("nnnnnnnnn::"+number);
               System.out.println("fffffffff::"+fname);
               System.out.println("typeeeeee::"+ltype);
               System.out.println("ppppppp::"+pwd);
               System.out.println("uuuuuuuuuu::"+uname);
             
         try{
            
             l.setDesignation(desg);
             l.setFullName(fname);
             l.setLType(ltype);
             l.setLoginId(uname);
             l.setMobileNo(number);
             l.setMail(email);
             l.setPassword(pwd);
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
       
       public boolean validateUser1(LoginDto l) {
        System.out.println("validdddddddddoooooooooooooooo");

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();

        System.out.println("checkinggggggggggggggggg");
        String userName = l.getLoginid();
       
         String number = l.getMobileNo();
        String sql = "select * from login  where binary login_id=:loginId or binary mobile_no=:mobileNo";
        Query query = session.createSQLQuery(sql);
        query.setParameter("loginId", userName);
       
        query.setParameter("mobileNo", number);
        List<Login> list = query.list();
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
       
       // --------------------delete user--------------------------
       
       public void deleteUser(int id) {
            Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        try {

            Login pq = new Login();
            Criteria cr = s.createCriteria(Login.class);
            pq = (Login) cr.add(Restrictions.eq("lid", id)).uniqueResult();
            s.delete(pq);
            t.commit();
            System.out.println("/n deleted successfully");

        } catch (HibernateException he) {
            System.out.println("hibernate exception caught during delete" + he);

        } catch (Exception e) {
            System.out.println("Exception during delete is caught" + e);
        }

       }
       
       
       public List editUser(int idw) {
        Session s1 = HibernateUtil.getSessionFactory().openSession();
        Transaction t1 = s1.beginTransaction();
        List l1 = null;
        try {
            Criteria cr = s1.createCriteria(Login.class);
            cr.add(Restrictions.eq("lid", idw));
            l1 = cr.list();
            System.out.println("truiitewtewtewtewtewtewtewtewtewtewtewtewtewtewtewtewtewr" + l1);
            t1.commit();
        } catch (HibernateException h) {
            System.out.println("HibernateException during Edit1:" + h);
            h.printStackTrace();
        } catch (Exception ex) {
            System.out.println("Exception during Edit1:" + ex);
            ex.printStackTrace();
        } finally {
            s1.close();
        }
        return l1;
    }
       
       public void updateUser(LoginDto logindto) {
           Session s1 = HibernateUtil.getSessionFactory().openSession();
        Transaction t1 = s1.beginTransaction();
        int lid=logindto.getLid();
        String name=logindto.getFullName();
        String desig=logindto.getDesignation();
        String mobile=logindto.getMobileNo();
        String ltype=logindto.getLType();
        String loginid=logindto.getLoginid();
        String pwd=logindto.getPassword();
           System.out.println(lid+name+desig+"*******"+mobile+loginid+pwd);
           
           try {
              Login l=new Login();
              l=(Login) s1.get(Login.class,lid);
              l.setLid(lid);
              l.setFullName(name);
              l.setDesignation(desig);
              l.setMobileNo(mobile);
              l.setMail(logindto.getEmail());
              l.setLType(ltype);
              l.setLoginId(loginid);
              l.setPassword(pwd);
              s1.update(l);
              t1.commit();
           }
           catch(Exception e) {
               e.printStackTrace();
           }
       }
       
//         public List viewparentCommonInvoice(int cid) {
//        Session s1 = HibernateUtil.getSessionFactory().openSession();
//        Transaction t1 = s1.beginTransaction();
//        List l1 = null;
//        try {
//            Criteria cr = s1.createCriteria(CommonInvoice.class);
//            cr.add(Restrictions.eq("cid", cid));
//            l1 = cr.list();
//            System.out.println("truiitewtewtewtewtewtewtewtewtewtewtewtewtewtewtewtewtewr" + l1);
//            t1.commit();
//            Float num=0.0f;
//            for(Object o:l1) {
//               CommonInvoice c=(CommonInvoice) o; 
//               num=c.getInvoiceTotal();
//            }
//            getNumberinWords(num);
//        } catch (HibernateException h) {
//            System.out.println("HibernateException during Edit1:" + h);
//            h.printStackTrace();
//        } catch (Exception ex) {
//            System.out.println("Exception during Edit1:" + ex);
//            ex.printStackTrace();
//        } finally {
//            s1.close();
//        }
//             System.out.println("Parent list issssssss"+l1);
//        return l1;
//    }
//         
//           public List viewChildCommonInvoice(int cid) {
//        Session s1 = HibernateUtil.getSessionFactory().openSession();
//        Transaction t1 = s1.beginTransaction();
//        List<ChildCommonInvoice> l1 = new ArrayList();
//        try {
//            Criteria cr = s1.createCriteria(ChildCommonInvoice.class);
//            cr.add(Restrictions.eq("commonInvoice.cid", cid));
//            l1 = cr.list();
//            System.out.println("truiitewtewtewtewtewtewtewtewtewtewtewtewtewtewtewtewtewr" + l1);
//            t1.commit();
//            
//        } catch (HibernateException h) {
//            System.out.println("HibernateException during Edit1:" + h);
//            h.printStackTrace();
//        } catch (Exception ex) {
//            System.out.println("Exception during Edit1:" + ex);
//            ex.printStackTrace();
//        } finally {
//            s1.close();
//        }
//             System.out.println("Child list issssssss"+l1);
//        return l1;
//    } 
//           
           public String getNumberinWords(Float f)
           {
               NumberToWord n=new NumberToWord();
               int i=Math.round(f);
               System.out.println("number issssss"+i);
              String word=n.convertNumberToWords(i);
               System.out.println("word isssssss"+word);
               words=word;
               return word;
           }
            public boolean validateUser2(LoginDto l) {
        System.out.println("validdddddddddoooooooooooooooo");

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();

        System.out.println("checkinggggggggggggggggg");
        String userName = l.getLoginid();
       
         String number = l.getMobileNo();
        String sql = "select mobile_no,login_id from login  where binary login_id=:loginId or binary mobile_no=:mobileNo";
        Query query = session.createSQLQuery(sql);
        query.setParameter("loginId", userName);
       
        query.setParameter("mobileNo", number);
        List list = query.list();
          System.out.println("????????????"+list);
 
         list.remove(number);
         list.remove(userName);
          System.out.println("??????/////////////////??????"+list);
         ArrayList<Object> list1 = new ArrayList(Arrays.asList(list));
           System.out.println("dfgdhgdh"+list1.size());
          
        if (list.size() > 1) 
        {
            //session.close();
            return false;
        }
       
        if(list.size()==1)
        {
            return true;
            
        }
        t.commit();
        session.close();

        //session.getTransaction().rollback();
        return true;

    }
           
//             public List viewparentSupplyInvoice(int sid) {
//        Session s1 = HibernateUtil.getSessionFactory().openSession();
//        Transaction t1 = s1.beginTransaction();
//        List l1 = null;
//        try {
//            Criteria cr = s1.createCriteria(SupplyInvoice.class);
//            cr.add(Restrictions.eq("sid", sid));
//            l1 = cr.list();
//            System.out.println("truiitewtewtewtewtewtewtewtewtewtewtewtewtewtewtewtewtewr" + l1);
//            t1.commit();
//            Float num=0.0f;
//            for(Object o:l1) {
//               SupplyInvoice c=(SupplyInvoice) o; 
//               num=c.getInvoiceTotal();
//            }
//            getNumberinWords(num);
//        } catch (HibernateException h) {
//            System.out.println("HibernateException during Edit1:" + h);
//            h.printStackTrace();
//        } catch (Exception ex) {
//            System.out.println("Exception during Edit1:" + ex);
//            ex.printStackTrace();
//        } finally {
//            s1.close();
//        }
//             System.out.println("Parent list issssssss"+l1);
//        return l1;
//    }
//        
//    public List viewChildSupplyInvoice(int sid) {
//        Session s1 = HibernateUtil.getSessionFactory().openSession();
//        Transaction t1 = s1.beginTransaction();
//        List<ChildCommonInvoice> l1 = new ArrayList();
//        try {
//            Criteria cr = s1.createCriteria(ChildSupplyInvoice.class);
//            cr.add(Restrictions.eq("supplyInvoice.sid", sid));
//            l1 = cr.list();
//            System.out.println("truiitewtewtewtewtewtewtewtewtewtewtewtewtewtewtewtewtewr" + l1);
//            t1.commit();
//            
//        } catch (HibernateException h) {
//            System.out.println("HibernateException during Edit1:" + h);
//            h.printStackTrace();
//        } catch (Exception ex) {
//            System.out.println("Exception during Edit1:" + ex);
//            ex.printStackTrace();
//        } finally {
//            s1.close();
//        }
//             System.out.println("Child list issssssss"+l1);
//        return l1;
//    } 

}
