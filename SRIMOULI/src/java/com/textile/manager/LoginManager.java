/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.manager;

import com.textile.dto.Logindto;
import com.textile.model.Counts;
import com.textile.model.Login;
import com.textile.model.Superviser;
import com.textile.util.HibernateUtil;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Swathi
 */
public class LoginManager {

    boolean status = false;
    List ulist = null;

    public List<Login> loginmanager(String username, String password) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<Login> list = null;
        try {
            // String username=l.getUsername();
            // String password=l.getPassword();

            Criteria c = s.createCriteria(Login.class);
            c.add(Restrictions.eq("userName", username));
            c.add(Restrictions.eq("password", password));
            list = c.list();
        } catch (Exception e) {

        }
        System.out.println("list is:------->>>>" + list);
        return list;

    }

    public List cardingList(int id) {

        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        String carding = "carding";
        List<Login> list = null;
        List<Login> list1 = null;
        try {
            Criteria c = s.createCriteria(Login.class);
            c.add(Restrictions.eq("id", id));
            list = c.list();
            for (Object o : list) {
                Login lg = (Login) o;
                String user = lg.getUserName();
                String pass = lg.getPassword();
                Criteria c1 = s.createCriteria(Login.class);
                c1.add(Restrictions.eq("userName", user)).add(Restrictions.eq("password", pass));
                list1 = c1.list();

            }
        } catch (Exception e) {

        }
        System.out.println("list is:---+++++++++00000000000---->>>>" + list1);
        return list1;
    }

    public boolean validateUser(Logindto l) {
        System.out.println("---------home----??????????------------");

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();

        System.out.println("-------------------ssssssssssss");
        String userName = l.getUsername();
        String password = l.getPassword();
        String sql = "select * from login  where binary user_name=:userName and binary password=:password";
        Query query = session.createSQLQuery(sql);
        query.setParameter("userName", userName);
        query.setParameter("password", password);
        List<Login> list = query.list();

//            Criteria c=session.createCriteria(Login.class);
//            c.add(Restrictions.eq("userName", name));
//            c.add(Restrictions.eq("password", pwd));
//            List<Login> list = c.list();
        if (list.size() > 0) {
            //session.close();
            return false;
        }
        t.commit();
        session.close();

        //session.getTransaction().rollback();
        return true;

    }

    public void changepassword(Logindto l, int id) {
        System.out.println("id is ----------))))))))))))" + id);
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        List list = new ArrayList();
        Criteria c = session.createCriteria(Login.class);
        c.add(Restrictions.eq("id", id));
        list = c.list();
        List<Login> list1 = new ArrayList<>();
        System.out.println("sj..............fdj........." + list);
        for (Object o : list) {
            Login lg = (Login) o;
            String user = lg.getUserName();
            String pass = lg.getPassword();
            System.out.println("xn,v--------------------------------" + user + pass);
            Criteria c1 = session.createCriteria(Login.class);
            c1.add(Restrictions.eq("userName", user)).add(Restrictions.eq("password", pass));
            list1.addAll(c1.list());

        }
        System.out.println("sj.......\\\\\\\\\\\\\\\\\\\\.......fdj........." + list);
        String newpwd = l.getNewpwd();
        String confirmpwd = l.getConfirmpwd();

        for (Object o1 : list1) {
            Login lg = (Login) o1;
            int id1 = lg.getId();
            System.out.println("kjsh------------password-----------------------" + id1);
            Login m = new Login();
            m = (Login) session.get(Login.class, id1);
            m.setPassword(newpwd);
            session.update(m);
        }
        t.commit();
        System.out.println("list is ::::::::::::" + list);

    }

    public List drawingList(int id) {
        // throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.

        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        String drawing = "drawing";
        List<Login> list = null;
        try {
            Criteria c = s.createCriteria(Login.class);
            c.add(Restrictions.eq("id", id));
            list = c.list();
        } catch (Exception e) {

        }
        System.out.println("list is:------->>>>" + list);
        return list;
    }

    public List openendList(int id) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        String openend = "openend";
        List<Login> list = null;
        try {
            Criteria c = s.createCriteria(Login.class);
            c.add(Restrictions.eq("id", id));
            list = c.list();
        } catch (Exception e) {

        }
        System.out.println("list is:------->>>>" + list);
        return list;
    }

    public List purchaseList(int id) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        String purchase = "purchase";
        List<Login> list = null;
        try {
            Criteria c = s.createCriteria(Login.class);
            c.add(Restrictions.eq("id", id));
            list = c.list();
        } catch (Exception e) {

        }
        System.out.println("list is:------->>>>" + list);
        return list;

    }

    public List saleList(int id) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        String sale = "sale";
        List<Login> list = null;
        try {
            Criteria c = s.createCriteria(Login.class);
            c.add(Restrictions.eq("id", id));
            list = c.list();
        } catch (Exception e) {

        }
        System.out.println("list is:------->>>>" + list);
        return list;
    }
    
    public List dispatchList(int id) {

        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        //  String packing="packing";
        List<Login> list = null;
        try {
            Criteria c = s.createCriteria(Login.class);
            c.add(Restrictions.eq("id", id));
            list = c.list();
        } catch (Exception e) {

        }
        System.out.println("list is:------->>>>" + list);
        return list;
    }

    public List productionList(int id) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        String production = "production";
        List<Login> list = null;
        try {
            Criteria c = s.createCriteria(Login.class);
            c.add(Restrictions.eq("id", id));
            list = c.list();
        } catch (Exception e) {

        }
        System.out.println("list is:------->>>>" + list);
        return list;
    }

    public List settingsList(int id) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        String control = "control";
        List<Login> list = null;
        try {
            Criteria c = s.createCriteria(Login.class);
            c.add(Restrictions.eq("id", id));
            list = c.list();
        } catch (Exception e) {

        }
        System.out.println("list is:------->>>>" + list);
        return list;
    }

    /* public boolean validateUser(Login l) {
           Session s=HibernateUtil.getSessionFactory().openSession();
         System.out.println("---------home----??????????------------"); 
        if (s != null) {
               s.close();
            }
       Transaction t=s.beginTransaction();
       try {
            String name = l.getUserName();
            String pwd = l.getPassword();
            String sql = "select * from Login l where binary l.userName=:name and binary l.password=:pwd";
            Query query = s.createSQLQuery(sql);
            query.setParameter("name", name);
            query.setParameter("pwd", pwd);
            List<Login> list = query.list();
            if (list.size() > 0) {
                //session.close();
                return false;
            }
            t.commit();
            s.close();
        } catch (Exception e) {
           
        } finally {
            if (s != null) {
               // session.close();
            }
        
        }
     
        return true;

    }*/
    public List getSuperviser() {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<String> dept = new ArrayList<>();
        List<Superviser> l = (List<Superviser>) s.createCriteria(Superviser.class).list();
        for (Superviser d : l) {
            dept.add(d.getName());
        }
        return dept;
    }

    public List getCount() {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<String> dept = new ArrayList<>();
        List<Counts> l = (List<Counts>) s.createCriteria(Counts.class).list();
        for (Counts d : l) {
            dept.add(d.getCount());

        }
        dept.add("All");
        return dept;
    }

    public List qualityList(int id) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        String quality = "quality";
        List<Login> list = null;
        try {
            Criteria c = s.createCriteria(Login.class);
            c.add(Restrictions.eq("id", id));
            list = c.list();
        } catch (Exception e) {

        }
        System.out.println("list is:------->>>>" + list);
        return list;
    }

    public List wastageList(int id) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<Login> list = null;
        try {
            Criteria c = s.createCriteria(Login.class);
            c.add(Restrictions.eq("id", id));
            list = c.list();
        } catch (Exception e) {

        }
        System.out.println("list is:------->>>>" + list);
        return list;
    }

    public List getPurchaseProductList() {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<String> p = new ArrayList<>();
        /* List<GodownProduct> l=(List<GodownProduct>)s.createCriteria(GodownProduct.class).list();
       for(GodownProduct d : l)
       {
            p.add(d.getProduct());
       }*/
        String sql = "select product_name from products_sample where partial_type like '%Purchase%'";
        SQLQuery query = s.createSQLQuery(sql);
        p = query.list();
        System.out.println("list saranyaaaaaaaaaaaaaaaaa" + p);
        return p;

    }

    public List getSaleProductList() {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<String> p = new ArrayList<>();
        /* List<GodownProduct> l=(List<GodownProduct>)s.createCriteria(GodownProduct.class).list();
       for(GodownProduct d : l)
       {
            p.add(d.getProduct());
       }*/
        String sql = "select product_name from products_sample where partial_type like '%Sale%'";
        SQLQuery query = s.createSQLQuery(sql);
        p = query.list();
        System.out.println("list saranyaaaaaaaaaaaaaaaaa" + p);
        return p;

    }

}
