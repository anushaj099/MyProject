/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.manager;

import com.textile.dto.ParentCardingDTO;
import com.textile.model.ChildCarding;
import com.textile.model.ParentCarding;
import com.textile.util.HibernateUtil;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import com.textile.model.Login;
import com.textile.model.Superviser;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author anusha
 */
public class PCardingManager {

    public List Retrieve(ParentCardingDTO p) throws ParseException {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<ParentCarding> list = new ArrayList<>();

        String superviser = p.getSuperviser();
        String shifts = p.getShifts();
        String d = p.getDate();
        String d1 = p.getDate1();
        SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yy");
        Date date = sf.parse(d);
        Date date1 = sf.parse(d1);
        System.out.println(shifts);
        if (shifts.equals("Whole day")) {
            Criteria c = s.createCriteria(ParentCarding.class);
            c.add(Restrictions.between("date", date, date1));
            list = c.list();
            t.commit();
        } else {
            Criteria c = s.createCriteria(ParentCarding.class);
            c.add(Restrictions.between("date", date, date1))
                    .add(Restrictions.eq("shifts", shifts));
            list = c.list();
            t.commit();
        }

        System.out.println("List is" + list);

        s.close();

        return list;
    }

    public List cardingList(ParentCardingDTO p) {

        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        String carding = "carding";
        List<Login> list = null;
        try {
            Criteria c = s.createCriteria(Login.class);
            c.add(Restrictions.eq("id", p.getId()));
            list = c.list();
        } catch (Exception e) {

        }
        System.out.println("list is:------->>>>" + list);
        return list;
    }

    public List cardingList1(int id) {

        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        String carding = "carding";
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

    public List retrievemain(ParentCardingDTO l) throws ParseException {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<ParentCarding> list = new ArrayList<>();
        String superviser = l.getSuperviser();

        String shifts = l.getShifts();
        String d = l.getDate();
        System.out.println("");
        String d1 = l.getDate1();
        SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yy");
        Date date = sf.parse(d);
        Date date1 = sf.parse(d1);
        System.out.println(shifts);
        if (shifts.equals("Whole day")) {
            Criteria c = s.createCriteria(ParentCarding.class);
            c.add(Restrictions.between("date", date, date1));
            list = c.list();
            t.commit();
        } else {
            Criteria c = s.createCriteria(ParentCarding.class);
            c.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("superviser", superviser))
                    .add(Restrictions.eq("shifts", shifts));
            list = c.list();
            t.commit();
        }

        System.out.println("List is" + list);

        s.close();

        return list;
    }

    /*  public List retrievemain1(ParentCardingDTO l,String machines) throws ParseException{    
         Session s=HibernateUtil.getSessionFactory().openSession();
        Transaction t=s.beginTransaction();
        List<ParentCarding> list= new ArrayList<>();
         List<ChildCarding> list1=new ArrayList<>();
         System.out.println("\n ffffffffffffffffff");
         ChildCarding ch=new ChildCarding();
         String d=l.getDate();
         String d1=l.getDate1();
             SimpleDateFormat sf=new SimpleDateFormat("dd-MM-yy");
             Date date=sf.parse(d);
             Date date1=sf.parse(d1);
             Criteria c=s.createCriteria(ParentCarding.class);
            c.add(Restrictions.between("date", date, date1));
            list=c.list();
            System.out.println("\n dddddddddddddddd"+list);
            
            
            int id = 0;
           for(Object o:list)
            {
              ParentCarding pq=(ParentCarding)o;
              id=pq.getIdc();
               System.out.println("\n ssssssssssssss"+id);
             } 
          Criteria c1=s.createCriteria(ChildCarding.class);
          List lst=null;
          String shifts=l.getShifts();

             
          if(machines.equals("MC-1"))
          {
            c1.add(Restrictions.eq("parentCarding.idc", id)).add(Restrictions.eq("carding", machines));
            System.out.println("svvvvvvvvvvvvvvvvvvvvv'''''''''''''''"+id+machines);
            lst=c1.list();
            System.out.println("jkhkj-----------------jnk-------"+lst);
            
            t.commit();
                System.out.println("List is"+list1);
          }
          else if(machines.equals("MC-2"))
          {
            System.out.println("\n zzzzzzzzzzzzzz"+machines);
            c1.add(Restrictions.eq("parentCarding.id", id)).add(Restrictions.eq("carding", machines));
            System.out.println("svvvvvvvvvvvvvvvvvvvvv'''''''''''''''"+id+machines);
            lst=c1.list();
            System.out.println("jkhkj-----------------jnk-------"+lst);
            t.commit();
                System.out.println("List is"+list1);
          }
         
          list.addAll(lst);
          
          s.close();
           
          return list;
         
     }*/
    public List Retrievecarding1(ParentCardingDTO d) {
        System.out.println("poooooooooo");
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<ChildCarding> list = new ArrayList<>();
        String shifts = d.getShifts();
        // List<String> carding=d.getCarding();

        Criteria cr = s.createCriteria(ParentCarding.class);
        cr.add(Restrictions.eq("shifts", shifts));
        System.out.println(shifts);
        list = cr.list();
        System.out.println("poooooooooo" + list);
        return list;
    }

