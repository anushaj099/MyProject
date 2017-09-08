/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.manager;

import com.textile.util.HibernateUtil;
import com.textile.dto.PCarding;
import com.textile.dto.ParentCardingDTO;
import com.textile.model.ChildCarding;
import com.textile.model.Employee;
import com.textile.model.FinancialYearBackup;
import com.textile.model.Login;
import com.textile.model.ParentCarding;
import com.textile.model.Superviser;
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
 * @author Masrat
 */
public class CardingManager {

    public void insertCarding(PCarding pcard, String date, String superv, String shift) throws ParseException {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();

        ParentCarding pc = new ParentCarding();
        try {
            String doj = date;
            System.out.println("\n mmmmmmmmmmmmm" + date + superv);
            SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yy");
            Date doj1 = sf.parse(doj);
            System.out.println("-------------date--------" + doj1);
            pc.setDate(doj1);
            pc.setSuperviser(superv);
            pc.setShifts(shift);
            pc.setTotalActualProduction(pcard.getTotalActualProduction());
            pc.setTotalEfficiency(pcard.getTotalEfficiency());
            pc.setTotalExpectedProduction(pcard.getTotalExpectedProduction());
            s.save(pc);
            t.commit();

            Criteria c = s.createCriteria(ParentCarding.class);
            pc = (ParentCarding) c.add(Restrictions.eq("superviser", superv)).add(Restrictions.eq("shifts", shift)).add(Restrictions.eq("date", doj1)).uniqueResult();
            s.close();

            Session s1 = HibernateUtil.getSessionFactory().openSession();
            // System.out.println("-------pc---------->"+pc);
            List<Float> l1 = pcard.getMcspeed();
            System.out.println("----------------+-------->" + l1);
            List<Float> l2 = pcard.getHank();
            System.out.println("-------------------09------------->" + l2);
            List<String> l3 = pcard.getCarding();
            System.out.println("-------------------09-46------------>" + l3);
            List<Float> l4 = pcard.getMcrun();
            List<Float> l5 = pcard.getExp();
            List<Float> l6 = pcard.getAct();
            List<Float> l7 = pcard.getEffic();
            List<String> l8 = pcard.getBrek();
            List<String> l9 = pcard.getRemk();
            List<Integer> l = pcard.getEmId();

            Transaction t1 = s1.beginTransaction();
            for (int i = 0; i < l1.size(); i++) {
                ChildCarding cc = new ChildCarding();
                cc.setParentCarding(pc);
                System.out.println("--------------------child--------------" + l1.get(i) + "&&&&&" + l5.get(i) + "(((((((((");
                System.out.println("------------------" + l2.get(i) + ")))))))))))" + l3.get(i) + "**" + l4.get(i));
                cc.setCarding((l3.get(i)));
                cc.setMcSpeed(l1.get(i));
                cc.setDeliveryHank(l2.get(i));
                cc.setMcRunning(l4.get(i));
                cc.setExpectedProduction(l5.get(i));
                cc.setActualProduction(l6.get(i));
                cc.setEfficiency(l7.get(i));
                cc.setBreakedInShifts(l8.get(i));
                cc.setRemarks(l9.get(i));
                cc.setEmId(l.get(i));
                System.out.println("--------------------4444444444--------------" + l.get(i));
                s1.save(cc);
                s1.flush();
                s1.clear();
                System.out.println("---------->" + l2.get(i));

            }
            t1.commit();
            s1.close();
        } catch (Exception e) {

        }

    }

    public List cardingList(PCarding pcard) {

        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        String carding = "carding";
        List<Login> list = null;
        System.out.println("list is-------------" + pcard.getId());
        try {
            Criteria c = s.createCriteria(Login.class);
            c.add(Restrictions.eq("id", pcard.getId()));
            list = c.list();
        } catch (Exception e) {

        }
        System.out.println("list is:------->>>>" + list);
        return list;
    }

    public List cardingList(int id) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        String carding = "carding";
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

    public List cardingList1(int id) {

        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        String carding = "carding";
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

    public List getEmployees() {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<Integer> dept = new ArrayList<>();
        List<Employee> l = (List<Employee>) s.createCriteria(Employee.class).list();
        for (Employee d : l) {
            dept.add(d.getEmpId());
        }
        return dept;
    }

    public boolean cardingInsVal(PCarding form) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        boolean p = false;
        try {
            String z = form.getShifts();
            System.out.println("lsflj-----" + z);
            List l = null;
            Criteria c = s.createCriteria(ParentCarding.class);
            String sd = form.getDat();
            System.out.println("dfgj------------" + sd);
            SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yy");
            Date d1 = sf.parse(sd);
            c.add(Restrictions.eq("date", d1));
            l = c.list();
            for (Object o : l) {
                ParentCarding pd = (ParentCarding) o;
                if (pd.getShifts().equals(z)) {
                    p = true;
                }
                System.out.println("lghg-------" + p);
            }
        } catch (Exception ep) {
            System.out.println("------drawing insert----validate---" + ep);
        }
        if (!p) {
            ParentCarding pd = new ParentCarding();
        }
        return p;
    }

