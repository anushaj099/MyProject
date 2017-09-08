/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.manager;

import com.textile.dto.countform;
import com.textile.dto.dispatchDTO;
import com.textile.dto.packingdto;
import com.textile.model.ChildOpenend;
import com.textile.model.ChildPacking;
import com.textile.model.Counts;
import com.textile.model.FinancialYearBackup;
import com.textile.model.Login;
import com.textile.model.PackPatterns;
import com.textile.model.PackerName;
import com.textile.model.PackingStockreport;
import com.textile.model.ParentOpenend;
import com.textile.model.ParentPacking;
import com.textile.model.PkDispatched;
import com.textile.model.ReadyToPack;
import com.textile.model.StockReptBgs;
import com.textile.model.Superviser;

import com.textile.util.HibernateUtil;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author anusha
 */
public class PackingManager {

    public List Retrieve(packingdto p) throws ParseException {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<ParentPacking> list = new ArrayList<>();

        //String supName=p.getSuperviser();
        String supName = p.getSupervisor();
        // System.out.println("=========================================" +p.getEmployeeId());
        String shifts = p.getShifts();
        String date1 = p.getDate();
        SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yy");
        Date date = sf.parse(date1);
        System.out.println(shifts);
        if (shifts.equals("Day")) {
            Criteria c = s.createCriteria(ParentPacking.class);
            c.add(Restrictions.eq("date", date));
            list = c.list();
            t.commit();
        } else {
            Criteria c = s.createCriteria(ParentPacking.class);
            c.add(Restrictions.eq("date", date)).
                    add(Restrictions.eq("supervisor", supName))
                    .add(Restrictions.eq("shifts", shifts));
            list = c.list();
            t.commit();
        }

        System.out.println("List is" + list);

        s.close();

        return list;
    }

    public void insertPacking(packingdto p, String date1, String supervisor, String evocher) throws ParseException {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        ParentPacking pp = new ParentPacking();
        //  String date1=p.getDate();
        try{
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = sf.parse(date1);
        pp.setDate(date);
        pp.setEvocher(evocher);
        pp.setSupervisor(supervisor);
       // pp.setTotalDisclose(p.getTotalDisclose());
       // pp.setTotalDispatch(p.getTotalDispatch());
        pp.setTotalOpeningStock(p.getTotalOpeningStock());
        pp.setTotalNoofkgsPacked(p.getTotalNoofkgsPacked());
        pp.setTotalPackedBags(p.getTotalPackedBags());
        System.out.println(p.getTotalOpeningStock());
        System.out.println("--------------");
        s.save(pp);
        t.commit();

        Criteria c = s.createCriteria(ParentPacking.class);
        pp = (ParentPacking) c.add(Restrictions.eq("date", date)).add(Restrictions.eq("supervisor", supervisor)).uniqueResult();
        s.close();

        Session s1 = HibernateUtil.getSessionFactory().openSession();
        //List<String> p1 = p.getCount1();
        //List<Float> p2 = p.getClose();
        List<Float> p3 = p.getPack();
           
        List<Float> p4 = p.getOpen();
        
        //List<Float> p5 = p.getDis();
        List<Integer> p6 = p.getCountdb();
        List<String> p7 = p.getBoxtype();
          
        List<String> p8 = p.getWeight();
          System.out.println("the weight isss------*********..***///"+p8);
        List<Float> p9=p.getNoofKgsPacked();
            System.out.println("hellloooooooooooooo");
        Transaction t1 = s1.beginTransaction();
        for (int i = 0; i < p3.size(); i++) {
            ChildPacking cp = new ChildPacking();
           // System.out.println("packkkkkkkkkkkkkkkk"+p3.get(i));
           // System.out.println("opennnnnnnnnnnnnn"+p4.get(i));
            String g2;
              Float f1=0.0f;
            Float dis=0.0f,dis1=0.0f;
             String swa=null;
            
            int it=i*2;
            System.out.println("the iterationis--"+i+"---the indez is,,,,"+it+"...the weight is.---+"+p8.get(it)+"----"+p8.get(it+1));
             swa=p8.get(it);
          if(swa.length()==0)
            swa=p8.get(it+1);
            
            
          
           // System.out.println("p8888888888 isss---------->>>>>>>>>>"+p8.get(i));
            if(swa.equals("")) {
                System.out.println("anuuuuuuuuuuuuuuuuuuuuuu");
               g2="";
             }
            
            else {
            System.out.println("entered==========");
            System.out.println("jjjjjjjjjjjjj"+swa);
            String[] a;
            String delimiter="=";
            a=swa.split(delimiter);
            String g1=a[0];
            g2=a[1];
            System.out.println("pppppppppppppppppppppppp"+g2);
            cp.setCClose(g2);
           // Float opp=Float.parseFloat(p4.get(i));
           if(p4.get(i)!=null)
            dis=p3.get(i)+p4.get(i);
            System.out.println("meeeeeeeeeeeeeeeee"); 
            System.out.println("dissssssssssss"+dis);
            String anu=cp.getCClose();
            System.out.println("vallllllllllllllll"+anu);
            Float weight=Float.valueOf(anu);
            System.out.println("weight issssssss"+weight);
            System.out.println("f111111111111 iss----->>>>>"+f1);
            dis1=dis*weight;
            System.out.println("bbbbbbb2222222222::::::::::"+dis1);
            cp.setDisclose(dis1);
            }
           
            cp.setParentPacking(pp);
            cp.setCountDb(p6.get(i));
            cp.setBoxType(p7.get(i));
            cp.setWeight(swa);
            //cp.setCount(p1.get(i));
             System.out.println("the openstock issss*****befffooorrreeee***---->"+p4);
             for(int z=0;z<p4.size();z++)
                  System.out.println("the openstock .....-----....***<<issss*****befffooorrreeee***---->"+p4.get(z));
            if(p4.get(i)!=null) {  
                System.out.println("the openstock issss********---->"+p4.get(i));
               // Float opp=Float.parseFloat(p4.get(i));
             cp.setOpeningStock(p4.get(i));
            }
            if(p3.get(i)!=null)
            cp.setPackedBags(p3.get(i));
             if(p9.get(i)!=null)
            cp.setNoofKgsPacked(p9.get(i));
            cp.setActualDate(date);
           
          
            System.out.println("whooooooooooooooo"); 
           
            cp.setDispatch(f1);
           
            System.out.println("\n packkkkkkkkkkkkkkkkkkkkkkkkkk"+cp);
            s1.save(cp);

        }
        t1.commit();
        s1.close();
        }
         catch(ClassCastException c)
        {
            System.out.println("\n hibernate exception during packing"+c);
            c.printStackTrace();
        }
        catch(HibernateException e)
        {
            System.out.println("\n hibernate exception during packing"+e);
            e.printStackTrace();
        }
        catch(ArrayIndexOutOfBoundsException e1) {
            
        }
    }
    
    
    public List count(countform form){
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<Counts> list = new ArrayList<>();
        Counts count=new Counts();
        String cnt=count.getCount();
        System.out.println("ccccccnnnnnntttt"+cnt);
        try{
              Criteria c = s.createCriteria(Counts.class);
            c.add(Restrictions.eq("count", cnt));
            list = c.list();
            System.out.println("open count list isssss+++++++" + list);
            t.commit();
        }
        catch(Exception e){
            e.printStackTrace();
            System.out.println(e);
        }
        return list;
    }
    
    
     public List retrieveDispatch(packingdto pt) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<ParentPacking> list = new ArrayList<>();
        String pattern = pt.getPattern();
        System.out.println(">>>>>>>>>>>>>>>>>>>" + pattern);

        String dor = pt.getDate();
        //System.out.println("--------------------------->"+dor);
        String dor1 = pt.getDate1();

        System.out.println("date issssssss" + dor);
        System.out.println("date date issssssss" + dor1);
        System.out.println("supervisor issssssss" + pattern);

