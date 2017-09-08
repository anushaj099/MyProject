/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.manager;

import com.textile.dto.PowerDTO;
import com.textile.model.FinancialYearBackup;
import com.textile.model.Login;
import com.textile.model.Powerunits;
import com.textile.model.Superviser;
import com.textile.util.HibernateUtil;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author anusha
 */
public class PowerManager {

    public List<Powerunits> retrieve() {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();

        List<Powerunits> glist = null;
        try {
            Criteria c = s.createCriteria(Powerunits.class);
            //c.add(Restrictions.eq("employeeId", employeeId));
            glist = c.list();
            System.out.println("list is" + glist);
            t.commit();
        } catch (Exception e) {
            System.out.println(e);
        }
        System.out.println(glist);
        return glist;
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

    public void delete(int id1) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        Powerunits pc = new Powerunits();
        Criteria cr = s.createCriteria(Powerunits.class);
        pc = (Powerunits) cr.add(Restrictions.eq("ide", id1)).uniqueResult();
        s.delete(pc);
        t.commit();
    }

    public List powerList(PowerDTO form) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        String power = "electricity";
        List<Login> list = null;
        System.out.println("list is-------------" + form.getId());
        try {
            Criteria c = s.createCriteria(Login.class);
            c.add(Restrictions.eq("id", form.getId()));
            list = c.list();
        } catch (Exception e) {

        }
        System.out.println("list is:------->>>>" + list);
        return list;

    }

    public List powerList(int id) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        String power = "electricity";
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

    public PowerDTO insertPower(PowerDTO pd, String dat, String superviser, String shifts) {

        System.out.println("----------due to  insertion----->");
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        Powerunits pu = new Powerunits();

        try {
            System.out.println("lllllllllllllggggggggg");
            System.out.println("lkdfj======---------------------" + dat);
            String doj = dat;
            SimpleDateFormat st = new SimpleDateFormat("dd-MM-yy");
            Date date = st.parse(doj);
            System.out.println("=========================" + date);

            pu.setDate(date);
            pu.setShifts(shifts);
            pu.setSuperviser(superviser);
            pu.setBlowRoom(pd.getBlowRoom());
            pu.setWrs(pd.getWrs());
            pu.setPrep(pd.getPrep());
            pu.setOe1(pd.getOe1());
            pu.setOe2(pd.getOe2());
            pu.setOe3(pd.getOe3());
            pu.setOe4(pd.getOe4());
            pu.setOe5(pd.getOe5());
            pu.setOe6(pd.getOe6());
            pu.setHmPlant(pd.getHmPlant());
            pu.setCompressor(pd.getCompressor());
            pu.setLighting(pd.getLighting());
            pu.setRoPlant(pd.getRoPlant());
            pu.setYcp(pd.getYcp());
            pu.setBalePress(pd.getBalePress());
            pu.setFireDump(pd.getFireDump());
            pu.setPreCleaning(pd.getPreCleaning());
            pu.setTotal(pd.getTotal());
            s.save(pu);

            t.commit();

        } catch (Exception ex) {
            System.out.println("Error due to  insertion----->" + ex);

        } finally {
            s.close();
        }
        return pd;
    }

    public boolean powerInsVal(PowerDTO form) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        boolean p = false;
        try {
            String z = form.getShifts();
            System.out.println("lsflj-----" + z);
            List l = null;
            Criteria c = s.createCriteria(Powerunits.class);
            String sd = form.getDate();
            System.out.println("dfgj------------" + sd);
            SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yy");
            Date d1 = sf.parse(sd);
            c.add(Restrictions.eq("date", d1));
            l = c.list();
            for (Object o : l) {
                Powerunits pd = (Powerunits) o;
                if (pd.getShifts().equals(z)) {
                    p = true;
                }
                System.out.println("lghg-------" + p);
            }
        } catch (Exception ep) {
            System.out.println("------drawing insert----validate---" + ep);
        }
        if (!p) {
            Powerunits pd = new Powerunits();
        }
        return p;
    }

    public List powervallist(PowerDTO form) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List l = null;
        try {
            String sd = form.getDate();
            System.out.println("dfgj------------" + sd);
            SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yy");
            Date d1 = sf.parse(sd);

            Powerunits pc = new Powerunits();
            Criteria c = s.createCriteria(Powerunits.class);
            c.add(Restrictions.eq("date", d1));
            System.out.println("hhhhhhhhhhhhhh");
            l = c.list();
            System.out.println("sdfafdasdfsafaf" + l);
        } catch (Exception e) {

        }
        t.commit();
        return l;
    }

    public List<PowerDTO> editPower(int id1) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List l = null;
        try {
            Criteria cr = s.createCriteria(Powerunits.class);
            cr.add(Restrictions.eq("ide", id1)).uniqueResult();
            l = cr.list();
            System.out.println("dfhgkhg-------------dkg" + l);
        } catch (Exception e) {
            System.out.println("\n bbbbbbbbbbbbbbbbbbbb" + l + id1);
        }
        return l;
    }

    public void powerUpdate(PowerDTO pd, int pow) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();

        try {
            Criteria cr = s.createCriteria(Powerunits.class);
            Powerunits pu = (Powerunits) cr.add(Restrictions.eq("ide", pow)).uniqueResult();
            //  Powerunits p=new Powerunits();
            String doj = pd.getDate();
            SimpleDateFormat st = new SimpleDateFormat("dd-MM-yy");
            Date date = st.parse(doj);
            pu.setDate(date);

            //p.setId(form.getId());
            pu.setShifts(pd.getShifts());
            pu.setSuperviser(pd.getSuperviser());
            pu.setBlowRoom(pd.getBlowRoom());
            pu.setWrs(pd.getWrs());
            pu.setPrep(pd.getPrep());
            pu.setOe1(pd.getOe1());
            pu.setOe2(pd.getOe2());
            pu.setOe3(pd.getOe3());
            pu.setOe4(pd.getOe4());
            pu.setOe5(pd.getOe5());
            pu.setOe6(pd.getOe6());
            pu.setHmPlant(pd.getHmPlant());
            pu.setCompressor(pd.getCompressor());
            pu.setLighting(pd.getLighting());
            pu.setRoPlant(pd.getRoPlant());
            pu.setYcp(pd.getYcp());
            pu.setBalePress(pd.getBalePress());
            pu.setFireDump(pd.getFireDump());
            pu.setPreCleaning(pd.getPreCleaning());
            pu.setTotal(pd.getTotal());

            s.update(pu);
            System.out.println("updateeeeeeeeee" + pd.getDate());
            System.out.println("updateeeeeeeeee" + pd.getShifts());
            t.commit();

        } catch (Exception e) {
            System.out.println(e);

        }

    }

    public List RetrivePower(PowerDTO pt) throws ParseException {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<Powerunits> list = new ArrayList<>();
        String superviser = pt.getSuperviser();
        System.out.println("--------------------------->" + superviser);

        String dor = pt.getDate();
        //System.out.println("--------------------------->"+dor);
        String dor1 = pt.getDate1();
        String shifts = pt.getShifts();

        try {
            SimpleDateFormat st = new SimpleDateFormat("dd-MM-yy");
            Date date = st.parse(dor);
            System.out.println("--------------------------->" + date);
            Date date1 = st.parse(dor1);
            System.out.println("--------------------------->" + date1);
            if (shifts.equals("Whole day")) {
                Criteria c = s.createCriteria(Powerunits.class);
                c.add(Restrictions.between("date", date, date1));
                list = c.list();
            } else {

                Criteria c = s.createCriteria(Powerunits.class);
                c.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("superviser", superviser)).add(Restrictions.eq("shifts", shifts));
                list = c.list();
                System.out.println("----------------------11111--->" + list);
            }
            System.out.println("----------------------0000--->" + list);
            t.commit();

        } catch (Exception e) {

        }

        System.out.println("list is" + list);
        return list;
    }

    public boolean check(PowerDTO form) throws ParseException {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        boolean succ = true;
        try {
            List<Powerunits> l = new ArrayList<>();

            String dd = form.getDate();
            SimpleDateFormat sf1 = new SimpleDateFormat("dd-MM-yy");
            Date doj1 = sf1.parse(dd);
            System.out.println("sjhfj999999999..,,,,,," + dd);
            Date oneDayBefore = new Date(doj1.getTime() - 2);
            System.out.println("shgtfjerhgt........++++++++=//////////............" + oneDayBefore);
            Criteria c = s.createCriteria(Powerunits.class);
            l = c.list();
            // c.add(Restrictions.eq("date",oneDayBefore));
            Date d = null;
            for (Object o : l) {
                Powerunits gd = (Powerunits) o;
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
        Transaction t = s.beginTransaction();
        List<Date> l = null;
        Date d = null;
        List l1 = null, l2 = new ArrayList();
        try {
            Criteria c = s.createCriteria(Powerunits.class).setProjection(Projections.projectionList().add(Projections.max("date")));;
            l = c.list();
            System.out.println("//////////////" + l);
            for (int i = 0; i < l.size(); i++) {
                d = l.get(i);
                dd = d;
            }

            Criteria c1 = s.createCriteria(Powerunits.class).add(Restrictions.eq("date", d));
            l1 = c1.list();
            for (Object o : l1) {
                Powerunits p = (Powerunits) o;
                String s1 = p.getShifts();
                l2.add(s1);
            }
        } catch (Exception e) {

        }
        System.out.println(">>>>>>>>>>>>>>>>" + l2);
        System.out.println("<<<<<<<<<<<<<<<<" + l2.size());
        return l2;
    }

}
