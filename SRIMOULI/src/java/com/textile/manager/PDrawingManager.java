/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.manager;

import com.textile.dto.ParentDrawingForm;
import com.textile.model.ChildDrawing;
import com.textile.model.Login;
import com.textile.model.ParentDrawing;
import com.textile.model.Superviser;
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
 * @author NSG
 */
public class PDrawingManager {

//    public List<ParentDrawing> DrawingRetrieve(ParentDrawingForm form) throws ParseException {
//         Session s=HibernateUtil.getSessionFactory().openSession();
//        Transaction t=s.beginTransaction();
//        List<ParentDrawing> list= new ArrayList<>();
//         String employeeId=form.getEmployeeId();
//        String shifts=form.getShifts();
//         String date1=form.getDate();
//             SimpleDateFormat sf=new SimpleDateFormat("dd-MM-yy");
//             Date date=sf.parse(date1);
//             System.out.println(shifts);
//            if(shifts.equals("Day"))
//            {
//                Criteria c=s.createCriteria(ParentDrawing.class);
//                c.add(Restrictions.eq("date", date));  
//                list=c.list();
//                t.commit();
//            }
//            else
//            {
//                Criteria c=s.createCriteria(ParentDrawing.class);
//                c.add(Restrictions.eq("date", date)).add(Restrictions.eq("employeeId",employeeId)).add(Restrictions.eq("shifts", shifts));
//                list=c.list();
//                t.commit();
//            }
//                System.out.println("List is"+list);
//               
//                s.close();
//                 
//                 
//                return list;
//             }
    public List drawingList(ParentDrawingForm form1) {

        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        String drawing = "drawing";
        List<Login> list = null;
        try {
            Criteria c = s.createCriteria(Login.class);
            c.add(Restrictions.eq("id", form1.getId()));
            list = c.list();
        } catch (Exception e) {

        }
        System.out.println("list is:------->>>>" + list);
        return list;
    }

    public List drawingList1(int id) {

        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        String drawing = "drawing";
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

    public List<ParentDrawing> DrawingRetrieve(ParentDrawingForm form1) throws ParseException {

        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<ParentDrawing> list = new ArrayList<>();
        String superviser = form1.getSuperviser();
        String shifts = form1.getShifts();
        String d = form1.getDate();
        String d1 = form1.getDate1();
        SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yy");
        Date date = sf.parse(d);
        Date date1 = sf.parse(d1);
        System.out.println(shifts);
        if (shifts.equals("Whole Day")) {
            Criteria c = s.createCriteria(ParentDrawing.class);
            c.add(Restrictions.between("date", date, date1));
            list = c.list();
            t.commit();
        } else {
            Criteria c = s.createCriteria(ParentDrawing.class);
            c.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("shifts", shifts));
            list = c.list();
            t.commit();
        }
        System.out.println("List is" + list);

        s.close();

        return list;
    }

    public List getSuperviser() {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<String> dept = new ArrayList<>();
        List<Superviser> l = (List<Superviser>) s.createCriteria(Superviser.class).list();
        for (Superviser d : l) {
            dept.add(d.getName());
        }
        return dept;
    }

    public List DrawingRetrieveMain(ParentDrawingForm form1, String m1) throws ParseException {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<ParentDrawing> list = new ArrayList<>();
        List<ChildDrawing> list1 = new ArrayList<>();
        System.out.println("\n ffffffffffffffffff");
        ChildDrawing ch = new ChildDrawing();
        String d = form1.getDate();
        String d1 = form1.getDate1();
        SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yy");
        Date date = sf.parse(d);
        Date date1 = sf.parse(d1);
        String shift = form1.getShifts();
        System.out.println("\n shift is" + shift);
        Criteria c = s.createCriteria(ParentDrawing.class);
        if (shift.equals("Whole Day")) {
            System.out.println("\n lllllllllllll" + list);
            Criteria c1 = s.createCriteria(ParentDrawing.class);
            c1.add(Restrictions.between("date", date, date1));
            list = c1.list();
            System.out.println("\n hhhhhhhhhhhhhhh" + list);
            t.commit();
        } else {
            Criteria c2 = s.createCriteria(ParentDrawing.class);
            c2.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("shifts", shift));
            list = c2.list();
            t.commit();
        }
//         c.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("shifts", shift));
//         list=c.list();
        System.out.println("\n dddddddddddddddd" + list);
        // t.commit();
        s.close();

        Session s1 = HibernateUtil.getSessionFactory().openSession();
        Transaction t1 = s1.beginTransaction();
        int id;
        for (Object o : list) {
            List l = null;
            ParentDrawing pq = (ParentDrawing) o;
            id = pq.getIdd();
            Criteria c1 = s1.createCriteria(ChildDrawing.class);
            System.out.println("\n qqqqqqqqqqqq" + c);
            if (m1.equals("MC-1") || m1.equals("MC-2") || m1.equals("MC-3") || m1.equals("MC-4") || m1.equals("MC-5")) {
                System.out.println("\n ggggggggggg" + c);
                c1.add(Restrictions.eq("parentDrawing.idd", id)).add(Restrictions.eq("carding", m1));
                l = c1.list();
                System.out.println("jkhkj-----11111111------------jnk-------" + l);
                s1.flush();
                s1.clear();
                list1.addAll(l);
                s1.flush();
                s1.clear();
                System.out.println("List is" + l);
            } else if (m1.equals("All")) {
                c1.add(Restrictions.eq("parentDrawing.idd", id));
                l = c1.list();
                System.out.println("jkhkj-----11111111------------jnk-------" + l);
                s1.flush();
                s1.clear();
                list1.addAll(l);
                s1.flush();
                s1.clear();
                System.out.println("List is" + l);
            }
        }
        t1.commit();
        s1.close();

        return list1;

    }

    public List<ParentDrawing> DrawingParent(ParentDrawingForm form1) throws ParseException {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<ParentDrawing> list = new ArrayList<>();
        String d = form1.getDate();
        String d1 = form1.getDate1();
        SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yy");
        Date date = sf.parse(d);
        Date date1 = sf.parse(d1);
        Criteria c = s.createCriteria(ParentDrawing.class);
        c.add(Restrictions.between("date", date, date1));
        list = c.list();
        System.out.println("\n ddddddddddddpppppppppparevttttttdddd" + list);

        t.commit();
        s.close();
        return list;
    }
}
