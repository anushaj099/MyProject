/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.manager;

import com.textile.dto.SalesDto;
import com.textile.model.GdSale;
import com.textile.model.Login;
import com.textile.util.HibernateUtil;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author ch.mounika
 */
public class SalesManager {

    Session s = null;

    public List RetriveGds(SalesDto sd) throws ParseException {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<GdSale> list = new ArrayList<>();

        String dor = sd.getDate();
        String dor1 = sd.getDate1();
        //System.out.println("--------------------------->"+dor);
        try {
            SimpleDateFormat st = new SimpleDateFormat("dd-MM-yy");
            Date date = st.parse(dor);
            System.out.println("--------------------------->" + date);
            Date date1 = st.parse(dor1);
            System.out.println("---------+++++++--------->" + date1);

            Criteria c = s.createCriteria(GdSale.class);
            c.add(Restrictions.between("date", date, date1));
            list = c.list();
            System.out.println("----------------------0000--->" + list);

//          String hql = "FROM PurchaseDto pd where pd.date BETWEEN date AND date1";
//            Query query = s.createQuery(hql);
//            list = query.list();
            t.commit();

        } catch (Exception e) {

        }

        System.out.println("list is" + list);
        return list;
    }

    public List MiniRetriveGds(SalesDto sd) throws ParseException {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<GdSale> list = new ArrayList<>();
        String dor = sd.getDate();
        String dor1 = sd.getDate1();
        //System.out.println("--------------------------->"+dor);
        try {
            List l = null;
            SimpleDateFormat st = new SimpleDateFormat("dd-MM-yy");
            Date date = st.parse(dor);
            System.out.println("---------------mmm------------>" + date);
            Date date1 = st.parse(dor1);
            System.out.println("--------jjjjjj------->" + date1);
            String exp = sd.getPtype();
            String a[] = exp.split(", ");
            for (int i = 0; i < a.length; i++) {
                Criteria c = s.createCriteria(GdSale.class);
                c.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("productType", a[i]));
                l = c.list();
                list.addAll(l);
                System.out.println("svvvvvvvvvvvvvvvvvvvvv'''''''''''''''------------------" + list);
                s.flush();
                s.clear();
            }

            System.out.println("----------------------0000--->" + list);

            t.commit();
        } catch (Exception e) {
            
        }

        System.out.println("list is" + list);
        return list;
    }

    public List saleList(SalesDto sd) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        String purchase = "purchase";
        List<Login> list = null;
        System.out.println("list is-------------" + sd.getId());
        try {
            Criteria c = s.createCriteria(Login.class);
            c.add(Restrictions.eq("id", sd.getId()));
            list = c.list();
        } catch (Exception e) {

        }
        System.out.println("list is:------->>>>" + list);
        return list;
    }

    public List saleList1(int id) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        //  String purchase="purchase";
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

    public List getProductList() {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<String> p = new ArrayList<>();
        /* List<GodownProduct> l=(List<GodownProduct>)s.createCriteria(GodownProduct.class).list();
       for(GodownProduct d : l)
       {
            p.add(d.getProduct());
       }*/
        String sql = "select product_name from products_sample where partial_type like '%Sale%'";
        SQLQuery query = s.createSQLQuery(sql);
        p = query.list();
        System.out.println("list saranyaaaaaaaaaaaaaaaaa" + p);
        return p;

    }

}
