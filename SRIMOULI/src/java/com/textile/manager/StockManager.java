/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.manager;

import com.textile.dto.Settingsdto;
import com.textile.dto.StockDTO;
import com.textile.dto.StockReportDto;
import com.textile.model.ChildGdPrecleaning;
import com.textile.model.ChildGdProduction;
import com.textile.model.ChildGdWastage;
import com.textile.model.GdPurchase;
import com.textile.model.GdSale;
import com.textile.model.Login;
import com.textile.model.ParentGdProduction;
import com.textile.model.ProductsSample;
import com.textile.model.Stock;
import com.textile.model.StockReport;
import com.textile.model.StockReportA;
import com.textile.model.StockReportReal;
import com.textile.util.HibernateUtil;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.Transformers;

/**
 *
 * @author Swathi
 */
public class StockManager {

    private List rlist1;
    private List rlist2;
    private List rlist3;
    private String a1, b1, b2;

    public String getA1() {
        return a1;
    }

    public void setA1(String a1) {
        this.a1 = a1;
    }

    public String getB1() {
        return b1;
    }

    public void setB1(String b1) {
        this.b1 = b1;
    }

    public String getB2() {
        return b2;
    }

    public void setB2(String b2) {
        this.b2 = b2;
    }

    public List getRlist2() {
        return rlist2;
    }

    public void setRlist2(List rlist2) {
        this.rlist2 = rlist2;
    }

    public List getRlist3() {
        return rlist3;
    }

    public void setRlist3(List rlist3) {
        this.rlist3 = rlist3;
    }

    public List getRlist1() {
        return rlist1;
    }

    public void setRlist1(List rlist1) {
        this.rlist1 = rlist1;
    }

