/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.manager;

import com.textile.dto.GdSalesDto;
import com.textile.model.FinancialYearBackup;
import com.textile.model.GdSale;
import com.textile.model.Login;
import com.textile.util.HibernateUtil;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author ch.mounika
 */
public class GdSalesManager {

    Session s = null;

    public GdSalesDto insertSale(GdSalesDto gsd) {

        System.out.println("----------due to  insertion----->");
        s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();

        GdSale ge = new GdSale();

        try {
            String cname = gsd.getCname();
            System.out.println("--------+++++=" + cname);
            String ptype = gsd.getPtype();
            System.out.println("--------+++++=" + ptype);
            String dt = gsd.getDate();
            SimpleDateFormat st = new SimpleDateFormat("dd-MM-yy");
            Date date = st.parse(dt);
            Float nbales = gsd.getNbales();
            Float grossWeight = gsd.getGrossWeight();
            System.out.println("ddddddddddmmmmmmm-------===================" + grossWeight);
            Float netWeight = gsd.getNetWeight();
            Float tareWeight = gsd.getTareWeight();

            //int nkgs=gsd.getNkgs();
            String vno = gsd.getVno();
            String remarks = gsd.getRemarks();
            ge.setCustomerName(cname);
            ge.setProductType(ptype);
            ge.setDate(date);
            ge.setNoOfBales(nbales);
            ge.setGrossWeight(grossWeight);
            ge.setNetWeight(netWeight);
            ge.setTareWeight(tareWeight);
            //ge.setNoOfKgs(nkgs);
            ge.setVehicleNo(vno);
            ge.setRemarks(remarks);
            s.save(ge);
            t.commit();
        } catch (Exception ex) {
            System.out.println("Error due to  insertion----->" + ge);
        } finally {
            s.close();
        }
        return gsd;
    }

    public List saleList1(int id) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        String sale = "sale";
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

    public List saleList(GdSalesDto gsd) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        String sale = "sale";
        List<Login> list = null;
        System.out.println("list is-------------" + gsd.getId());
        try {
            Criteria c = s.createCriteria(Login.class);
            c.add(Restrictions.eq("id", gsd.getId()));
            list = c.list();
        } catch (Exception e) {

        }
        System.out.println("list is:------->>>>" + list);
        return list;
    }

    public List getProductList() {
        Session s = HibernateUtil.getSessionFactory().openSession();
        List<String> p = new ArrayList<>();
        /*List<GodownProduct> l=(List<GodownProduct>)s.createCriteria(GodownProduct.class).list();
        for(GodownProduct d : l)
        {
            p.add(d.getProduct());
        }*/
        String sql = "select product_name from products_sample where partial_type like '%Sale%'";
        SQLQuery query = s.createSQLQuery(sql);
        p = query.list();
        System.out.println("list issssssssssssssssss" + p);
        return p;
    }

    public List saleList() {
       Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<GdSale> l = new ArrayList<>();
        try {
            Criteria c = s.createCriteria(GdSale.class);
            l = c.list();
        } catch (Exception e) {

        }
        System.out.println("List in Godown Purchase is -------" + l);
        return l;
    }

    public List editSale(int ids) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<GdSale> l = new ArrayList<>();
        System.out.println("idp is" + ids);
        try {
            Criteria c = s.createCriteria(GdSale.class);
            c.add(Restrictions.eq("ids", ids));
            l = c.list();
        } catch (Exception e) {

        }
        System.out.println("List in Godown Saleis -------" + l);
        return l;
    }

    public GdSalesDto saleUpdate(GdSalesDto f1) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();

        try {
            //   GdPurchase gd=new GdPurchase();
            //  System.out.println("IDS ISSSSSSSSSSSSSS"+f1.getIds());
            String cName = f1.getCname();
            String productType = f1.getPtype();
            String vehicleNo = f1.getVno();
            String remarks = f1.getRemarks();
            Float noOfBales = f1.getNbales();
            Float grossWeight = f1.getGrossWeight();
            System.out.println("ddddddddddmmmmmmm-------===================" + grossWeight);
            Float netWeight = f1.getNetWeight();
            Float tareWeight = f1.getTareWeight();
            //int noOfKgs=f1.getNkgs();
            String date = f1.getDate();
            SimpleDateFormat sf1 = new SimpleDateFormat("dd-MM-yy");
            Date doj1 = sf1.parse(date);
            int idp = f1.getIds();

            GdSale gd = (GdSale) s.get(GdSale.class, idp);
            // gd=(GdPurchase) c.add(Restrictions.eq("idp",idp));
            gd.setDate(doj1);
            gd.setIds(idp);
            gd.setCustomerName(cName);
            gd.setProductType(productType);
            gd.setNoOfBales(noOfBales);
            gd.setVehicleNo(vehicleNo);
            gd.setGrossWeight(grossWeight);
            gd.setNetWeight(netWeight);
            gd.setTareWeight(tareWeight);
            //gd.setNoOfKgs(noOfKgs);
            gd.setRemarks(remarks);
            s.update(gd);
            t.commit();

        } catch (Exception e) {
            s.close();
        }
        return f1;
    }

    public void deletePurchase(int ids) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        try {
            GdSale gd = (GdSale) s.get(GdSale.class, ids);
            s.delete(gd);
            t.commit();
        } catch (Exception e) {
            s.close();
        }
    }

    public boolean check(GdSalesDto gsd) throws ParseException {

        s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        boolean succ = true;
        try {
            List<GdSale> l = new ArrayList<>();

            String dd = gsd.getDate();
            SimpleDateFormat sf1 = new SimpleDateFormat("dd-MM-yy");
            Date doj1 = sf1.parse(dd);
            System.out.println("sjhfj999999999..,,,,,," + dd);
            Date oneDayBefore = new Date(doj1.getTime() - 2);
            System.out.println("shgtfjerhgt........++++++++=//////////............" + oneDayBefore);
            Criteria c = s.createCriteria(GdSale.class);
            l = c.list();
            // c.add(Restrictions.eq("date",oneDayBefore));
            Date d = null;
            for (Object o : l) {
                GdSale gd = (GdSale) o;
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

//         s=HibernateUtil.getSessionFactory().openSession();
//        Transaction t=s.beginTransaction();
//         List<GdSale> l=new ArrayList<>();
//        boolean succ=true;
//        
//         String dd=gsd.getDate();
//        SimpleDateFormat sf1= new SimpleDateFormat("dd-MM-yy");
//         Date doj1=sf1.parse(dd);
//         System.out.println("sjhfj999999999..,,,,,,"+dd);
//        Date oneDayBefore = new Date(doj1.getTime() - 2);
//        System.out.println("shgtfjerhgt........++++++++=//////////"+oneDayBefore);
//        Criteria c=s.createCriteria(GdSale.class);
//        c.add(Restrictions.eq("date",oneDayBefore));
//          l=c.list();
//         System.out.println("shgtfjerhgt.....................----------"+dd+"..."+l);
//         if(l.size()>0){
//            succ=true;
//          }else{
//             succ = false;
//          }
//          t.commit();
//       System.out.println("........................"+succ);
//        return succ; 
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
        List<Date> l = null;
        Date d = null;
        List l2 = new ArrayList();
        try {
            Criteria c = s.createCriteria(GdSale.class).setProjection(Projections.projectionList().add(Projections.max("date")));;
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
}
