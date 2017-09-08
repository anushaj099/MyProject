/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.manager;

import com.textile.dto.QualityRtve;
import com.textile.model.ChildQuality;
import com.textile.model.Login;
import com.textile.model.ParentQuality;
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
import org.hibernate.criterion.Projections;

import org.hibernate.criterion.Restrictions;

/**
 *
 * @author ch.mounika
 */
public class QualityRtveManager {

    Session s = null;

    public List RetriveQlty(QualityRtve qlt) throws ParseException {

        List<ParentQuality> list = new ArrayList<>();
        List<ChildQuality> list1 = new ArrayList<>();

        String superName = qlt.getSuperName();
        System.out.println("--------------------------->");
        String shifts = qlt.getShifts();
        System.out.println("--------------------------->" + shifts);
        String d = qlt.getDate();
        String d1 = qlt.getDate1();
        String mctype = qlt.getMctype();
        String[] ect = mctype.split(", ");
        String a1 = ect[0];
        //     String a2=ect[1];
        //    System.out.println("LLLLLLLLLLLLLLL"+a1+a2);
        int size = ect.length;
        String a3 = "M/C-1", a4 = "M/C-2", a5 = "M/C-3", a6 = "M/C-4", a7 = "M/C-5", a8 = "M/C-6";
        String b3 = "Sample1", b4 = "Sample2", b5 = "Sample3", b6 = "Sample4", b7 = "Sample5", b8 = "Sample6";

        System.out.println("----->>>>-------->>>>-------->>>------>");
        System.out.println("@@@@@@@@@@@@@" + a1);
        try {
            Session s = HibernateUtil.getSessionFactory().openSession();
            Transaction t = s.beginTransaction();
            SimpleDateFormat st = new SimpleDateFormat("dd-MM-yy");
            Date date = st.parse(d);
            Date date1 = st.parse(d1);
            System.out.println("-----------8548---------------->" + date);

            Criteria c = s.createCriteria(ParentQuality.class);
            c.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("shifts", shifts));
            //c.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("superViser",superName)).add(Restrictions.eq("shifts", shifts));
            list = c.list();
            System.out.println("--------iiiiiiiiiiiiiiiiii-->" + list + superName);
            int id = 0;

            t.commit();
            s.close();

            Session s1 = HibernateUtil.getSessionFactory().openSession();
            Transaction t1 = s1.beginTransaction();
            for (Object o : list) {
                List l = null, l1 = null;
                ParentQuality pq = (ParentQuality) o;
                id = pq.getIdq();
                System.out.println("888888888888888888888" + id);

                if (shifts.equals("M/C Testing")) {
                    if (a1.equals(a3) || a1.equals(a4) || a1.equals(a5) || a1.equals(a6) || a1.equals(a7) || a1.equals(a8)) {
                        System.out.println("&&&&&&&&&&&&&&&&&&");
                        Criteria c1 = s1.createCriteria(ChildQuality.class);
                        c1.add(Restrictions.eq("parentQuality.idq", id)).add(Restrictions.eq("machines", a1));
                        l = c1.list();
                        System.out.println(">>>>>>>>>>>>>>>>>>>>>>>" + l);
                    }
                }
                if (shifts.equals("Samples")) {
                    System.out.println("______________________entered");
                    if (a1.equals(b3) || a1.equals(b4) || a1.equals(b5) || a1.equals(b6) || a1.equals(b7) || a1.equals(b8)) {
                        System.out.println("&&&&&&&&&&&&&&&&&&");
                        Criteria c1 = s1.createCriteria(ChildQuality.class);
                        c1.add(Restrictions.eq("parentQuality.idq", id)).add(Restrictions.eq("machines", a1));
                        l = c1.list();
                        System.out.println("<<<<<<<<<<<<<<<<<<<" + l);
                    }
                }

                System.out.println("--------------------fhfgh-------------fgh");
                list1.addAll(l);
                System.out.println("svvvvvvvvsssssscccccccccccc'''''''''''''''" + id + "------------------" + list1);
                s1.flush();
                s1.clear();
            }
            System.out.println("dsjfg-------------------" + list1);
            t1.commit();
            //}
        } catch (Exception e) {

        }
        System.out.println("list is" + list1);
        return list1;
    }

    public List RetriveQlty2(QualityRtve qlt) throws ParseException {

        List<ParentQuality> list = new ArrayList<>();
        List<ChildQuality> list1 = new ArrayList<>();

        String superName = qlt.getSuperName();
        System.out.println("--------------------------->" + superName);
        String shifts = qlt.getShifts();
        System.out.println("--------------------------->" + shifts);
        String d = qlt.getDate();
        String d1 = qlt.getDate1();
        String mctype = qlt.getMctype();
        String[] ect = mctype.split(", ");
        String a1 = ect[1];
        String a3 = "M/C-1", a4 = "M/C-2", a5 = "M/C-3", a6 = "M/C-4", a7 = "M/C-5", a8 = "M/C-6";
        String b3 = "Sample1", b4 = "Sample2", b5 = "Sample3", b6 = "Sample4", b7 = "Sample5", b8 = "Sample6";
        //System.out.println("--------------------------->"+dor);
        try {
            Session s = HibernateUtil.getSessionFactory().openSession();
            Transaction t = s.beginTransaction();
            SimpleDateFormat st = new SimpleDateFormat("dd-MM-yy");
            Date date = st.parse(d);
            Date date1 = st.parse(d1);
            System.out.println("-----------8548---------------->" + date);

            Criteria c = s.createCriteria(ParentQuality.class);
            c.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("shifts", shifts));
            //c.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("superViser",superName)).add(Restrictions.eq("shifts", shifts));
            list = c.list();
            System.out.println("----------------------11111--->" + list + superName);
            int id = 0;

            t.commit();
            s.close();

            Session s1 = HibernateUtil.getSessionFactory().openSession();
            Transaction t1 = s1.beginTransaction();
            for (Object o : list) {
                List l = null;
                ParentQuality pq = (ParentQuality) o;
                id = pq.getIdq();
                System.out.println("222222222222222jjjjjjjj" + id);
                if (shifts.equals("M/C Testing")) {
                    if (a1.equals(a3) || a1.equals(a4) || a1.equals(a5) || a1.equals(a6) || a1.equals(a7) || a1.equals(a8)) {
                        System.out.println("&&&&&&&&&&&&&&&&&&");
                        Criteria c1 = s1.createCriteria(ChildQuality.class);
                        c1.add(Restrictions.eq("parentQuality.idq", id)).add(Restrictions.eq("machines", a1));
                        l = c1.list();
                        System.out.println(">>>>>>>>>>>>>>>>>>>>>>>" + l);
                    }
                }
                if (shifts.equals("Samples")) {
                    System.out.println("______________________entered");
                    if (a1.equals(b3) || a1.equals(b4) || a1.equals(b5) || a1.equals(b6) || a1.equals(b7) || a1.equals(b8)) {
                        System.out.println("&&&&&&&&&&&&&&&&&&");
                        Criteria c1 = s1.createCriteria(ChildQuality.class);
                        c1.add(Restrictions.eq("parentQuality.idq", id)).add(Restrictions.eq("machines", a1));
                        l = c1.list();
                        System.out.println("<<<<<<<<<<<<<<<<<<<" + l);
                    }
                }

                list1.addAll(l);
                System.out.println("svvvvvvvvvvvvvvvvvvvvv'''''''''''''''" + id + "------------------" + list1);
                s1.flush();
                s1.clear();
            }
            System.out.println("dsjfg-------------------" + list1);
            t1.commit();
            //}
        } catch (Exception e) {

        }

        System.out.println("list is" + list1);
        return list1;
    }

    public List RetriveQlty3(QualityRtve qlt) throws ParseException {

        List<ParentQuality> list = new ArrayList<>();
        List<ChildQuality> list1 = new ArrayList<>();

        String superName = qlt.getSuperName();
        System.out.println("--------------------------->" + superName);
        String shifts = qlt.getShifts();
        System.out.println("--------------------------->" + shifts);
        String d = qlt.getDate();
        String d1 = qlt.getDate1();
        String mctype = qlt.getMctype();
        String[] ect = mctype.split(", ");
        String a1 = ect[2];
        String a3 = "M/C-1", a4 = "M/C-2", a5 = "M/C-3", a6 = "M/C-4", a7 = "M/C-5", a8 = "M/C-6";
        String b3 = "Sample1", b4 = "Sample2", b5 = "Sample3", b6 = "Sample4", b7 = "Sample5", b8 = "Sample6";
        //System.out.println("--------------------------->"+dor);
        try {
            Session s = HibernateUtil.getSessionFactory().openSession();
            Transaction t = s.beginTransaction();
            SimpleDateFormat st = new SimpleDateFormat("dd-MM-yy");
            Date date = st.parse(d);
            Date date1 = st.parse(d1);
            System.out.println("-----------8548---------------->" + date);

            Criteria c = s.createCriteria(ParentQuality.class);
            c.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("shifts", shifts));
            //c.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("superViser",superName)).add(Restrictions.eq("shifts", shifts));
            list = c.list();
            System.out.println("----------------------11111--->" + list + superName);
            int id = 0;

            t.commit();
            s.close();

            Session s1 = HibernateUtil.getSessionFactory().openSession();
            Transaction t1 = s1.beginTransaction();
            for (Object o : list) {
                List l = null;
                ParentQuality pq = (ParentQuality) o;
                id = pq.getIdq();
                System.out.println("222222222222222jjjjjjjj" + id);
                if (shifts.equals("M/C Testing")) {
                    if (a1.equals(a3) || a1.equals(a4) || a1.equals(a5) || a1.equals(a6) || a1.equals(a7) || a1.equals(a8)) {
                        System.out.println("&&&&&&&&&&&&&&&&&&");
                        Criteria c1 = s1.createCriteria(ChildQuality.class);
                        c1.add(Restrictions.eq("parentQuality.idq", id)).add(Restrictions.eq("machines", a1));
                        l = c1.list();
                        System.out.println(">>>>>>>>>>>>>>>>>>>>>>>" + l);
                    }
                }
                if (shifts.equals("Samples")) {
                    System.out.println("______________________entered");
                    if (a1.equals(b3) || a1.equals(b4) || a1.equals(b5) || a1.equals(b6) || a1.equals(b7) || a1.equals(b8)) {
                        System.out.println("&&&&&&&&&&&&&&&&&&");
                        Criteria c1 = s1.createCriteria(ChildQuality.class);
                        c1.add(Restrictions.eq("parentQuality.idq", id)).add(Restrictions.eq("machines", a1));
                        l = c1.list();
                        System.out.println("<<<<<<<<<<<<<<<<<<<" + l);
                    }
                }
                list1.addAll(l);
                System.out.println("svvvvvvvvvvvvvvvvvvvvv'''''''''''''''" + id + "------------------" + list1);
                s1.flush();
                s1.clear();
            }
            System.out.println("dsjfg-------------------" + list1);
            t1.commit();
            //}
        } catch (Exception e) {

        }

        System.out.println("list is" + list1);
        return list1;
    }

    public List RetriveQlty4(QualityRtve qlt) throws ParseException {

        List<ParentQuality> list = new ArrayList<>();
        List<ChildQuality> list1 = new ArrayList<>();

        String superName = qlt.getSuperName();
        System.out.println("--------------------------->" + superName);
        String shifts = qlt.getShifts();
        System.out.println("--------------------------->" + shifts);
        String d = qlt.getDate();
        String d1 = qlt.getDate1();
        String mctype = qlt.getMctype();
        String[] ect = mctype.split(", ");
        String a1 = ect[3];
        String a3 = "M/C-1", a4 = "M/C-2", a5 = "M/C-3", a6 = "M/C-4", a7 = "M/C-5", a8 = "M/C-6";
        String b3 = "Sample1", b4 = "Sample2", b5 = "Sample3", b6 = "Sample4", b7 = "Sample5", b8 = "Sample6";
        //System.out.println("--------------------------->"+dor);
        try {
            Session s = HibernateUtil.getSessionFactory().openSession();
            Transaction t = s.beginTransaction();
            SimpleDateFormat st = new SimpleDateFormat("dd-MM-yy");
            Date date = st.parse(d);
            Date date1 = st.parse(d1);
            System.out.println("-----------8548---------------->" + date);

            Criteria c = s.createCriteria(ParentQuality.class);
            c.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("shifts", shifts));
            //c.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("superViser",superName)).add(Restrictions.eq("shifts", shifts));
            list = c.list();
            System.out.println("----------------------11111--->" + list + superName);
            int id = 0;

            t.commit();
            s.close();

            Session s1 = HibernateUtil.getSessionFactory().openSession();
            Transaction t1 = s1.beginTransaction();
            for (Object o : list) {
                List l = null;
                ParentQuality pq = (ParentQuality) o;
                id = pq.getIdq();
                System.out.println("222222222222222jjjjjjjj" + id);
                if (shifts.equals("M/C Testing")) {
                    if (a1.equals(a3) || a1.equals(a4) || a1.equals(a5) || a1.equals(a6) || a1.equals(a7) || a1.equals(a8)) {
                        System.out.println("&&&&&&&&&&&&&&&&&&");
                        Criteria c1 = s1.createCriteria(ChildQuality.class);
                        c1.add(Restrictions.eq("parentQuality.idq", id)).add(Restrictions.eq("machines", a1));
                        l = c1.list();
                        System.out.println(">>>>>>>>>>>>>>>>>>>>>>>" + l);
                    }
                }
                if (shifts.equals("Samples")) {
                    System.out.println("______________________entered");
                    if (a1.equals(b3) || a1.equals(b4) || a1.equals(b5) || a1.equals(b6) || a1.equals(b7) || a1.equals(b8)) {
                        System.out.println("&&&&&&&&&&&&&&&&&&");
                        Criteria c1 = s1.createCriteria(ChildQuality.class);
                        c1.add(Restrictions.eq("parentQuality.idq", id)).add(Restrictions.eq("machines", a1));
                        l = c1.list();
                        System.out.println("<<<<<<<<<<<<<<<<<<<" + l);
                    }
                }
                list1.addAll(l);
                System.out.println("svvvvvvvvvvvvvvvvvvvvv'''''''''''''''" + id + "------------------" + list1);
                s1.flush();
                s1.clear();
            }
            System.out.println("dsjfg-------------------" + list1);
            t1.commit();
            //}
        } catch (Exception e) {

        }

        System.out.println("list is" + list1);
        return list1;
    }

    public List RetriveQlty5(QualityRtve qlt) throws ParseException {

        List<ParentQuality> list = new ArrayList<>();
        List<ChildQuality> list1 = new ArrayList<>();

        String superName = qlt.getSuperName();
        System.out.println("--------------------------->" + superName);
        String shifts = qlt.getShifts();
        System.out.println("--------------------------->" + shifts);
        String d = qlt.getDate();
        String d1 = qlt.getDate1();
        String mctype = qlt.getMctype();
        String[] ect = mctype.split(", ");
        String a1 = ect[4];
        String a3 = "M/C-1", a4 = "M/C-2", a5 = "M/C-3", a6 = "M/C-4", a7 = "M/C-5", a8 = "M/C-6";
        String b3 = "Sample1", b4 = "Sample2", b5 = "Sample3", b6 = "Sample4", b7 = "Sample5", b8 = "Sample6";
        //System.out.println("--------------------------->"+dor);
        try {
            Session s = HibernateUtil.getSessionFactory().openSession();
            Transaction t = s.beginTransaction();
            SimpleDateFormat st = new SimpleDateFormat("dd-MM-yy");
            Date date = st.parse(d);
            Date date1 = st.parse(d1);
            System.out.println("-----------8548---------------->" + date);

            Criteria c = s.createCriteria(ParentQuality.class);
            c.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("shifts", shifts));
            //c.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("superViser",superName)).add(Restrictions.eq("shifts", shifts));
            list = c.list();
            System.out.println("----------------------11111--->" + list + superName);
            int id = 0;

            t.commit();
            s.close();

            Session s1 = HibernateUtil.getSessionFactory().openSession();
            Transaction t1 = s1.beginTransaction();
            for (Object o : list) {
                List l = null;
                ParentQuality pq = (ParentQuality) o;
                id = pq.getIdq();
                System.out.println("222222222222222jjjjjjjj" + id);
                if (shifts.equals("M/C Testing")) {
                    if (a1.equals(a3) || a1.equals(a4) || a1.equals(a5) || a1.equals(a6) || a1.equals(a7) || a1.equals(a8)) {
                        System.out.println("&&&&&&&&&&&&&&&&&&");
                        Criteria c1 = s1.createCriteria(ChildQuality.class);
                        c1.add(Restrictions.eq("parentQuality.idq", id)).add(Restrictions.eq("machines", a1));
                        l = c1.list();
                        System.out.println(">>>>>>>>>>>>>>>>>>>>>>>" + l);
                    }
                }
                if (shifts.equals("Samples")) {
                    System.out.println("______________________entered");
                    if (a1.equals(b3) || a1.equals(b4) || a1.equals(b5) || a1.equals(b6) || a1.equals(b7) || a1.equals(b8)) {
                        System.out.println("&&&&&&&&&&&&&&&&&&");
                        Criteria c1 = s1.createCriteria(ChildQuality.class);
                        c1.add(Restrictions.eq("parentQuality.idq", id)).add(Restrictions.eq("machines", a1));
                        l = c1.list();
                        System.out.println("<<<<<<<<<<<<<<<<<<<" + l);
                    }
                }
                list1.addAll(l);
                System.out.println("svvvvvvvvvvvvvvvvvvvvv'''''''''''''''" + id + "------------------" + list1);
                s1.flush();
                s1.clear();
            }
            System.out.println("dsjfg-------------------" + list1);
            t1.commit();
            //}
        } catch (Exception e) {

        }

        System.out.println("list is" + list1);
        return list1;
    }

    public List RetriveQlty6(QualityRtve qlt) throws ParseException {

        List<ParentQuality> list = new ArrayList<>();
        List<ChildQuality> list1 = new ArrayList<>();

        String superName = qlt.getSuperName();
        System.out.println("--------------------------->" + superName);
        String shifts = qlt.getShifts();
        System.out.println("--------------------------->" + shifts);
        String d = qlt.getDate();
        String d1 = qlt.getDate1();
        String mctype = qlt.getMctype();
        String[] ect = mctype.split(", ");
        String a1 = ect[5];
        String a3 = "M/C-1", a4 = "M/C-2", a5 = "M/C-3", a6 = "M/C-4", a7 = "M/C-5", a8 = "M/C-6";
        String b3 = "Sample1", b4 = "Sample2", b5 = "Sample3", b6 = "Sample4", b7 = "Sample5", b8 = "Sample6";
        //System.out.println("--------------------------->"+dor);
        try {
            Session s = HibernateUtil.getSessionFactory().openSession();
            Transaction t = s.beginTransaction();
            SimpleDateFormat st = new SimpleDateFormat("dd-MM-yy");
            Date date = st.parse(d);
            Date date1 = st.parse(d1);
            System.out.println("-----------8548---------------->" + date);

            Criteria c = s.createCriteria(ParentQuality.class);
            c.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("shifts", shifts));
            //c.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("superViser",superName)).add(Restrictions.eq("shifts", shifts));
            list = c.list();
            System.out.println("----------------------11111--->" + list + superName);
            int id = 0;

            t.commit();
            s.close();

            Session s1 = HibernateUtil.getSessionFactory().openSession();
            Transaction t1 = s1.beginTransaction();
            for (Object o : list) {
                List l = null;
                ParentQuality pq = (ParentQuality) o;
                id = pq.getIdq();
                System.out.println("222222222222222jjjjjjjj" + id);
                if (shifts.equals("M/C Testing")) {
                    if (a1.equals(a3) || a1.equals(a4) || a1.equals(a5) || a1.equals(a6) || a1.equals(a7) || a1.equals(a8)) {
                        System.out.println("&&&&&&&&&&&&&&&&&&");
                        Criteria c1 = s1.createCriteria(ChildQuality.class);
                        c1.add(Restrictions.eq("parentQuality.idq", id)).add(Restrictions.eq("machines", a1));
                        l = c1.list();
                        System.out.println(">>>>>>>>>>>>>>>>>>>>>>>" + l);
                    }
                }
                if (shifts.equals("Samples")) {
                    System.out.println("______________________entered");
                    if (a1.equals(b3) || a1.equals(b4) || a1.equals(b5) || a1.equals(b6) || a1.equals(b7) || a1.equals(b8)) {
                        System.out.println("&&&&&&&&&&&&&&&&&&");
                        Criteria c1 = s1.createCriteria(ChildQuality.class);
                        c1.add(Restrictions.eq("parentQuality.idq", id)).add(Restrictions.eq("machines", a1));
                        l = c1.list();
                        System.out.println("<<<<<<<<<<<<<<<<<<<" + l);
                    }
                }
                list1.addAll(l);
                System.out.println("svvvvvvvvvvvvvvvvvvvvv'''''''''''''''" + id + "------------------" + list1);
                s1.flush();
                s1.clear();
            }
            System.out.println("dsjfg-------------------" + list1);
            t1.commit();
            //}
        } catch (Exception e) {

        }

        System.out.println("list is" + list1);
        return list1;
    }

    public List<String> getSuperviser() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        List<String> dept = new ArrayList<>();
        List<Superviser> l = (List<Superviser>) session.createCriteria(Superviser.class).list();
        for (Superviser d : l) {
            dept.add(d.getName());
        }
        return dept;
    }

    public List qualityList(QualityRtve qlt) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        String quality = "quality";
        List<Login> list = null;
        try {
            Criteria c = s.createCriteria(Login.class);
            c.add(Restrictions.eq("id", qlt.getId()));
            list = c.list();
        } catch (Exception e) {

        }
        System.out.println("list is:------->>>>" + list);
        return list;
    }

    public List qualityList1(int id) {
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

    public List<ParentQuality> RetriveQltyPar(QualityRtve qlt) throws ParseException {

        List<ParentQuality> list = new ArrayList<>();
        String superName = qlt.getSuperName();
        System.out.println("--------------------------->" + superName);
        String shifts = qlt.getShifts();
        System.out.println("--------------------------->" + shifts);
        String d = qlt.getDate();
        String d1 = qlt.getDate1();
        //System.out.println("--------------------------->"+dor);
        try {
            Session s = HibernateUtil.getSessionFactory().openSession();
            Transaction t = s.beginTransaction();
            SimpleDateFormat st = new SimpleDateFormat("dd-MM-yy");
            Date date = st.parse(d);
            Date date1 = st.parse(d1);
            System.out.println("-----------8548---------------->" + date);

            Criteria c = s.createCriteria(ParentQuality.class);
            c.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("shifts", shifts));
            //c.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("superViser",superName)).add(Restrictions.eq("shifts", shifts));
            list = c.list();
            System.out.println("-------------.......---------11111--->" + list + superName);

            t.commit();
            s.close();
        } catch (NullPointerException n) {
            System.out.println("sfj---------------------------->" + n);
        }
        return list;
    }

    public List qualityrtt() {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        System.out.println("&&&&&&&&&&&&&&&");
        List l = new ArrayList();
        try {
            Criteria c = s.createCriteria(ChildQuality.class).add(Restrictions.eq("parentQuality.idq", 1)).setProjection(Projections.projectionList().add(Projections.property("mc1Cm")));
            l = c.list();
            System.out.println("List is ############" + l);
        } catch (Exception e) {

        }
        return l;
    }
}
