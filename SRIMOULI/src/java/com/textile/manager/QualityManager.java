/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.manager;

import com.textile.dto.ParentQualityForm;
import com.textile.model.ChildQuality;
import com.textile.model.Counts;
import com.textile.model.FinancialYearBackup;
import com.textile.model.Login;
import com.textile.model.ParentQuality;
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
public class QualityManager {

    Session s = null;
    Session s1 = null;

    public void insertQuality(ParentQualityForm form, String date, String superv, String shift, int id2) {
        s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        try {
            ParentQuality p = new ParentQuality();
            System.out.println("\n vsvsvvvsvvsvvvvvvv" + id2);
            String d = date;
            SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yy");
            Date d1 = sf.parse(d);
            p.setDate(d1);
            p.setSuperViser(superv);
            p.setShifts(shift);

            System.out.println("\n vsvsvvvsvvsvvvvvvv" + d1 + "" + form.getSuperViser() + "" + form.getShifts());
            s.save(p);
            t.commit();

            ParentQuality p1 = new ParentQuality();
            Criteria c1 = s.createCriteria(ParentQuality.class);
            p1 = (ParentQuality) c1.add(Restrictions.eq("date", d1)).add(Restrictions.eq("superViser", superv)).add(Restrictions.eq("shifts", shift)).uniqueResult();
            s.close();
            int id = p1.getIdq();
            System.out.println("\n vvvvvvvvvvvvv" + id + "...........32131100000------" + p1.getIdq());
            Session s1 = HibernateUtil.getSessionFactory().openSession();
            Transaction t1 = s1.beginTransaction();
            List<String> l = form.getMachines();
            List<Integer> l1 = form.getCount();

            List<Float> l2 = form.getCountmaintained();
            System.out.println("maintainnnnnnnnnnnnnnn" + l2);
            List<Float> l3 = form.getCsp();
            List<Float> l4 = form.getCv();
            List<Float> l5 = form.getStrengthCv();
            List<Float> l6 = form.getMinus50EveryDay();
            List<Float> l7 = form.getPlus50EveryDay();
            List<Float> l8 = form.getPlus280everyDay();
            List<Float> l9 = form.getIpi();
            List<String> l10 = form.getRemarks();

            System.out.println("dddddddate id" + d1);
            for (int i = 0; i < l.size(); i++) {
                System.out.println("000000000000-------------------->" + l2.get(i) + "................" + l1.get(i));
                ChildQuality c = new ChildQuality();
                System.out.println("11111++++++++++++.........--------------------->" + c);
                c.setParentQuality(p1);
                System.out.println("11111.........--------------------->" + p1);
                c.setMachines(l.get(i));
                System.out.println("11111222222.........--------------------->" + l.get(i));
                c.setCount(l1.get(i));
                System.out.println("111112222223333333.........--------------------->" + l1.get(i));
                c.setCountmaintained(l2.get(i));
                System.out.println("11111222222.44444444444444........--------------------->" + l2.get(i));
                c.setCsp(l3.get(i));
                System.out.println("11111222222..555555555555.......--------------------->" + l3.get(i));
                c.setCv(l4.get(i));
                System.out.println("11111222222..666666666666.......--------------------->" + l4.get(i));
                c.setStrengthCv(l5.get(i));
                System.out.println("11111222222.77777777777........--------------------->" + l5.get(i));
                c.setMinus50EveryDay(l6.get(i));
                System.out.println("11111222222.8888888888........--------------------->" + l6.get(i));
                c.setPlus50EveryDay(l7.get(i));
                System.out.println("11111222222.999999999........--------------------->" + l7.get(i));
                c.setPlus280everyDay(l8.get(i));
                System.out.println("11111222222..1010101010**.......--------------------->" + l8.get(i));
                c.setIpi(l9.get(i));
                System.out.println("11111222222...////////////......--------------------->" + l9.get(i));
                c.setRemarks(l10.get(i));
                System.out.println("11111222222....**************.....--------------------->" + l10.get(i));
                c.setActualDate(d1);
                System.out.println("11111222222.???????????........--------------------->" + d1);

                s1.save(c);
                s1.flush();
                s1.clear();
                System.out.println("-----.................----->" + l.get(i) + "" + l1.get(i));
            }

            t1.commit();
            s1.close();

            System.out.println("\n Quality Inserted Successfully");
        } catch (HibernateException h) {
            System.out.println("Hibernate Exception during insertion" + h);
            h.printStackTrace();
        } catch (Exception e) {
            System.out.println("Exception during insertion..................." + e);
            e.printStackTrace();
        } finally {
            //s.close();
        }
    }

