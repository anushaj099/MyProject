/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.manager;

import com.textile.dto.OeHomeDto;
import com.textile.model.ChildOpenend;
import com.textile.model.Counts;
import com.textile.model.Login;
import com.textile.model.ParentOpenend;
import com.textile.util.HibernateUtil;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author ch.mounika
 */
public class OeRtveManager {

    Session s = null;

    public List RetriveOe(OeHomeDto ort) throws ParseException {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<ParentOpenend> list = new ArrayList<>();
        String superviser = ort.getSuperviser();
        System.out.println("--------------------------->" + superviser);
        String shifts = ort.getShifts();
        System.out.println("--------------------------->" + shifts);
        String d = ort.getDate();
        String d1 = ort.getDate1();

        try {
            SimpleDateFormat st = new SimpleDateFormat("dd-MM-yy");
            Date date = st.parse(d);
            Date date1 = st.parse(d1);
            System.out.println("--------------------------->" + date);
            if (shifts.equals("Whole day")) {
                Criteria c = s.createCriteria(ParentOpenend.class);
                c.add(Restrictions.between("date", date, date1));
                list = c.list();
            } else {

                Criteria c = s.createCriteria(ParentOpenend.class);
                c.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("shifts", shifts));
                list = c.list();
                System.out.println("----------------------11111--->" + list);
            }
            System.out.println("----------------------0000--->" + list);

            t.commit();

        } catch (Exception ex) {

        }

