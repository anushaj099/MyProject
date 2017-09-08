/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.manager;

import com.textile.dto.countform;
import com.textile.model.Counts;
import com.textile.model.Login;
import com.textile.util.HibernateUtil;
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
public class CountManager {

    //   Session s=null;
    public countform insertcount(countform l) {
        Session s1 = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = s1.beginTransaction();
        Counts c = new Counts();
        try {
            System.out.println("kkkkkkkkkkkk" + l.getCount()+".........."+l.getOpenStock());
            String count = l.getCount();
            float open = 0;
            if(l.getOpenStock()!=null)
                open=l.getOpenStock();
            System.out.println("inserted succesfully");
            System.out.println("printed " + count);
            c.setCount(count);
            c.setOpenStock(open);
            s1.save(c);
            tx.commit();
        } catch (Exception e) {
            System.out.println("Exception is caught" + e.getMessage());
        } finally {
            //   s1.close();
        }
        return l;
    }

    public List settingsList(countform l) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        String control = "control";
        List<Login> list = null;
        System.out.println("list is-------------" + l.getId());
        try {
            Criteria c = s.createCriteria(Login.class);
            c.add(Restrictions.eq("id", l.getId()));
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

    public List<Counts> retrieve() {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<Counts> list = null;
        try {
            Criteria c = s.createCriteria(Counts.class);
            list = c.list();
            t.commit();
        } catch (HibernateException he) {
            System.out.println("Exception caught" + he);

        } catch (Exception e) {
            System.out.println("Exception caught" + e);
        }
        System.out.println("8888888888888888888888" + list);
        return list;
    }

    public void deletecount(int id1) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        Counts c = new Counts();
        Criteria cr = s.createCriteria(Counts.class);
        c = (Counts) cr.add(Restrictions.eq("idm", id1)).uniqueResult();
        s.delete(c);
        System.out.println("deltedddddd" + id1);
        t.commit();

    }

    public boolean countvalidate(String count) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        System.out.println("?????????????????" + count);
        try {
            List<Counts> list = null;
            Criteria c = s.createCriteria(Counts.class);
            c.add(Restrictions.eq("count", count));
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