    public boolean stockRt(StockReportDto sr) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        String date = sr.getDate();
        String date1 = sr.getDate1();
        String ptype = sr.getPtype();
        int quantity = sr.getQuantity();
        String variety = null, variety1 = null;
        Date gddate = null, gddate1 = null;
        float kgs = sr.getKgs();
        List l = null;
        List l1 = null;
        int purchasesize = 0, salesize = 0;
        GdPurchase gd;
        GdSale gds;
        try {
            SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yy");
            Date date2 = sf.parse(date);
            Date date3 = sf.parse(date1);
            String[] ect = ptype.split(", ");
            //     System.out.println("sssssssssssssssssss" + date2 + date3 + ect[1] + quantity + kgs);
            Criteria c = s.createCriteria(GdPurchase.class);
            c.add(Restrictions.between("date", date2, date3));
            l = c.list();
            //      purchasesize = l.size();
            System.out.println("lllllllllllllllllllll" + l + purchasesize);

            Criteria c1 = s.createCriteria(GdSale.class);
            c1.add(Restrictions.between("date", date2, date3));
            l1 = c1.list();
            salesize = l1.size();
            //      System.out.println("l111111111111111111111" + l1 + salesize);
            for (Object o : l) {
                gd = (GdPurchase) o;
                gddate = gd.getDate();
                variety = gd.getProductType();
                //         System.out.println(gddate + variety);
            }
            for (Object o1 : l1) {
                gds = (GdSale) o1;
                gddate1 = gds.getDate();
                variety1 = gds.getProductType();
                //        System.out.println("ddddddddddddddddd" + gddate1 + variety1);
            }

            if (!(gddate == gddate1) && !(variety.equals(variety1))) {
                return true;
            }
        } catch (Exception e) {

        }
        return false;
    }

    // ------------Insert stock report
    public StockReportDto stockinsert(StockReportDto sr) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        String date = sr.getDate(), product_type = null;
        String date1 = sr.getDate1();
        Date ddate = null;

        List l = null;
        List l1 = null;
        List l2 = null;
        List l3 = null;
        List l4 = new ArrayList();
        List l5 = new ArrayList();
        int id = 0, sale_bales = 0;
        float sale_weight = 0;
        GdPurchase gd;
        GdSale gds;
        ParentGdProduction pgd;
        ChildGdProduction cgd;
        //   System.out.println("ddddddddddddd" + date);
        try {
            SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yy");
            Date date2 = sf.parse(date);
            Date date3 = sf.parse(date1);

            Criteria c = s.createCriteria(GdPurchase.class);
            c.add(Restrictions.between("date", date2, date3));
            l = c.list();
            //   System.out.println("lllllllllllllllllll" + l);
            Criteria c1 = s.createCriteria(GdSale.class);
            c1.add(Restrictions.between("date", date2, date3));
            ProjectionList p2 = Projections.projectionList();
            p2.add(Projections.property("date"));
            p2.add(Projections.property("productType"));
            p2.add(Projections.property("netWeight"));
            p2.add(Projections.property("noOfBales"));
            c1.setProjection(p2);
            l1 = c1.list();
            //    System.out.println("lllll222222222222222" + l1);

            Criteria c2 = s.createCriteria(ParentGdProduction.class);
            c2.add(Restrictions.between("date", date2, date3));
            l2 = c2.list();
            //    System.out.println("lllll3333333333333333" + l2);

            for (Object o2 : l2) {
                pgd = (ParentGdProduction) o2;
                ddate = pgd.getDate();
                id = pgd.getIdpp();
                //     System.out.println(id + "sdsdsde" + ddate);
                Criteria c3 = s.createCriteria(ChildGdProduction.class);
                c3.add(Restrictions.eq("parentGdProduction.idpp", id));
                ProjectionList p1 = Projections.projectionList();
                p1.add(Projections.property("variety"));
                p1.add(Projections.property("weight"));
                p1.add(Projections.property("totalBales"));
                c3.setProjection(p1);
                l3 = c3.list();
                l4.add(ddate);

                Iterator i = l3.iterator();
                while (i.hasNext()) {
                    Object ob[] = (Object[]) i.next();
                    //      System.out.println(ob[0] + "--------" + ob[1] + "----------" + ob[2]);
                    l4.add(ob[0]);
                    l4.add(ob[1]);
                    l4.add(ob[2]);
                }
            }
            Iterator it = l1.iterator();
            while (it.hasNext()) {
                Object ob1[] = (Object[]) it.next();
                //    System.out.println(ob1[0] + "--------" + ob1[1] + "----------" + ob1[2]);
                l5.add(ob1[0]);
                l5.add(ob1[1]);
                l5.add(ob1[2]);
            }

        } catch (Exception e) {

        }
        return sr;
    }

    // iiiiiiiiiiiiiiiiiiiiiiiiiiiiii
    public StockReportDto stockinsert3(StockReportDto sr) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        String variety_type = sr.getPtype();
        String date = sr.getDate(), product_type = null;
        String date1 = sr.getDate1();
        Date[] ddate1 = new Date[1000];
        String[] variety1 = null;
        List l = null;
        List l1 = null;
        List l2 = null;
        List l3 = null;
        List l4 = null;
        List l5 = null;
        List l6 = null;
        List l7 = null;
        List l8 = null;
        List l9 = null;
        List l10 = null;
        List l11 = null;
        GdPurchase gd = new GdPurchase();
        GdSale gds = new GdSale();
        ParentGdProduction pgd;
        ChildGdProduction cgd = new ChildGdProduction();

        try {
            SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yy");
            Date date2 = sf.parse(date);
            Date date3 = sf.parse(date1);
            String[] ect = variety_type.split(", ");
            //    System.out.println("///////////////////" + ect[0] + ect[1] + ect[2]);

            Date oneDayBefore = new Date(date2.getTime() - 2);

            Criteria c13 = s.createCriteria(GdPurchase.class);
            c13.add(Restrictions.between("date", date2, date3));
            c13.add(Restrictions.eq("productType", ect[2]));
            l9 = c13.list();

            Criteria c3 = s.createCriteria(GdSale.class);
            c3.add(Restrictions.between("date", date2, date3));
            c3.add(Restrictions.eq("productType", ect[2]));
            l3 = c3.list();

            Criteria c6 = s.createCriteria(ChildGdProduction.class);
            c6.add(Restrictions.between("actualDate", date2, date3));
            c6.add(Restrictions.eq("variety", ect[2]));
            l6 = c6.list();

            for (Object o2 : l3) {
                gds = (GdSale) o2;
            }
            for (Object o3 : l6) {
                cgd = (ChildGdProduction) o3;
            }
            if ((gds.getProductType().equals(cgd.getVariety()))) {
                //       System.out.println("hello saranya");
                Float quantity = gds.getNoOfBales() + cgd.getTotalBales();
                Float weight = gds.getNetWeight() + cgd.getWeight();
                //       System.out.println(quantity + "iiiiiiiiiiiiiii" + weight);
                Criteria c14 = s.createCriteria(StockReport.class);
                StockReport st = (StockReport) c14.add(Restrictions.eq("date", oneDayBefore)).add(Restrictions.eq("variety", ect[2])).uniqueResult();
                l10 = c14.list();
                for (Object o12 : l9) {
                    gd = (GdPurchase) o12;

                    Float f1 = st.getStockKgs();
                    Float i1 = st.getStockQuantity();
                    Float f2 = f1 + gd.getNetWeight() - weight;
                    Float i2 = i1 + gd.getNoOfBales() - quantity;
                    //        System.out.println(gd.getDate());
                    st = new StockReport();
                    st.setReceivedKgs(gd.getNetWeight());
                    st.setReceivedQuantity(gd.getNoOfBales());
                    st.setVariety(ect[2]);
                    st.setDate(gd.getDate());
                    st.setIssueKgs(weight);
                    st.setIssueQuantity(quantity);
                    st.setIssueKgs(weight);
                    st.setStockKgs(f2);
                    st.setStockQuantity(i2);
                    s.save(st);
                    s.flush();
                    s.clear();
                }
                t.commit();
            }

        } catch (Exception e) {

        }
        return sr;
    }

    public StockReportDto stockinsert2(StockReportDto sr) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        String variety_type = sr.getPtype();
        String date = sr.getDate(), product_type = null;
        String date1 = sr.getDate1();
        Date[] ddate1 = new Date[1000];
        String[] variety1 = null;
        List l = null;
        List l1 = null;
        List l2 = null;
        List l3 = null;
        List l4 = null;
        List l5 = null;
        List l6 = null;
        List l7 = null;
        List l8 = null;
        List l9 = null;
        List l10 = null;
        List l11 = null;
        GdPurchase gd = new GdPurchase();
        GdSale gds = new GdSale();
        ParentGdProduction pgd;
        ChildGdProduction cgd = new ChildGdProduction();

        try {
            SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yy");
            Date date2 = sf.parse(date);
            Date date3 = sf.parse(date1);
            String[] ect = variety_type.split(", ");
            //    System.out.println("///////////////////" + ect[0] + ect[1] + ect[2]);

            Date oneDayBefore = new Date(date2.getTime() - 2);

            Criteria c12 = s.createCriteria(GdPurchase.class);
            c12.add(Restrictions.between("date", date2, date3));
            c12.add(Restrictions.eq("productType", ect[1]));
            l8 = c12.list();

            Criteria c2 = s.createCriteria(GdSale.class);
            c2.add(Restrictions.between("date", date2, date3));
            c2.add(Restrictions.eq("productType", ect[1]));
            l2 = c2.list();

            Criteria c5 = s.createCriteria(ChildGdProduction.class);
            c5.add(Restrictions.between("actualDate", date2, date3));
            c5.add(Restrictions.eq("variety", ect[1]));
            l5 = c5.list();

            System.out.println("lllll6666666666" + l6);

            for (Object o2 : l2) {
                gds = (GdSale) o2;
            }
            for (Object o3 : l5) {
                cgd = (ChildGdProduction) o3;
            }
            if ((gds.getProductType().equals(cgd.getVariety()))) {
                //   System.out.println("hello anusha");
                Float quantity = gds.getNoOfBales() + cgd.getTotalBales();
                Float weight = gds.getNetWeight() + cgd.getWeight();
                //   System.out.println(gds.getNetWeight() + "mmmmmmmmmmmmmmm" + cgd.getWeight());
                //  System.out.println(quantity + "mmmmmmmmmmmmmmm" + weight);
                Criteria c15 = s.createCriteria(StockReport.class);
                StockReport st = (StockReport) c15.add(Restrictions.eq("date", oneDayBefore)).add(Restrictions.eq("variety", ect[1])).uniqueResult();
                l11 = c15.list();
                for (Object o11 : l8) {
                    gd = (GdPurchase) o11;
                    //       System.out.println("1234567890" + st.getStockQuantity());
                    Float f1 = st.getStockKgs();
                    Float i1 = st.getStockQuantity();
                    Float f2 = f1 + gd.getNetWeight() - weight;
                    Float i2 = i1 + gd.getNoOfBales() - quantity;
                    //      System.out.println(gd.getDate());
                    st = new StockReport();
                    st.setReceivedKgs(gd.getNetWeight());
                    st.setReceivedQuantity(gd.getNoOfBales());
                    st.setVariety(ect[1]);
                    st.setDate(gd.getDate());
                    st.setIssueKgs(weight);
                    st.setIssueQuantity(quantity);
                    st.setIssueKgs(weight);
                    st.setStockKgs(f2);
                    st.setStockQuantity(i2);
                    s.save(st);
                    s.flush();
                    s.clear();
                }
                t.commit();

            }

        } catch (Exception e) {

        }
        return sr;
    }

    public StockReportDto stockinsert1(StockReportDto sr) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        String variety_type = sr.getPtype();

        String date = sr.getDate(), product_type = null;
        String date1 = sr.getDate1();
        Date[] ddate1 = new Date[1000];
        String[] variety1 = null;
        List l = null;
        List l1 = null;
        List l2 = null;
        List l3 = null;
        List l4 = null;
        List l5 = null;
        List l6 = null;
        List l7 = null;
        List l8 = null;
        List l9 = null;
        List l10 = null;
        List l11 = null;
        GdPurchase gd = new GdPurchase();
        GdSale gds = new GdSale();
        ParentGdProduction pgd;
        ChildGdProduction cgd = new ChildGdProduction();

        try {
            System.out.println(variety_type + "???????????");
            SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yy");
            Date date2 = sf.parse(date);
            Date date3 = sf.parse(date1);
            String[] ect = variety_type.split(", ");
            //      System.out.println("///////////////////" + ect[0] + ect[1] + ect[2]);

            Date oneDayBefore = new Date(date2.getTime() - 2);
            System.out.println("shgtfjerhgt........++++++++=//////////" + oneDayBefore);

            System.out.println("im java" + l);

            Criteria c11 = s.createCriteria(GdPurchase.class);
            c11.add(Restrictions.between("date", date2, date3));
            c11.add(Restrictions.eq("productType", ect[0]));
            l7 = c11.list();
            System.out.println(";;;;;;;;;;;;;;;;;;;;;;;;" + l7);

            Criteria c1 = s.createCriteria(GdSale.class);
            c1.add(Restrictions.between("date", date2, date3));
            c1.add(Restrictions.eq("productType", ect[0]));
            l1 = c1.list();

            System.out.println("lllll111111111111" + l1);
//            System.out.println("lllll222222222222222" + l2);
//            System.out.println("lllll333333333333" + l3);
            //       System.out.println("///////////////////" + ect[0] + ect[1] + ect[2]);
            Criteria c4 = s.createCriteria(ChildGdProduction.class);
            c4.add(Restrictions.between("actualDate", date2, date3));
            c4.add(Restrictions.eq("variety", ect[0]));
            l4 = c4.list();

            System.out.println("lllll1444444444444" + l4);
//            System.out.println("lllll55555555555" + l5);
//            System.out.println("lllll6666666666" + l6);

            for (Object o : l1) {
                gds = (GdSale) o;
            }
            for (Object o1 : l4) {
                cgd = (ChildGdProduction) o1;
            }

            if ((gds.getProductType().equals(cgd.getVariety()))) {
                Float quantity = gds.getNoOfBales() + cgd.getTotalBales();
                Float weight = gds.getNetWeight() + cgd.getWeight();
                System.out.println(quantity + "hhhhhhhhhhhhhhhh" + weight);
                Criteria c = s.createCriteria(StockReport.class);
                StockReport st = (StockReport) c.add(Restrictions.eq("date", oneDayBefore)).add(Restrictions.eq("variety", ect[0])).uniqueResult();
                l = c.list();
                for (Object o10 : l7) {
                    gd = (GdPurchase) o10;
                    System.out.println("qqqqqqqqqqqqqqqqqqqqq" + gd.getDate());

                    System.out.println(st.getStockKgs() + "kkkkkkkkkkkkkkk" + st.getStockQuantity());
                    Float f1 = st.getStockKgs();
                    Float i1 = st.getStockQuantity();
                    Float f2 = f1 + gd.getNetWeight() - weight;
                    Float i2 = i1 + gd.getNoOfBales() - quantity;
                    System.out.println(gd.getDate());
                    st = new StockReport();
                    st.setReceivedKgs(gd.getNetWeight());
                    st.setReceivedQuantity(gd.getNoOfBales());
                    st.setVariety(ect[0]);
                    st.setDate(gd.getDate());
                    st.setIssueKgs(weight);
                    st.setIssueQuantity(quantity);
                    st.setIssueKgs(weight);
                    st.setStockKgs(f2);
                    st.setStockQuantity(i2);
                    s.save(st);
                    s.flush();
                    s.clear();
                }
                t.commit();

            }

        } catch (Exception e) {

        }
        return sr;
    }

    //-----------------------------
    public StockReportDto stockRt1(StockReportDto sr) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        String date = sr.getDate();
        String date1 = sr.getDate1();
        String ptype = sr.getPtype();
        int quantity = sr.getQuantity();
        return sr;
    }

    public List settingsList(Settingsdto rf) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        String control = "control";
        List<Login> list = null;
        System.out.println("list is-------------" + rf.getId());
        try {
            Criteria c = s.createCriteria(Login.class);
            c.add(Restrictions.eq("id", rf.getId()));
            list = c.list();
        } catch (Exception e) {

        }
        System.out.println("list is:------->>>>" + list);
        return list;
    }

    public List settingsList1(int id) {
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

    public List stockList() {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<StockReport> list = null;
        try {
            Criteria c = s.createCriteria(StockReport.class);
            list = c.list();
        } catch (Exception e) {

        }
        System.out.println("list is:------->>>>" + list);
        return list;
    }

    public StockDTO insertStock(StockDTO st) {
        System.out.println("\n anusaaaaaaaaaaaaaaaaaaaaaa");
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        try {
            String date = st.getDate();
            SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yy");
            Date date1 = sf.parse(date);
            System.out.println("-------------date--------" + date1);

            List<String> l1 = st.getVariety();
            List<Float> l2 = st.getStockQuantity();
            List<Float> l3 = st.getStockKgs();

            for (int i = 0; i < l1.size(); i++) {
                StockReport r = new StockReport();
                System.out.println("\n bbbbbbbbbbbbbbbbb" + l1 + l2 + l3);
                r.setVariety(l1.get(i));

                r.setStockQuantity(l2.get(i));
                r.setStockKgs(l3.get(i));
                r.setDate(date1);
                s.save(r);

                StockReportReal re = new StockReportReal();
                System.out.println("\n bbbbbbbbbbbbbbbbb" + l1 + l2 + l3);
                re.setVariety(l1.get(i));

                re.setStockQuantity(l2.get(i));
                re.setStockKgs(l3.get(i));
                re.setDate(date1);
                s.save(re);
                // s.flush();
                //  s.clear();
            }
            t.commit();
            //s.close();
        } catch (Exception e) {

        }
        return st;
    }

    public List stockRetrieve(StockReportDto sr) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<StockReport> l = new ArrayList<>();
        String d1 = sr.getDate();
        String d2 = sr.getDate1();
        String variety_type = sr.getPtype();
        try {
            SimpleDateFormat st = new SimpleDateFormat("dd-MM-yy");
            Date date = st.parse(d1);
            Date date1 = st.parse(d2);
            String[] ect = variety_type.split(", ");
            int size = ect.length;
            //  System.out.println("8888888888888888888" + ect[0] + ect[1] + ect[2]);
            if (size == 3) {
                Criteria c = s.createCriteria(StockReport.class);
                c.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("variety", ect[0]));
                List list = c.list();
                this.rlist1 = list;
                l.addAll(list);

                Criteria c1 = s.createCriteria(StockReport.class);
                c1.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("variety", ect[1]));
                List list1 = c1.list();
                this.rlist2 = list1;
                l.addAll(list1);

                Criteria c2 = s.createCriteria(StockReport.class);
                c2.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("variety", ect[2]));
                List list2 = c2.list();
                this.rlist3 = list2;
                l.addAll(list2);

                a1 = ect[0];
                b1 = ect[1];
                b2 = ect[2];
            }
            if (size == 2) {
                System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%");
                Criteria c = s.createCriteria(StockReport.class);
                c.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("variety", ect[0]));
                List list = c.list();
                this.rlist1 = list;
                l.addAll(list);

                Criteria c1 = s.createCriteria(StockReport.class);
                c1.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("variety", ect[1]));
                List list1 = c1.list();
                this.rlist2 = list1;
                l.addAll(list1);

                a1 = ect[0];
                b1 = ect[1];
            }
            if (size == 1) {
                System.out.println("kkkkkkkkkkkkkkkk" + ect[0]);
                Criteria c = s.createCriteria(StockReport.class);
                c.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("variety", ect[0]));
                List list = c.list();
                this.rlist1 = list;
                l.addAll(list);

                a1 = ect[0];
            }
        } catch (Exception e) {

        }
        System.out.println("*******************" + rlist1 + "////////////////////" + rlist2);
        System.out.println("....................." + l);
        return l;
    }

    public boolean purchaseValidate(StockReportDto sr) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List l = new ArrayList();
        String d1 = sr.getDate();
        String d2 = sr.getDate1();
        String variety_type = sr.getPtype();
        try {

            SimpleDateFormat st = new SimpleDateFormat("dd-MM-yy");
            Date date = st.parse(d1);
            Date date1 = st.parse(d2);
            String[] ect = variety_type.split(", ");

            Criteria c = s.createCriteria(GdPurchase.class);
            c.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("productType", ect[0]));
            l = c.list();
            System.out.println("||||||||||||||||||||||" + l);
            if (l.isEmpty()) {
                System.out.println("''''''''''''''''''");
                return true;
            }

            Criteria c1 = s.createCriteria(GdPurchase.class);
            c1.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("productType", ect[1]));
            List list1 = c1.list();
            if (list1.isEmpty()) {
                return true;
            }

            Criteria c2 = s.createCriteria(GdPurchase.class);
            c2.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("productType", ect[2]));
            List list2 = c2.list();
            if (list2.isEmpty()) {
                return true;
            }