        System.out.println("list is" + list);
        return list;
    }

    public List retrievemain1(OeHomeDto l, String machines, String count) throws ParseException {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<ParentOpenend> list = new ArrayList<>();
        List<ChildOpenend> list1 = new ArrayList<>();
        String d = l.getDate();
        String d1 = l.getDate1();
        SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yy");
        Date date = sf.parse(d);
        Date date1 = sf.parse(d1);
        String shifts = l.getShifts();
        List<String> dept = new ArrayList<>();
        List<Counts> cl = (List<Counts>) s.createCriteria(Counts.class).list();
        for (Counts dl : cl) {
            dept.add(dl.getCount());
        }
        String st = dept.toString();
        System.out.println("\n count in oeeeeeee" + dept + "oooooooooo" + st);
        try {
            if ((machines.equals("OE-1") || machines.equals("OE-2") || machines.equals("OE-3") || machines.equals("OE-4") || machines.equals("OE-5") || machines.equals("OE-6")) && (dept.contains(count)) && (shifts.equals("Whole day"))) {
                int i = Integer.parseInt(count);
                Criteria c = s.createCriteria(ParentOpenend.class);
                c.add(Restrictions.between("date", date, date1));
                list = c.list();
                int id = 0;
                for (Object o : list) {
                    List l1 = null;
                    ParentOpenend pq = (ParentOpenend) o;
                    id = pq.getIdo();
                    Criteria c1 = s.createCriteria(ChildOpenend.class);
                    c1.add(Restrictions.eq("parentOpenend.ido", id)).add(Restrictions.eq("openEnd", machines)).add(Restrictions.eq("count", i));
                    l1 = c1.list();
                    System.out.println("\n a1a1a1a1a1a1a1a1a1;" + l1);
                    s.flush();
                    s.clear();
                    list1.addAll(l1);
                    s.flush();
                    s.clear();
                }
                t.commit();
            } else if (dept.contains(count) && shifts.equals("Whole day")) {
                int i = Integer.parseInt(count);
                Criteria c = s.createCriteria(ParentOpenend.class);
                c.add(Restrictions.between("date", date, date1));
                list = c.list();
                int id = 0;
                for (Object o : list) {
                    List l1 = null;
                    ParentOpenend pq = (ParentOpenend) o;
                    id = pq.getIdo();
                    Criteria c1 = s.createCriteria(ChildOpenend.class);
                    c1.add(Restrictions.eq("parentOpenend.ido", id)).add(Restrictions.eq("count", i));
                    l1 = c1.list();
                    System.out.println("\n b1b1b1bb1b1b1b1b1b1b;" + l1);
                    s.flush();
                    s.clear();
                    list1.addAll(l1);
                    s.flush();
                    s.clear();
                }
                t.commit();
            } else if ((machines.equals("OE-1") || machines.equals("OE-2") || machines.equals("OE-3") || machines.equals("OE-4") || machines.equals("OE-5") || machines.equals("OE-6")) && (dept.contains(count))) {
                int i = Integer.parseInt(count);
                Criteria c = s.createCriteria(ParentOpenend.class);
                c.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("shifts", shifts));
                list = c.list();
                int id = 0;
                for (Object o : list) {
                    List l1 = null;
                    ParentOpenend pq = (ParentOpenend) o;
                    id = pq.getIdo();
                    Criteria c1 = s.createCriteria(ChildOpenend.class);
                    c1.add(Restrictions.eq("parentOpenend.ido", id)).add(Restrictions.eq("openEnd", machines)).add(Restrictions.eq("count", i));
                    l1 = c1.list();
                    System.out.println("\n c1c1c1c1c1c1c1c1c1c1;" + l1);
                    s.flush();
                    s.clear();
                    list1.addAll(l1);
                    s.flush();
                    s.clear();
                }
                t.commit();
            } else if ((machines.equals("OE-1") || machines.equals("OE-2") || machines.equals("OE-3") || machines.equals("OE-4") || machines.equals("OE-5") || machines.equals("OE-6")) && (count.equals("All")) && (shifts.equals("Whole day"))) {
                Criteria c = s.createCriteria(ParentOpenend.class);
                c.add(Restrictions.between("date", date, date1));
                list = c.list();
                int id = 0;

                for (Object o : list) {
                    List l1 = null;
                    ParentOpenend pq = (ParentOpenend) o;
                    id = pq.getIdo();
                    Criteria c1 = s.createCriteria(ChildOpenend.class);
                    c1.add(Restrictions.eq("parentOpenend.ido", id)).add(Restrictions.eq("openEnd", machines));
                    l1 = c1.list();
                    System.out.println("\n d1d1d1d1d1d1d1d1d;" + l1);
                    s.flush();
                    s.clear();
                    list1.addAll(l1);
                    s.flush();
                    s.clear();
                }
                t.commit();
            } else if ((machines.equals("OE-1") || machines.equals("OE-2") || machines.equals("OE-3") || machines.equals("OE-4") || machines.equals("OE-5") || machines.equals("OE-6")) && (count.equals("All"))) {
                Criteria c = s.createCriteria(ParentOpenend.class);
                c.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("shifts", shifts));
                list = c.list();
                int id = 0;
                for (Object o : list) {
                    List l1 = null;
                    ParentOpenend pq = (ParentOpenend) o;
                    id = pq.getIdo();
                    Criteria c1 = s.createCriteria(ChildOpenend.class);
                    c1.add(Restrictions.eq("parentOpenend.ido", id)).add(Restrictions.eq("openEnd", machines));
                    l1 = c1.list();
                    System.out.println("\n e1e1e1e1e1e1e1e1e1e1;" + l1);
                    s.flush();
                    s.clear();
                    list1.addAll(l1);
                    s.flush();
                    s.clear();
                }
                t.commit();
            } else if ((dept.contains(count)) && (!shifts.equals("Whole day"))) {
                int i = Integer.parseInt(count);
                Criteria c = s.createCriteria(ParentOpenend.class);
                c.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("shifts", shifts));
                list = c.list();
                int id = 0;
                for (Object o : list) {
                    List l1 = null;
                    ParentOpenend pq = (ParentOpenend) o;
                    id = pq.getIdo();
                    Criteria c1 = s.createCriteria(ChildOpenend.class);
                    c1.add(Restrictions.eq("parentOpenend.ido", id)).add(Restrictions.eq("count", i));
                    l1 = c1.list();
                    System.out.println("\n f1f1f1f1f1f1f1f1f1f1;" + l1);
                    s.flush();
                    s.clear();
                    list1.addAll(l1);
                    s.flush();
                    s.clear();
                }
                t.commit();
            } else if (count.equals("All") && shifts.equals("Whole day")) {
                Criteria c = s.createCriteria(ParentOpenend.class);
                c.add(Restrictions.between("date", date, date1));
                list = c.list();
                int id = 0;
                for (Object o : list) {
                    List l1 = null;
                    ParentOpenend pq = (ParentOpenend) o;
                    id = pq.getIdo();
                    Criteria c1 = s.createCriteria(ChildOpenend.class);
                    c1.add(Restrictions.eq("parentOpenend.ido", id));
                    l1 = c1.list();
                    System.out.println("\n g1g1g1g1g1g1g1g1g1g1;" + l1);
                    s.flush();
                    s.clear();
                    list1.addAll(l1);
                    s.flush();
                    s.clear();
                }
                t.commit();
            } else if (count.equals("All")) {
                Criteria c = s.createCriteria(ParentOpenend.class);
                c.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("shifts", shifts));
                list = c.list();
                int id = 0;
                for (Object o : list) {
                    List l1 = null;
                    ParentOpenend pq = (ParentOpenend) o;
                    id = pq.getIdo();
                    Criteria c1 = s.createCriteria(ChildOpenend.class);
                    c1.add(Restrictions.eq("parentOpenend.ido", id));
                    l1 = c1.list();
                    System.out.println("\n h1h1h1h1h1h1h1h1h1;" + l1);
                    s.flush();
                    s.clear();
                    list1.addAll(l1);
                    s.flush();
                    s.clear();
                }
                t.commit();
            }

        } catch (HibernateException h) {
            System.out.println("\n Hibernate Exception during retrieve");
            h.printStackTrace();
        } catch (Exception e) {
            System.out.println("\n Exception during retrieve");
            e.printStackTrace();
        }

        return list1;
    }

    public List<ParentOpenend> DrawingParent(OeHomeDto form1) throws ParseException {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<ParentOpenend> list = new ArrayList<>();
        String d = form1.getDate();
        String d1 = form1.getDate1();
        SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yy");
        Date date = sf.parse(d);
        Date date1 = sf.parse(d1);
        Criteria c = s.createCriteria(ParentOpenend.class);
        c.add(Restrictions.between("date", date, date1));
        list = c.list();
        System.out.println("\n ddddddddddddpppppppppparevttttttdddd" + list);

        t.commit();
        s.close();
        return list;
    }

    public List openendList(OeHomeDto ort) {

        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        String openend = "openend";
        List<Login> list = null;
        try {
            Criteria c = s.createCriteria(Login.class);
            c.add(Restrictions.eq("id", ort.getId()));
            list = c.list();
        } catch (Exception e) {

        }
        System.out.println("list is:------->>>>" + list);
        return list;
    }

    public List openendList1(int id) {

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

}

