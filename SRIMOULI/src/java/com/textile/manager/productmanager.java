/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.manager;

import com.textile.dto.Stockform;
import com.textile.dto.productname;
import com.textile.model.Login;
import com.textile.model.ProductsSample;
import com.textile.model.Stock;
import com.textile.util.HibernateUtil;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author nsg
 */
public class productmanager {

    Session s = null;

    public productname insert2(productname form, Stockform stock) {
        s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List l=new ArrayList();
        try {
            ProductsSample p = new ProductsSample();
            String pname = form.getProductName();
            String type = form.getPartialType();
             
            String[] ect = type.split(",");
            System.out.println("hlooooooooooooo" + ect.length);
            for (int i = 0; i < ect.length; i++) {

                if (ect[i].equals("Purchase")) {
                    p.setPartialType("Purchase");
                } else if (ect[i].equals("Issue to Department")) {
                    p.setPartialType("Issue to Department");
                }
                if (ect[i].equals("Issue to pre-cleaning")) {
                    p.setPartialType("Issue to pre-cleaning");
                } else if (ect[i].equals("Wastage")) {
                    p.setPartialType("Wastage");
                }
                if (ect[i].equals("Sale")) {
                    p.setPartialType("Sale");
                } else if (ect[i].equals("Stock Report")) {
                    p.setPartialType("Stock Report");
                }
                p.setProductName(pname);
                p.setPartialType(type);
                s.save(p);
                t.commit();
                Session s1 = HibernateUtil.getSessionFactory().openSession();
                Transaction t1 = s1.beginTransaction();
                
                 Criteria c = s1.createCriteria(Stock.class);
            c.add(Restrictions.eq("variety", pname));
                l = c.list();
                if(l.size()>0){
                    for(Object o:l){
                        Stock st=(Stock)o;
                         SimpleDateFormat sf1 = new SimpleDateFormat("dd-MM-yy");
                Date d2 = sf1.parse(stock.getDate());
                st.setDate(d2);
                st.setVariety(pname);
                float f1 = stock.getStockQuantity();
                float f2 = stock.getStockKgs();
                st.setStockQuantity(f1);
                st.setStockKgs(f2);
                st.setVariety(form.getProductName());
                float f3 = f2 / f1;
                st.setStockAvg(f3);
                s1.update(st);
                    }
                }
                else{
                
                Stock st = new Stock();
                float f1=0,f2=0,f3=0;
                if(stock.getStockQuantity()!=null)
                    f1 = stock.getStockQuantity();
                if(stock.getStockKgs()!=null)
                    f2 = stock.getStockKgs();
                st.setStockQuantity(f1);
                st.setStockKgs(f2);
                st.setVariety(form.getProductName());
                if(f1!=0 && f2!=0)
                    f3 = f2 / f1;
                st.setStockAvg(f3);
               
//                Calendar cal = Calendar.getInstance();
//                String d1 = "31" + "-" + "03" + "-" + cal.getWeekYear();
//                System.out.println("ooooooooooooooooo" + d1);

                SimpleDateFormat sf1 = new SimpleDateFormat("dd-MM-yy");
                Date d2 = sf1.parse(stock.getDate());
                st.setDate(d2);
                s1.save(st);
                
                }
                t1.commit();
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return form;
    }

    public List settingsList(productname form) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        String control = "control";
        int id = form.getIdl();
        System.out.println("101010999999999999999999" + id);
        List<Login> list = new ArrayList();
        System.out.println("list is-------------" + form.getIdl());
        try {
            Criteria c = s.createCriteria(Login.class);
            c.add(Restrictions.eq("id", form.getIdl()));
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
        //   int id=form.getIds();
        System.out.println("101010999999999999999999" + id);
        List<Login> list = new ArrayList();
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

    public List<ProductsSample> retrieve1() {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<ProductsSample> list = null;
        try {
            System.out.println("valuessssssssssss" + list);
            Criteria c = s.createCriteria(ProductsSample.class);
            list = c.list();
        } catch (HibernateException he) {
            System.out.println("\n Hibernate Exception during display");
            he.printStackTrace();

        } catch (Exception e) {
            System.out.println("\n exception caught during display");
            e.printStackTrace();
        }
        return list;

    }

    public void delete1(int id1) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        ProductsSample s1 = new ProductsSample();
        Criteria cr = s.createCriteria(ProductsSample.class);
        s1 = (ProductsSample) cr.add(Restrictions.eq("idl", id1)).uniqueResult();
        s.delete(s1);
        t.commit();

    }

    public List productEdit1(int id1) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        List l = null;
        try {
            Criteria c = session.createCriteria(ProductsSample.class);
            c.add(Restrictions.eq("idl", id1)).uniqueResult();
            l = c.list();
            System.out.println("\n dddddddddddddddddd" + l);
        } catch (HibernateException h) {
            System.out.println("Hibernate Exception during edit" + h);
        } catch (Exception e) {
            System.out.println("Exception during edit" + e);
        } finally {
            //session.close();
        }
        return l;
    }

    public List productEdit(int id1, String v) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        List l = null;
        try {
//            Criteria c = session.createCriteria(ProductsSample.class);
//            c.add(Restrictions.eq("idl", id1)).uniqueResult();
            Criteria c1 = session.createCriteria(Stock.class);
            c1.add(Restrictions.eq("variety", v)).uniqueResult();
           // l = c.list();
            l = c1.list();
            System.out.println("\n iiiiiiiiiiiiii" + l+"***********"+l);
        } catch (HibernateException h) {
            System.out.println("Hibernate Exception during edit" + h);
        } catch (Exception e) {
            System.out.println("Exception during edit" + e);
        } finally {
            //session.close();
        }
        return l;
    }

