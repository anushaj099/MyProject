/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.manager;

import com.textile.dto.OeHomeDto;
import com.textile.model.ChildOpenend;
import com.textile.model.Counts;
import com.textile.model.Employee;
import com.textile.model.Login;
import com.textile.model.ParentOpenend;
import com.textile.model.Superviser;
import com.textile.util.HibernateUtil;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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
public class OeHomeManager {

    public void insertOe(OeHomeDto oe, String date, String superv, String shift) throws ParseException {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();

        ParentOpenend po = new ParentOpenend();
        System.out.println("dddddddddddddddddd" + date);
        String doj = date;
        SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yy");
        Date date1 = sf.parse(date);
        System.out.println("-------------date--------" + date);
        po.setDate(date1);
        po.setSuperviser(superv);
        po.setShifts(shift);
        po.setTotalEp(oe.getTotalEp());
        po.setTotalAp(oe.getTotalAp());
        po.setTotalEfcy(oe.getTotalEfcy());
        // po.setTotalBreakeges(oe.getTotalBkg());
        po.setTotalHpEfcy(oe.getTotalHpEfcy());

        s.save(po);
        t.commit();

        Criteria c = s.createCriteria(ParentOpenend.class);
        po = (ParentOpenend) c.add(Restrictions.eq("superviser", superv)).add(Restrictions.eq("shifts", shift)).add(Restrictions.eq("date", date1)).uniqueResult();
        s.close();

        Session s1 = HibernateUtil.getSessionFactory().openSession();
        // System.out.println("-------pc---------->"+pc);
        List<String> l1 = oe.getOpenEnd();
        //  System.out.println("----------------+-------->"+l1);
        List<Integer> l2 = oe.getCount();
        //  System.out.println("-------------------09------------->"+l2);
        List<Float> l3 = oe.getCountMaintain();
        //   System.out.println("-------------------09-46------------>"+l3);
        List<Double> l4 = oe.getMcSpeed();
        List<Float> l5 = oe.getTm();
        List<Double> l6 = oe.getMcRunning();
        List<Float> l7 = oe.getExpectedProduction();
        List<Float> l8 = oe.getActualProduction();
        List<Float> l9 = oe.getEfficiency();
        List<String> l10 = oe.getBreakeges();
        List<Float> l11 = oe.getHundredPercentEfcy();
        List<String> l12 = oe.getRemarks();
        List<Integer> l13 = oe.getEmpId();

        Transaction t1 = s1.beginTransaction();
        for (int i = 0; i < l1.size(); i++) {
            ChildOpenend co = new ChildOpenend();
            co.setParentOpenend(po);
            System.out.println("--------------------child--------------" + l1.get(i));
            co.setOpenEnd(l1.get(i));
            co.setCount(l2.get(i));
            co.setCountMaintain(l3.get(i));
            co.setMcSpeed(l4.get(i));
            co.setTm(l5.get(i));
            co.setMcRunning(l6.get(i));
            co.setExpectedProduction(l7.get(i));
            co.setActualProduction(l8.get(i));
            co.setEfficiency(l9.get(i));
            co.setBreakeges(l10.get(i));
            co.setActualDate(date1);
            co.setHundredPercentEfcy(l11.get(i));
            System.out.println("1111111111111111111111111111111" + l11.get(i));
            co.setRemarks(l12.get(i));
            co.setEmpId(l13.get(i));
            s1.save(co);
            s1.flush();
            s1.clear();
            System.out.println("---------->" + l2.get(i));

        }
        t1.commit();
        s1.close();

    }

