/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.manager;

import com.textile.dto.ParentDrawingForm;
import com.textile.model.ChildDrawing;
import com.textile.model.Employee;
import com.textile.model.FinancialYearBackup;
import com.textile.model.Login;
import com.textile.model.ParentDrawing;
import com.textile.model.Superviser;
import com.textile.util.HibernateUtil;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author NSG
 */
public class DrawingManager {

    Session s = null;

    public ParentDrawingForm drawingInsert(ParentDrawingForm form, String date, String superv, String shift) {
        s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        try {
            ParentDrawing p = new ParentDrawing();

            String d = date;
            SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yy");
            Date d1 = sf.parse(d);
            p.setDate(d1);
            p.setSuperviser(superv);
            p.setShifts(shift);
            p.setTotalAp(form.getTotalAp());
            p.setTotalEp(form.getTotalEp());
            p.setTotalEfficiency(form.getTotalEfficiency());
            s.save(p);
            t.commit();

            ParentDrawing p1 = new ParentDrawing();
            Criteria c1 = s.createCriteria(ParentDrawing.class);
            p1 = (ParentDrawing) c1.add(Restrictions.eq("date", d1)).add(Restrictions.eq("superviser", superv)).add(Restrictions.eq("shifts", shift)).uniqueResult();
            int id = p1.getIdd();
            System.out.println("\n vvvvvvvvvvvvv" + id);
            s.close();

            Session s1 = HibernateUtil.getSessionFactory().openSession();
            List<String> l1 = form.getCarding();
            List<Float> l2 = form.getDeliveryHank();
            List<Float> l3 = form.getMcSpeed();
            List<Float> l4 = form.getMcRunning();
            List<Float> l5 = form.getExpectedProduction();
            List<Float> l6 = form.getActualProduction();
            List<Float> l7 = form.getEfficiency();
            List<String> l8 = form.getBreakedInShifts();
            List<String> l9 = form.getRemarks();
            List<Integer> l10 = form.getEmpId();
            Transaction t1 = s1.beginTransaction();
            for (int i = 0; i < l1.size(); i++) {
                ChildDrawing cc = new ChildDrawing();
                cc.setParentDrawing(p1);
                cc.setCarding((l1.get(i)));
                cc.setDeliveryHank(l2.get(i));
                cc.setMcSpeed(l3.get(i));
                cc.setMcRunning(l4.get(i));
                cc.setExpectedProduction(l5.get(i));
                cc.setActualProduction(l6.get(i));
                cc.setEfficiency(l7.get(i));
                cc.setBreakedInShifts(l8.get(i));
                cc.setRemarks(l9.get(i));
                cc.setEmpId(l10.get(i));
                s1.save(cc);
                s1.flush();
                s1.clear();
                System.out.println("---------->" + l2.get(i));
            }
            t1.commit();
            s1.close();

            System.out.println("\n Inserted Successfully ");
        } catch (HibernateException h) {
            System.out.println("Hibernate Exception during insertion" + h);
            h.printStackTrace();
        } catch (Exception e) {
            System.out.println("Exception during insertion" + e);
            e.printStackTrace();
        } finally {
            //s.close();
        }
        return form;
    }

    public List getEmployees() {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<Integer> dept = new ArrayList<>();
        List<Employee> l = (List<Employee>) s.createCriteria(Employee.class).list();
        for (Employee d : l) {
            dept.add(d.getEmpId());
        }
        return dept;
    }