/* 
public List retrievemain1(OeHomeDto l,String machines) throws ParseException{    
          Session s=HibernateUtil.getSessionFactory().openSession();
        Transaction t=s.beginTransaction();
        List<ParentOpenend> list= new ArrayList<>();
        List<ChildOpenend> list1=new ArrayList<>();
         System.out.println("\n ffffffffffffffffff");
         String d=l.getDate();
         String d1=l.getDate1();
         SimpleDateFormat sf=new SimpleDateFormat("dd-MM-yy");
         Date date=sf.parse(d);
         Date date1=sf.parse(d1);
         String shifts=l.getShifts();
        try
        {
           if((machines.equals("OE-1") || machines.equals("OE-2") || machines.equals("OE-3") || machines.equals("OE-4") || machines.equals("OE-5") || machines.equals("OE-6")) && !shifts.equals("Whole day"))
           {
              Criteria c = s.createCriteria(ParentOpenend.class);
                c.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("shifts", shifts));
                list = c.list();
                System.out.println("\n cccccccccccccccccccccccccccccccc"+list);
                int id = 0;
                t.commit();
                Session s1 = HibernateUtil.getSessionFactory().openSession();
                Transaction t1 = s1.beginTransaction();
                for (Object o : list) {
                    List l1 = null;
                    ParentOpenend pq = (ParentOpenend) o;
                    id = pq.getIdo();
                    Criteria c1 = s1.createCriteria(ChildOpenend.class);
                    c1.add(Restrictions.eq("parentOpenend.ido", id)).add(Restrictions.eq("openEnd", machines));
                    l1 = c1.list();
                    System.out.println("\n cc1c1c1c1c1cc1c1c1c1c;"+l1);
                    s.flush();
                    s.clear();
                    list1.addAll(l1);
                    s1.flush();
                    s1.clear();
                }
                t1.commit();
         }
         else if((machines.equals("OE-1") || machines.equals("OE-2") || machines.equals("OE-3") || machines.equals("OE-4") || machines.equals("OE-5") || machines.equals("OE-6")) && shifts.equals("Whole day"))
         {
             Criteria c=s.createCriteria(ParentOpenend.class);
             c.add(Restrictions.between("date", date, date1));
             list = c.list();
             System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"+list);
              int id = 0;
             for(Object o:list)
             {
               List lst=null;
               ParentOpenend pq=(ParentOpenend)o;
               id=pq.getIdo();
               String sh=pq.getShifts();
               System.out.println("\n a1a11a1a1a11a11a1a1a1"+id);
               Criteria c1=s.createCriteria(ChildOpenend.class);
                  c1.add(Restrictions.eq("parentOpenend.ido", id)).add(Restrictions.eq("openEnd", machines));
                  lst=c1.list();
                  System.out.println("jkhkj-----11111111------------jnk-------"+lst);
                  s.flush();
                  s.clear();
                  list1.addAll(lst);
                  s.flush();
                  s.clear();
                  System.out.println("List is"+l);
             }
              t.commit();
         }
        else if(machines.equals("OE-1") || machines.equals("OE-2") || machines.equals("OE-3") || machines.equals("OE-4") || machines.equals("OE-5") || machines.equals("OE-6"))
         {
             Criteria c=s.createCriteria(ParentOpenend.class);
             c.add(Restrictions.between("date", date, date1));
             list = c.list();
             System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"+list);
              int id = 0;
             for(Object o:list)
             {
               List lst=null;
               ParentOpenend pq=(ParentOpenend)o;
               id=pq.getIdo();
               String sh=pq.getShifts();
               System.out.println("\n aaaaaaaaaaaa"+id);
               Criteria c1=s.createCriteria(ChildOpenend.class);
                  c1.add(Restrictions.eq("parentOpenend.ido", id)).add(Restrictions.eq("openEnd", machines));
                  lst=c1.list();
                  System.out.println("jkhkj-----11111111------------jnk-------"+lst);
                  s.flush();
                  s.clear();
                  list1.addAll(lst);
                  s.flush();
                  s.clear();
                  System.out.println("List is"+l);
             }
              t.commit();
              //s.close();
         }
         else if( machines.equals("All") && shifts.equals("Whole day") )
         {
                Criteria c = s.createCriteria(ParentOpenend.class);
                c.add(Restrictions.between("date", date, date1));
                list = c.list();
                System.out.println("\n ddddddddddddddd"+list);
                int id = 0;
                t.commit();
                //s.close();
                Session s1 = HibernateUtil.getSessionFactory().openSession();
                Transaction t1 = s1.beginTransaction();
                for (Object o : list) {
                    List l1 = null;
                    ParentOpenend pq = (ParentOpenend) o;
                    id = pq.getIdo();
                    Criteria c1 = s1.createCriteria(ChildOpenend.class);
                    c1.add(Restrictions.eq("parentOpenend.ido", id));
                    l1 = c1.list();
                    System.out.println("\n eeeeeeeeeeeee;"+l1);
                    s.flush();
                    s.clear();
                    list1.addAll(l1);
                    s1.flush();
                    s1.clear();
                }
                t1.commit();
                
            }
         else if(machines.equals("All") && !shifts.equals("-1"))
         {
             Criteria c=s.createCriteria(ParentOpenend.class);
             c.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("shifts", shifts));
             list = c.list();
             System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"+list);
              int id = 0;
             for(Object o:list)
             {
               List lst=null;
               ParentOpenend pq=(ParentOpenend)o;
               id=pq.getIdo();
               System.out.println("\n iiiiiiiiiiiiiiiiiii"+id);
               Criteria c1=s.createCriteria(ChildOpenend.class);
                  c1.add(Restrictions.eq("parentOpenend.ido", id));
                  lst=c1.list();
                  System.out.println("jkhkj-----11111111------------jnk-------"+lst);
                  s.flush();
                  s.clear();
                  list1.addAll(lst);
                  s.flush();
                  s.clear();
                  System.out.println("List is"+l);
             }
              t.commit();
              s.close();
         }
         else if(machines.equals("All"))
         {
              Criteria c = s.createCriteria(ParentOpenend.class);
              c.add(Restrictions.between("date", date, date1));
              list = c.list();
              int id = 0;
              t.commit();
              s.close();
              Session s1 = HibernateUtil.getSessionFactory().openSession();
              Transaction t1 = s1.beginTransaction();
              for(Object o:list)
             {
              List lst=null;
              ParentOpenend pq=(ParentOpenend)o;
              id=pq.getIdo();
              System.out.println("\n bbbbbbbbbbbbb"+id);
              Criteria c1=s1.createCriteria(ChildOpenend.class);
                 c1.add(Restrictions.eq("parentOpenend.ido", id));
                 lst=c1.list();
                 System.out.println("jkhkj------------2222-----jnk-------"+l);
                 s1.flush();
                 s1.clear();
                 list1.addAll(lst);
                 s1.flush();
                 s1.clear();
                 System.out.println("List is"+l);
             }
             t1.commit();
             s1.close();
         }
         else if(shifts.equals("Whole day"))
            {
                Criteria c = s.createCriteria(ParentOpenend.class);
                c.add(Restrictions.between("date", date, date1));
                list = c.list();
                System.out.println("\n ffffffffffffffffff"+list);
                int id = 0;
                t.commit();
                s.close();

                Session s1 = HibernateUtil.getSessionFactory().openSession();
                Transaction t1 = s1.beginTransaction();
                for (Object o : list) {
                    List l1 = null;
                    ParentOpenend pq = (ParentOpenend) o;
                    id = pq.getIdo();
                    Criteria c1 = s1.createCriteria(ChildOpenend.class);
                    c1.add(Restrictions.eq("parentOpenend.ido", id));
                    l1 = c1.list();
                    System.out.println("\n gggggggggggg;"+l1);
                    list1.addAll(l1);
                    s1.flush();
                    s1.clear();
                }
                t1.commit();
                
            }
            else
            {
              Criteria c=s.createCriteria(ParentOpenend.class);
              c.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("shifts", shifts));
              list = c.list();
              int id = 0;
              for(Object o:list)
              {
                 List lst=null;
                 ParentOpenend pq=(ParentOpenend)o;
                 id=pq.getIdo();
                 Criteria c1=s.createCriteria(ChildOpenend.class);
                  c1.add(Restrictions.eq("parentOpenend.ido", id));
                  lst=c1.list();
                  System.out.println("jkhkj-----11111111------------jnk-------"+lst);
                  s.flush();
                  s.clear();
                  list1.addAll(lst);
                  s.flush();
                  s.clear();
                  System.out.println("List is"+l);
             }
              t.commit();
              s.close();
                
            }
         
         
          }
          catch(HibernateException h)
          {
              System.out.println("\n hibernate exception during retrieve");
              h.printStackTrace();
          }
          catch(Exception e)
          {
              System.out.println("\n  exception");
              e.printStackTrace();
          }
           
           
          return list1;
  
   }
 */
