/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.manager;

import com.textile.dto.WastageDto;
import com.textile.model.ChildGdWastage;
import com.textile.model.FinancialYearBackup;
import com.textile.model.Login;
import com.textile.model.ParentGdWastage;
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
public class WastageManager {

    public void insertWastage(WastageDto ptp, String date, String receipt) throws ParseException {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();

        ParentGdWastage pg = new ParentGdWastage();
        String dat = date;
        SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yy");
        Date date1 = sf.parse(dat);
        System.out.println("-------------date--------" + date1);
        pg.setDate(date1);
        pg.setReceiptNo(receipt);
        System.out.println("886985j7knjdgklnnnnn======nnnnnnnhsk;" + receipt);
        pg.setTotalWeight(ptp.getTotalWeight());
        pg.setTotalBales(ptp.getTotalBales());

        s.save(pg);
        t.commit();

        Criteria c = s.createCriteria(ParentGdWastage.class);
        pg = (ParentGdWastage) c.add(Restrictions.eq("date", date1)).add(Restrictions.eq("receiptNo", receipt)).uniqueResult();
        s.close();
        Session s1 = HibernateUtil.getSessionFactory().openSession();
        List<String> l1 = ptp.getVariety();
        List<Float> l2 = ptp.getWeight();
        List<Float> l3 = ptp.getNoofBales();
        Transaction t1 = s1.beginTransaction();
        for (int i = 0; i < l1.size(); i++) {
            ChildGdWastage cg = new ChildGdWastage();
            cg.setParentGdWastage(pg);
            System.out.println("--------------------child--------------" + l1.get(i));
            cg.setVariety((l1.get(i)));
            cg.setWeight(l2.get(i));
            cg.setNumberofBales(l3.get(i));
            cg.setActDate(date1);
            s1.save(cg);
            s1.flush();
            s1.clear();
        }
        t1.commit();
        s1.close();
    }