    public List retrievemain1(ParentCardingDTO l, String machines) throws ParseException {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<ParentCarding> list = new ArrayList<>();
        List<ChildCarding> list1 = new ArrayList<>();
        System.out.println("\n ffffffffffffffffff");
        ChildCarding ch = new ChildCarding();
        String d = l.getDate();
        String d1 = l.getDate1();
        String shifts = l.getShifts();
        SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yy");
        Date date = sf.parse(d);
        Date date1 = sf.parse(d1);
        Criteria c = s.createCriteria(ParentCarding.class);
        c.add(Restrictions.between("date", date, date1));
        list = c.list();
        System.out.println("\n dddddddddddddddd" + list);
        t.commit();
        s.close();

        Session s1 = HibernateUtil.getSessionFactory().openSession();
        Transaction t1 = s1.beginTransaction();
        int id;
        for (Object o : list) {
            List lst = null;
            ParentCarding pq = (ParentCarding) o;
            id = pq.getIdc();
            Criteria c1 = s1.createCriteria(ChildCarding.class);
            if (machines.equals("MC-1") || machines.equals("MC-2") || machines.equals("MC-3") || machines.equals("MC-4") || machines.equals("MC-5") || machines.equals("MC-6") || machines.equals("MC-7") || machines.equals("MC-8") || machines.equals("MC-9") || machines.equals("MC-10")) {

                c1.add(Restrictions.eq("parentCarding.idc", id)).add(Restrictions.eq("carding", machines));
                lst = c1.list();
                System.out.println("jkhkj-----11111111------------jnk-------" + l);
                s1.flush();
                s1.clear();
                list1.addAll(lst);
                s1.flush();
                s1.clear();
                System.out.println("List is" + l);
            } else if (machines.equals("All")) {
                c1.add(Restrictions.eq("parentCarding.idc", id));
                lst = c1.list();
                System.out.println("jkhkj------------2222-----jnk-------" + l);
                list1.addAll(lst);
                s1.flush();
                s1.clear();
                System.out.println("List is" + l);
            }
        }

        t1.commit();
        s1.close();

        return list1;

    }

    public List<ParentCarding> CardingParent(ParentCardingDTO form) throws ParseException {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<ParentCarding> list = new ArrayList<>();
        String d = form.getDate();
        String d1 = form.getDate1();
        SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yy");
        Date date = sf.parse(d);
        Date date1 = sf.parse(d1);
        Criteria c = s.createCriteria(ParentCarding.class);
        c.add(Restrictions.between("date", date, date1));
        list = c.list();
        System.out.println("\n ddddddddddddpppppppppparevttttttdddd" + list);

        t.commit();
        s.close();
        return list;
    }

    public List<ParentCarding> carding(ParentCardingDTO form) throws ParseException {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<ParentCarding> list = new ArrayList<>();
        String d = form.getDate();
        String d1 = form.getDate1();
        SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yy");
        Date date = sf.parse(d);
        Date date1 = sf.parse(d1);
        Criteria c = s.createCriteria(ParentCarding.class);
        c.add(Restrictions.between("date", date, date1));
        list = c.list();
        System.out.println("\n guhfdiuhfioedddddddddddddddddddd" + list);
        t.commit();
        s.close();
        return list;

    }

}
