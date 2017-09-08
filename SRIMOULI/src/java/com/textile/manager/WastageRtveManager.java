/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.manager;

import com.textile.dto.WastageDto;
import com.textile.model.ChildGdWastage;
import com.textile.model.Login;
import com.textile.model.ParentGdWastage;
import com.textile.util.HibernateUtil;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author ch.mounika
 */
public class WastageRtveManager {

    public List RetriveWastage(WastageDto pp) throws ParseException {

        List<ParentGdWastage> list = new ArrayList<>();
        List<ChildGdWastage> list1 = new ArrayList<>();

        String d = pp.getDate();
        String d1 = pp.getDate1();
        String receipt = pp.getReceipt();

        try {
            Session s = HibernateUtil.getSessionFactory().openSession();
            Transaction t = s.beginTransaction();
            SimpleDateFormat st = new SimpleDateFormat("dd-MM-yy");
            Date date = st.parse(d);
            Date date1 = st.parse(d1);
            Criteria c = s.createCriteria(ParentGdWastage.class);
            c.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("receiptNo", receipt));
            list = c.list();
            System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" + list);
            int id = 0;

            for (Object o : list) {
                List l = null;
                ParentGdWastage pq = (ParentGdWastage) o;
                id = pq.getIdw();
                System.out.println("sgrtfrdtytryytglllllllllgg" + id);
                Criteria c1 = s.createCriteria(ChildGdWastage.class);
                c1.add(Restrictions.eq("parentGdWastage.idw", id));
                l = c1.list();
                list1.addAll(l);
                s.flush();
                s.clear();
            }
            t.commit();
            s.close();

        } catch (Exception e) {

        }

        System.out.println("list is" + list1);
        return list1;
    }

    public List wastageList(WastageDto pp) {

        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        String production = "wastage";
        List<Login> list = null;
        try {
            Criteria c = s.createCriteria(Login.class);
            c.add(Restrictions.eq("id", pp.getId()));
            list = c.list();
        } catch (Exception e) {

        }
        System.out.println("list is:------->>>>" + list);
        return list;

    }

    public List wastageList1(int id) {

        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
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

    public List<ParentGdWastage> retrieveCtp(WastageDto pp) {
        String d = pp.getDate();
        String d1 = pp.getDate1();

        List list = null;

        try {
            Session s = HibernateUtil.getSessionFactory().openSession();
            Transaction t = s.beginTransaction();
            SimpleDateFormat st = new SimpleDateFormat("dd-MM-yy");
            Date date = st.parse(d);
            Date date1 = st.parse(d1);
            String receipt = pp.getReceipt();

            Criteria c = s.createCriteria(ParentGdWastage.class);
            c.add(Restrictions.between("date", date, date1));
            list = c.list();

        } catch (Exception e) {

        }
        System.out.println("11111111111111111111111111111111111111111111" + list);
        return list;

    }

}
