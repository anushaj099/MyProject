/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.manager;

import com.textile.dto.pcleaning;
import com.textile.model.ChildGdPrecleaning;
import com.textile.model.Login;
import com.textile.model.ParentGdPrecleaning;
import com.textile.model.Superviser;
import com.textile.util.HibernateUtil;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author ch.mounika
 */
public class RtcleanManager {

    public List RetrivePtp(pcleaning pp) throws ParseException {

        List<ParentGdPrecleaning> list = new ArrayList<>();
        List<ChildGdPrecleaning> list1 = new ArrayList<>();

        String superviser = pp.getSuperviser();
        String mix = pp.getMixingNumber();
        String issue = pp.getIssueNumber();
        int tm = pp.getTotalMixing();
        String d = pp.getDate();
        String d1 = pp.getDate1();
        int iss = 0;
        if (!issue.equals("All")) {
            iss = Integer.parseInt(issue);
        }
        try {
            Session s = HibernateUtil.getSessionFactory().openSession();
            Transaction t = s.beginTransaction();
            SimpleDateFormat st = new SimpleDateFormat("dd-MM-yy");
            Date date = st.parse(d);
            Date date1 = st.parse(d1);
            System.out.println("in productjion----------------------------" + mix + "............." + issue);

            if (mix.equals("All") || (mix.equals("-1") && issue.equals("-1"))) {
                Criteria c = s.createCriteria(ParentGdPrecleaning.class);
                c.add(Restrictions.between("date", date, date1));
                list = c.list();
                int id = 0;
                t.commit();
                s.close();

                Session s1 = HibernateUtil.getSessionFactory().openSession();
                Transaction t1 = s1.beginTransaction();
                for (Object o : list) {
                    List l = null;
                    ParentGdPrecleaning pq = (ParentGdPrecleaning) o;
                    id = pq.getIdpr();
                    Criteria c1 = s1.createCriteria(ChildGdPrecleaning.class);

                    c1.add(Restrictions.eq("parentGdPrecleaning.idpr", id));
                    l = c1.list();
                    list1.addAll(l);
                    s1.flush();
                    s1.clear();
                }
                t1.commit();

            } else if ((mix.equals("Mixing1") || mix.equals("Mixing2") || mix.equals("Mixing3")) && (issue.equals("All"))) {
                Criteria c = s.createCriteria(ParentGdPrecleaning.class);
                c.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("mixingNumber", mix));
                list = c.list();
                int id = 0;
                for (Object o : list) {
                    List l = null;
                    ParentGdPrecleaning pq = (ParentGdPrecleaning) o;
                    id = pq.getIdpr();
                    Criteria c1 = s.createCriteria(ChildGdPrecleaning.class);
                    c1.add(Restrictions.eq("parentGdPrecleaning.idpr", id));
                    l = c1.list();
                    s.flush();
                    s.clear();
                    list1.addAll(l);
                    s.flush();
                    s.clear();
                }
                t.commit();
                s.close();
            } else if (issue.equals("All") || (mix.equals("-1") && issue.equals("-1"))) {

                Criteria c = s.createCriteria(ParentGdPrecleaning.class);
                c.add(Restrictions.between("date", date, date1));
                list = c.list();
                int id = 0;
                t.commit();
                s.close();

                Session s1 = HibernateUtil.getSessionFactory().openSession();
                Transaction t1 = s1.beginTransaction();
                for (Object o : list) {
                    List l = null;
                    ParentGdPrecleaning pq = (ParentGdPrecleaning) o;
                    id = pq.getIdpr();
                    Criteria c1 = s1.createCriteria(ChildGdPrecleaning.class);
                    c1.add(Restrictions.eq("parentGdPrecleaning.idpr", id));
                    l = c1.list();
                    list1.addAll(l);
                    s1.flush();
                    s1.clear();
                }
                t1.commit();
            } else if ((mix.equals("Mixing1") || mix.equals("Mixing2") || mix.equals("Mixing3")) && ((iss == 1) || (iss == 2) || (iss == 3)
                    || (iss == 4) || (iss == 5) || (iss == 6) || (iss == 7) || (iss == 8) || (iss == 9) || (iss == 10))) {
                Criteria c = s.createCriteria(ParentGdPrecleaning.class);
                c.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("mixingNumber", mix)).add(Restrictions.eq("issueNumber", iss));
                list = c.list();
                int id = 0;
                for (Object o : list) {
                    List l = null;
                    ParentGdPrecleaning pq = (ParentGdPrecleaning) o;
                    id = pq.getIdpr();

                    Criteria c1 = s.createCriteria(ChildGdPrecleaning.class);
                    c1.add(Restrictions.eq("parentGdPrecleaning.idpr", id));
                    l = c1.list();
                    s.flush();
                    s.clear();
                    list1.addAll(l);
                    s.flush();
                    s.clear();
                }
                t.commit();
                s.close();
            } else if ((mix.equals("Mixing1") || mix.equals("Mixing2") || mix.equals("Mixing3"))) {

                Criteria c = s.createCriteria(ParentGdPrecleaning.class);
                c.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("mixingNumber", mix));
                list = c.list();
                int id = 0;
                for (Object o : list) {
                    List l = null;
                    ParentGdPrecleaning pq = (ParentGdPrecleaning) o;
                    id = pq.getIdpr();
                    Criteria c1 = s.createCriteria(ChildGdPrecleaning.class);
                    c1.add(Restrictions.eq("parentGdPrecleaning.idpr", id));
                    l = c1.list();
                    s.flush();
                    s.clear();
                    list1.addAll(l);
                    s.flush();
                    s.clear();
                }
                t.commit();
                s.close();
            } else {
                Criteria c = s.createCriteria(ParentGdPrecleaning.class);
                c.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("issueNumber", iss));
                list = c.list();
                int id = 0;
                for (Object o : list) {
                    List l = null;
                    ParentGdPrecleaning pq = (ParentGdPrecleaning) o;
                    id = pq.getIdpr();
                    Criteria c1 = s.createCriteria(ChildGdPrecleaning.class);
                    c1.add(Restrictions.eq("parentGdPrecleaning.idpr", id));
                    l = c1.list();
                    s.flush();
                    s.clear();
                    list1.addAll(l);
                    s.flush();
                    s.clear();
                }
                t.commit();
                s.close();
            }
        } catch (Exception e) {

        }

        System.out.println("list is" + list1);
        return list1;
    }

    public List productionList(pcleaning pp) {

        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        String production = "production";
        List<Login> list = null;
        try {
            Criteria c = s.createCriteria(Login.class);
            c.add(Restrictions.eq("id", pp.getId()));
            list = c.list();
        } catch (Exception e) {

        }
        System.out.println("list is:------->>>>" + list);
        return list;

    }

    public List productionList1(int id) {

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

    public List<ParentGdPrecleaning> retrieveCtp(pcleaning pp) {
        String d = pp.getDate();
        String d1 = pp.getDate1();
        List list = null;
        try {
            Session s = HibernateUtil.getSessionFactory().openSession();
            Transaction t = s.beginTransaction();
            SimpleDateFormat st = new SimpleDateFormat("dd-MM-yy");
            Date date = st.parse(d);
            Date date1 = st.parse(d1);

            String mix = pp.getMixingNumber();
            String issue = pp.getIssueNumber();
            int iss = 0;
            if (!issue.equals("All")) {
                iss = Integer.parseInt(issue);
            }

            if (mix.equals("All") || (mix.equals("-1") && issue.equals("-1"))) {
                Criteria c = s.createCriteria(ParentGdPrecleaning.class);
                c.add(Restrictions.between("date", date, date1));
                list = c.list();
                int id = 0;
                t.commit();
                s.close();
            } else if ((mix.equals("Mixing1") || mix.equals("Mixing2") || mix.equals("Mixing3")) && ((iss == 1) || (iss == 2) || (iss == 3)
                    || (iss == 4) || (iss == 5) || (iss == 6) || (iss == 7) || (iss == 8) || (iss == 9) || (iss == 10))) {
                Criteria c = s.createCriteria(ParentGdPrecleaning.class);
                c.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("mixingNumber", mix)).add(Restrictions.eq("issueNumber", iss));
                list = c.list();
            } else if ((mix.equals("Mixing1") || mix.equals("Mixing2") || mix.equals("Mixing3")) && (issue.equals("All"))) {
                Criteria c = s.createCriteria(ParentGdPrecleaning.class);
                c.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("mixingNumber", mix));
                list = c.list();
            } else if (mix.equals("Mixing1") || mix.equals("Mixing2") || mix.equals("Mixing3")) {
                Criteria c = s.createCriteria(ParentGdPrecleaning.class);
                c.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("mixingNumber", mix));
                list = c.list();
            } else if (issue.equals("All") || (mix.equals("-1") && issue.equals("-1"))) {
                Criteria c = s.createCriteria(ParentGdPrecleaning.class);
                c.add(Restrictions.between("date", date, date1));
                list = c.list();
                int id = 0;
                t.commit();
                s.close();
            } else {
                Criteria c = s.createCriteria(ParentGdPrecleaning.class);
                c.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("issueNumber", iss));
                list = c.list();
            }

        } catch (Exception e) {

        }
        System.out.println("11111111111111111111111111111111111111111111" + list);
        return list;

    }
}
