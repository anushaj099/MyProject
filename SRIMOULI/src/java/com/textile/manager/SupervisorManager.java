/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.manager;

import com.textile.dto.SupervisorForm;
import com.textile.model.Login;
import com.textile.model.Superviser;
import com.textile.util.HibernateUtil;
import java.util.ArrayList;
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
public class SupervisorManager {

    Session s = null;

    public SupervisorForm insert2(SupervisorForm form) {
        s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        Superviser sm = new Superviser();
        try {
            String name = form.getName();
            sm.setName(name);
            s.save(sm);
            t.commit();
        } catch (HibernateException he) {
            System.out.println("Exception caught");
        } catch (Exception e) {
            System.out.println("Exception caught");

        } finally {
            s.close();
        }
        return form;
    }

    public List settingsList(SupervisorForm form) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        String control = "control";
        int id = form.getIds();
        System.out.println("101010999999999999999999" + id);
        List<Login> list = new ArrayList();
        System.out.println("list is-------------" + form.getIds());
        try {
            Criteria c = s.createCriteria(Login.class);
            c.add(Restrictions.eq("id", form.getIds()));
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

    public List<Superviser> retrieve1(int id) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<Superviser> list = null;
        try {
            System.out.println("valuessssssssssss" + list);
            Criteria c = s.createCriteria(Superviser.class);
            list = c.list();
        } catch (HibernateException he) {
            System.out.println("exception caught" + he);

        } catch (Exception e) {
            System.out.println("exception caught" + e);
        }
        return list;

    }

    public void delete1(int id1) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        Superviser s1 = new Superviser();
        Criteria cr = s.createCriteria(Superviser.class);
        s1 = (Superviser) cr.add(Restrictions.eq("ids", id1)).uniqueResult();
        s.delete(s1);
        t.commit();

    }

    public boolean countvalidate(String name) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        try {
            List<Superviser> list = null;
            Criteria c = s.createCriteria(Superviser.class);
            c.add(Restrictions.eq("name", name));
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