    public List wastageList(WastageDto ptp) {
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

    public List wastageList(int id1) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        String wastage = "wastage";
        List<Login> list = null;
        System.out.println("list is-------------" + id1);
        try {
            Criteria c = s.createCriteria(Login.class);
            c.add(Restrictions.eq("id", id1));
            list = c.list();
        } catch (Exception e) {
            System.out.println(e);
        }
        System.out.println("list is:------->>>>" + list);
        return list;

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
            Criteria c = s.createCriteria(ParentGdWastage.class).setProjection(Projections.projectionList().add(Projections.max("date")));;
            l = c.list();
            System.out.println("//////////////" + l);
            for (int i = 0; i < l.size(); i++) {
                d = l.get(i);
                dd = d;
            }

//            Criteria c1=s.createCriteria(ParentGdWastage.class).add(Restrictions.eq("date",d));
//            l1=c1.list();
//            for(Object o: l1) {
//                ParentGdWastage p=(ParentGdWastage) o;
//                String s1=p.getShifts();
//                l2.add(s1);
//            }
        } catch (Exception e) {

        }
        System.out.println(">>>>>>>>>>>>>>>>" + l2);
        System.out.println("<<<<<<<<<<<<<<<<" + l2.size());
        return l2;
    }

    public boolean check(WastageDto gsd) throws ParseException {

        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        boolean succ = true;
        try {
            List<ParentGdWastage> l = new ArrayList<>();

            String dd = gsd.getDate();
            SimpleDateFormat sf1 = new SimpleDateFormat("dd-MM-yy");
            Date doj1 = sf1.parse(dd);
            System.out.println("sjhfj999999999..,,,,,," + dd);
            Date oneDayBefore = new Date(doj1.getTime() - 2);
            System.out.println("shgtfjerhgt........++++++++=//////////............" + oneDayBefore);
            Criteria c = s.createCriteria(ParentGdWastage.class);
            l = c.list();
            // c.add(Restrictions.eq("date",oneDayBefore));
            Date d = null;
            for (Object o : l) {
                ParentGdWastage gd = (ParentGdWastage) o;
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

    public boolean validateData(WastageDto ptp) throws ParseException {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        Criteria c = s.createCriteria(ParentGdWastage.class);
        String p = ptp.getDate();
        List l;
        boolean st = false;
        SimpleDateFormat sf1 = new SimpleDateFormat("dd-MM-yy");
        Date doj1 = sf1.parse(p);
        c.add(Restrictions.eq("date", doj1)).add(Restrictions.eq("receiptNo", ptp.getReceipt()));
        l = c.list();
        System.out.println("kjdgh-------dgh\\---------" + l);
        if (l.size() > 0) {
            st = true;
        }
        t.commit();
        s.close();
        return st;
    }

    public List<WastageDto> displayWastage() {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();

        List l = null;
        try {
            Criteria c = s.createCriteria(ParentGdWastage.class);
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

    public void deletewastage(int id) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        try {

            ParentGdWastage pq = new ParentGdWastage();
            Criteria cr = s.createCriteria(ParentGdWastage.class);
            pq = (ParentGdWastage) cr.add(Restrictions.eq("idw", id)).uniqueResult();
            s.delete(pq);
            t.commit();
            System.out.println("/n deleted successfully");

        } catch (HibernateException he) {
            System.out.println("hibernate exception caught during delete" + he);

        } catch (Exception e) {
            System.out.println("Exception during delete is caught" + e);
        }

    }

    public List editWastage(int id1) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<ParentGdWastage> l = null;
        try {
            ParentGdWastage e = new ParentGdWastage();
            Criteria c = s.createCriteria(ParentGdWastage.class);
            c.add(Restrictions.eq("idw", id1)).uniqueResult();
            l = c.list();
            t.commit();
        } catch (HibernateException h) {
            System.out.println("HibernateException during Edit:" + h);
            h.printStackTrace();
        } catch (Exception ex) {
            System.out.println("Exception during Edit:" + ex);
            ex.printStackTrace();
        } finally {
            s.close();
        }
        return l;
    }

    public List editWastage1(int idw) {
        Session s1 = HibernateUtil.getSessionFactory().openSession();
        Transaction t1 = s1.beginTransaction();
        List l1 = null;
        try {
            Criteria cr = s1.createCriteria(ChildGdWastage.class);
            cr.add(Restrictions.eq("parentGdWastage.idw", idw));
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

    public List getProductList() {
        Session s = HibernateUtil.getSessionFactory().openSession();
        List<String> p = new ArrayList<>();
        String sql = "select product_name from products_sample where partial_type like '%Wastage%'";
        SQLQuery query = s.createSQLQuery(sql);
        p = query.list();
        System.out.println("products areeeeeeeeee" + p);
        return p;
    }

    public void updateWastage(WastageDto form, int id1) throws ParseException {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        try {
            ParentGdWastage pg = new ParentGdWastage();
            pg = (ParentGdWastage) s.get(ParentGdWastage.class, id1);
            SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yy");
            Date date1 = sf.parse(form.getDate());
            System.out.println("-------------date--------" + date1);
            pg.setDate(date1);
            pg.setReceiptNo(form.getReceipt());
            System.out.println("886985j7knjdgklnnnnn======nnnnnnnhsk;" + form.getReceipt());
            pg.setTotalWeight(form.getTotalWeight());
            pg.setTotalBales(form.getTotalBales());
            s.update(pg);
            t.commit();

            Criteria c = s.createCriteria(ParentGdWastage.class);
            pg = (ParentGdWastage) c.add(Restrictions.eq("date", date1)).add(Restrictions.eq("receiptNo", form.getReceipt())).uniqueResult();
            s.close();

            Session s1 = HibernateUtil.getSessionFactory().openSession();
            Transaction t1 = s1.beginTransaction();
            List lis = null;
            Criteria c2 = s1.createCriteria(ChildGdWastage.class);
            System.out.println("kjdgh----------------------dhg+++++++++++++++--------------child");
            lis = c2.add(Restrictions.eq("parentGdWastage.idw", id1)).list();
            if (lis != null) {
                System.out.println("kjdgh--------ggggggggggggggggggg--------------child");
                for (Object o : lis) {
                    System.out.println("kjdgh---------dhg+++++++++++++++");
                    ChildGdWastage cq = (ChildGdWastage) o;
                    s1.delete(cq);
                }
            }
            List<String> l1 = form.getVariety();
            List<Float> l2 = form.getWeight();
            List<Float> l3 = form.getNoofBales();

            for (int i = 0; i < l1.size(); i++) {
                ChildGdWastage cg = new ChildGdWastage();
                cg.setParentGdWastage(pg);
                System.out.println("--------------------child--------------" + l1.get(i));
                cg.setVariety((l1.get(i)));
                cg.setWeight(l2.get(i));
                cg.setNumberofBales(l3.get(i));
                s1.save(cg);
                s1.flush();
                s1.clear();
            }
            t1.commit();
            s1.close();
        } catch (HibernateException h) {
            System.out.println("\n Hibernate exception during update");
            h.printStackTrace();
        }
    }

}