    public boolean check(OeHomeDto gsd) throws ParseException {
        System.out.println("......................******************..");
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        boolean succ = true;
        try {
            List<ParentOpenend> l = new ArrayList<>();

            String dd = gsd.getDate();
            SimpleDateFormat sf1 = new SimpleDateFormat("dd-MM-yy");
            Date doj1 = sf1.parse(dd);
            System.out.println("sjhfj999999999..,,,,,," + dd);
            Date oneDayBefore = new Date(doj1.getTime() - 2);
            System.out.println("shgtfjerhgt........++++++++=//////////............" + oneDayBefore);
            Criteria c = s.createCriteria(ParentOpenend.class);
            l = c.list();
            // c.add(Restrictions.eq("date",oneDayBefore));
            Date d = null;
            for (Object o : l) {
                ParentOpenend gd = (ParentOpenend) o;
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

    public List openendList(OeHomeDto oe) {

        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        String openend = "openend";
        List<Login> list = null;
        System.out.println("list is-------------" + oe.getId());
        try {
            Criteria c = s.createCriteria(Login.class);
            c.add(Restrictions.eq("id", oe.getId()));
            list = c.list();
        } catch (Exception e) {

        }
        System.out.println("list is:------->>>>" + list);
        return list;

    }

    public List<ParentOpenend> display() {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();

        List<ParentOpenend> glist = null;
        try {
            Criteria c = s.createCriteria(ParentOpenend.class);
            //c.add(Restrictions.eq("employeeId", employeeId));
            glist = c.list();
            System.out.println("list is" + glist);
            t.commit();
        } catch (Exception e) {
            System.out.println(e);
        }
        System.out.println(glist);
        return glist;
    }

    public List oevallist(OeHomeDto form) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List l = null;
        try {
            String sd = form.getDate();
            System.out.println("dfgj------------" + sd);
            SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yy");
            Date d1 = sf.parse(sd);

            ParentOpenend pc = new ParentOpenend();
            Criteria c = s.createCriteria(ParentOpenend.class);
            c.add(Restrictions.eq("date", d1));
            System.out.println("hhhhhhhhhhhhhh");
            l = c.list();
            System.out.println("sdfafdasdfsafaf" + l);
        } catch (Exception e) {

        }
        t.commit();
        return l;
    }

    public List<ChildOpenend> displayChild(int id1) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();

        List<ChildOpenend> glist = null;

        try {
            Criteria c = s.createCriteria(ChildOpenend.class);
            c.add(Restrictions.eq("parentOpenend.ido", id1));
            //c.add(Restrictions.eq("parentQuality.id", id));
            glist = c.list();
            System.out.println("dfhgkhg-------------dkg" + glist);

            t.commit();
        } catch (Exception e) {
            System.out.println(e);
        }
        System.out.println(glist);
        return glist;
    }

    public List<ParentOpenend> editOpenend(int id1) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List l = null;
        try {
            Criteria cr = s.createCriteria(ParentOpenend.class);
            cr.add(Restrictions.eq("ido", id1)).uniqueResult();
            l = cr.list();
            System.out.println("dfhgkhg-------------dkg" + l);
        } catch (Exception e) {
            System.out.println("\n bbbbbbbbbbbbbbbbbbbb" + l + id1);
        }
        return l;
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

    public OeHomeDto updateOpenend(OeHomeDto form) throws ParseException {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        ParentOpenend p = new ParentOpenend();
        String shifts = form.getShifts();
        int id = form.getIdo();
        float te = form.getTotalEp();
        float ta = form.getTotalAp();
        float tefy = form.getTotalEfcy();
        float th = form.getTotalHpEfcy();

        String date = form.getDate();
        SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yy");
        Date d = sf.parse(date);
        String sname = form.getSuperviser();
        try {
            p.setShifts(shifts);
            p.setSuperviser(sname);
            p.setIdo(id);
            p.setDate(d);
            p.setTotalEp(te);
            p.setTotalAp(ta);
            p.setTotalEfcy(tefy);
            
            p.setTotalHpEfcy(th);
            s.update(p);

            ParentOpenend p1 = new ParentOpenend();
            Criteria c1 = s.createCriteria(ParentOpenend.class);
            p1 = (ParentOpenend) c1.add(Restrictions.eq("date", d)).add(Restrictions.eq("superviser", sname)).add(Restrictions.eq("shifts", shifts)).uniqueResult();
            System.out.println("kjdgh-------32131321--dhg+++++++++++++++");
            t.commit();
            s.close();

            Session s1 = HibernateUtil.getSessionFactory().openSession();
            Transaction t1 = s1.beginTransaction();

            List lis = null;

            Criteria c2 = s1.createCriteria(ChildOpenend.class);
            lis = c2.add(Restrictions.eq("parentOpenend.ido", id)).list();
            if (lis != null) {
                for (Object o : lis) {
                    System.out.println("kjdgh---------dhg+++++++++++++++");
                    ChildOpenend cq = (ChildOpenend) o;
                    s1.delete(cq);
                }

            }

            System.out.println("kjdgh---------dhg+++++54787897++++++++++");

            List<String> l1 = form.getOpenEnd();

            List<Integer> l2 = form.getCount();

            List<Float> l3 = form.getCountMaintain();

            List<Double> l4 = form.getMcSpeed();
            List<Float> l5 = form.getTm();
            List<Double> l6 = form.getMcRunning();
            List<Float> l7 = form.getExpectedProduction();
            List<Float> l8 = form.getActualProduction();
            List<Float> l9 = form.getEfficiency();
            List<String> l10 = form.getBreakeges();
            List<Float> l11 = form.getHundredPercentEfcy();
            List<String> l12 = form.getRemarks();
            List<Integer> l13 = form.getEmpId();
            //  Transaction t1=s1.beginTransaction();
            for (int i = 0; i < l1.size(); i++) {
                ChildOpenend c = new ChildOpenend();

                //c.setParentOpenend(p);
                System.out.println("--------------------child--------------" + l1.get(i));
                c.setParentOpenend(p1);
                c.setOpenEnd(l1.get(i));
                c.setCount(l2.get(i));
                c.setCountMaintain(l3.get(i));
                c.setMcSpeed(l4.get(i));
                c.setTm(l5.get(i));
                c.setMcRunning(l6.get(i));
                c.setExpectedProduction(l7.get(i));
                c.setActualProduction(l8.get(i));
                c.setEfficiency(l9.get(i));
                c.setBreakeges(l10.get(i));
                c.setHundredPercentEfcy(l11.get(i));
                System.out.println("tttttttttttttttttttttttttttttt" + l11.get(i));
                c.setRemarks(l12.get(i));
                c.setEmpId(l13.get(i));
                c.setActualDate(d);
                s1.save(c);
                System.out.println("iiiiiiiiiii" + c);
                s1.flush();
                s1.clear();
                // System.out.println("---------->"+l.get(i) +""+l1.get(i));
            }
            t1.commit();
            s1.close();

            System.out.println("\n Quality Inserted Successfully");

        } catch (Exception e) {
            System.out.println(e);
        }
        return form;
    }

    public void deleteOe(int ido) throws ParseException {

        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        try {
            //ParentOpenend e=new ParentOpenend();

            ParentOpenend e = (ParentOpenend) s.get(ParentOpenend.class, ido);
            // Criteria c=s.createCriteria(ParentOpenend.class);
            // e=(ParentOpenend) c.add(Restrictions.eq("parentOpenend.id",id1)).uniqueResult();
            System.out.println("ehgrtfeyfgrgghruh---====" + ido);
            s.delete(e);
            t.commit();
            System.out.println("\n deleted successfully");
        } catch (Exception h) {
            System.out.println("HibernateException during deletion:" + h);
            s.close();
        }

    }

    public boolean openendInsVal(OeHomeDto form) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        boolean p = false;
        try {
            String z = form.getShifts();
            System.out.println("lsflj-----" + z);
            List l = null;
            Criteria c = s.createCriteria(ParentOpenend.class);
            String sd = form.getDate();
            System.out.println("dfgj------------" + sd);
            SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yy");
            Date d1 = sf.parse(sd);
            c.add(Restrictions.eq("date", d1));
            l = c.list();
            for (Object o : l) {
                ParentOpenend pd = (ParentOpenend) o;
                if (pd.getShifts().equals(z)) {
                    p = true;
                }
                System.out.println("lghg-------" + p);
            }
        } catch (Exception ep) {
            System.out.println("------drawing insert----validate---" + ep);
        }
        if (!p) {
            ParentOpenend pd = new ParentOpenend();
        }
        return p;
    }

    public List openendList(int id) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        String openend = "openend";
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

    public List getCounts() {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<String> dept = new ArrayList<>();
        List<Counts> l = (List<Counts>) s.createCriteria(Counts.class).list();
        for (Counts d : l) {
            dept.add(d.getCount());
        }
        System.out.println("111111111111111111111ashdgfvashdfhggrtfure" + dept);

        return dept;
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
            Criteria c = s.createCriteria(ParentOpenend.class).setProjection(Projections.projectionList().add(Projections.max("date")));;
            l = c.list();
            System.out.println("//////////////" + l);
            for (int i = 0; i < l.size(); i++) {
                d = l.get(i);
                dd = d;
            }

            Criteria c1 = s.createCriteria(ParentOpenend.class).add(Restrictions.eq("date", d));
            l1 = c1.list();
            for (Object o : l1) {
                ParentOpenend p = (ParentOpenend) o;
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
