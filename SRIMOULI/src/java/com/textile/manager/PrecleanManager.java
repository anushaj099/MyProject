/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.manager;

import com.textile.dto.ptcleaningDto;
import com.textile.model.ChildGdPrecleaning;
import com.textile.model.FinancialYearBackup;
import com.textile.model.Login;
import com.textile.model.ParentGdPrecleaning;
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
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author ch.mounika
 */
public class PrecleanManager {

    public void insertProduction(ptcleaningDto ptp, String date, String superv, String mixingNumber, int issueNumber) throws ParseException {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();

        ParentGdPrecleaning pg = new ParentGdPrecleaning();
        String dat = date;
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
        Date date1 = sf.parse(dat);
        System.out.println("-------------date--------" + date1);
        pg.setDate(date1);
        pg.setSuperviser(superv);
        // pg.setShifts(shift);
        pg.setMixingNumber(mixingNumber);
        pg.setIssueNumber(issueNumber);
        pg.setTotalWeight(ptp.getTotalWeight());
        pg.setTotalMixing(ptp.getTotalMixing());
        pg.setTotalBales(ptp.getTotalTotalBales());
        System.out.println("886985j7knjdgklnnnnnnnnnnnnhsk;" + mixingNumber + issueNumber);
        s.save(pg);
        t.commit();

        Criteria c = s.createCriteria(ParentGdPrecleaning.class);
        pg = (ParentGdPrecleaning) c.add(Restrictions.eq("date", date1)).add(Restrictions.eq("superviser", superv)).add(Restrictions.eq("mixingNumber", mixingNumber)).add(Restrictions.eq("issueNumber", issueNumber)).uniqueResult();
        s.close();
        Session s1 = HibernateUtil.getSessionFactory().openSession();
        List<String> l1 = ptp.getVariety();
        List<Float> l2 = ptp.getWeight();
        List<Float> l3 = ptp.getMixing();
        List<Float> l4 = ptp.getTotalBales();
        System.out.println("OOOOOOOOOOOO" + l1 + "LLLLLLLL" + l2 + "OOOOOOOOO" + l3 + "TTTTTTTTTTT" + l4);
        Transaction t1 = s1.beginTransaction();
        for (int i = 0; i < l1.size(); i++) {
            ChildGdPrecleaning cg = new ChildGdPrecleaning();
            cg.setParentGdPrecleaning(pg);
            System.out.println("--------------------child--------------" + l1.get(i));
            cg.setVariety((l1.get(i)));
            cg.setWeight(l2.get(i));
            cg.setMixing(l3.get(i));
            cg.setTotalBales(l4.get(i));
            cg.setActualDate(date1);
            s1.save(cg);
            s1.flush();
            s1.clear();
        }
        t1.commit();
        s1.close();
    }

