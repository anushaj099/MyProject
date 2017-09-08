/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.manager;

import com.textile.dto.packernameform;
import com.textile.model.Login;
import com.textile.model.PackerName;
import com.textile.util.HibernateUtil;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author nsg
 */
public class PackerManager {

    Session s = null;

    public packernameform insert2(packernameform form) {
        s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        PackerName sm = new PackerName();
        try {
            String packerName = form.getPackerName();
            sm.setPackerName(packerName);
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

    public List settingsList(packernameform form) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        String control = "control";
        int id = form.getIdn();
        System.out.println("101010999999999999999999" + id);
        List<Login> list = new ArrayList();
        System.out.println("list is-------------" + form.getIdn());
        try {
            Criteria c = s.createCriteria(Login.class);
            c.add(Restrictions.eq("id", form.getIdn()));
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

    public List<PackerName> retrieve1() {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<PackerName> list = null;
        try {
            System.out.println("valuessssssssssss" + list);
            Criteria c = s.createCriteria(PackerName.class);
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
        PackerName s1 = new PackerName();
        Criteria cr = s.createCriteria(PackerName.class);
        s1 = (PackerName) cr.add(Restrictions.eq("idn", id1)).uniqueResult();
        s.delete(s1);
        t.commit();

    }

    public boolean exists(packernameform form) {
        
         System.out.println("-----<<<<pp.....>>>>>>----home----??????????------------");

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();

       
         String pk=form.getPackerName();
        String sql = "select * from packer_name where packer_name=:pk";
        Query query = session.createSQLQuery(sql);
        query.setParameter("pk", pk);
       
        List list = query.list();

        if (list.size() > 0) {
            //session.close();
            System.out.println("the sldfjsljf");
            return false;
        }
        t.commit();
        session.close();

        //session.getTransaction().rollback();
        return true;
        
    }

}