    public ParentQualityForm updateQuality(ParentQualityForm form) {
        s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        try {
            ParentQuality p = new ParentQuality();

            String d = form.getDate();
            SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yy");
            Date d1 = sf.parse(d);
            p.setDate(d1);
            String q = form.getSuperViser();
            int id = form.getIdq();
            p.setSuperViser(q);
            String sh = form.getShifts();
            p.setShifts(sh);
            p.setIdq(id);
            System.out.println("\n vsvsvvvsvvsvvvvvvv" + d1 + "" + form.getSuperViser() + "" + form.getShifts());
            s.update(p);
            ParentQuality p1 = new ParentQuality();
            Criteria c1 = s.createCriteria(ParentQuality.class);
            p1 = (ParentQuality) c1.add(Restrictions.eq("date", d1)).add(Restrictions.eq("superViser", q)).add(Restrictions.eq("shifts", sh)).uniqueResult();
            t.commit();
            s.close();

            Session s1 = HibernateUtil.getSessionFactory().openSession();
            Transaction t1 = s1.beginTransaction();

            List lis = null;

            Criteria c2 = s1.createCriteria(ChildQuality.class);
            lis = c2.add(Restrictions.eq("parentQuality.idq", id)).list();
            if (lis != null) {
                for (Object o : lis) {
                    System.out.println("kjdgh---------dhg+++++++++++++++");
                    ChildQuality cq = (ChildQuality) o;
                    s1.delete(cq);
                }

            }

            System.out.println("\n vvvvvvvvvvvvv" + id);

            List<String> l = form.getMachines();
            List<Integer> l1 = form.getCount();

            List<Float> l2 = form.getCountmaintained();
            List<Float> l3 = form.getCsp();
            List<Float> l4 = form.getCv();
            List<Float> l5 = form.getStrengthCv();
            List<Float> l6 = form.getMinus50EveryDay();
            List<Float> l7 = form.getPlus50EveryDay();
            List<Float> l8 = form.getPlus280everyDay();
            List<Float> l9 = form.getIpi();
            List<String> l10 = form.getRemarks();

            ChildQuality c = new ChildQuality();

            System.out.println("dddddddate id" + d1);
            for (int i = 0; i < l.size(); i++) {

                c.setParentQuality(p);
                c.setMachines(l.get(i));
                c.setCount(l1.get(i));
                c.setCountmaintained(l2.get(i));
                c.setCsp(l3.get(i));
                c.setCv(l4.get(i));
                c.setStrengthCv(l5.get(i));
                c.setMinus50EveryDay(l6.get(i));
                c.setPlus50EveryDay(l7.get(i));
                c.setPlus280everyDay(l8.get(i));
                c.setIpi(l9.get(i));
                c.setRemarks(l10.get(i));

                s1.save(c);
                s1.flush();
                s1.clear();
                System.out.println("---------->" + l.get(i) + "" + l1.get(i));
            }

            t1.commit();
            s1.close();

            System.out.println("\n Quality Updated Successfully");
        } catch (HibernateException h) {
            System.out.println("Hibernate Exception during Updation" + h);
            h.printStackTrace();
        } catch (Exception e) {
            System.out.println("Exception during Updation" + e);
            e.printStackTrace();
        } finally {
            //s.close();
        }
        return form;
    }