    public List drawingList(ParentDrawingForm form) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        String drawing = "drawing";
        List<Login> list = null;
        System.out.println("list is-------------" + form.getId());
        try {
            Criteria c = s.createCriteria(Login.class);
            c.add(Restrictions.eq("id", form.getId()));
            list = c.list();
        } catch (Exception e) {

        }
        System.out.println("list is:------->>>>" + list);
        return list;

    }

    public List drawingList(int id) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        String drawing = "drawing";
        List<Login> list = null;
        System.out.println("list is-------------" + id);
        try {
            Criteria c = s.createCriteria(Login.class);
            c.add(Restrictions.eq("id", id));
            list = c.list();
        } catch (Exception e) {

        }
        System.out.println("list is:------->>>>" + list);
        return list;

    }

    public List drawingList1(int id) {
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

    public boolean drawingInsVal(ParentDrawingForm form) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        boolean p = false;
        try {
            String z = form.getShifts();
            System.out.println("lsflj-----" + z);
            List l = null;
            Criteria c = s.createCriteria(ParentDrawing.class);
            String sd = form.getDate();
            System.out.println("dfgj------------" + sd);
            SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yy");
            Date d1 = sf.parse(sd);
            c.add(Restrictions.eq("date", d1));
            l = c.list();
            for (Object o : l) {
                ParentDrawing pd = (ParentDrawing) o;
                if (pd.getShifts().equals(z)) {
                    p = true;
                }
                System.out.println("lghg-------" + p);
            }
        } catch (Exception ep) {
            System.out.println("------drawing insert----validate---" + ep);
        }
        if (!p) {
            ParentDrawing pd = new ParentDrawing();
        }
        return p;
    }

    public List<ParentDrawingForm> displayDrawing() {
        s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List l = null;
        try {
            Criteria cr = s.createCriteria(ParentDrawing.class);
            //cr.add(Restrictions.eq("id",id));   
            l = cr.list();
            t.commit();
            System.out.println("\n displayed successsfully");
        } catch (HibernateException h) {
            System.out.println("Hibernate Exception during display" + h);
        } catch (Exception ex) {
            System.out.println("Exception during display" + ex);
        } finally {
            s.close();
        }
        System.out.println("List in drawing is;;;;;;;;;;;;;" + l);
        return l;
    }

    public List<ParentDrawingForm> pdrawingEdit(int id1) {
        s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<ParentDrawingForm> l = null;
        try {
            ParentDrawing gm = new ParentDrawing();
            Criteria cr = s.createCriteria(ParentDrawing.class);
            cr.add(Restrictions.eq("idd", id1)).uniqueResult();
            l = cr.list();
        } catch (HibernateException h) {
            System.out.println("Hibernate Exception during edit" + h);
        } catch (Exception e) {
            System.out.println("Exception during edit" + e);
        } finally {
            s.close();
        }
        return l;

    }

    public List<ChildDrawing> cdrawingEdit(int id1) {
        s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<ChildDrawing> l = null;
        try {
            ChildDrawing gm = new ChildDrawing();
            Criteria cr = s.createCriteria(ChildDrawing.class);
            cr.add(Restrictions.eq("parentDrawing.idd", id1));
            l = cr.list();
        } catch (HibernateException h) {
            System.out.println("Hibernate Exception during edit" + h);
        } catch (Exception e) {
            System.out.println("Exception during edit" + e);
        } finally {
            s.close();
        }
        return l;

    }

    public void drawingUpdate(ParentDrawingForm form, int idd) throws ParseException {
        s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();

        try {

            System.out.println("\n ddddddddddddd" + form.getIdd());
            ParentDrawing p = (ParentDrawing) s.get(ParentDrawing.class, idd);

            String d = form.getDate();
            SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yy");
            Date d1 = sf.parse(d);
            //  p.setIdd(form.getIdd());
            p.setDate(d1);
            p.setSuperviser(form.getSuperviser());

            System.out.println("\n mmmmmmmmmmmmmmmmmm" + form.getSuperviser());
            p.setShifts(form.getShifts());
            p.setTotalAp(form.getTotalAp());
            p.setTotalEp(form.getTotalEp());
            p.setTotalEfficiency(form.getTotalEfficiency());
            s.update(p);

            System.out.println("\n dddddddddbbbbbb" + form.getId() + form.getDate() + form.getSuperviser() + form.getShifts());

            ParentDrawing p1 = new ParentDrawing();
            Criteria c1 = s.createCriteria(ParentDrawing.class);
            p1 = (ParentDrawing) c1.add(Restrictions.eq("date", d1)).add(Restrictions.eq("superviser", form.getSuperviser())).add(Restrictions.eq("shifts", form.getShifts())).uniqueResult();
            t.commit();
            s.close();

            Session s1 = HibernateUtil.getSessionFactory().openSession();
            Transaction t1 = s1.beginTransaction();
            List lis = null;

            Criteria c2 = s1.createCriteria(ChildDrawing.class);
            System.out.println("kjdgh----------------------dhg+++++++++++++++--------------child");
            lis = c2.add(Restrictions.eq("parentDrawing.idd", idd)).list();
            if (lis != null) {
                System.out.println("kjdgh--------ggggggggggggggggggg--------------child");
                for (Object o : lis) {
                    System.out.println("kjdgh---------dhg+++++++++++++++");
                    ChildDrawing cq = (ChildDrawing) o;
                    s1.delete(cq);
                }

            }
            List<String> l1 = form.getCarding();
            List<Float> l2 = form.getDeliveryHank();
            List<Float> l3 = form.getMcSpeed();
            List<Float> l4 = form.getMcRunning();
            List<Float> l5 = form.getExpectedProduction();
            List<Float> l6 = form.getActualProduction();
            List<Float> l7 = form.getEfficiency();
            List<String> l8 = form.getBreakedInShifts();
            List<String> l9 = form.getRemarks();
            List<Integer> l10 = form.getEmpId();

            for (int i = 0; i < l1.size(); i++) {
                ChildDrawing cc = new ChildDrawing();
                cc.setParentDrawing(p1);

                cc.setCarding((l1.get(i)));
                cc.setDeliveryHank(l2.get(i));
                cc.setMcSpeed(l3.get(i));
                cc.setMcRunning(l4.get(i));
                cc.setExpectedProduction(l5.get(i));
                cc.setActualProduction(l6.get(i));
                cc.setEfficiency(l7.get(i));
                cc.setBreakedInShifts(l8.get(i));
                cc.setRemarks(l9.get(i));
                cc.setEmpId(l10.get(i));
                s1.save(cc);
                s1.flush();
                s1.clear();

                System.out.println("---------->" + l2.get(i));
            }
            t1.commit();
            s1.close();

            System.out.println("\n updated Successfully ");
        } catch (HibernateException h) {
            System.out.println("Hibernate Exception during insertion" + h);
            h.printStackTrace();
        } catch (Exception e) {
            System.out.println("Exception during insertion" + e);
            e.printStackTrace();
        } finally {
            //s.close();
        }

    }

    public void drawingDelete(int id1) {
        s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        try {
            ParentDrawing g = new ParentDrawing();
            Criteria cr = s.createCriteria(ParentDrawing.class);
            g = (ParentDrawing) cr.add(Restrictions.eq("idd", id1)).uniqueResult();
            s.delete(g);
            t.commit();
            System.out.println("\n deleted successfully");
        } catch (HibernateException h) {
            System.out.println("Hibernate Exception during deletion" + h);
        } catch (Exception e) {
            System.out.println("Exception during deletion" + e);
        } finally {
            s.close();
        }
    }

    public List drawingvallist(ParentDrawingForm form) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List l = null;
        try {
            String sd = form.getDate();
            System.out.println("dfgj------------" + sd);
            SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yy");
            Date d1 = sf.parse(sd);

            ParentDrawing pc = new ParentDrawing();
            Criteria c = s.createCriteria(ParentDrawing.class);
            c.add(Restrictions.eq("date", d1));
            System.out.println("hhhhhhhhhhhhhh");
            l = c.list();
            System.out.println("sdfafdasdfsafaf" + l);
        } catch (Exception e) {

        }
        t.commit();
        return l;
    }

    public boolean check(ParentDrawingForm gsd) throws ParseException {

        System.out.println("......................******************..");
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        boolean succ = true;
        try {
            List<ParentDrawing> l = new ArrayList<>();

            String dd = gsd.getDate();
            SimpleDateFormat sf1 = new SimpleDateFormat("dd-MM-yy");
            Date doj1 = sf1.parse(dd);
            System.out.println("sjhfj999999999..,,,,,," + dd);
            Date oneDayBefore = new Date(doj1.getTime() - 2);
            System.out.println("shgtfjerhgt........++++++++=//////////............" + oneDayBefore);
            Criteria c = s.createCriteria(ParentDrawing.class);
            l = c.list();
            // c.add(Restrictions.eq("date",oneDayBefore));
            Date d = null;
            for (Object o : l) {
                ParentDrawing gd = (ParentDrawing) o;
                d = gd.getDate();
            }
            Calendar cal = Calendar.getInstance();
            cal.setTime(d);
            cal.add(Calendar.DATE, 1);
            Date dt = cal.getTime();
            System.out.println("..............date..................." + dt);
            if (dt.getTime() == doj1.getTime() || d.getTime() == doj1.getTime()) {
                succ = true;
            } else {
                succ = false;
            }
        } catch (NullPointerException p) {
            System.out.println("............. in purchase ....." + p);
        }
        t.commit();
        s.close();
        System.out.println("........................" + succ);
        return succ;

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
            Criteria c = s.createCriteria(ParentDrawing.class).setProjection(Projections.projectionList().add(Projections.max("date")));;
            l = c.list();
            System.out.println("//////////////" + l);
            for (int i = 0; i < l.size(); i++) {
                d = l.get(i);
                dd = d;
            }

            Criteria c1 = s.createCriteria(ParentDrawing.class).add(Restrictions.eq("date", d));
            l1 = c1.list();
            for (Object o : l1) {
                ParentDrawing p = (ParentDrawing) o;
                String s1 = p.getShifts();
                l2.add(s1);
            }
        } catch (Exception e) {

        }
        System.out.println(">>>>>>>>>>>>>>>>" + l2);
        System.out.println("<<<<<<<<<<<<<<<<" + l2.size());
        return l2;
    }

}