//            
//             Criteria c2 = s.createCriteria(ChildGdProduction.class);
//            c2.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("variety", ect[0]));
//            List  list2 = c2.list();
//            l.addAll(list2);

        } catch (Exception e) {

        }
        System.out.println("\\\\\\\\\\\\\\\\\\" + l);
        return false;
    }

    public boolean productionValidate(StockReportDto sr) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List l = new ArrayList();
        String d1 = sr.getDate();
        String d2 = sr.getDate1();
        String variety_type = sr.getPtype();
        try {

            SimpleDateFormat st = new SimpleDateFormat("dd-MM-yy");
            Date date = st.parse(d1);
            Date date1 = st.parse(d2);
            String[] ect = variety_type.split(", ");
            System.out.println("sssssssssssss");
            Criteria c = s.createCriteria(ChildGdProduction.class);
            c.add(Restrictions.between("actualDate", date, date1)).add(Restrictions.eq("variety", ect[0]));
            l = c.list();
            System.out.println("12234565" + l);
            if (l.isEmpty()) {

                return true;
            }

            Criteria c1 = s.createCriteria(ChildGdProduction.class);
            c1.add(Restrictions.between("actualDate", date, date1)).add(Restrictions.eq("variety", ect[1]));
            List list1 = c1.list();
            if (list1.isEmpty()) {
                return true;
            }

            Criteria c2 = s.createCriteria(ChildGdProduction.class);
            c2.add(Restrictions.between("actualDate", date, date1)).add(Restrictions.eq("variety", ect[2]));
            List list2 = c2.list();
            if (list2.isEmpty()) {
                return true;
            }
        } catch (Exception e) {

        }
        System.out.println("$$$$$$$$$$$$$$$$$$" + l);
        return false;
    }

    public boolean saleValidate(StockReportDto sr) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List l = new ArrayList();
        String d1 = sr.getDate();
        String d2 = sr.getDate1();
        String variety_type = sr.getPtype();
        try {

            SimpleDateFormat st = new SimpleDateFormat("dd-MM-yy");
            Date date = st.parse(d1);
            Date date1 = st.parse(d2);
            String[] ect = variety_type.split(", ");

            Criteria c = s.createCriteria(GdSale.class);
            c.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("productType", ect[0]));
            l = c.list();
            System.out.println("||||||||||||||||||||||" + l);
            if (l.isEmpty()) {
                System.out.println("''''''''''''''''''");
                return true;
            }

            Criteria c1 = s.createCriteria(GdSale.class);
            c1.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("productType", ect[1]));
            List list1 = c1.list();
            if (list1.isEmpty()) {
                return true;
            }

            Criteria c2 = s.createCriteria(GdSale.class);
            c2.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("productType", ect[2]));
            List list2 = c2.list();
            if (list2.isEmpty()) {
                return true;
            }

        } catch (Exception e) {

        }
        System.out.println("\\\\\\\\\\\\\\\\\\" + l);
        return false;
    }

    public List stockrte() {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List l = null;
        try {
            Criteria c = s.createCriteria(StockReport.class);
            l = c.list();
            t.commit();
        } catch (Exception e) {

        }
        return l;
    }

    public List[] getListV1(StockReportDto sd) throws ParseException {
        ArrayList[] list1 = new ArrayList[5];
        String v1 = sd.getPtype();
        System.out.println("the list variety is.----------------->" + v1);
        List l1 = null, l2 = null, l3 = null;
        float q1 = 0, k1 = 0, a1 = 0;
        String variety[] = sd.getPtype().split(", ");
        int size = variety.length;
        System.out.println("the variety------..>" + variety);
        String date = sd.getDate();
        String date1 = sd.getDate1();
        SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yy");
        Date date2 = sf.parse(date);
        Date date3 = sf.parse(date1);
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t1 = session.beginTransaction();

        System.out.println("-------------------ssssssssssss");
        String sql = "select date from gd_purchase group by date;";
        Query query = session.createSQLQuery(sql);
        List purch = query.list();

        String sql2 = "select date from parent_gd_production group by date;";
        Query query2 = session.createSQLQuery(sql2);
        List dept = query2.list();

        String sql3 = "select date from parent_gd_precleaning group by date;";
        Query query3 = session.createSQLQuery(sql3);
        List prec = query3.list();

        String sql4 = "select date from parent_gd_wastage group by date;";
        Query query4 = session.createSQLQuery(sql4);
        List wast = query4.list();

        String sql5 = "select date from gd_sale group by date;";
        Query query5 = session.createSQLQuery(sql5);
        List sale = query5.list();

        List<Date> myList = new ArrayList<>();
        SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
        Date sa=null,s2=null,s3=null,s4=null,s5=null;
        if(!purch.isEmpty())
        sa = ft.parse(purch.get(0).toString());
        if(!dept.isEmpty())
        s2 = ft.parse(dept.get(0).toString());
        if(!prec.isEmpty())
        s3 = ft.parse(prec.get(0).toString());
        if(!wast.isEmpty())
        s4 = ft.parse(wast.get(0).toString());
        if(!sale.isEmpty())
        s5 = ft.parse(sale.get(0).toString());
        if(sa!=null)
        myList.add(sa);
        if(s2!=null)
        myList.add(s2);
        if(s3!=null)
        myList.add(s3);
        if(s4!=null)
        myList.add(s4);
        if(s5!=null)
        myList.add(s5);
        System.out.println("the list iss in the glistv1 of stock manager iss------------>"+myList);
        if(myList!=null){
        Collections.sort(myList, new Comparator<Date>() {

            @Override
            public int compare(Date o1, Date o2) {
                return o1.compareTo(o2);
            }
        });
        System.out.println("..............last date....--------->" + myList.get(0));
        for (int i = 0; i < myList.size(); i++) {
            System.out.println(myList.get(i).toString());
        }
        }

        List<Date> myList2 = new ArrayList<>();
        Date e1=null,e2=null,e3=null,e4=null,e5=null;
         if(!purch.isEmpty())
        e1 = ft.parse(purch.get(purch.size() - 1).toString());
          if(!dept.isEmpty())
        e2 = ft.parse(dept.get(dept.size() - 1).toString());
           if(!prec.isEmpty())
        e3 = ft.parse(prec.get(prec.size() - 1).toString());
            if(!wast.isEmpty())
        e4 = ft.parse(wast.get(wast.size() - 1).toString());
             if(!sale.isEmpty())
        e5 = ft.parse(sale.get(sale.size() - 1).toString());
         if(e1!=null)
        myList2.add(e1);
          if(e2!=null)
        myList2.add(e2);
        if(e3!=null)
        myList2.add(e3);
         if(e4!=null)
        myList2.add(e4);
         if(e5!=null)
        myList2.add(e5);
        Collections.sort(myList2, new Comparator<Date>() {

            @Override
            public int compare(Date o1, Date o2) {
                return o1.compareTo(o2);
            }
        });
        System.out.println("..............leat date....--------->" + myList2.get(0));
        for (int i = 0; i < myList2.size(); i++) {
            System.out.println(myList2.get(i).toString());
        }

        List<Date> dates = new ArrayList<>();
        Date startDate = myList.get(0);
        Date endDate = myList2.get(myList2.size() - 1);
        long interval = 24 * 1000 * 60 * 60; // 1 hour in millis
        long endTime = endDate.getTime(); // create your endtime here, possibly using Calendar or Date
        long curTime = startDate.getTime();
        while (curTime <= endTime) {
            dates.add(new Date(curTime));
            curTime += interval;
        }
        for (int i = 0; i < dates.size(); i++) {
            Date lDate = (Date) dates.get(i);
            String ds = ft.format(lDate);
            System.out.println(" Date is ..." + ds);
        }

        String aq = "delete from stock_report_a;";
        Query qu = session.createSQLQuery(aq);
        qu.executeUpdate();

        String aq1 = "INSERT INTO stock_report_a(date,variety,stock_quantity,stock_kgs,stock_avg) SELECT  date,variety,stock_quantity,stock_kgs,stock_avg FROM stock;";
        Query qu1 = session.createSQLQuery(aq1);
        qu1.executeUpdate();

        t1.commit();
        session.close();

//        try{
        if (size >= 1) {
            Session s = HibernateUtil.getSessionFactory().openSession();
            Transaction t = s.beginTransaction();
            Criteria c6 = s.createCriteria(GdPurchase.class);
            List l6 = c6.list();
            Criteria c4 = s.createCriteria(ChildGdProduction.class);
            List l4 = c4.list();
            Criteria cr4 = s.createCriteria(ChildGdPrecleaning.class);
            List li4 = cr4.list();
            Criteria cri4 = s.createCriteria(ChildGdWastage.class);
            List lii4 = cri4.list();
            Criteria c5 = s.createCriteria(GdSale.class);
            List l5 = c5.list();

            for (int i = 0; i < dates.size(); i++) {

                float iq = 0, ik = 0;
                float pq = 0, pk = 0;
                float dq = 0, dk = 0;
                float ppq = 0, ppk = 0;

                for (Object o6 : l6) {
                    System.out.println("the size of purchase is-------------------------" + l6.size());
                    GdPurchase gp = (GdPurchase) o6;
                    Date d = gp.getDate();
                    String g = gp.getProductType();
                    if (variety[0].equals(g) && (d.compareTo(dates.get(i)) == 0)) {
                        if (gp.getNoOfBales() != null) {
                            pq += gp.getNoOfBales();
                        }
                        if (gp.getNetWeight() != null) {
                            pk += gp.getNetWeight();
                        }
                        System.out.println("the iq and is..pruchase..---...." + pq + "............" + pk + "--------->" + dates.get(i));

                    }
                }
                float pwq = 0, pwk = 0;
                System.out.println("the size of wastage is-------------->" + lii4.size());
                for (Object ow6 : lii4) {
                    ChildGdWastage wgp = (ChildGdWastage) ow6;
                    Date wd = wgp.getActDate();
                    System.out.println("the size of wastage is-------------->" + wd);
                    String wg = wgp.getVariety();
                    if (variety[0].equals(wg) && (wd.compareTo(dates.get(i)) == 0)) {
                        if (wgp.getNumberofBales() != null) {
                            pwq += wgp.getNumberofBales();
                        }
                        if (wgp.getWeight() != null) {
                            pwk += wgp.getWeight();
                        }
                        System.out.println("the iq and is....wastage---...." + pwq + "............" + pwk);

                    }
                }
                System.out.println("the iq and is.00000...wastage---...." + pwq + "............" + pwk);
                pq += pwq;
                pk += pwk;
                System.out.println("the iq and is..total.*********..---...." + pq + "............" + pk);

                for (Object o5 : l5) {
                    GdSale gs = (GdSale) o5;
                    Date d = gs.getDate();
                    String g = gs.getProductType();
                    if (variety[0].equals(g) && (d.compareTo(dates.get(i)) == 0)) {
                        if (gs.getNoOfBales() != null) {
                            iq += gs.getNoOfBales();
                        }
                        if (gs.getNetWeight() != null) {
                            ik += gs.getNetWeight();
                        }
                        System.out.println("the iq and is...sale.---...." + iq + "............" + ik);
                    }
                }

                for (Object o4 : l4) {
                    ChildGdProduction gs = (ChildGdProduction) o4;
                    Date d = gs.getActualDate();
                    String g = gs.getVariety();
                    if (variety[0].equals(g) && (d.compareTo(dates.get(i)) == 0)) {
                        if (gs.getTotalBales() != null) {
                            dq += gs.getTotalBales();
                        }
                        if (gs.getWeight() != null) {
                            dk += gs.getWeight();
                        }
                        System.out.println("the iq and is....department---...." + dq + "............" + dk + "------------>" + dates.get(i));
                    }
                }
                for (Object oi4 : li4) {
                    ChildGdPrecleaning gs = (ChildGdPrecleaning) oi4;
                    Date d = gs.getActualDate();
                    String g = gs.getVariety();
                    if (variety[0].equals(g) && (d.compareTo(dates.get(i)) == 0)) {
                        if (gs.getTotalBales() != null) {
                            ppq += gs.getTotalBales();
                        }
                        if (gs.getWeight() != null) {
                            ppk += gs.getWeight();
                        }
                        System.out.println("the iq and is...precleaning.---...." + ppq + "............" + ppk);
                    }
                }
                
                if(i==0){
                    //Date oneDayBefore = new Date(dates.get(i).getTime() - 2);
                Criteria c1 = s.createCriteria(Stock.class);
                c1.add(Restrictions.eq("variety", variety[0]));
                l1 = c1.list();
                for (Object o1 : l1) {
                    Stock sp1 = (Stock) o1;
                    if (sp1.getStockQuantity() != null) {
                        q1 = sp1.getStockQuantity();
                    }
                    if (sp1.getStockKgs() != null) {
                        k1 = sp1.getStockKgs();
                    }
                    if (sp1.getStockAvg() != null) {
                        a1 = sp1.getStockAvg();
                    }
                    System.out.println("the q and k are-----stock-------->" + q1 + k1);
                }
                }
                
                else{

                Date oneDayBefore = new Date(dates.get(i).getTime() - 2);
                Criteria c1 = s.createCriteria(StockReportA.class);
                c1.add(Restrictions.eq("variety", variety[0])).add(Restrictions.eq("date", oneDayBefore));
                l1 = c1.list();
                for (Object o1 : l1) {
                    StockReportA sp1 = (StockReportA) o1;
                    if (sp1.getStockQuantity() != null) {
                        q1 = sp1.getStockQuantity();
                    }
                    if (sp1.getStockKgs() != null) {
                        k1 = sp1.getStockKgs();
                    }
                    if (sp1.getStockAvg() != null) {
                        a1 = sp1.getStockAvg();
                    }
                    System.out.println("the q and k are-----stock-------->" + q1 + k1);
                }
                }
                float ssq = 0, ssk = 0, pavg = 0, davg = 0, ppavg = 0, savg = 0, iavg = 0;

                ssq = (q1 + pq) - (iq + dq + ppq);
                ssk = (k1 + pk) - (ik + dk + ppk);
                if (pq != 0) {
                    pavg = pk / pq;
                }
                if (iq != 0) {
                    iavg = ik / iq;
                }
                if (dq != 0) {
                    davg = dk / dq;
                }
                if (ppq != 0) {
                    ppavg = ppk / ppq;
                }
                if (ssq != 0) {
                    savg = ssk / ssq;
                }
                StockReportA st = new StockReportA();
                st.setDate(dates.get(i));
                st.setVariety(variety[0]);
                st.setReceivedQuantity(pq);
                st.setReceivedKgs(pk);
                st.setReceivedAvg(pavg);
                st.setIssuedQuantity(dq);
                st.setIssuedKgs(dk);
                st.setIssuedAvg(davg);
                st.setIssuepQuantity(ppq);
                st.setIssuepKgs(ppk);
                st.setIssuepAvg(ppavg);
                st.setSaleQuantity(iq);
                st.setSaleKgs(ik);
                st.setSaleAvg(iavg);
                st.setStockQuantity(ssq);
                st.setStockKgs(ssk);
                st.setStockAvg(savg);
              //  if (!(pq == 0.0 && pk == 0.0 && pavg == 0.0 && dq == 0.0 && dk == 0.0 && davg == 0.0 && ppq == 0.0 && ppk == 0.0 && ppavg == 0.0 && iq == 0.0 && ik == 0.0 && iavg == 0.0)) {
                    s.save(st);
               // }
                System.out.println("the department and precleaning are ------------>" + dq + dk + ppq + ppk);
                s.flush();
                s.clear();

            }

            t.commit();
            s.close();

            Session s1 = HibernateUtil.getSessionFactory().openSession();
            Transaction tr = s1.beginTransaction();

            Criteria c1 = s1.createCriteria(StockReportA.class);
            c1.add(Restrictions.between("date", date2, date3)).add(Restrictions.eq("variety", variety[0]));
            list1[0] = (ArrayList) c1.list();
            tr.commit();
            s1.close();

        }

        if (size >= 2) {

            Session s = HibernateUtil.getSessionFactory().openSession();
            Transaction t = s.beginTransaction();
            Criteria c6 = s.createCriteria(GdPurchase.class);
            List l6 = c6.list();
            Criteria c4 = s.createCriteria(ChildGdProduction.class);
            List l4 = c4.list();
            Criteria cr4 = s.createCriteria(ChildGdPrecleaning.class);
            List li4 = cr4.list();
            Criteria cri4 = s.createCriteria(ChildGdWastage.class);
            List lii4 = cri4.list();
            Criteria c5 = s.createCriteria(GdSale.class);
            List l5 = c5.list();

            for (int i = 0; i < dates.size(); i++) {

                float iq = 0, ik = 0;
                float pq = 0, pk = 0;
                float dq = 0, dk = 0;
                float ppq = 0, ppk = 0;

                for (Object o6 : l6) {
                    GdPurchase gp = (GdPurchase) o6;
                    Date d = gp.getDate();
                    String g = gp.getProductType();
                    if (variety[1].equals(g) && (d.compareTo(dates.get(i)) == 0)) {

                        if (gp.getNoOfBales() != null) {
                            pq += gp.getNoOfBales();
                        }
                        if (gp.getNetWeight() != null) {
                            pk += gp.getNetWeight();
                        }
                        System.out.println("the iq and is..pruchase..---...." + pq + "............" + pk + "--------->" + dates.get(i));

                    }
                }
                float pwq = 0, pwk = 0;
                for (Object ow6 : lii4) {
                    ChildGdWastage wgp = (ChildGdWastage) ow6;
                    Date wd = wgp.getActDate();
                    String wg = wgp.getVariety();
                    if (variety[1].equals(wg) && (wd.compareTo(dates.get(i)) == 0)) {
                        if (wgp.getNumberofBales() != null) {
                            pwq += wgp.getNumberofBales();
                        }
                        if (wgp.getWeight() != null) {
                            pwk += wgp.getWeight();
                        }
                        System.out.println("the iq and is....wastage---...." + pwq + "............" + pwk);

                    }
                }
                pq += pwq;
                pk += pwk;
                System.out.println("the iq and is..total.*********..---...." + pq + "............" + pk);

                for (Object o5 : l5) {
                    GdSale gs = (GdSale) o5;
                    Date d = gs.getDate();
                    String g = gs.getProductType();
                    if (variety[1].equals(g) && (d.compareTo(dates.get(i)) == 0)) {
                        if (gs.getNoOfBales() != null) {
                            iq += gs.getNoOfBales();
                        }
                        if (gs.getNetWeight() != null) {
                            ik += gs.getNetWeight();
                        }
                        System.out.println("the iq and is...sale.---...." + iq + "............" + ik);
                    }
                }

                for (Object o4 : l4) {
                    ChildGdProduction gs = (ChildGdProduction) o4;
                    Date d = gs.getActualDate();
                    String g = gs.getVariety();
                    if (variety[1].equals(g) && (d.compareTo(dates.get(i)) == 0)) {
                        if (gs.getTotalBales() != null) {
                            dq += gs.getTotalBales();
                        }
                        if (gs.getWeight() != null) {
                            dk += gs.getWeight();
                        }
                        System.out.println("the iq and is....department---...." + dq + "............" + dk + "------------>" + dates.get(i));

                    }
                }
                for (Object oi4 : li4) {
                    ChildGdPrecleaning gs = (ChildGdPrecleaning) oi4;
                    Date d = gs.getActualDate();
                    String g = gs.getVariety();
                    if (variety[1].equals(g) && (d.compareTo(dates.get(i)) == 0)) {
                        if (gs.getTotalBales() != null) {
                            ppq += gs.getTotalBales();
                        }
                        if (gs.getWeight() != null) {
                            ppk += gs.getWeight();
                        }
                        System.out.println("the iq and is...precleaning.---...." + ppq + "............" + ppk);
                    }
                }
                
                if(i==0){
                    
                    // Date oneDayBefore = new Date(dates.get(i).getTime() - 2);
                Criteria c1 = s.createCriteria(Stock.class);
                c1.add(Restrictions.eq("variety", variety[1]));
                l1 = c1.list();
                for (Object o1 : l1) {
                    Stock sp1 = (Stock) o1;
                    if (sp1.getStockQuantity() != null) {
                        q1 = sp1.getStockQuantity();
                    }
                    if (sp1.getStockKgs() != null) {
                        k1 = sp1.getStockKgs();
                    }
                    if (sp1.getStockAvg() != null) {
                        a1 = sp1.getStockAvg();
                    }
                    System.out.println("the q and k are------------->" + q1 + k1);
                }
                    
                }
                else{
                Date oneDayBefore = new Date(dates.get(i).getTime() - 2);
                Criteria c1 = s.createCriteria(StockReportA.class);
                c1.add(Restrictions.eq("variety", variety[1])).add(Restrictions.eq("date", oneDayBefore));
                l1 = c1.list();
                for (Object o1 : l1) {
                    StockReportA sp1 = (StockReportA) o1;
                    if (sp1.getStockQuantity() != null) {
                        q1 = sp1.getStockQuantity();
                    }
                    if (sp1.getStockKgs() != null) {
                        k1 = sp1.getStockKgs();
                    }
                    if (sp1.getStockAvg() != null) {
                        a1 = sp1.getStockAvg();
                    }
                    System.out.println("the q and k are------------->" + q1 + k1);
                }
                }
                float ssq = 0, ssk = 0, pavg = 0, davg = 0, ppavg = 0, savg = 0, iavg = 0;

                ssq = (q1 + pq) - (iq + dq + ppq);
                ssk = (k1 + pk) - (ik + dk + ppk);
                if (pq != 0) {
                    pavg = pk / pq;
                }
                if (iq != 0) {
                    iavg = ik / iq;
                }
                if (dq != 0) {
                    davg = dk / dq;
                }
                if (ppq != 0) {
                    ppavg = ppk / ppq;
                }
                if (ssq != 0) {
                    savg = ssk / ssq;
                }
                StockReportA st = new StockReportA();
                st.setDate(dates.get(i));
                st.setVariety(variety[1]);
                st.setReceivedQuantity(pq);
                st.setReceivedKgs(pk);
                st.setReceivedAvg(pavg);
                st.setIssuedQuantity(dq);
                st.setIssuedKgs(dk);
                st.setIssuedAvg(davg);
                st.setIssuepQuantity(ppq);
                st.setIssuepKgs(ppk);
                st.setIssuepAvg(ppavg);
                st.setSaleQuantity(iq);
                st.setSaleKgs(ik);
                st.setSaleAvg(iavg);
                st.setStockQuantity(ssq);
                st.setStockKgs(ssk);
                st.setStockAvg(savg);
              //  if (!(pq == 0.0 && pk == 0.0 && pavg == 0.0 && dq == 0.0 && dk == 0.0 && davg == 0.0 && ppq == 0.0 && ppk == 0.0 && ppavg == 0.0 && iq == 0.0 && ik == 0.0 && iavg == 0.0)) {
                    s.save(st);
              // }
                s.flush();
                s.clear();

            }

            t.commit();
            s.close();

            Session s1 = HibernateUtil.getSessionFactory().openSession();
            Transaction tr = s1.beginTransaction();

            Criteria c1 = s1.createCriteria(StockReportA.class);
            c1.add(Restrictions.between("date", date2, date3)).add(Restrictions.eq("variety", variety[1]));
            list1[1] = (ArrayList) c1.list();
            tr.commit();
            s1.close();

        }
        if (size == 3) {

            Session s = HibernateUtil.getSessionFactory().openSession();
            Transaction t = s.beginTransaction();
            Criteria c6 = s.createCriteria(GdPurchase.class);
            List l6 = c6.list();
            Criteria c4 = s.createCriteria(ChildGdProduction.class);
            List l4 = c4.list();
            Criteria cr4 = s.createCriteria(ChildGdPrecleaning.class);
            List li4 = cr4.list();
            Criteria cri4 = s.createCriteria(ChildGdWastage.class);
            List lii4 = cri4.list();
            Criteria c5 = s.createCriteria(GdSale.class);
            List l5 = c5.list();

            for (int i = 0; i < dates.size(); i++) {

                float iq = 0, ik = 0;
                float pq = 0, pk = 0;
                float dq = 0, dk = 0;
                float ppq = 0, ppk = 0;

                for (Object o6 : l6) {
                    GdPurchase gp = (GdPurchase) o6;
                    Date d = gp.getDate();
                    String g = gp.getProductType();
                    if (variety[2].equals(g) && (d.compareTo(dates.get(i)) == 0)) {

                        if (gp.getNoOfBales() != null) {
                            pq += gp.getNoOfBales();
                        }
                        if (gp.getNetWeight() != null) {
                            pk += gp.getNetWeight();
                        }
                        System.out.println("the iq and is..pruchase..---...." + pq + "............" + pk + "--------->" + dates.get(i));

                    }
                }
                float pwq = 0, pwk = 0;
                for (Object ow6 : lii4) {
                    ChildGdWastage wgp = (ChildGdWastage) ow6;
                    Date wd = wgp.getActDate();
                    String wg = wgp.getVariety();
                    if (variety[2].equals(wg) && (wd.compareTo(dates.get(i)) == 0)) {
                        if (wgp.getNumberofBales() != null) {
                            pwq += wgp.getNumberofBales();
                        }
                        if (wgp.getWeight() != null) {
                            pwk += wgp.getWeight();
                        }
                        System.out.println("the iq and is....wastage---...." + pwq + "............" + pwk);

                    }
                }
                pq += pwq;
                pk += pwk;
                System.out.println("the iq and is..total.*********..---...." + pq + "............" + pk);

                for (Object o5 : l5) {
                    GdSale gs = (GdSale) o5;
                    Date d = gs.getDate();
                    String g = gs.getProductType();
                    if (variety[2].equals(g) && (d.compareTo(dates.get(i)) == 0)) {
                        if (gs.getNoOfBales() != null) {
                            iq += gs.getNoOfBales();
                        }
                        if (gs.getNetWeight() != null) {
                            ik += gs.getNetWeight();
                        }
                        System.out.println("the iq and is...sale.---...." + iq + "............" + ik);
                    }
                }

                for (Object o4 : l4) {
                    ChildGdProduction gs = (ChildGdProduction) o4;
                    Date d = gs.getActualDate();
                    String g = gs.getVariety();
                    if (variety[2].equals(g) && (d.compareTo(dates.get(i)) == 0)) {
                        if (gs.getTotalBales() != null) {
                            dq += gs.getTotalBales();
                        }
                        if (gs.getWeight() != null) {
                            dk += gs.getWeight();
                        }
                        System.out.println("the iq and is....department---...." + dq + "............" + dk + "------------>" + dates.get(i));
                    }
                }
                for (Object oi4 : li4) {
                    ChildGdPrecleaning gs = (ChildGdPrecleaning) oi4;
                    Date d = gs.getActualDate();
                    String g = gs.getVariety();
                    if (variety[2].equals(g) && (d.compareTo(dates.get(i)) == 0)) {
                        if (gs.getTotalBales() != null) {
                            ppq += gs.getTotalBales();
                        }
                        if (gs.getWeight() != null) {
                            ppk += gs.getWeight();
                        }
                        System.out.println("the iq and is...precleaning.---...." + ppq + "............" + ppk);
                    }
                }
                
                if(i==0){
                    // Date oneDayBefore = new Date(dates.get(i).getTime() - 2);
                Criteria c1 = s.createCriteria(Stock.class);
                c1.add(Restrictions.eq("variety", variety[2]));
                l1 = c1.list();
                
                for (Object o1 : l1) {
                    Stock sp1 = (Stock) o1;
                    if (sp1.getStockQuantity() != null) {
                        q1 = sp1.getStockQuantity();
                    }
                    if (sp1.getStockKgs() != null) {
                        k1 = sp1.getStockKgs();
                    }
                    if (sp1.getStockAvg() != null) {
                        a1 = sp1.getStockAvg();
                    }
                    System.out.println("the q and k are----of stock--------->" + q1 + k1);
                }
                
                
                
                }
                else{
                Date oneDayBefore = new Date(dates.get(i).getTime() - 2);
                Criteria c1 = s.createCriteria(StockReportA.class);
                c1.add(Restrictions.eq("variety", variety[2])).add(Restrictions.eq("date", oneDayBefore));
                l1 = c1.list();
                
                 for (Object o1 : l1) {
                    StockReportA sp1 = (StockReportA) o1;
                    if (sp1.getStockQuantity() != null) {
                        q1 = sp1.getStockQuantity();
                    }
                    if (sp1.getStockKgs() != null) {
                        k1 = sp1.getStockKgs();
                    }
                    if (sp1.getStockAvg() != null) {
                        a1 = sp1.getStockAvg();
                    }
                    System.out.println("the q and k are------------->" + q1 + k1);
                }
                
                
                }
                
                float ssq = 0, ssk = 0, pavg = 0, davg = 0, ppavg = 0, savg = 0, iavg = 0;

                ssq = (q1 + pq) - (iq + dq + ppq);
                ssk = (k1 + pk) - (ik + dk + ppk);
                if (pq != 0) {
                    pavg = pk / pq;
                }
                if (iq != 0) {
                    iavg = ik / iq;
                }
                if (dq != 0) {
                    davg = dk / dq;
                }
                if (ppq != 0) {
                    ppavg = ppk / ppq;
                }
                if (ssq != 0) {
                    savg = ssk / ssq;
                }
                StockReportA st = new StockReportA();
                st.setDate(dates.get(i));
                st.setVariety(variety[2]);
                st.setReceivedQuantity(pq);
                st.setReceivedKgs(pk);
                st.setReceivedAvg(pavg);
                st.setIssuedQuantity(dq);
                st.setIssuedKgs(dk);
                st.setIssuedAvg(davg);
                st.setIssuepQuantity(ppq);
                st.setIssuepKgs(ppk);
                st.setIssuepAvg(ppavg);
                st.setSaleQuantity(iq);
                st.setSaleKgs(ik);
                st.setSaleAvg(iavg);
                st.setStockQuantity(ssq);
                st.setStockKgs(ssk);
                st.setStockAvg(savg);
                //if (!(pq == 0.0 && pk == 0.0 && pavg == 0.0 && dq == 0.0 && dk == 0.0 && davg == 0.0 && ppq == 0.0 && ppk == 0.0 && ppavg == 0.0 && iq == 0.0 && ik == 0.0 && iavg == 0.0)) {
                    s.save(st);
               // }
                s.flush();
                s.clear();

            }

            t.commit();
            s.close();

            Session s1 = HibernateUtil.getSessionFactory().openSession();
            Transaction tr = s1.beginTransaction();

            Criteria c1 = s1.createCriteria(StockReportA.class);
            c1.add(Restrictions.between("date", date2, date3)).add(Restrictions.eq("variety", variety[2]));
            list1[2] = (ArrayList) c1.list();
            tr.commit();
            s1.close();

        }

        return list1;
    }

    public boolean checkDate(StockDTO pcard) throws ParseException {
        boolean ch = false;
        String sg = pcard.getDate();
        Date d = null;
        try {
            SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yy");
            Date date2 = sf.parse(sg);
            Session s = HibernateUtil.getSessionFactory().openSession();
            Transaction t = s.beginTransaction();

            String sql = "SELECT * FROM parent_gd_production LIMIT 1;";
            Query query = s.createSQLQuery(sql);
            Iterator iterator = query.list().iterator();
            String sj = null;
            if (iterator.hasNext()) {
                Object[] tuple = (Object[]) iterator.next();
                System.out.println(tuple[0].toString());
                d = (Date) tuple[0];
            }

            Date oneDayBefore = new Date(d.getTime() - 2);
            Date dt = sf.parse(sf.format(oneDayBefore));
            System.out.println("...................." + date2 + "......-.........." + oneDayBefore + "------------------.." + dt);
            if (dt.getTime() == date2.getTime()) {
                ch = true;
            }
        } catch (Exception e) {
            System.out.println(" the exception in date validation in report is--------------->" + e);
        }
        System.out.println("the date is***......" + ch);

        return ch;
    }

    public List getProductlist() {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<String> dept = new ArrayList<>();
        List<ProductsSample> l = (List<ProductsSample>) s.createCriteria(ProductsSample.class).list();
        for (ProductsSample d : l) {
            dept.add(d.getProductName());
        }
        return dept;
    }

}