    public List getSuperviser() {
        s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<String> dept = new ArrayList<>();
        List<Superviser> l = (List<Superviser>) s.createCriteria(Superviser.class).list();
        for (Superviser d : l) {
            dept.add(d.getName());
        }
        System.out.println(dept);
        return dept;
    }

    public boolean validEmp(ParentQualityForm l) throws ParseException {
        s = HibernateUtil.getSessionFactory().openSession();
        ParentQuality p = new ParentQuality();
        Transaction t = s.beginTransaction();
        List<ParentQuality> list = new ArrayList();
        String name = l.getSuperViser();
        String date = l.getDate();
        SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yy");
        Date d = sf.parse(date);
        String shifts = l.getShifts();
        try {
            /* String sql = "from ParentDrawing l where l.employeeId=:empId and l.date=:d and l.shifts=:shifts";
            Query query = s.createQuery(sql);
            query.setParameter("employeeId",empId);
            query.setParameter("date", d);
            query.setParameter("shifts", shifts);*/
            Criteria c1 = s.createCriteria(ParentQuality.class);
            c1.add(Restrictions.eq("date", d)).add(Restrictions.eq("superViser", name)).add(Restrictions.eq("shifts", shifts));
            System.out.println("\n bbbbbbbbbbbbbb" + name + d + shifts);
            list = c1.list();
            System.out.println("\n kkkkkkkkkkkkkkkkkk" + list);
            //List<ParentDrawing> list = query.list();
            if (list.size() > 0) {
                s.close();
                return true;
            }
            t.commit();
        } catch (HibernateException h) {
            System.out.println("HibernateException during Searching:" + h);
            h.printStackTrace();
        } catch (Exception ex) {
            System.out.println("Exception during Searching:" + ex);
        } finally {
            // s.close();
        }

        return false;

    }