        try {
            SimpleDateFormat st = new SimpleDateFormat("dd-MM-yy");
            Date date = st.parse(dor);
            System.out.println("--------------------------->" + date);
            Date date1 = st.parse(dor1);
            System.out.println("--------------------------->" + date1);

            Criteria c = s.createCriteria(PkDispatched.class);
            if (pattern.equals("Box")) {
                c.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("patternType", pattern));
            } else if (pattern.equals("Bag")) {
                c.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("patternType", pattern));
            } else {
                c.add(Restrictions.between("date", date, date1));
            }
            list = c.list();
            System.out.println("----------------------11111--->" + list);

            t.commit();

        } catch (Exception e) {

        }

        System.out.println("list is" + list);
        return list;
    }

    public List packProcedure(String date) throws ParseException {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<ChildPacking> result = null;
        try {
            SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yy");
            Date dt = formatter.parse(date);
            SimpleDateFormat st = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date da = new Date(dt.getTime());
            String form = st.format(da);

            Query query = s.createSQLQuery("CALL chpack123('" + form + "')").addEntity(ChildPacking.class);
            result = query.list();
            t.commit();
            System.out.println("esjrhjhg" + result);
        } catch (Exception e) {
            System.out.println("the pack procedure is----------------->" + e);
        }
        return result;
    }
  public List<ParentPacking> display() {
      System.out.println("the view in packing***//***");
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();

        List<ParentPacking> glist = null;
        try {
            Criteria c = s.createCriteria(ParentPacking.class);
            //c.add(Restrictions.eq("employeeId", employeeId));
            glist = c.list();
            System.out.println("list is" + glist);
            t.commit();
            s.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        System.out.println(glist);
        return glist;
    }
  
  
  
  
  
  public List<ChildPacking> displayChild(int id1) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();

        List<ChildPacking> glist = null;

        try {
            Criteria c = s.createCriteria(ChildPacking.class);
            c.add(Restrictions.eq("parentPacking.idpq", id1));
            //c.add(Restrictions.eq("parentQuality.id", id));
            glist = c.list();
            System.out.println("dfhgkhg-------------dkg" + glist);

            t.commit();
        } catch (Exception e) {
            System.out.println(e);
        }
        System.out.println(glist);
        return glist;
    }
  public List<ParentPacking> editPacking(int id1) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List l = null;
        try {
            System.out.println("iiiiiiiiiiidd" + id1);
            Criteria cr = s.createCriteria(ParentPacking.class);
            cr.add(Restrictions.eq("idpq", id1)).uniqueResult();
            l = cr.list();
            System.out.println("dfhgkhg-------------dkg" + l);
        } catch (Exception e) {
            System.out.println("\n bbbbbbbbbbbbbbbbbbbb" + l + id1);
        }
        return l;
    }
   public List packingList1(int id) {

        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        String packing = "packing";
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
 public List packingList(packingdto oe) {

        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        String packing = "packing";
        List<Login> list = null;
        System.out.println("list is-------------" + oe.getId());
        try {
            Criteria c = s.createCriteria(Login.class);
            c.add(Restrictions.eq("id", oe.getId()));
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
  
    public List getopeningstock(String date) throws ParseException {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        System.out.println("\n triveniiiiiiiiiiiiiii"+date);
        List<ChildPacking>  l=new ArrayList<>();
        try {
        Date d1 = new SimpleDateFormat("dd-MM-yyyy").parse(date);
        Date d2 = new Date(d1.getTime() - 1);
        System.out.println("date usssssssss"+d2);
        l = (List<ChildPacking>) s.createCriteria(ChildPacking.class).add(Restrictions.eq("actualDate", d2)).list();
   //  Criteria c=s.createCriteria(PackingStockreport.class);
   //  l=c.list();
     t.commit();
     System.out.println("\n opening stockkkkkkkkkkkkkkkk"+date+"dddddddddddddddd"+d2+"list is"+l);
        System.out.println("list issssssssssss"+l);
        }
        catch(HibernateException e) {
           e.printStackTrace();
        }
        return l;
       
    }
    
public List getCount(String date) throws ParseException {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        System.out.println("\n triveniiiiiiiiiiiiiii"+date);
        List<ReadyToPack>  l=new ArrayList<>();
        try {
            Criteria c= s.createCriteria(Counts.class);
            c.setProjection(Projections.property("count"));
            List l1=c.list();
            
           
              System.out.println("Counts aree------------>>>>>/?????????????????"+l1);
              for(int i=0;i<l1.size();i++) {
                  String count=(String) l1.get(i);
                  int count1=Integer.parseInt(count);
               System.out.println("Count is------------>>>>>///////////"+count1);
               
              Criteria cc= s.createCriteria(ReadyToPack.class).add(Restrictions.eq("count", count1));
        cc.setProjection(Projections.max("date"));
        List l2=cc.list();
      //  t.commit();
        Date dd1=(Date)l2.get(0);
         Criteria cc1= s.createCriteria(ReadyToPack.class).add(Restrictions.eq("date",dd1)).add(Restrictions.eq("count", count1));
               cc1.setProjection(Projections.property("count"));
               List ll=cc1.list();
                System.out.println("<<<<<<<<<<<<<<<<<<<<<-----------"+l1);
               l.addAll(ll);   
                 System.out.println("<<<<<<<<<<<<<<<<<<<<<----------->>>>>>>>>>>"+l2);
             }
           
            System.out.println("Counts aree------------>>>>>/?????????????????"+l);
             
        
  
     t.commit();
     System.out.println("\n opening stockFFFFFFFFFFFFFFFFFFF"+date+"ppppppppppppppppp"+"list is"+l);
        System.out.println("list issssssssssss"+l);
        }
        catch(HibernateException e) {
           e.printStackTrace();
        }
        return l;
       
    }




public List getCount(Date date) throws ParseException {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        System.out.println("\n triveniiiiiiiiiiiiiii"+date);
        List<ReadyToPack>  l=new ArrayList<>();
        try {
              Criteria c= s.createCriteria(Counts.class);
              c.setProjection(Projections.property("count"));
              List l1=c.list();
            
           
              System.out.println("Counts aree------------>>>>>/?????????????????"+l1);
              for(int i=0;i<l1.size();i++) {
                  String count=(String) l1.get(i);
                  int count1=Integer.parseInt(count);
               System.out.println("Count is------------>>>>>///////////"+count1);
               
              Criteria cc= s.createCriteria(ReadyToPack.class).add(Restrictions.eq("count", count1));
        cc.setProjection(Projections.max("date"));
        List l2=cc.list();
      //  t.commit();
        Date dd1=(Date)l2.get(0);
         Criteria cc1= s.createCriteria(ReadyToPack.class).add(Restrictions.eq("date",dd1)).add(Restrictions.eq("count", count1));
               cc1.setProjection(Projections.property("count"));
               List ll=cc1.list();
                System.out.println("<<<<<<<<<<<<<<<<<<<<<-----------"+l1);
               l.addAll(ll);   
                 System.out.println("<<<<<<<<<<<<<<<<<<<<<----------->>>>>>>>>>>"+l2);
             }
           
            System.out.println("Counts aree------------>>>>>/?????????????????"+l);
  
     t.commit();
     System.out.println("\n opening stockFFFFFFFFFFFFFFFFFFF"+date+"ppppppppppppppppp"+"list is"+l);
        System.out.println("list issssssssssss"+l);
        }
        catch(HibernateException e) {
           e.printStackTrace();
        }
        return l;
       
    }

public List getBoxtype(String date) throws ParseException {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        System.out.println("\n triveniiiiiiiiiiiiiii"+date);
        List<String>  l=new ArrayList<>();
        try {
        Date d1 = new SimpleDateFormat("yyyy-MM-dd").parse(date);
        Date d2 = new Date(d1.getTime() - 1);
        System.out.println("date usssssssss"+d2);
        Criteria cc= s.createCriteria(ChildPacking.class).add(Restrictions.eq("actualDate", d2));
        cc.setProjection(Projections.property("boxType"));
       List  l1=cc.list();
        for(int i=0;i<l1.size();i++) {
            String aa=(String) l1.get(i);
            System.out.println("string izzzzzzzzzzzzzz"+aa);
            String bb="'"+aa+"'";
            System.out.println("string izzzzzzzzzzzzzz"+bb);
            l.add(bb);
        }
  
     t.commit();
     System.out.println("\n opening stockkkkkkkkkkkkkkkk"+date+"ppppppppppppppppp"+d2+"list is"+l);
        System.out.println("list issssssssssss"+l);
        }
        catch(HibernateException e) {
           e.printStackTrace();
        }
        return l;
       
    }


public List countdbcheck() throws ParseException {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
      //System.out.println("\n triveniiiiiiiiiiiiiii"+date);
        List  l1=new ArrayList<>();
        try {
       // Date d1 = new SimpleDateFormat("yyyy-MM-dd").parse(date);
      //  Date d2 = new Date(d1.getTime() - 1);
     //   System.out.println("date usssssssss"+d2);
        Criteria cc= s.createCriteria(ChildPacking.class);
        cc.setProjection(Projections.property("countDb"));
        l1=cc.list();
        t.commit();
        System.out.println("\n opening stockkkkkkkkkkkkkkkk  ppppppppppppppppp"+"list is"+l1);
        System.out.println("list issssssssssss"+l1);
        }
        catch(HibernateException e) {
           e.printStackTrace();
        }
        return l1;
       
    }

public List getWeight(String date) throws ParseException {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        System.out.println("\n triveniiiiiiiiiiiiiii"+date);
        List<String>  l=new ArrayList<>();
        try {
        Date d1 = new SimpleDateFormat("yyyy-MM-dd").parse(date);
        Date d2 = new Date(d1.getTime() - 1);
        System.out.println("date usssssssss"+d2);
        Criteria cc= s.createCriteria(ChildPacking.class).add(Restrictions.eq("actualDate", d2));
        cc.setProjection(Projections.property("weight"));
       List  l1=cc.list();
        for(int i=0;i<l1.size();i++) {
            String aa=(String) l1.get(i);
            System.out.println("string izzzzzzzzzzzzzz"+aa);
            String bb="'"+aa+"'";
            System.out.println("string izzzzzzzzzzzzzz"+bb);
            l.add(bb);
        }
  
     t.commit();
     System.out.println("\n weighttttttttttttttttt"+date+"wwwwwwwwwwwwwwwwwww"+d2+"list is"+l);
        System.out.println("list issssssssssss"+l);
        }
        catch(HibernateException e) {
           e.printStackTrace();
        }
        return l;
       
    }

public List getWeight(Date date) throws ParseException {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        System.out.println("\n triveniiiiiiiiiiiiiii"+date);
        List<String>  l=new ArrayList<>();
        try {
      //  Date d1 = new SimpleDateFormat("yyyy-MM-dd").parse(date);
        Date d2 = new Date(date.getTime() - 1);
        System.out.println("date usssssssss"+d2);
        Criteria cc= s.createCriteria(ChildPacking.class).add(Restrictions.eq("actualDate", d2));
        cc.setProjection(Projections.property("weight"));
       List  l1=cc.list();
        for(int i=0;i<l1.size();i++) {
            String aa=(String) l1.get(i);
            System.out.println("string izzzzzzzzzzzzzz"+aa);
            String bb="'"+aa+"'";
            System.out.println("string izzzzzzzzzzzzzz"+bb);
            l.add(bb);
        }
  
     t.commit();
     System.out.println("\n weighttttttttttttttttt"+date+"wwwwwwwwwwwwwwwwwww"+d2+"list is"+l);
        System.out.println("list issssssssssss"+l);
        }
        catch(HibernateException e) {
           e.printStackTrace();
        }
        return l;
       
    }

public List getBoxtype(Date date) throws ParseException {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        System.out.println("\n triveniiiiiiiiiiiiiii"+date);
        List<String>  l=new ArrayList<>();
        try {
      //  Date d1 = new SimpleDateFormat("yyyy-MM-dd").parse(date);
        Date d2 = new Date(date.getTime() - 1);
        System.out.println("date usssssssss"+d2);
        Criteria cc= s.createCriteria(ChildPacking.class).add(Restrictions.eq("actualDate", d2));
        cc.setProjection(Projections.property("boxType"));
       List  l1=cc.list();
        for(int i=0;i<l1.size();i++) {
            String aa=(String) l1.get(i);
            System.out.println("string izzzzzzzzzzzzzz"+aa);
            String bb="'"+aa+"'";
            System.out.println("string izzzzzzzzzzzzzz"+bb);
            l.add(bb);
        }
  
     t.commit();
     System.out.println("\n opening stockkkkkkkkkkkkkkkk"+date+"ppppppppppppppppp"+d2+"list is"+l);
        System.out.println("list issssssssssss"+l);
        }
        catch(HibernateException e) {
           e.printStackTrace();
        }
        return l;
       
    }

public List getCount1() throws ParseException {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
      
        List<Counts>  l=new ArrayList<>();
        try {
            System.out.println("*********************");
        Criteria cc= s.createCriteria(Counts.class);
        cc.setProjection(Projections.property("count"));
        l=cc.list();
        
  
     t.commit();
     System.out.println("\n opening stockkkkkkkkkkkkkkkk"+"ppppppppppppppppp"+"list is"+l);
        System.out.println("list issssssssssss"+l);
        }
        catch(HibernateException e) {
           e.printStackTrace();
        }
        return l;
       
    }

public List getopenStock() throws ParseException {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
      
        List<Counts>  l=new ArrayList<>();
        try {
        System.out.println("**********#######################***********");
        Criteria cc= s.createCriteria(Counts.class);
        cc.setProjection(Projections.property("openStock"));
        l=cc.list();
        
        t.commit();
        System.out.println("\n opening stockkkkkkkkkkkkkkkk"+"ppppppppppppppppp"+"list is"+l);
        System.out.println("list issssssssssss"+l);
        }
        catch(HibernateException e) {
           e.printStackTrace();
        }
        return l;
    }


public List getClosingStock(String date) throws ParseException {
    System.out.println("Entered into closing stock----------------------------------------------------->>>>>>>>>>>>>>>>>>");
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        System.out.println("\n triveniiiiiiiiiiiiiii"+date);
        List  l=new ArrayList();
        List disp=new ArrayList();
         Date d2 =null;
        try {
            Date d1 = new SimpleDateFormat("yyyy-MM-dd").parse(date);
            Criteria c= s.createCriteria(Counts.class);
            c.setProjection(Projections.property("count"));
            List l1=c.list();
            
           
              System.out.println("Counts aree------------>>>>>/?????????????????"+l1);
              for(int i=0;i<l1.size();i++) {
                  String count=(String) l1.get(i);
                  int count1=Integer.parseInt(count);
               System.out.println("Count is------------>>>>>///////////"+count1);
               
              Criteria cc= s.createCriteria(ReadyToPack.class).add(Restrictions.eq("count", count1));
        cc.setProjection(Projections.max("date"));
        List l2=cc.list();
      //  t.commit();
        Date dd1=(Date)l2.get(0);
         Criteria cc1= s.createCriteria(ReadyToPack.class).add(Restrictions.eq("date",dd1)).add(Restrictions.eq("count", count1));
               cc1.setProjection(Projections.property("readytopackKgs"));
               List ll=cc1.list();
                System.out.println("<<<<<<<<<<<<<<<<<<<<<-----------"+l1);
               l.addAll(ll);   
                 System.out.println("<<<<<<<<<<<<<<<<<<<<<----------->>>>>>>>>>>"+l2);
             }
           
            System.out.println("Counts aree------------>>>>>/?????????????????"+l);
  
     t.commit();
     System.out.println("\n opening stockkkkkkkkkkkkkkkk"+date+"swaaaaaaaaaaaaaa"+d2+"list is"+l);
        System.out.println("list issssssssssss"+l);
        }
        catch(HibernateException e) {
           e.printStackTrace();
        }
        return l;
    }

public List getClosingStock(Date date) throws ParseException {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        System.out.println("\n triveniiiiiiiiiiiiiii"+date);
        List l=new ArrayList<>();
        try {
//        Date d1 = new SimpleDateFormat("yyyy-MM-dd").parse(date);
        Criteria c= s.createCriteria(Counts.class);
            c.setProjection(Projections.property("count"));
            List l1=c.list();
            
           
              System.out.println("Counts aree------------>>>>>/?????????????????"+l1);
              for(int i=0;i<l1.size();i++) {
                  String count=(String) l1.get(i);
                  int count1=Integer.parseInt(count);
               System.out.println("Count is------------>>>>>///////////"+count1);
               
              Criteria cc= s.createCriteria(ReadyToPack.class).add(Restrictions.eq("count", count1));
        cc.setProjection(Projections.max("date"));
        List l2=cc.list();
      //  t.commit();
        Date dd1=(Date)l2.get(0);
         Criteria cc1= s.createCriteria(ReadyToPack.class).add(Restrictions.eq("date",dd1)).add(Restrictions.eq("count", count1));
               cc1.setProjection(Projections.property("readytopackKgs"));
               List ll=cc1.list();
                System.out.println("<<<<<<<<<<<<<<<<<<<<<-----------"+l1);
               l.addAll(ll);   
                 System.out.println("<<<<<<<<<<<<<<<<<<<<<----------->>>>>>>>>>>"+l2);
             }
           
            System.out.println("Counts aree------------>>>>>/?????????????????"+l);
  
     t.commit();
     System.out.println("\n opening stockkkkkkkkkkkkkkkk"+date+"swaaaaaaaaaaaaaa"+"list is"+l);
        System.out.println("list issssssssssss"+l);
        }
        catch(HibernateException e) {
           e.printStackTrace();
        }
        return l;
    }

   public packingdto updatePacking(packingdto form,String evocher) throws ParseException {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        ParentPacking p = new ParentPacking();

        int id = form.getIdpq();
        Float tos = form.getTotalOpeningStock();
        float tp = form.getTotalPackedBags();
        //float tdp = form.getTotalDispatch();
        float nop=form.getTotalNoofkgsPacked();
        //float tcs = form.getTotalDisclose();

        String date = form.getDate();

        SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yy");
        Date d = sf.parse(date);
        System.out.println("ddd" + d);
        String sname = form.getSupervisor();
        try {

            p.setSupervisor(sname);
            p.setIdpq(id);
            p.setDate(d);
            p.setTotalOpeningStock(tos);
            p.setTotalPackedBags(tp);
           // p.setTotalDispatch(tdp);
            p.setTotalNoofkgsPacked(nop);
            p.setEvocher(evocher);
            //p.setTotalDisclose(tcs);
            s.update(p);

            ParentPacking p1 = new ParentPacking();
            Criteria c1 = s.createCriteria(ParentPacking.class);
            p1 = (ParentPacking) c1.add(Restrictions.eq("date", d)).add(Restrictions.eq("supervisor", sname)).uniqueResult();
            System.out.println("kjdgh-------32131321--dhg+++++++++++++++");
            t.commit();
            s.close();

            Session s1 = HibernateUtil.getSessionFactory().openSession();
            Transaction t1 = s1.beginTransaction();

            List lis = null;
            
            
              

            Criteria c2 = s1.createCriteria(ChildPacking.class);
            lis = c2.add(Restrictions.eq("parentPacking.idpq", id)).list();
            if (lis != null) {
                for (Object o : lis) {
                    System.out.println("kjdgh---------dhg+++++++++++++++");
                    ChildPacking cq = (ChildPacking) o;
                    s1.delete(cq);
                }

            }

            System.out.println("kjdgh---------dhg+++++54787897++++++++++");

            //List<String> l1 = form.getCount1();

            List<Float> l2 = form.getOpen();
            List<Float> l3 = form.getPack();
            //List<Float> l4 = form.getDis();
           // List<Float> l5 = form.getClose();
            List<Integer> l6 = form.getCountdb();
            List<String> l7 = form.getBoxtype();
            List<String> l8 = form.getWeight();
            List<Float> l9=form.getNoofKgsPacked();

            for (int i = 0; i < l2.size(); i++) {
                ChildPacking c = new ChildPacking();

               Float f1=0.0f,f2=0.0f; 
                Float dis=0.0f,dis1=0.0f; 
                 String g2=null;
            String swa=l8.get(i);
            System.out.println("p8888888888 isss---------->>>>>>>>>>"+swa);
            if(swa.equals("")) {
                System.out.println("PPPPPPPPPPPPPPPP");
               g2="";
            }
            else {
                System.out.println("entered==========");
            
            System.out.println("jjjjjjjjjjjjj"+swa);
             String[] a;
            String delimiter="=";
            a=swa.split(delimiter);
            String g1=a[0];
             g2=a[1];
            System.out.println("pppppppppppppppppppppppp"+g2);
           
            }
//            if(!swa.equals("")) {
//                 Float weight=Float.valueOf(g2);
//            dis=(l2.get(i)+l3.get(i))-f1;
//            dis1=dis*weight;
//            }
//            
             Criteria c3 = s1.createCriteria(PkDispatched.class);
                  c3.add(Restrictions.eq("date", d)).add(Restrictions.eq("count", l6.get(i))).add(Restrictions.eq("packingType", l7.get(i)));
                  List ll=c3.list();
                  System.out.println("list izzzzzzzzz"+ll);
                  for(Object o:ll) {
                       Float  f3=f2;
                     PkDispatched pk=(PkDispatched) o; 
                     Integer ff=pk.getNoOfBags();
                      f2=Float.valueOf(ff);
                   
                     f2=f2+f1+f3;
                  }
                  if(swa.equals("")) {
                      
                  }
                  else {
                        Float weight=Float.valueOf(g2);
                        System.out.println("l2.get"+l2.get(i));
                        System.out.println("l3.get"+l3.get(i));
                      //  Float oppp=Float.parseFloat(l2.get(i));
            dis=(l2.get(i)+l3.get(i))-f2;
                      System.out.println("fffffffff"+dis+"OOOOOO"+weight);
            dis1=dis*weight;
                System.out.println("^^^^^^^^^^^^^^^^^"+dis1);
                  }
                System.out.println("dispatch value"+f2);
                System.out.println("dixxxxxxxxxxxxxxx"+dis1);
              c.setParentPacking(p1);
             // Float op=Float.parseFloat(l2.get(i));
                c.setOpeningStock(l2.get(i));
                c.setPackedBags(l3.get(i));
                c.setNoofKgsPacked(l9.get(i));
               c.setDisclose(dis1);
                c.setActualDate(d);
                c.setCountDb(l6.get(i));
                c.setBoxType(l7.get(i));
                c.setWeight(l8.get(i));  
            c.setDispatch(f2);
            c.setCClose(g2);
                s1.save(c);
                System.out.println("iiiiiiiiiii" + c);
                s1.flush();
                s1.clear();
           
            }
            t1.commit();
            s1.close();

            System.out.println("\n Packing Updated Successfully");

        } catch (Exception e) {
            System.out.println(e);
        }
        return form;
    }
   

   

    public void deletePack(int id1) throws ParseException {

        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        try {
            //ParentOpenend e=new ParentOpenend();

            ParentPacking e = (ParentPacking) s.get(ParentPacking.class, id1);
            // Criteria c=s.createCriteria(ParentOpenend.class);
            // e=(ParentOpenend) c.add(Restrictions.eq("parentOpenend.id",id1)).uniqueResult();
            System.out.println("ehgrtfeyfgrgghruh---====" + id1);
            s.delete(e);
            t.commit();
            System.out.println("\n deleted successfully");
        } catch (Exception h) {
            System.out.println("HibernateException during deletion:" + h);
            s.close();
        }

    }

    public String productionInsVal(packingdto form) throws ParseException {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();

        System.out.println("......................******************..");
        String dec = "";
        boolean succ = true;
        try {
            List<ParentPacking> l = new ArrayList<>();

            String dd = form.getDate();
            SimpleDateFormat sf1 = new SimpleDateFormat("yyyy-MM-dd");
            Date doj1 = sf1.parse(dd);
            System.out.println("sjhfj999999999..,,,,,," + dd);
            Date oneDayBefore = new Date(doj1.getTime() - 2);
            System.out.println("shgtfjerhgt........++++++++=//////////............" + oneDayBefore);
            Criteria c = s.createCriteria(ParentPacking.class);
            l = c.list();
            System.out.println("sjhfj999999999.----list---------------.,,,,,," + l);
            // c.add(Restrictions.eq("date",oneDayBefore));
            if (!l.isEmpty()) {
                Date d = null;
                for (Object o : l) {
                    ParentPacking gd = (ParentPacking) o;
                    d = gd.getDate();
                }
                System.out.println("sjhfj999999999.----ldate----------------------..." + d);

                Calendar cal = Calendar.getInstance();
                cal.setTime(d);
                cal.add(Calendar.DATE, 1);
                Date dt = cal.getTime();
                System.out.println("..............date..................." + dt);
                if (d.getTime() == doj1.getTime()) {
                    dec = "return";
                } else if (dt.getTime() == doj1.getTime()) {
                    dec = "show";
                    succ = true;
                } else {
                    dec = "error";
                    succ = false;
                }
            }
        } catch (NullPointerException p) {
            System.out.println("............. in packing ....." + p);
        }
        t.commit();
        s.close();
        System.out.println("........................" + succ);
        return dec;

        //  System.out.println("lsflj-----"+z);
//            Criteria c=s.createCriteria(ParentPacking.class);
//            String sd=form.getDate();
//            System.out.println("dfgj------------"+sd);
//            SimpleDateFormat sf=new SimpleDateFormat("dd-MM-yy");
//             Date d1=sf.parse(sd);
//            c.add(Restrictions.eq("date",d1)); 
//            l=c.list();
//              System.out.println("list is"+l);
//           
//        }catch(Exception ep){
//            System.out.println("------packing insert----validate---"+ep);
//        }
//      if(l.size()>0) {
//               return true; // date exists
//           }
//      else
//        return false; //date not exists
    }
    private Date dd = null;

    public Date getDd() {
        return dd;
    }

    public void setDd(Date dd) {
        this.dd = dd;
    }

    public List shiftExists() {
        System.out.println("Entered in to shifts");
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<Date> l = null;
        Date d = null;
        List l1 = null, l2 = new ArrayList();
        try {
            Criteria c = s.createCriteria(ParentPacking.class).setProjection(Projections.projectionList().add(Projections.max("date")));;
            l = c.list();
            System.out.println("//////////////" + l);
            for (int i = 0; i < l.size(); i++) {
                d = l.get(i);
                dd = d;
            }

        } catch (Exception e) {
        }
        System.out.println(">>>>>>>>>>>>>>>>" + l2);
        System.out.println("<<<<<<<<<<<<<<<<" + l2.size());
        return l2;
    }

    public List countList() {
        List l = new ArrayList();
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        try {
            Criteria c = s.createCriteria(Counts.class).setProjection(Projections.projectionList().add(Projections.property("count")));
            l = c.list();
          //  l.add("All");
            System.out.println("!!!!!!!!!!!!!!" + l);
        } catch (Exception e) {

        }
        return l;
    }
    public List countList1() {
        List l = new ArrayList();
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        try {
            Criteria c = s.createCriteria(Counts.class).setProjection(Projections.projectionList().add(Projections.property("count")));
            l = c.list();
          //  l.add("All");
            System.out.println("!!!!!!!!!!!!!!" + l);
        } catch (Exception e) {

        }
        l.add("All");
        return l;
    }
    

    public List packerList() {
        List l = new ArrayList();
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        try {
            Criteria c = s.createCriteria(PackerName.class).setProjection(Projections.projectionList().add(Projections.property("packerName")));
            l = c.list();
            System.out.println("@@@@@@@@@@@@@@@@@@@" + l);
        } catch (Exception e) {

        }
        return l;
    }

    public List weightList() {
        List<String> l = new ArrayList();
        List l1 = null;
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        String a1 = null, a2 = null, a3 = null;
        Float final_weight = 0.0f;
        try {
            Criteria c = s.createCriteria(PackPatterns.class).add(Restrictions.eq("typeOfPacking", "Bag"));
            l1 = c.list();
            System.out.println("@@@@@@@@@@@@@@@" + l1);
            for (Object o : l1) {
                PackPatterns p = (PackPatterns) o;
                Float con_weight = p.getConWeight();
                Float no_of_cones = p.getNoOfCones();
                int d = Math.round(no_of_cones);
                int d1 = Math.round(p.getWeight());
                Float weight = p.getWeight();
                a1 = Float.toString(con_weight);

                String s1 = a1 + "*" + d + "=" + d1;
                System.out.println("MMMMMMMMMMMMMMM" + d);
                l.add(s1);
            }
        } catch (Exception e) {

        }
        System.out.println("################" + l);
        return l;
    }
    public List weightList1() {
        List<String> l = new ArrayList();
        List l1 = null;
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        String a1 = null, a2 = null, a3 = null;
        Float final_weight = 0.0f;
        try {
            Criteria c = s.createCriteria(PackPatterns.class).add(Restrictions.eq("typeOfPacking", "Box"));
            l1 = c.list();
            System.out.println("@@@@@@@@@@@@@@@" + l1);
            for (Object o : l1) {
                PackPatterns p = (PackPatterns) o;
                Float con_weight = p.getConWeight();
                Float no_of_cones = p.getNoOfCones();
                int d = Math.round(no_of_cones);
                int d1 = Math.round(p.getWeight());
                Float weight = p.getWeight();
                a1 = Float.toString(con_weight);

                String s1 = a1 + "*" + d + "=" + d1;
                System.out.println("MMMMMMMMMMMMMMM" + d);
                l.add(s1);
            }
        } catch (Exception e) {

        }
        System.out.println("################" + l);
        return l;
    }
    
    public List RetrivePack(packingdto pt,String countdb) throws ParseException {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<ParentPacking> list = new ArrayList<>();
          List list1 = new ArrayList<>();
        String supervisor = pt.getSuperviser();
       // List<Integer> countdb= pt.getCountdb();
        System.out.println("--------------------------->" + supervisor);
       
        String dor = pt.getDate();
        //System.out.println("--------------------------->"+dor);
        String dor1 = pt.getDate1();
         List l1 = null;
        System.out.println("date issssssss" + dor);
        System.out.println("date date issssssss" + dor1);
        System.out.println("supervisor issssssss" + supervisor);
        List<String> dept = new ArrayList<>();
        List<Counts> cl = (List<Counts>) s.createCriteria(Counts.class).list();
        for (Counts dl : cl) {
            dept.add(dl.getCount());
        }
        //String st = dept.toString();
// System.out.println("supervisor issssssss" + countdb);
        try {
            if(dept.contains(countdb))
            {
                 int count=Integer.parseInt(countdb);
            SimpleDateFormat st = new SimpleDateFormat("dd-MM-yy");
            Date date = st.parse(dor);
            System.out.println("--------------------------->" + date);
            Date date1 = st.parse(dor1);
            System.out.println("--------------------------->" + date1);

            Criteria c = s.createCriteria(ParentPacking.class);
            c.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("supervisor", supervisor));
            list = c.list();
            System.out.println("----------------------11111--->" + list);
            int id = 0;
                for (Object o : list) {
                    System.out.println("enterrrrrrrrrrrrrrrrrrr");
                    
                    ParentPacking pq = (ParentPacking) o;
                    id = pq.getIdpq();
                    System.out.println("iiiiiiiiiiiiiiiii ddddddddddddddddd issssss"+id);
                    Criteria c1 = s.createCriteria(ChildPacking.class);
                    c1.add(Restrictions.eq("parentPacking.idpq", id)).add(Restrictions.eq("countDb", count));
                    System.out.println("cnttttttttttttttttttt"+countdb);
                    l1 = c1.list();
                    System.out.println("\n f1f1f1f1f1f1f1f1f1f1;" + l1);
                    
                    list1.addAll(l1);
                    s.flush();
                    s.clear();
                }
           t.commit();
            }
            else if(countdb.equals("All"))
            {
            SimpleDateFormat st = new SimpleDateFormat("dd-MM-yy");
            Date date = st.parse(dor);
            Date date1 = st.parse(dor1);

            Criteria c = s.createCriteria(ParentPacking.class);
            c.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("supervisor", supervisor));
            list = c.list();
            int id = 0;
                for (Object o : list) {
                    System.out.println("enterrrrrrrrrrrrrrrrrrr");
                    
                    ParentPacking pq = (ParentPacking) o;
                    id = pq.getIdpq();
                    Criteria c1 = s.createCriteria(ChildPacking.class);
                    c1.add(Restrictions.eq("parentPacking.idpq", id));
                    System.out.println("saraaaaaaaaaaaaaaaaaaa"+countdb+id);
                    l1 = c1.list();
                    System.out.println("\n ghjdhghjdghkghkdjghkjfd;" + l1);
                    
                    list1.addAll(l1);
                    s.flush();
                    s.clear();
                }
           t.commit();
            }

        } catch (Exception e) {

        }

        System.out.println("list is" + list1);
        return list1;
    }


// Packing Stock Report------------------------------------------------------
    public List retrieveStock(packingdto pt,String countdb,List countlist1) {
         System.out.println("the stock report of bags is---------------------");
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List list = new ArrayList();
        List list1=new ArrayList();
         List list2=new ArrayList();
          List list3=new ArrayList();
         List listf=new ArrayList();
         List fromdt =null;
          List todt=null;
        String dor = pt.getDate();
        System.out.println("--------------------------->"+dor);
        String dor1 = pt.getDate1();
        System.out.println("--------------------------->"+dor1);

       
       try {
           
            String sql = "SELECT MIN(actual_date) FROM child_packing UNION SELECT MIN(date) FROM pk_dispatched;";
          
        Query query = s.createSQLQuery(sql);
       fromdt = query.list();
       
        //System.out.println("the date from isssssss--------------------------->"+fromdt);
        if(!fromdt.isEmpty()){
            for(int i=0;i<fromdt.size();i++){
                if(fromdt.get(i)==null)
                    fromdt.remove(i);
            }
        }
       System.out.println("the date from isssssss---------000000000000------------------>"+fromdt);
         Collections.sort(fromdt, new Comparator<Date>() {
            @Override
            public int compare(Date o1, Date o2) {
                return o1.compareTo(o2);
            }
        });
          Date startDate=(Date) fromdt.get(0);
          
          
           String sqll = "SELECT MAX(actual_date) FROM child_packing UNION SELECT MAX(date) FROM pk_dispatched;";
          
        Query queryl = s.createSQLQuery(sqll);
       todt = queryl.list();
       
        //System.out.println("the date from isssssss--------------------------->"+fromdt);
        if(!todt.isEmpty()){
            for(int i=0;i<todt.size();i++){
                if(todt.get(i)==null)
                    todt.remove(i);
            }
        }
       // System.out.println("the date from isssssss---------000000000000------------------>"+fromdt);
         Collections.sort(todt, new Comparator<Date>() {
            @Override
            public int compare(Date o1, Date o2) {
                return o1.compareTo(o2);
            }
        });
         Date endDate=(Date) todt.get(todt.size()-1);
           
            System.out.println("date issssssss--------------" + startDate);
        System.out.println("date issssssss------------------" + endDate);
           
             SimpleDateFormat st = new SimpleDateFormat("dd-MM-yy");
            Date date = st.parse(dor);
            System.out.println("--------------<<<<------------->" + date);
            Date date1 = st.parse(dor1);
           
             List<Date> dates = new ArrayList<>();
        
         Criteria c = s.createCriteria(PkDispatched.class);
          //  c.add(Restrictions.between("date", date, date1));
            list = c.list();
            
         Criteria c1= s.createCriteria(ChildPacking.class);
          //  c1.add(Restrictions.between("actualDate", date, date1));
            list1 = c1.list();
            
        Criteria c2= s.createCriteria(PackPatterns.class);
            list2 = c2.list();
        
        
        
        long interval = 24 * 1000 * 60 * 60; // 1 hour in millis
        long endTime = endDate.getTime(); // create your endtime here, possibly using Calendar or Date
        long curTime = startDate.getTime();
        while (curTime <= endTime) {
            dates.add(new Date(curTime));
            curTime += interval;
        }
        
         String aq = "delete from stock_rept_bgs;";
        Query qu = s.createSQLQuery(aq);
        qu.executeUpdate();
            
            t.commit();
            s.close();
        
             Session s4 = HibernateUtil.getSessionFactory().openSession();
        Transaction t4 = s4.beginTransaction();
           
            for (int i = 0; i < dates.size(); i++) {
               
                if(!countdb.equals("All")){
                    int cont=Integer.parseInt(countdb);
                    System.out.println("the count is--------------->"+cont);
                    if(list2!=null)
                    for(Object ob:list2){
                        
                         float disp=0;
                float pkbgs=0;
                float opStk=0;
                 float csk=0;
                  float cskg=0;
                        
                                 PackPatterns pp=(PackPatterns)ob;
                                 String type=pp.getTypeOfPacking();
                                  Float con_weight = pp.getConWeight();
                                    Float no_of_cones = pp.getNoOfCones();
                                    int d = Math.round(no_of_cones);
                                    int d1 = Math.round(pp.getWeight());
                                   String a1 = Float.toString(con_weight);
                                   String s1 = a1 + "*" + d + "=" + d1;
                    
                             if(list!=null)      
                     for(Object o:list){
                         PkDispatched pd=(PkDispatched)o;
                         Date pkd=null;String ptype=null,pwt=null;
                         if(pd.getDate()!=null)
                            pkd=pd.getDate();
                         if(pd.getPackingType()!=null)
                            ptype=pd.getPackingType();
                         if(pd.getPackingWeight()!=null)
                            pwt=pd.getPackingWeight();
                         if(pd.getCount()!=null)
                         if(pkd.compareTo(dates.get(i))==0 && cont==pd.getCount()){
                              
                                if(ptype.equals(type) && pwt.equals(s1)){
                                    if(pd.getNoOfBags()!=null)
                                    disp+=pd.getNoOfBags();
                                }
                                 
                             }
                             
                         }
                        System.out.println("the dispatch value isss---------------"+disp);
                     for(Object o:list1){
                         ChildPacking cp=(ChildPacking)o;
                          Date pkd=null;String ptype=null,pwt=null;
                          if(cp.getActualDate()!=null)
                         pkd=cp.getActualDate();
                          if(cp.getBoxType()!=null)
                         ptype=cp.getBoxType();
                          if(cp.getWeight()!=null)
                         pwt=cp.getWeight();
                          if(cp.getCountDb()!=null)
                         if(pkd.compareTo(dates.get(i))==0 && cont==cp.getCountDb()){
                                if(ptype.equals(type) && pwt.equals(s1)){
                                    if(cp.getPackedBags()!=null)
                                    pkbgs+=cp.getPackedBags();
                                }
                                 
                             }
                             
                         }
                        System.out.println("the Child Pack value is--------------->"+pkbgs);
                         Date before=new Date(dates.get(i).getTime() - 2);
                          Criteria c4= s4.createCriteria(StockReptBgs.class);
                        c4.add(Restrictions.eq("date", before)).add(Restrictions.eq("count",cont)).add(Restrictions.eq("typeOfPack",type)).add(Restrictions.eq("packWt",s1));
                     list3 = c4.list();
                     if(list3!=null){
                     for(Object ot:list3){
                         StockReptBgs cpg=(StockReptBgs)ot;
                         opStk=cpg.getClosingStk();
                     }
                         
                     }
                        System.out.println("the open stock value is ---------------->"+opStk);
                     if(disp!=0||pkbgs!=0||opStk!=0){
                        csk=(opStk+pkbgs)-disp;
                        }
                     if(csk!=0)
                        cskg=csk*pp.getWeight();
                         System.out.println("the closing stock is--------..........---------->"+csk+".......--"+cskg);
                         StockReptBgs sb=new StockReptBgs();
                         sb.setDate(dates.get(i));
                         sb.setCount(cont);
                         sb.setTypeOfPack(type);
                         sb.setPackWt(s1);
                         sb.setOpenStk(opStk);
                         sb.setPackedBags(pkbgs);
                         sb.setDispatch(disp);
                         sb.setClosingStk(csk);
                         sb.setClosingStkKgs(cskg);
                           s4.save(sb);
                s4.flush();
                s4.clear();
                     
                     
                    }
                    
                    
                }
                else{
                    for(int j=0;j<countlist1.size();j++){
                         int cont=Integer.parseInt(countlist1.get(j).toString());
                    System.out.println("the count is--------------->"+cont);
                    if(list2!=null)
                    for(Object ob:list2){
                        
                         float disp=0;
                float pkbgs=0;
                float opStk=0;
                 float csk=0;
                  float cskg=0;
                        
                                 PackPatterns pp=(PackPatterns)ob;
                                 String type=pp.getTypeOfPacking();
                                  Float con_weight = pp.getConWeight();
                                    Float no_of_cones = pp.getNoOfCones();
                                    int d = Math.round(no_of_cones);
                                    int d1 = Math.round(pp.getWeight());
                                   String a1 = Float.toString(con_weight);
                                   String s1 = a1 + "*" + d + "=" + d1;
                    
                             if(list!=null)      
                     for(Object o:list){
                         PkDispatched pd=(PkDispatched)o;
                         Date pkd=null;String ptype=null,pwt=null;
                         if(pd.getDate()!=null)
                            pkd=pd.getDate();
                         if(pd.getPackingType()!=null)
                            ptype=pd.getPackingType();
                         if(pd.getPackingWeight()!=null)
                            pwt=pd.getPackingWeight();
                         if(pd.getCount()!=null)
                         if(pkd.compareTo(dates.get(i))==0 && cont==pd.getCount()){
                              
                                if(ptype.equals(type) && pwt.equals(s1)){
                                    if(pd.getNoOfBags()!=null)
                                    disp+=pd.getNoOfBags();
                                }
                                 
                             }
                             
                         }
                        System.out.println("the dispatch value isss---------------"+disp);
                     for(Object o:list1){
                         ChildPacking cp=(ChildPacking)o;
                          Date pkd=null;String ptype=null,pwt=null;
                          if(cp.getActualDate()!=null)
                         pkd=cp.getActualDate();
                          if(cp.getBoxType()!=null)
                         ptype=cp.getBoxType();
                          if(cp.getWeight()!=null)
                         pwt=cp.getWeight();
                          if(cp.getCountDb()!=null)
                         if(pkd.compareTo(dates.get(i))==0 && cont==cp.getCountDb()){
                                if(ptype.equals(type) && pwt.equals(s1)){
                                    if(cp.getPackedBags()!=null)
                                    pkbgs+=cp.getPackedBags();
                                }
                                 
                             }
                             
                         }
                        System.out.println("the Child Pack value is--------------->"+pkbgs);
                         Date before=new Date(dates.get(i).getTime() - 2);
                          Criteria c4= s4.createCriteria(StockReptBgs.class);
                        c4.add(Restrictions.eq("date", before)).add(Restrictions.eq("count",cont)).add(Restrictions.eq("typeOfPack",type)).add(Restrictions.eq("packWt",s1));
                     list3 = c4.list();
                     if(list3!=null){
                     for(Object ot:list3){
                         StockReptBgs cpg=(StockReptBgs)ot;
                         opStk=cpg.getClosingStk();
                     }
                         
                     }
                        System.out.println("the open stock value is ---------------->"+opStk);
                     if(disp!=0||pkbgs!=0||opStk!=0){
                        csk=(opStk+pkbgs)-disp;
                        }
                     if(csk!=0)
                        cskg=csk*pp.getWeight();
                         System.out.println("the closing stock is--------..........---------->"+csk+".......--"+cskg);
                         StockReptBgs sb=new StockReptBgs();
                         sb.setDate(dates.get(i));
                         sb.setCount(cont);
                         sb.setTypeOfPack(type);
                         sb.setPackWt(s1);
                         sb.setOpenStk(opStk);
                         sb.setPackedBags(pkbgs);
                         sb.setDispatch(disp);
                         sb.setClosingStk(csk);
                         sb.setClosingStkKgs(cskg);
                           s4.save(sb);
                s4.flush();
                s4.clear();
                    }
                }
                
            }
           
            
        }
             t4.commit();
            s4.close();
            
             Session s5 = HibernateUtil.getSessionFactory().openSession();
            Transaction tr = s5.beginTransaction();

            Criteria c5 = s5.createCriteria(StockReptBgs.class);
             c5.add(Restrictions.between("date", date, date1));
            listf = c5.list();
            tr.commit();
            s5.close();
       }catch (Exception e) {

        }
        System.out.println("----333333------------------11111--->" + listf);
        return listf;
    }
     

     



     
      
  
    public List<ParentPacking> parentPack(packingdto form) throws ParseException {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<ParentPacking> list = new ArrayList<>();
        String d = form.getDate();
        String d1 = form.getDate1();
        SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yy");
        Date date = sf.parse(d);
        Date date1 = sf.parse(d1);
        Criteria c = s.createCriteria(ParentPacking.class);
        c.add(Restrictions.between("date", date, date1));
        list = c.list();
        System.out.println("\n ddddddddddddpppppppppparevttttttdddd" + list);

        t.commit();
        s.close();
        return list;
    }
    
     public List dispatch(packingdto f, String count) throws ParseException {
        List l = new ArrayList();
        Session s = HibernateUtil.getSessionFactory().openSession();
        List<PkDispatched> list=new ArrayList<>(); 
        String d = f.getDate();
        String d1 = f.getDate1();
        SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yy");
        Date date = sf.parse(d);
        Date date1 = sf.parse(d1);
        int c=0; Date d2; String packtype; int bags=0;int bags1=0;
        List<String> dept = new ArrayList<>();
        List<PkDispatched> cl = (List<PkDispatched>) s.createCriteria(PkDispatched.class).list();
        for (PkDispatched dl : cl) {
            dept.add(dl.getCount().toString());
        }
         try {
             System.out.println("\n sddsdddssdsdsdsdsdsddssdsdsdsddssdsdsdsd"+dept);
             if (dept.contains(count))
             {
                int i = Integer.parseInt(count);
                Criteria c2 = s.createCriteria(PkDispatched.class);
                c2.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("count", i));
                list = c2.list();
                for(Object o : list)
               {
                   PkDispatched pk=(PkDispatched) o;
                   c=pk.getCount();d2=pk.getDate(); 
                   bags=pk.getNoOfBags();
                     packtype=pk.getPackingType();
                   System.out.println("\n zzzzzzzzzzzzzzzzzzzzzzz"+c+d2+packtype+"bagsssssssss"+bags);
                   bags1+=bags;
               }
                   System.out.println("\n no of bagssssssssssssss"+bags1);
               Criteria c3 = s.createCriteria(PkDispatched.class).add(Restrictions.eq("count", c));
               l = c3.list();
               System.out.println("trririririririririririri" + l);
              }
        
        } catch (HibernateException e) 
        {
                 e.printStackTrace();
        }
         catch(Exception e)
         {
             e.printStackTrace();
         }
        return l;
    }
     
     
     
     
      
       public List retrieveReadyToPk1(String dd, List countlist1) {
        System.out.println("insideeeeeee ready toj pack retrieve ................");
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List listf = new ArrayList<>();
        List list = new ArrayList<>();
         List list1 = new ArrayList<>();
          List list3 = new ArrayList<>();
           List pack = new ArrayList<>();
           List fromdt =null;
          List todt=null,l1=null;
            try {
        String dor = dd;
        System.out.println("--------------------------->"+dor);
        String dor1 = dd;
        String cont="All";
        System.out.println("the count value is-------------->"+cont);
        Integer count = null;
        if(!cont.equals("All"))
            count=Integer.parseInt(cont);
        
        System.out.println("the count issssss-------------------->"+count);

        System.out.println("date issssssss" + dor);
        System.out.println("date date issssssss" + dor1);

      
            
              String sql = "SELECT MIN(actual_date) FROM child_packing UNION SELECT MIN(actual_date) FROM child_openend;";
          
        Query query = s.createSQLQuery(sql);
       fromdt = query.list();
       
        //System.out.println("the date from isssssss--------------------------->"+fromdt);
        if(!fromdt.isEmpty()){
            for(int i=0;i<fromdt.size();i++){
                if(fromdt.get(i)==null)
                    fromdt.remove(i);
            }
        }
       System.out.println("the date from isssssss---------000000000000------------------>"+fromdt);
         Collections.sort(fromdt, new Comparator<Date>() {
            @Override
            public int compare(Date o1, Date o2) {
                return o1.compareTo(o2);
            }
        });
          Date startDate=(Date) fromdt.get(0);
          
          
           String sqll = "SELECT MAX(actual_date) FROM child_packing UNION SELECT MAX(actual_date) FROM child_openend;";
          
        Query queryl = s.createSQLQuery(sqll);
       todt = queryl.list();
       
        //System.out.println("the date from isssssss--------------------------->"+fromdt);
        if(!todt.isEmpty()){
            for(int i=0;i<todt.size();i++){
                if(todt.get(i)==null)
                    todt.remove(i);
            }
        }
       // System.out.println("the date from isssssss---------000000000000------------------>"+fromdt);
         Collections.sort(todt, new Comparator<Date>() {
            @Override
            public int compare(Date o1, Date o2) {
                return o1.compareTo(o2);
            }
        });
         Date endDate=(Date) todt.get(todt.size()-1);
           
            
            SimpleDateFormat st = new SimpleDateFormat("yyyy-MM-dd");
            Date date = st.parse(dor);
            System.out.println("--------------------------->" + date);
            Date date1 = st.parse(dor1);
            System.out.println("--------------------------->" + date1);
            Criteria c = s.createCriteria(ParentPacking.class);
            //c.add(Restrictions.between("date", date, date1));
            list = c.list();
            t.commit();
            s.close();
            System.out.println("the list from parent packing is--------------->"+list);
             Session s1 = HibernateUtil.getSessionFactory().openSession();
        Transaction t1 = s1.beginTransaction();
        int id;
            
            for(Object o:list){
                 List l = null;
                ParentPacking pp=(ParentPacking)o;
                id=pp.getIdpq();
               
                if(!cont.equals("All")){
                   
                Criteria c1 = s1.createCriteria(ChildPacking.class);
                c1.add(Restrictions.eq("parentPacking.idpq", id)).add(Restrictions.eq("countDb", count));
                l=c1.list();
                 System.out.println("ljd=--------sdjf=----------lkjf---------ksj"+id+"......***....."+l);
                s1.flush();
                s1.clear();
                list1.addAll(l);
                }
                else{
                    System.out.println("with count all in chid packing");
                Criteria c1 = s1.createCriteria(ChildPacking.class);
                c1.add(Restrictions.eq("parentPacking.idpq", id));
                l=c1.list();
                s1.flush();
                s1.clear();
                list1.addAll(l); 
               
                }
            }
             System.out.println("the list is of child packing -------------->"+list1);
               List list2 = new ArrayList<>();
             Criteria c2= s1.createCriteria(ParentOpenend.class);
           // c2.add(Restrictions.between("date", date, date1));
            list2 = c2.list();
             System.out.println("the list  in parent openend is -------------->"+list2);
             
            t1.commit();
            s1.close();
            
             Session s3 = HibernateUtil.getSessionFactory().openSession();
        Transaction t3 = s3.beginTransaction();
        int id3;
            
            for(Object o:list2){
                 List l = null;
                ParentOpenend pp=(ParentOpenend)o;
                id3=pp.getIdo();
                if(!cont.equals("All")){
                Criteria c1 = s3.createCriteria(ChildOpenend.class);
                c1.add(Restrictions.eq("parentOpenend.ido", id3)).add(Restrictions.eq("count", count));
                l=c1.list();
                s3.flush();
                s3.clear();
                list3.addAll(l);
                }
                else{
                Criteria c1 = s3.createCriteria(ChildOpenend.class);
                c1.add(Restrictions.eq("parentOpenend.ido", id3));
                l=c1.list();
                s3.flush();
                s3.clear();
                list3.addAll(l); 
                }
            }
            System.out.println("the child openend is ---------------->"+list3);
            
            
            String aq = "delete from ready_to_pack;";
        Query qu = s3.createSQLQuery(aq);
        qu.executeUpdate();
            
            t3.commit();
            s3.close();
            
            
            List<Date> dates = new ArrayList<>();
//        Date startDate = date;
//        Date endDate = date1;
        long interval = 24 * 1000 * 60 * 60; // 1 hour in millis
        long endTime = endDate.getTime(); // create your endtime here, possibly using Calendar or Date
        long curTime = startDate.getTime();
        while (curTime <= endTime) {
            dates.add(new Date(curTime));
            curTime += interval;
        }
//        for (int i = 0; i < dates.size(); i++) {
//            Date lDate = (Date) dates.get(i);
//            //String ds = ft.format(lDate);
//            System.out.println(" Date is ............" + lDate);
//        }
         Session s4 = HibernateUtil.getSessionFactory().openSession();
        Transaction t4 = s4.beginTransaction();
        
         for (int i = 0; i < dates.size(); i++) { 
             float opstock=0;
             float pkbags=0;
             float readytopack=0;
            if(!cont.equals("All")){
                  
                for(Object o:list1){
                 ChildPacking cp=(ChildPacking)o;
                    Date d = null;
                     if(cp.getActualDate()!=null)
                        d=cp.getActualDate();
                     if(d!=null)
                     if(d.compareTo(dates.get(i)) == 0){
                         pkbags+=cp.getNoofKgsPacked();
                     }
                 }
                
//                 if(i==0){
//                    //Date oneDayBefore = new Date(dates.get(i).getTime() - 2);
//                Criteria c1 = s4.createCriteria(Counts.class);
//                c1.add(Restrictions.eq("count", count.toString()));
//                l1 = c1.list();
//                for (Object o1 : l1) {
//                    Counts sp1 = (Counts) o1;
//                    if (sp1.getOpenStock() != null) {
//                        opstock += sp1.getOpenStock();
//                    }
//                    System.out.println("the openstock form counts are------------>" + opstock);
//                }
//                }
                
                for(Object o1:list3){
                    ChildOpenend co=(ChildOpenend)o1;
                     Date d=null;
                    if(co.getActualDate()!=null)
                        d=co.getActualDate();
                    if(d!=null)
                     if(d.compareTo(dates.get(i)) == 0){
                         opstock+=co.getActualProduction();
                     }
                }
                 Date before=new Date(dates.get(i).getTime() - 2);
                   Criteria c4= s4.createCriteria(ReadyToPack.class);
                        c4.add(Restrictions.eq("date", before)).add(Restrictions.eq("count",cont));
                     pack = c4.list();
                     if(pack!=null){
                     for(Object ot:pack){
                         ReadyToPack cpg=(ReadyToPack)ot;
                         opstock+=cpg.getReadytopackKgs();
                     }
                         
                     }
                
                
                
                if(!(opstock==0.0 && pkbags==0.0)){
                readytopack=opstock-pkbags;
                ReadyToPack rp=new ReadyToPack();
                rp.setDate(dates.get(i));
                rp.setCount(count);
                rp.setOpeningStockKgs(opstock);
                rp.setPackedbagsKgs(pkbags);
                rp.setReadytopackKgs(readytopack);
                s4.save(rp);
                s4.flush();
                s4.clear();
                }
                     
            }
            else{
                System.out.println("-----------count immmmmmmmmm------------ s.......");
                for(int j=0;j<countlist1.size();j++){
                    opstock=0;
                    pkbags=0;
                    readytopack=0;
                     for(Object o:list1){
                         
                     ChildPacking cp=(ChildPacking)o;
                     Date d = null;
                     if(cp.getActualDate()!=null)
                        d=cp.getActualDate();
                     String cnt = null;
                     if(cp.getCountDb()!=null)
                        cnt=cp.getCountDb().toString();
                       
                     if(d!=null && cnt!=null)
                     if(d.compareTo(dates.get(i)) == 0 && cnt.equals(countlist1.get(j).toString())){
                         if(cp.getNoofKgsPacked()!=null)
                         pkbags+=cp.getNoofKgsPacked();
                     }
                 }
                for(Object o1:list3){
                    ChildOpenend co=(ChildOpenend)o1;
                    Date d=null;
                    if(co.getActualDate()!=null)
                        d=co.getActualDate();
                    String cnt=null;
                    if(co.getCount()!=null)
                        cnt=co.getCount().toString();
                  //  System.out.println("**************----------------------"+cnt);
                    if(d!=null && cnt!=null)
                     if(d.compareTo(dates.get(i)) == 0 && cnt.equals(countlist1.get(j).toString())){
                        // System.out.println("**************-----------************************-----------"+cnt);
                         if(co.getActualProduction()!=null)
                         opstock+=co.getActualProduction();
                     }
                }
              //   System.out.println("in child packing the---------- count values aer......////........******"+opstock+"......000000........"+countlist1.get(j));   
                
                 Integer cou=Integer.parseInt(countlist1.get(j).toString());
               //  System.out.println("count is.....------------------------***************------------->"+cou);
               
//                if(i==0){
//                    //Date oneDayBefore = new Date(dates.get(i).getTime() - 2);
//                Criteria c1 = s4.createCriteria(Counts.class);
//                c1.add(Restrictions.eq("count", countlist1.get(j).toString()));
//                l1 = c1.list();
//                for (Object o1 : l1) {
//                    Counts sp1 = (Counts) o1;
//                    if (sp1.getOpenStock() != null) {
//                        opstock += sp1.getOpenStock();
//                    }
//                    System.out.println("the openstock form counts are-------if count is alll----->" + opstock);
//                }
//                }
               
               
                   Date before=new Date(dates.get(i).getTime() - 2);
                   Criteria c4= s4.createCriteria(ReadyToPack.class);
                        c4.add(Restrictions.eq("date", before)).add(Restrictions.eq("count",cou));
                     pack = c4.list();
                     if(pack!=null){
                     for(Object ot:pack){
                         ReadyToPack cpg=(ReadyToPack)ot;
                         opstock+=cpg.getReadytopackKgs();
                     }
                         
                     }
               
               
               if(!(opstock==0.0 && pkbags==0.0)){
                readytopack=opstock-pkbags;
               }
                ReadyToPack rp=new ReadyToPack();
                   System.out.println("ready to pack issss"+dates.get(i));
                   System.out.println("ready to pack issss"+cou);
                   System.out.println("opening stock"+opstock);
                   System.out.println("PK Bags"+pkbags);
                   System.out.println("kgsss"+readytopack);
                rp.setDate(dates.get(i));
                rp.setCount(cou);
                rp.setOpeningStockKgs(opstock);
                rp.setPackedbagsKgs(pkbags);
                rp.setReadytopackKgs(readytopack);
                s4.save(rp);
                s4.flush();
                s4.clear();
                
                }
                
            }
           
         }
          t4.commit();
          s4.close();
          
          
           Session s5 = HibernateUtil.getSessionFactory().openSession();
            Transaction tr = s5.beginTransaction();

            Criteria c1 = s5.createCriteria(ReadyToPack.class).add(Restrictions.between("date", date, date1));
            listf = c1.list();
            tr.commit();
            s5.close();
            
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("the exception in ready to packing is---------------->"+e);
        }
        System.out.println("----333333------------------11111--->" + listf);
        return listf;
    }
    
       
       
 public List retrieveReadyToPk(packingdto pt, List countlist1) {
        System.out.println("insideeeeeee **********///*************/***** ready toj pack retrieve ................");
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List listf = new ArrayList<>();
        List list = new ArrayList<>();
         List list1 = new ArrayList<>();
          List list3 = new ArrayList<>();
           List pack = new ArrayList<>();
           List fromdt =null;
          List todt=null,l1=null;
         String dor = pt.getDate();
        System.out.println("--------------------------->"+dor);
        String dor1 = pt.getDate1();
        String cont=pt.getCount();
        System.out.println("the count value is-------------->"+cont);
        Integer count = null;
        if(!cont.equals("All"))
            count=Integer.parseInt(cont);
        
        System.out.println("the count issssss-------------------->"+count);

        System.out.println("date issssssss" + dor);
        System.out.println("date date issssssss" + dor1);

        try {
            
              String sql = "SELECT MIN(actual_date) FROM child_packing UNION SELECT MIN(actual_date) FROM child_openend;";
          
        Query query = s.createSQLQuery(sql);
       fromdt = query.list();
       
        //System.out.println("the date from isssssss--------------------------->"+fromdt);
        if(!fromdt.isEmpty()){
            for(int i=0;i<fromdt.size();i++){
                if(fromdt.get(i)==null)
                    fromdt.remove(i);
            }
        }
       System.out.println("the date from isssssss---------000000000000------------------>"+fromdt);
         Collections.sort(fromdt, new Comparator<Date>() {
            @Override
            public int compare(Date o1, Date o2) {
                return o1.compareTo(o2);
            }
        });
          Date startDate=(Date) fromdt.get(0);
          
          
           String sqll = "SELECT MAX(actual_date) FROM child_packing UNION SELECT MAX(actual_date) FROM child_openend;";
          
        Query queryl = s.createSQLQuery(sqll);
       todt = queryl.list();
       
        //System.out.println("the date from isssssss--------------------------->"+fromdt);
        if(!todt.isEmpty()){
            for(int i=0;i<todt.size();i++){
                if(todt.get(i)==null)
                    todt.remove(i);
            }
        }
       // System.out.println("the date from isssssss---------000000000000------------------>"+fromdt);
         Collections.sort(todt, new Comparator<Date>() {
            @Override
            public int compare(Date o1, Date o2) {
                return o1.compareTo(o2);
            }
        });
         Date endDate=(Date) todt.get(todt.size()-1);
           
            
           SimpleDateFormat st = new SimpleDateFormat("dd-MM-yy");
            Date date = st.parse(dor);
            System.out.println("--------------------------->" + date);
            Date date1 = st.parse(dor1);
            System.out.println("--------------------------->" + date1);
            Criteria c = s.createCriteria(ParentPacking.class);
            //c.add(Restrictions.between("date", date, date1));
            list = c.list();
            t.commit();
            s.close();
            System.out.println("the list from parent packing is--------------->"+list);
             Session s1 = HibernateUtil.getSessionFactory().openSession();
        Transaction t1 = s1.beginTransaction();
        int id;
            
            for(Object o:list){
                 List l = null;
                ParentPacking pp=(ParentPacking)o;
                id=pp.getIdpq();
               
                if(!cont.equals("All")){
                   
                Criteria c1 = s1.createCriteria(ChildPacking.class);
                c1.add(Restrictions.eq("parentPacking.idpq", id)).add(Restrictions.eq("countDb", count));
                l=c1.list();
                 System.out.println("ljd=--------sdjf=----------lkjf---------ksj"+id+"......***....."+l);
                s1.flush();
                s1.clear();
                list1.addAll(l);
                }
                else{
                    System.out.println("with count all in chid packing");
                Criteria c1 = s1.createCriteria(ChildPacking.class);
                c1.add(Restrictions.eq("parentPacking.idpq", id));
                l=c1.list();
                s1.flush();
                s1.clear();
                list1.addAll(l); 
               
                }
            }
             System.out.println("the list is of child packing -------------->"+list1);
               List list2 = new ArrayList<>();
             Criteria c2= s1.createCriteria(ParentOpenend.class);
           // c2.add(Restrictions.between("date", date, date1));
            list2 = c2.list();
             System.out.println("the list  in parent openend is -------------->"+list2);
             
            t1.commit();
            s1.close();
            
             Session s3 = HibernateUtil.getSessionFactory().openSession();
        Transaction t3 = s3.beginTransaction();
        int id3;
            
            for(Object o:list2){
                 List l = null;
                ParentOpenend pp=(ParentOpenend)o;
                id3=pp.getIdo();
                if(!cont.equals("All")){
                Criteria c1 = s3.createCriteria(ChildOpenend.class);
                c1.add(Restrictions.eq("parentOpenend.ido", id3)).add(Restrictions.eq("count", count));
                l=c1.list();
                s3.flush();
                s3.clear();
                list3.addAll(l);
                }
                else{
                Criteria c1 = s3.createCriteria(ChildOpenend.class);
                c1.add(Restrictions.eq("parentOpenend.ido", id3));
                l=c1.list();
                s3.flush();
                s3.clear();
                list3.addAll(l); 
                }
            }
            System.out.println("the child openend is ---------------->"+list3);
            
            
            String aq = "delete from ready_to_pack;";
        Query qu = s3.createSQLQuery(aq);
        qu.executeUpdate();
            
            t3.commit();
            s3.close();
            
            
            List<Date> dates = new ArrayList<>();
//        Date startDate = date;
//        Date endDate = date1;
        long interval = 24 * 1000 * 60 * 60; // 1 hour in millis
        long endTime = endDate.getTime(); // create your endtime here, possibly using Calendar or Date
        long curTime = startDate.getTime();
        while (curTime <= endTime) {
            dates.add(new Date(curTime));
            curTime += interval;
        }
//        for (int i = 0; i < dates.size(); i++) {
//            Date lDate = (Date) dates.get(i);
//            //String ds = ft.format(lDate);
//            System.out.println(" Date is ............" + lDate);
//        }
         Session s4 = HibernateUtil.getSessionFactory().openSession();
        Transaction t4 = s4.beginTransaction();
        
         for (int i = 0; i < dates.size(); i++) { 
             float opstock=0;
             float pkbags=0;
             float readytopack=0;
            if(!cont.equals("All")){
                  
                for(Object o:list1){
                 ChildPacking cp=(ChildPacking)o;
                    Date d = null;
                     if(cp.getActualDate()!=null)
                        d=cp.getActualDate();
                     if(d!=null)
                     if(d.compareTo(dates.get(i)) == 0){
                         pkbags+=cp.getNoofKgsPacked();
                     }
                 }
                 if(i==0){
                    //Date oneDayBefore = new Date(dates.get(i).getTime() - 2);
                Criteria c1 = s4.createCriteria(Counts.class);
                c1.add(Restrictions.eq("count", count.toString()));
                l1 = c1.list();
                for (Object o1 : l1) {
                    Counts sp1 = (Counts) o1;
                    if (sp1.getOpenStock() != null) {
                        opstock += sp1.getOpenStock();
                    }
                    System.out.println("the openstock form counts are------------>" + opstock);
                }
                }
                for(Object o1:list3){
                    ChildOpenend co=(ChildOpenend)o1;
                     Date d=null;
                    if(co.getActualDate()!=null)
                        d=co.getActualDate();
                    if(d!=null)
                     if(d.compareTo(dates.get(i)) == 0){
                         opstock+=co.getActualProduction();
                     }
                }
                 Date before=new Date(dates.get(i).getTime() - 2);
                   Criteria c4= s4.createCriteria(ReadyToPack.class);
                        c4.add(Restrictions.eq("date", before)).add(Restrictions.eq("count",count));
                     pack = c4.list();
                     if(pack!=null){
                     for(Object ot:pack){
                         ReadyToPack cpg=(ReadyToPack)ot;
                         opstock+=cpg.getReadytopackKgs();
                     }
                         
                     }
                
                
                
                if(!(opstock==0.0 && pkbags==0.0)){
                readytopack=opstock-pkbags;
                ReadyToPack rp=new ReadyToPack();
                rp.setDate(dates.get(i));
                rp.setCount(count);
                rp.setOpeningStockKgs(opstock);
                rp.setPackedbagsKgs(pkbags);
                rp.setReadytopackKgs(readytopack);
                s4.save(rp);
                s4.flush();
                s4.clear();
                }
                     
            }
            else{
                System.out.println("-----------count immmmmmmmmm------------ s.......");
                for(int j=0;j<countlist1.size();j++){
                    opstock=0;
                    pkbags=0;
                    readytopack=0;
                     for(Object o:list1){
                         
                     ChildPacking cp=(ChildPacking)o;
                     Date d = null;
                     if(cp.getActualDate()!=null)
                        d=cp.getActualDate();
                     String cnt = null;
                     if(cp.getCountDb()!=null)
                        cnt=cp.getCountDb().toString();
                       
                     if(d!=null && cnt!=null)
                     if(d.compareTo(dates.get(i)) == 0 && cnt.equals(countlist1.get(j).toString())){
                         if(cp.getNoofKgsPacked()!=null)
                         pkbags+=cp.getNoofKgsPacked();
                     }
                 }
                for(Object o1:list3){
                    ChildOpenend co=(ChildOpenend)o1;
                    Date d=null;
                    if(co.getActualDate()!=null)
                        d=co.getActualDate();
                    String cnt=null;
                    if(co.getCount()!=null)
                        cnt=co.getCount().toString();
                  //  System.out.println("**************----------------------"+cnt);
                    if(d!=null && cnt!=null)
                     if(d.compareTo(dates.get(i)) == 0 && cnt.equals(countlist1.get(j).toString())){
                        // System.out.println("**************-----------************************-----------"+cnt);
                         if(co.getActualProduction()!=null)
                         opstock+=co.getActualProduction();
                     }
                }
              //   System.out.println("in child packing the---------- count values aer......////........******"+opstock+"......000000........"+countlist1.get(j));   
                
                 Integer cou=Integer.parseInt(countlist1.get(j).toString());
               //  System.out.println("count is.....------------------------***************------------->"+cou);
               
               if(i==0){
                    //Date oneDayBefore = new Date(dates.get(i).getTime() - 2);
                Criteria c1 = s4.createCriteria(Counts.class);
                c1.add(Restrictions.eq("count", countlist1.get(j).toString()));
                l1 = c1.list();
                for (Object o1 : l1) {
                    Counts sp1 = (Counts) o1;
                    if (sp1.getOpenStock() != null) {
                        opstock += sp1.getOpenStock();
                    }
                    System.out.println("the openstock form counts are-------if count is alll----->" + opstock);
                }
                }
               
               
                   Date before=new Date(dates.get(i).getTime() - 2);
                   Criteria c4= s4.createCriteria(ReadyToPack.class);
                        c4.add(Restrictions.eq("date", before)).add(Restrictions.eq("count",cou));
                     pack = c4.list();
                     if(pack!=null){
                     for(Object ot:pack){
                         ReadyToPack cpg=(ReadyToPack)ot;
                         opstock+=cpg.getReadytopackKgs();
                     }
                         
                     }
               
               
               if(!(opstock==0.0 && pkbags==0.0)){
                readytopack=opstock-pkbags;
                }
                ReadyToPack rp=new ReadyToPack();
                   System.out.println("ready to pack issss"+dates.get(i));
                   System.out.println("ready to pack issss"+cou);
                   System.out.println("opening stock"+opstock);
                   System.out.println("PK Bags"+pkbags);
                   System.out.println("kgsss"+readytopack);
                rp.setDate(dates.get(i));
                rp.setCount(cou);
                rp.setOpeningStockKgs(opstock);
                rp.setPackedbagsKgs(pkbags);
                rp.setReadytopackKgs(readytopack);
                s4.save(rp);
                s4.flush();
                s4.clear();
               
                }
                
            }
           
         }
          t4.commit();
          s4.close();
          
          
           Session s5 = HibernateUtil.getSessionFactory().openSession();
            Transaction tr = s5.beginTransaction();
//            if(cont.equals("All")){
//                 System.out.println("*..==the count is all*****"+cont);
//                 Criteria c1 = s5.createCriteria(ReadyToPack.class).add(Restrictions.between("date", date, date1));
//            listf = c1.list();
//            }
//            else{
                System.out.println("==**..the count is not all*****");
                 Criteria c1 = s5.createCriteria(ReadyToPack.class).add(Restrictions.between("date", date, date1));
            listf = c1.list();
           // }
            tr.commit();
            s5.close();
            
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("the exception in ready to packing is---------------->"+e);
        }
        System.out.println("----333333----------****....*****--------11111--->" + listf);
        return listf;
    }
 
 public boolean packingDataVal(packingdto form) {
      Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        
        try {
           String date=form.getDate();
           String packername=form.getSupervisor();
            SimpleDateFormat sf1 = new SimpleDateFormat("yyyy-MM-dd");
            Date doj1 = sf1.parse(date);
            System.out.println("sjhfj999999999..,,,,,," + date);
            System.out.println("------->>>>>>>>>>>>"+doj1+packername);
            
            Criteria c=s.createCriteria(ParentPacking.class);
            c.add(Restrictions.eq("date",doj1));
            c.add(Restrictions.eq("supervisor", packername));
            List l=c.list();
            if(l.isEmpty()) {
                return false;
            }
            
        }
        catch(Exception e) {
            
        }
        return true;
    }
 
 
}