    public List productionList(ptcleaningDto ptp) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<Login> list = null;
        System.out.println("list is-------------" + ptp.getId());
        try {
            Criteria c = s.createCriteria(Login.class);
            c.add(Restrictions.eq("id", ptp.getId()));
            list = c.list();
        } catch (Exception e) {
            System.out.println(e);
        }
        System.out.println("list is:------->>>>" + list);
        return list;

    }

    public List productionList(int id) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<Login> list = null;
        System.out.println("list is-------------" + id);
        try {
            Criteria c = s.createCriteria(Login.class);
            c.add(Restrictions.eq("id", id));
            list = c.list();
        } catch (Exception e) {
            System.out.println(e);
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
            System.out.println(e);
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

    public List<ParentGdPrecleaning> displayProduction() {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();

        List l = null;
        try {
            Criteria c = s.createCriteria(ParentGdPrecleaning.class);
            //  c.add(Restrictions.eq("employeeId", employeeId));
            l = c.list();
            System.out.println("0000000000000000000000000000000" + l);
            t.commit();
        } catch (Exception e) {
            System.out.println(e);
        }
        System.out.println(l);
        return l;

    }

    public boolean productionInsVal(ptcleaningDto form) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        boolean p = false;
        try {
            String z = form.getShifts();
            System.out.println("lsflj-----" + z);
            List l = null;
            Criteria c = s.createCriteria(ParentGdPrecleaning.class);
            String sd = form.getDate();
            System.out.println("dfgj------------" + sd);
            SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yy");
            Date d1 = sf.parse(sd);
            c.add(Restrictions.eq("date", d1));
            l = c.list();
            for (Object o : l) {
                ParentGdPrecleaning pd = (ParentGdPrecleaning) o;
                if (pd.getShifts().equals(z)) {
                    p = true;
                }
                System.out.println("lghg-------" + p);
            }
        } catch (ParseException | HibernateException ep) {
            System.out.println("------drawing insert----validate---" + ep);
        }
        if (!p) {
            ParentGdPrecleaning pd = new ParentGdPrecleaning();
        }
        return p;
    }

    public List packingvallist(ptcleaningDto form) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List l = null;
        try {
            String sd = form.getDate();
            System.out.println("dfgj------------" + sd);
            SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yy");
            Date d1 = sf.parse(sd);

            ParentGdPrecleaning pc = new ParentGdPrecleaning();
            Criteria c = s.createCriteria(ParentGdPrecleaning.class);
            c.add(Restrictions.eq("date", d1));
            System.out.println("hhhhhhhhhhhhhh");
            l = c.list();
            System.out.println("sdfafdasdfsafaf" + l);
        } catch (ParseException | HibernateException e) {
            System.out.println(e);
        }
        t.commit();
        return l;
    }

    public List productionEdit(int id) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<ParentGdPrecleaning> l = null;
        try {
            ParentGdPrecleaning e = new ParentGdPrecleaning();
            Criteria c = s.createCriteria(ParentGdPrecleaning.class);
            c.add(Restrictions.eq("idpr", id)).uniqueResult();
            l = c.list();
            t.commit();
        } catch (HibernateException h) {
            System.out.println("HibernateException during Edit:" + h);
        } catch (Exception ex) {
            System.out.println("Exception during Edit:" + ex);
        } finally {
            s.close();
        }
        return l;
    }

    public void productionUpdate(ptcleaningDto ptp, int id1) throws ParseException {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        try {

            ParentGdPrecleaning pd = new ParentGdPrecleaning();
            pd = (ParentGdPrecleaning) s.get(ParentGdPrecleaning.class, id1);
            System.out.println("77777777777777777777777777777777" + pd);
            System.out.println("6666666666666666666666" + ptp.getId());
            String dat = ptp.getDate();
            SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yy");
            Date date1 = sf.parse(dat);
            System.out.println("-------------date--------" + dat);
            pd.setDate(date1);
            pd.setMixingNumber(ptp.getMixingNumber());
            pd.setIssueNumber(ptp.getIssueNumber());
            // pd.setShifts(ptp.getShifts());
            pd.setSuperviser(ptp.getSuperviser());
            pd.setTotalWeight(ptp.getTotalWeight());
            pd.setTotalMixing(ptp.getTotalMixing());
            pd.setTotalBales(ptp.getTotalTotalBales());
            s.update(pd);
            t.commit();

            Criteria c = s.createCriteria(ParentGdPrecleaning.class);
            pd = (ParentGdPrecleaning) c.add(Restrictions.eq("date", date1)).add(Restrictions.eq("superviser", ptp.getSuperviser())).add(Restrictions.eq("mixingNumber", ptp.getMixingNumber())).add(Restrictions.eq("issueNumber", ptp.getIssueNumber())).uniqueResult();
            s.close();

            Session s1 = HibernateUtil.getSessionFactory().openSession();
            Transaction t1 = s1.beginTransaction();
            List lis = null;
            Criteria c2 = s1.createCriteria(ChildGdPrecleaning.class);
            System.out.println("kjdgh----------------------dhg+++++++++++++++--------------child");
            lis = c2.add(Restrictions.eq("parentGdPrecleaning.idpr", id1)).list();
            if (lis != null) {
                System.out.println("kjdgh--------ggggggggggggggggggg--------------child");
                for (Object o : lis) {
                    System.out.println("kjdgh---------dhg+++++++++++++++");
                    ChildGdPrecleaning cq = (ChildGdPrecleaning) o;
                    s1.delete(cq);
                }
            }
            List<String> l1 = ptp.getVariety();
            List<Float> l2 = ptp.getWeight();
            List<Float> l3 = ptp.getMixing();
            List<Float> l4 = ptp.getTotalBales();
            for (int i = 0; i < l1.size(); i++) {
                ChildGdPrecleaning cd = new ChildGdPrecleaning();
                cd.setParentGdPrecleaning(pd);
                System.out.println("--------------------child--------------" + l1.get(i));
                cd.setVariety((l1.get(i)));
                cd.setWeight(l2.get(i));
                cd.setMixing(l3.get(i));
                cd.setTotalBales(l4.get(i));
                cd.setActualDate(date1);
                s1.save(cd);
                s1.flush();
                s1.clear();
            }
            t1.commit();
            s1.close();
        } catch (HibernateException he) {
            System.out.println("hibernate Exception Caught" + he);
        }
    }

    public List productionEdit1(int idpp) {
        Session s1 = HibernateUtil.getSessionFactory().openSession();
        Transaction t1 = s1.beginTransaction();
        List l1 = null;
        try {
            Criteria cr = s1.createCriteria(ChildGdPrecleaning.class);
            cr.add(Restrictions.eq("parentGdPrecleaning.idpr", idpp));
            l1 = cr.list();
            System.out.println("truiitewtewtewtewtewtewtewtewtewtewtewtewtewtewtewtewtewr" + l1);
            t1.commit();
        } catch (HibernateException h) {
            System.out.println("HibernateException during Edit:" + h);
        } catch (Exception ex) {
            System.out.println("Exception during Edit:" + ex);
        } finally {
            s1.close();
        }
        return l1;
    }

    public void productionDelete(int id1) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        try {
            Criteria c = s.createCriteria(ParentGdPrecleaning.class);
            ParentGdPrecleaning e = (ParentGdPrecleaning) c.add(Restrictions.eq("idpr", id1)).uniqueResult();
            s.delete(e);
            t.commit();
            System.out.println(" deleted successfully");
        } catch (HibernateException h) {
            System.out.println("HibernateException during deletion:" + h);
        } catch (Exception ex) {
            System.out.println("Exception during deletion:" + ex);
        } finally {
            s.close();
        }
    }

    public boolean check(ptcleaningDto gsd) throws ParseException {

        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        boolean succ = true;
        try {
            List<ParentGdPrecleaning> l = new ArrayList<>();

            String dd = gsd.getDate();
            SimpleDateFormat sf1 = new SimpleDateFormat("yyyy-MM-dd");
            Date doj1 = sf1.parse(dd);
            System.out.println("sjhfj999999999..,,,,,," + dd);
            Date oneDayBefore = new Date(doj1.getTime() - 2);
            System.out.println("shgtfjerhgt........++++++++=//////////............" + oneDayBefore);
            Criteria c = s.createCriteria(ParentGdPrecleaning.class);
            l = c.list();
            // c.add(Restrictions.eq("date",oneDayBefore));
            Date d = null;
            for (Object o : l) {
                ParentGdPrecleaning gd = (ParentGdPrecleaning) o;
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

    public boolean validateData(ptcleaningDto ptp) throws ParseException {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        Criteria c = s.createCriteria(ParentGdPrecleaning.class);
        String p = ptp.getDate();
        List l;
        boolean st = false;
        SimpleDateFormat sf1 = new SimpleDateFormat("yyyy-MM-dd");
        Date doj1 = sf1.parse(p);
        c.add(Restrictions.eq("date", doj1)).add(Restrictions.eq("superviser", ptp.getSuperviser()))
                .add(Restrictions.eq("mixingNumber", ptp.getMixingNumber())).add(Restrictions.eq("issueNumber", ptp.getIssueNumber()));
        l = c.list();
        System.out.println("kjdgh-------dgh\\---------" + l);
        if (l.size() > 0) {
            st = true;
        }
        t.commit();
        s.close();
        return st;
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
            Criteria c = s.createCriteria(ParentGdPrecleaning.class).setProjection(Projections.projectionList().add(Projections.max("date")));;
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

    public List getProductList() {
        Session s = HibernateUtil.getSessionFactory().openSession();
        List<String> p = new ArrayList<>();

        String sql = "select product_name from products_sample where partial_type like '%Issue to pre-cleaning%'";
        SQLQuery query = s.createSQLQuery(sql);
        p = query.list();
        System.out.println("products areeeeeeeeee" + p);
        return p;
    }
}