    public boolean qualityInsVal(ParentQualityForm form) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        boolean p = false;
        try {
            String z = form.getShifts();
            System.out.println("lsflj-----" + z);
            List l = null;
            Criteria c = s.createCriteria(ParentQuality.class);
            String sd = form.getDate();
            System.out.println("dfgj------------" + sd);
            SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yy");
            Date d1 = sf.parse(sd);
            c.add(Restrictions.eq("date", d1));
            l = c.list();
            for (Object o : l) {
                ParentQuality pd = (ParentQuality) o;
                if (pd.getShifts().equals(z)) {
                    p = true;
                }
                System.out.println("lghg-------" + p);
            }
        } catch (Exception ep) {
            System.out.println("------drawing insert----validate---" + ep);
        }
        if (!p) {
            ParentQuality pd = new ParentQuality();
        }
        return p;
    }

    public List qualityList1(ParentQualityForm form) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        String quality = "quality";
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

    public List qualityList(int id) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        String quality = "quality";
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

    public List count() {
        s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<String> dept = new ArrayList<>();
        List<Counts> l = (List<Counts>) s.createCriteria(Counts.class).list();
        for (Counts d : l) {
            dept.add(d.getCount());
        }
        return dept;
    }

    public List qualityList1(int id) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        //   String quality="quality";
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

    public List packingvallist(ParentQualityForm form) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List l = null;
        try {
            String sd = form.getDate();
            System.out.println("dfgj------------" + sd);
            SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yy");
            Date d1 = sf.parse(sd);

            ParentQuality pc = new ParentQuality();
            Criteria c = s.createCriteria(ParentQuality.class);
            c.add(Restrictions.eq("date", d1));
            System.out.println("hhhhhhhhhhhhhh");
            l = c.list();
            System.out.println("sdfafdasdfsafaf" + l);
        } catch (Exception e) {

        }
        t.commit();
        return l;
    }

    public List<ParentQuality> display() {
       Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();

        List<ParentQuality> glist = null;
        try {
            Criteria c = s.createCriteria(ParentQuality.class);
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

    public List<ChildQuality> displayChild(int id1) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();

        List<ChildQuality> glist1 = null;
        try {
            Criteria c = s.createCriteria(ChildQuality.class);
            c.add(Restrictions.eq("parentQuality.idq", id1));
            //c.add(Restrictions.eq("parentQuality.id", id));
            glist1 = c.list();
            System.out.println("dfhgkhg-------------dkg" + glist1);

            t.commit();
        } catch (Exception e) {
            System.out.println(e);
        }
        System.out.println(glist1);
        return glist1;
    }

    public List<String> getCounts1() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        List<String> et = new ArrayList<>();
        List<Counts> l = (List<Counts>) session.createCriteria(Counts.class).list();
        for (Counts e : l) {
            et.add(e.getCount());
        }
        return et;
    }

    public List<ParentQualityForm> editQuality(int id1) {
        s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List l = null;
        try {
            Criteria cr = s.createCriteria(ParentQuality.class);
            cr.add(Restrictions.eq("idq", id1)).uniqueResult();
            l = cr.list();
            System.out.println("dfhgkhg-------------dkg" + l);
        } catch (Exception e) {
            System.out.println("\n bbbbbbbbbbbbbbbbbbbb" + l + id1);
        }
        return l;
    }

    public void deletequality(int id) {
        s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        try {

            ParentQuality pq = new ParentQuality();
            Criteria cr = s.createCriteria(ParentQuality.class);
            pq = (ParentQuality) cr.add(Restrictions.eq("idq", id)).uniqueResult();
            s.delete(pq);
            t.commit();
            System.out.println("/n deleted successfully");

        } catch (HibernateException he) {
            System.out.println("hibernate exception caught during delete" + he);

        } catch (Exception e) {
            System.out.println("Exception during delete is caught" + e);
        }

    }

    public boolean check(ParentQualityForm form) throws ParseException {

        System.out.println("......................******************..");
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        boolean succ = true;
        try {
            List<ParentQuality> l = new ArrayList<>();

            String dd = form.getDate();
            SimpleDateFormat sf1 = new SimpleDateFormat("dd-MM-yy");
            Date doj1 = sf1.parse(dd);
            System.out.println("sjhfj999999999..,,,,,," + dd);
            Date oneDayBefore = new Date(doj1.getTime() - 2);
            System.out.println("shgtfjerhgt........++++++++=//////////............" + oneDayBefore);
            Criteria c = s.createCriteria(ParentQuality.class);
            l = c.list();
            // c.add(Restrictions.eq("date",oneDayBefore));
            Date d = null;
            for (Object o : l) {
                ParentQuality gd = (ParentQuality) o;
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
            Criteria c = s.createCriteria(ParentQuality.class).setProjection(Projections.projectionList().add(Projections.max("date")));;
            l = c.list();
            System.out.println("//////////////" + l);
            for (int i = 0; i < l.size(); i++) {
                d = l.get(i);
                dd = d;
            }

        } catch (Exception e) {

        }
        System.out.println(">>>>>>>>>>>>>>>>" + l2);
        System.out.println("<<<<<<<<<<<<<<<<" + l2.size());
        return l2;
    }
      public boolean qualityData(ParentQualityForm form) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
       
        try {
            String z = form.getShifts();
            String qad=form.getSuperViser();
            String shifts=form.getShifts();
            
            System.out.println("lsflj-----" + z+"oooooooooo"+qad+"ppppp"+shifts);
            List l = null;
            Criteria c = s.createCriteria(ParentQuality.class);
            String sd = form.getDate();
            System.out.println("dfgj------------" + sd);
            SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yy");
            Date d1 = sf.parse(sd);
            c.add(Restrictions.eq("date", d1)).add(Restrictions.eq("superViser", qad)).add(Restrictions.eq("shifts", shifts));
            l = c.list();
           if(l.isEmpty()) {
               return true;
           }
        } catch (Exception ep) {
            System.out.println("------drawing insert----validate---" + ep);
        }
       
        return false;
    }

}