    public List packingvallist(PCarding form) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List l = null;
        try {
            String sd = form.getDat();
            System.out.println("dfgj------------" + sd);
            SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yy");
            Date d1 = sf.parse(sd);

            ParentCarding pc = new ParentCarding();
            Criteria c = s.createCriteria(ParentCarding.class);
            c.add(Restrictions.eq("date", d1));
            System.out.println("hhhhhhhhhhhhhh");
            l = c.list();
            System.out.println("sdfafdasdfsafaf" + l);
        } catch (Exception e) {

        }
        t.commit();
        return l;
    }

    public List<ParentCarding> retrieve() {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<ParentCarding> list = null;
        try {
            Criteria c = s.createCriteria(ParentCarding.class);
            list = c.list();
            t.commit();
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<ParentCardingDTO> editCarding(int id1) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List l = null;
        try {
            Criteria cr = s.createCriteria(ParentCarding.class);
            cr.add(Restrictions.eq("idc", id1)).uniqueResult();
            l = cr.list();
            System.out.println("dfhgkhg-------------dkg" + l);
        } catch (Exception e) {
            System.out.println("\n bbbbbbbbbbbbbbbbbbbb" + l + id1);
        }
        return l;
    }

    public List<ChildCarding> childRetrieve(int id1) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();

        List<ChildCarding> l = null;
        try {
            Criteria c = s.createCriteria(ChildCarding.class);
            c.add(Restrictions.eq("parentCarding.idc", id1));
            //c.add(Restrictions.eq("parentQuality.id", id));
            l = c.list();
            System.out.println("aaaaaaaaaaaaaaaa" + l);

            t.commit();
        } catch (Exception e) {
            System.out.println(e);
        }

        return l;
    }

    public PCarding updateCarding(PCarding form, int idc) throws ParseException {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();

        try {
            ParentCarding p = (ParentCarding) s.get(ParentCarding.class, idc);

            String sh = form.getShifts();
            String sname = form.getSuperviser();
            String d = form.getDate();
            SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yy");
            Date date = sf.parse(d);

            p.setShifts(sh);
            p.setSuperviser(sname);
            p.setDate(date);
            // p.setIdc(form.getIdc());
//       p.setTotalActualProduction(act);
//       p.setTotalEfficiency(eff);
//       p.setTotalExpectedProduction(exp);
            p.setTotalActualProduction(form.getTotalActualProduction());
            p.setTotalEfficiency(form.getTotalEfficiency());
            p.setTotalExpectedProduction(form.getTotalExpectedProduction());
            s.update(p);
            System.out.println("hiiiiiiiiiiiiiiii" + form.getSuperviser() + "" + form.getDate());

            ParentCarding p1 = new ParentCarding();
            Criteria c1 = s.createCriteria(ParentCarding.class);
            p1 = (ParentCarding) c1.add(Restrictions.eq("date", date)).add(Restrictions.eq("superviser", sname)).add(Restrictions.eq("shifts", sh)).uniqueResult();
            System.out.println("kjdgh-------32131321--dhg+++++++++++++++");
            t.commit();
            s.close();

            Session s1 = HibernateUtil.getSessionFactory().openSession();
            Transaction t1 = s1.beginTransaction();

//           String sql="delete from ChildQuality ac where ac.parentQuality.id=:id";
//           Query q=s1.createSQLQuery(sql);
//           q.setParameter("id", id);
//           q.executeUpdate();
            List lis = null;

            Criteria c2 = s1.createCriteria(ChildCarding.class);
            lis = c2.add(Restrictions.eq("parentCarding.idc", form.getIdc())).list();
            if (lis != null) {
                for (Object o : lis) {
                    System.out.println("kjdgh---------dhg+++++++++++++++");
                    ChildCarding cq = (ChildCarding) o;
                    s1.delete(cq);
                }
            }

            System.out.println("kjdgh---------dhg+++++54787897++++++++++");

            // int id=p1.getId();
            System.out.println("\n vvvvvvvvvvvvv" + form.getId());
            // Session  s1=HibernateUtil.getSessionFactory().openSession();

            List<Float> l7 = form.getMcspeed();
            System.out.println("6666666666666666666" + l7);
            List<Float> l1 = form.getHank();
            // System.out.println("djgk-----------kk"+form.getMc2Cm());
            List<String> l2 = form.getCarding();
            List<Float> l3 = form.getMcrun();
            List<Float> l4 = form.getExp();
            List<Float> l5 = form.getAct();
            List<Float> l6 = form.getEffic();
            List<String> l8 = form.getBrek();
            List<String> l9 = form.getRemk();
            List<Integer> l10 = form.getEmId();

            //  Transaction t1=s1.beginTransaction();
            for (int i = 0; i < l1.size(); i++) {
                ChildCarding c = new ChildCarding();
                //Criteria c2=s.createCriteria(ChildQuality.class);
                // ChildQuality c=(ChildQuality)c2.add(Restrictions.eq("parentQuality.id",id));
                c.setParentCarding(p1);
                c.setMcSpeed(l7.get(i));
                c.setDeliveryHank(l1.get(i));
                c.setCarding(l2.get(i));
                c.setMcRunning(l3.get(i));
                c.setExpectedProduction(l4.get(i));
                c.setActualProduction(l5.get(i));
                c.setEfficiency(l6.get(i));
                c.setBreakedInShifts(l8.get(i));
                c.setRemarks(l9.get(i));
                c.setEmId(l10.get(i));
                s1.save(c);
                System.out.println("iiiiiiiiiii" + c);
                s1.flush();
                s1.clear();
                // System.out.println("---------->"+l.get(i) +""+l1.get(i));
            }
            t1.commit();
            s1.close();

            System.out.println("\n Quality Inserted Successfully");

        } catch (Exception e) {
            System.out.println(e);
            e.printStackTrace();
        }
        // t.commit();
        //s.close();
        return form;
    }

    public void deletecarding(int id1) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        ParentCarding pc = new ParentCarding();
        Criteria cr = s.createCriteria(ParentCarding.class);
        pc = (ParentCarding) cr.add(Restrictions.eq("idc", id1)).uniqueResult();
        s.delete(pc);
        t.commit();

    }