    public productname productUpdate(productname form, int idl, Stockform stock) {
        s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        try {
            System.out.println("\n formmmmmmmmmmmmmmmmm" + idl);
            ProductsSample p = (ProductsSample) s.get(ProductsSample.class, idl);
            //String pname=form.getProductName();
            String type = form.getPartialType();
            String[] ect = type.split(",");
            System.out.println("hlooooooooooooo" + ect.length);
            String x=form.getProductName();

            for (int i = 0; i < ect.length; i++) {

                if (ect[i].equals("Purchase")) {
                    p.setPartialType("Purchase");
                } else if (ect[i].equals("Issue to Department")) {
                    p.setPartialType("Issue to Department");
                }
                if (ect[i].equals("Issue to pre-cleaning")) {
                    p.setPartialType("Issue to pre-cleaning");
                } else if (ect[i].equals("Wastage")) {
                    p.setPartialType("Wastage");
                } else if (ect[i].equals("Sale")) {
                    p.setPartialType("Sale");
                } else if (ect[i].equals("Stock Report")) {
                    p.setPartialType("Stock Report");
                }
                p.setProductName(form.getProductName());
                p.setPartialType(type);
            }
            s.update(p);
            t.commit();
            
            //System.out.println("variety issssssssssssssss"+ids);
            
            Session s1 = HibernateUtil.getSessionFactory().openSession();
            Transaction t1 = s1.beginTransaction();
           
             Stock st=new Stock();
             Criteria c1 = s1.createCriteria(Stock.class);
             System.out.println("the product name in product manager of pudate product is---------------------->"+x);
             st = (Stock) c1.add(Restrictions.eq("variety", x)).uniqueResult();
            s1.clear();
            //Stock st = new Stock();
            float f1 = stock.getStockQuantity();
            float f2 = stock.getStockKgs();
            st.setIds(stock.getIds());
            st.setStockQuantity(f1);
            st.setStockKgs(f2);
           // st.setVariety(form.getProductName());
            float f3 = f2 / f1;
            st.setStockAvg(f3);
            s1.update(st);
            t1.commit();

        } catch (HibernateException h) {
            System.out.println("\n hibernate exception during update");
            h.printStackTrace();
        } catch (Exception e) {
            System.out.println("\n exception during update");
            e.printStackTrace();
        }
        return form;

    }

    public boolean productvalidate(String productName) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        System.out.println("?????????????????" + productName);
        try {
            List<ProductsSample> list = null;
            Criteria c = s.createCriteria(ProductsSample.class);
            c.add(Restrictions.eq("productName", productName));
            list = c.list();
            System.out.println("list issssssssssss" + list);
            if (list.size() > 0) {
                return true;
            }
            t.commit();
        } catch (Exception e) {

        }
        return false;
    }

}
