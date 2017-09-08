/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.manager;

import com.textile.dto.patternform;
import com.textile.model.Login;
import com.textile.model.PackPatterns;
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
public class patternmanager {

    public patternform insertp(patternform form) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        PackPatterns pp = new PackPatterns();

        try {
            Float conWeight = form.getConWeight();
            Float noOfCones = form.getNoOfCones();
            Float weight = form.getWeight();
            Float tareWeight = form.getTareWeight();
            String packType=form.getPackType();
            pp.setConWeight(conWeight);
            pp.setNoOfCones(noOfCones);
            pp.setTareWeight(tareWeight);
            pp.setWeight(weight);
            pp.setTypeOfPacking(packType);
            System.out.println("pack typeeeeeeeeeeeeeeeeeeeeeeeeeeeee"+packType);
            s.save(pp);
            t.commit();
        } catch (Exception e) {
            System.out.println("\n Exception caught during insertionnnnnnnnnnnn" + e);
            e.printStackTrace();

        } finally {
            s.close();
        }

        return form;

    }

    public List settingsList(patternform form) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        String control = "control";
        int id = form.getIdp();
        System.out.println("101010999999999999999999" + id);
        List<Login> list = new ArrayList();
        System.out.println("list is-------------" + form.getIdp());
        try {
            Criteria c = s.createCriteria(Login.class);
            c.add(Restrictions.eq("id", form.getIdp()));
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
            System.out.println("Exception" +e);

        }
        System.out.println("list is:------->>>>" + list);
        return list;
    }
    

    public List<PackPatterns> retrieve() {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<PackPatterns> list = null;
        try {
            Criteria c = s.createCriteria(PackPatterns.class);
            list = c.list();
            t.commit();
        } catch (Exception e) {
            System.out.println("Exception caught during retrieveeeeeeeeeeeeeeeeee" + e);
        }
        System.out.println("8888888888888888888888" + list);
        return list;
    }
    


    public void delete1(int id) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        PackPatterns s1 = new PackPatterns();
        Criteria cr = s.createCriteria(PackPatterns.class);
        s1 = (PackPatterns) cr.add(Restrictions.eq("idp", id)).uniqueResult();
        s.delete(s1);
        t.commit();

    }


    public List<patternform> editpatterns(int id1) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List l = null;

        try {
            Criteria cr = s.createCriteria(PackPatterns.class);
            cr.add(Restrictions.eq("idp", id1)).uniqueResult();
            l = cr.list();
            System.out.println("dfhgkhg-------------dkg" + id1);
        } catch (Exception e) {
            System.out.println("\n bbbbbbbbbbbbbbbbbbbb" + l + id1);
        }
        t.commit();
        s.close();
        return l;
    }
    
    
    

    public patternform updatepattern(patternform form, int idp) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        //PackPatterns e =new PackPatterns();
        try {
            PackPatterns e = (PackPatterns) s.get(PackPatterns.class, form.getIdp());
            e.setConWeight(form.getConWeight());
            e.setNoOfCones(form.getNoOfCones());
            e.setTareWeight(form.getTareWeight());
            e.setWeight(form.getWeight());
            e.setTypeOfPacking(form.getPackType());
            e.setIdp(form.getIdp());

            // e.setEmpTypeId(form.getEmpTypeId());
            // e.setDescription(empf.getDescription());
            s.update(e);
            t.commit();
        } catch (HibernateException he) {
            System.out.println("Exception during  Updation " + he);
        } finally {
            s.close();
        }
        return form;
    }

    public boolean exists(patternform form) {
        System.out.println("-----<<<<>>>>>>----home----??????????------------");

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();

        System.out.println("-------------------ssssssssssss");
        Float con = form.getConWeight();
        Float nocon = form.getNoOfCones();
         Float tare = form.getTareWeight();
         String pk=form.getPackType();
        String sql = "select * from pack_patterns  where con_weight=:con and no_of_cones=:nocon and tare_weight=:tare and type_of_packing=:pk";
        Query query = session.createSQLQuery(sql);
        query.setParameter("con", con);
        query.setParameter("nocon", nocon);
        query.setParameter("tare", tare);
         query.setParameter("pk", pk);
        List<Login> list = query.list();

        if (list.size() > 0) {
            //session.close();
            return false;
        }
        t.commit();
        session.close();

        //session.getTransaction().rollback();
        return true;
    }

}