//  public boolean check(PCarding gsd) throws ParseException {
//        Session s=HibernateUtil.getSessionFactory().openSession();
//      Transaction t=s.beginTransaction();
//        List<ParentCarding> l=new ArrayList<>();
//       boolean succ=true;
//    
//    String dd=gsd.getDate();
//       SimpleDateFormat sf1= new SimpleDateFormat("dd-MM-yy");
//       Date doj1=sf1.parse(dd);
//      Date oneDayBefore = new Date(doj1.getTime() - 2);
//       System.out.println("shgtfjerhgt........++++++++=//////////"+oneDayBefore);
//       Criteria c=s.createCriteria(ParentCarding.class);
//        c.add(Restrictions.eq("date",oneDayBefore));
//         l=c.list();
//        System.out.println("shgtfjerhgt.....................----------"+dd+"..."+l);
//       if(l.size()>0){
//           succ=true;
//         }else{
//           succ = false;
//        }
//         t.commit();
//       System.out.println("........................"+succ);
//       return succ; 
//           }
    public boolean check(PCarding pcard) throws ParseException {
        System.out.println("......................******************..");
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        boolean succ = true;
        try {
            List<ParentCarding> l = new ArrayList<>();

            String dd = pcard.getDat();
            SimpleDateFormat sf1 = new SimpleDateFormat("dd-MM-yy");
            Date doj1 = sf1.parse(dd);
            System.out.println("sjhfj999999999..,,,,,," + dd);
            Date oneDayBefore = new Date(doj1.getTime() - 2);
            System.out.println("shgtfjerhgt........++++++++=//////////............" + oneDayBefore);
            Criteria c = s.createCriteria(ParentCarding.class);
            l = c.list();
            // c.add(Restrictions.eq("date",oneDayBefore));
            Date d = null;
            for (Object o : l) {
                ParentCarding gd = (ParentCarding) o;
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
            Criteria c = s.createCriteria(ParentCarding.class).setProjection(Projections.projectionList().add(Projections.max("date")));;
            l = c.list();
            System.out.println("//////////////" + l);
            for (int i = 0; i < l.size(); i++) {
                d = l.get(i);
                dd = d;
            }

            Criteria c1 = s.createCriteria(ParentCarding.class).add(Restrictions.eq("date", d));
            l1 = c1.list();
            for (Object o : l1) {
                ParentCarding p = (ParentCarding) o;
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
