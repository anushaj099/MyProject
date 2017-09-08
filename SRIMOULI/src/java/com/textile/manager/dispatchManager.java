/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.manager;

import com.textile.dto.dispatchDTO;
import com.textile.dto.packingdto;
import com.textile.model.ChildPacking;
import com.textile.model.Counts;
import com.textile.model.FinancialYearBackup;
import com.textile.model.Login;
import com.textile.model.PackPatterns;
import com.textile.model.ParentPacking;
import com.textile.model.PkDispatched;
import com.textile.model.Superviser;
import com.textile.util.HibernateUtil;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author anusha
 */
public class dispatchManager {

    public List dispatchList1(int id) {

        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        //  String packing="packing";
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

    public List dispatchList(dispatchDTO oe) {

        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        //  String packing="packing";
        List<Login> list = null;
        System.out.println("list is-------------" + oe.getIdk());
        try {
            Criteria c = s.createCriteria(Login.class);
            c.add(Restrictions.eq("id", oe.getIdk()));
            list = c.list();
        } catch (Exception e) {

        }
        System.out.println("list is:------->>>>" + list);
        return list;

    }
    
     public List retrieveDispatch(dispatchDTO pt,String count) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<ParentPacking> list = new ArrayList<>();
        String packtype = pt.getPackingType();
        System.out.println(">>>>>>>>>>>>>>>>>>>" + packtype+count);
        List<String> dept = new ArrayList<>();
        List<Counts> cl = (List<Counts>) s.createCriteria(Counts.class).list();
        for (Counts dl : cl) {
            dept.add(dl.getCount());
        }
        String dor = pt.getDate();
        String dor1 = pt.getDate1();
        try {
            SimpleDateFormat st = new SimpleDateFormat("dd-MM-yy");
            Date date = st.parse(dor);
            System.out.println("--------------------------->" + date);
            Date date1 = st.parse(dor1);
            System.out.println("--------------------------->" + date1);
            Criteria c = s.createCriteria(PkDispatched.class);
            if (dept.contains(count) && packtype.equals("Bag")) 
            {
                int count1=Integer.parseInt(count);
                c.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("count", count1)).add(Restrictions.eq("packingType", packtype));
                list = c.list();
                System.out.println("\n aaaaaaaaaaaa"+list);
            } 
            else if (dept.contains(count) && packtype.equals("Box")) 
            {
                int count1=Integer.parseInt(count);
                c.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("count", count1)).add(Restrictions.eq("packingType", packtype));
                list = c.list();
                System.out.println("\n bbbbbbbbbbb"+list);
            } 
            else if (dept.contains(count) && packtype.equals("All")) 
            {
                int count1=Integer.parseInt(count);
                c.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("count", count1));
                list = c.list();
                System.out.println("\n cccccccccccccc"+list);
            }
            else if (count.equals("All") && packtype.equals("Bag")) 
            {
                c.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("packingType", packtype));
                list = c.list();
                System.out.println("\n ddddddddddddddddd"+list);
            }
            else if (count.equals("All") && packtype.equals("Box")) 
            {
                c.add(Restrictions.between("date", date, date1)).add(Restrictions.eq("packingType", packtype));
                list = c.list();
                System.out.println("\n eeeeeeeeeeeeeeeeee"+list);
            }
            else if (count.equals("All") && packtype.equals("All"))
            {
                c.add(Restrictions.between("date", date, date1));
                list = c.list();
                System.out.println("\n ttttttttttttttt"+list);
            }
            
            System.out.println("triveniiiiiiiiiiiiiiii" + list);

            t.commit();
            s.close();

        } catch (Exception e) {

        }

        System.out.println("list is" + list);
        return list;
    }
 
    
      public List countList1() {
        List l = new ArrayList();
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        try {
            Criteria c = s.createCriteria(Counts.class).setProjection(Projections.projectionList().add(Projections.property("count")));
            l = c.list();
        } catch (Exception e) {

        }
        l.add("All");
        return l;
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

    public List count() {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<String> dept = new ArrayList<>();
        List<Counts> l = (List<Counts>) s.createCriteria(Counts.class).list();
        for (Counts d : l) {
            dept.add(d.getCount());
            
        }
        return dept;
    }
    
    public List count1(){
        Session s=HibernateUtil.getSessionFactory().openSession();
        Transaction t=s.beginTransaction();
        List<String> dept = new ArrayList<>();
        List<Counts> l = (List<Counts>) s.createCriteria(Counts.class).list();
        
        for (Counts d : l) {
            dept.add(d.getCount());
           
        }
         dept.add("All");
        return dept;
    }
//    
    
    

    public void insert(dispatchDTO p,packingdto form, String box, String boxtare) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        try {
            System.out.println("kingggggggggggggggggggg");
            PkDispatched l = new PkDispatched();
            String d = p.getDate();
            SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yy");
            Date d1 = sf.parse(d);
            l.setDate(d1);
            l.setBagSerialNo(p.getBagSerialNo());
            l.setCount(p.getCount());
            l.setCustomer(p.getCustomer());
            l.setLotNo(p.getLotNo());
            l.setNetWt(p.getNetWt());
            l.setPackingType(p.getPackingType());
            if(p.getPackingType().equals("Bag")){
            l.setPackingWeight(p.getPackingWeight());
            l.setTareWeight(p.getTareWeight());
            }
            else{
               l.setPackingWeight(box); 
               l.setTareWeight(boxtare);
            }
            l.setExpectedGrossWt(p.getExpectedGrossWt());
            l.setNoOfBags(p.getNoOfBags());
            l.setExtraYarnCent(p.getExtraYarnCent());
            l.setRemarks(p.getRemarks());
            l.setVehicleNo(p.getVehicleNo());
            l.setWeighingBridge(p.getWeighingBridge());
            s.save(l);
         // t.commit();
         // s.close();
            System.out.println("*********************************$$$$$$$$$$" +boxtare);
            
            
           
            ChildPacking p1 = new ChildPacking();
             List lis = null;
             String dd = p.getDate();
            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yy");
            Date ddd = sf.parse(dd);
            System.out.println("heloooooooooooooooooooo"+ddd);
             Criteria c2 = s.createCriteria(ChildPacking.class).add(Restrictions.eq("actualDate",ddd)).add(Restrictions.eq("countDb", p.getCount())).add(Restrictions.eq("boxType", p.getPackingType()));
            lis = c2.list();
            System.out.println("22222222222222"+lis);
            Float op,pb,dis;
            if (lis != null) {
                for (Object o : lis) {
                    System.out.println("kjdgh---------dhg+++++++++++++++");
                    ChildPacking cq = (ChildPacking) o;
                    Date date=cq.getActualDate();
                    System.out.println("ddddddddddddddddddd"+date);
                    int count=cq.getCountDb();
                    System.out.println("countttttttttttttttt"+count);
                    String type=cq.getBoxType();
                    System.out.println("tyyyyyyyypeeeeeeeeeeeee"+type);
                    op=cq.getOpeningStock();
                    pb=cq.getPackedBags();
                    System.out.println("OP ISS"+op);
                    System.out.println("PACKED BAGS"+pb);
                    
                   List list=null;
                   List list1=null;
                  Criteria c3 = s.createCriteria(ChildPacking.class);
                  c3.add(Restrictions.eq("actualDate", date)).add(Restrictions.eq("countDb", count)).add(Restrictions.eq("boxType", type));
                  list=c3.list();
                  System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaa"+list);
                  
                  String swa=cq.getCClose();
                  Float weight=Float.valueOf(swa);
                    System.out.println("weight issssssss"+weight);
                    
                
                       Float bags1=cq.getDispatch();
                       System.out.println("prrrrrrrrrrrrrrrr"+bags1);
                       Integer bags=p.getNoOfBags();
                  Float b=Float.valueOf(bags);
                      System.out.println("previousssssssssssssssss"+b);
                //  Float b1=Float.valueOf(bags1);
                
                bags1+=b;
                dis=((op+pb)-bags1);
                Float dis1=weight*dis;
                      System.out.println("bagssssssssssssss areeeeeeeeee"+bags1);
                      System.out.println("disclose issssssss"+dis1);
                  cq.setDispatch(bags1);
                  cq.setDisclose(dis1);
                  s.update(cq);
                   
                  //}
                  /*String bags=p.getNoOfBags();
                  Float b=Float.valueOf(bags);
                  cq.setDpatch(b);
                  s.update(cq);*/
                  
                    System.out.println("lllllllllllllllllllll"+list);
                }
            }
            t.commit();
            s.close();
            
        
      //  int r=s.createSQLQuery(sql).executeUpdate();
            System.out.println("wowwwwwwwwwwwwwwwwwwwwwwww");
             
             
        } catch (Exception e) {
            System.out.println(e);
            e.printStackTrace();
            s.close();
        }
    }
    
    
    public void generate(dispatchDTO p) throws ParseException {
         Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
     ChildPacking p1 = new ChildPacking();
       Float op,pb,dis;
             List lis = null;
             String dd = p.getDate();
            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yy");
            Date ddd = sdf.parse(dd);
            System.out.println("heloooooooooooooooooooo"+ddd);
             Criteria c2 = s.createCriteria(ChildPacking.class).add(Restrictions.eq("actualDate",ddd)).add(Restrictions.eq("countDb", p.getCount())).add(Restrictions.eq("boxType", p.getPackingType()));
            lis = c2.list();
            System.out.println("22222222222222"+lis);
            if (lis != null) {
                for (Object o : lis) {
                    System.out.println("kjdgh---------dhg+++++++++++++++");
                    ChildPacking cq = (ChildPacking) o;
                    Date date=cq.getActualDate();
                    System.out.println("ddddddddddddddddddd"+date);
                    int count=cq.getCountDb();
                    System.out.println("countttttttttttttttt"+count);
                    String type=cq.getBoxType();
                    System.out.println("tyyyyyyyypeeeeeeeeeeeee"+type);
                    
                     op=cq.getOpeningStock();
                     pb=cq.getPackedBags();
                     System.out.println("opening stock is"+op);
                     System.out.println("packed bagsis"+pb);
                      
                    
                   List list=null;
                   List list1=null;
//                  Criteria c3 = s.createCriteria(ChildPacking.class);
//                  c3.add(Restrictions.eq("actualDate", date)).add(Restrictions.eq("countDb", count)).add(Restrictions.eq("boxType", type));
//                  list=c3.list();
//                  System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaa"+list);
//                   
                
                       Float bags1=cq.getDispatch();
                       System.out.println("prrrrrrrrrrrrrrrr"+bags1);
                       Integer bags=p.getNoOfBags();
                  Float b=Float.valueOf(bags);
                      System.out.println("previousssssssssssssssss"+b);
                //  Float b1=Float.valueOf(bags1);
                if(bags1.equals(0.0f)) {
                    bags1=b;
                }
                else {
                     bags1+=b; 
                }
                dis=(op+pb)-bags1;
//                for(Object o1:list) {
//                    ChildPacking cp=(ChildPacking) o1;
//                     op=cp.getOpeningStock();
//                     pb=cp.getPackedBags();
//                     System.out.println("opening stock is"+op);
//                       System.out.println("packed bagsis"+pb);
//                        dis=(op+pb)-bags1;
//                }
              
              
                      System.out.println("bagssssssssssssss areeeeeeeeee"+bags1);
                      System.out.println("------------->>>>>>>>>>>>>>"+dis);
                  cq.setDispatch(bags1);
                  cq.setDisclose(dis);
                  s.update(cq);
                   
                  //}
                  /*String bags=p.getNoOfBags();
                  Float b=Float.valueOf(bags);
                  cq.setDpatch(b);
                  s.update(cq);*/
                  
                    System.out.println("lllllllllllllllllllll"+list);
                }
            }
    }
    
    
    
    public dispatchDTO insert2(packingdto form,dispatchDTO p) throws ParseException{
            
         Session s2 = HibernateUtil.getSessionFactory().openSession();
         Transaction t2 = s2.beginTransaction();
         ChildPacking cp=new ChildPacking();
        
         
        return p;
    }

    public boolean check(dispatchDTO gsd) throws ParseException {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        boolean succ = true;
        try {
            List<PkDispatched> l = new ArrayList<>();

            String dd = gsd.getDate();
            SimpleDateFormat sf1 = new SimpleDateFormat("dd-MM-yy");
            Date doj1 = sf1.parse(dd);
            System.out.println("sjhfj999999999..,,,,,," + dd);
            Date oneDayBefore = new Date(doj1.getTime() - 2);
            System.out.println("shgtfjerhgt........++++++++=//////////............" + oneDayBefore);
            Criteria c = s.createCriteria(PkDispatched.class);
            l = c.list();
            // c.add(Restrictions.eq("date",oneDayBefore));
            Date d = null;
            for (Object o : l) {
                PkDispatched gd = (PkDispatched) o;
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

    public List dispatchList() {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<PkDispatched> l = new ArrayList<>();
        try {
            Criteria c = s.createCriteria(PkDispatched.class);
            l = c.list();
        } catch (Exception e) {

        }
        System.out.println("List in Dispatched is -------" + l);
        return l;
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
            Criteria c = s.createCriteria(PkDispatched.class).setProjection(Projections.projectionList().add(Projections.max("date")));;
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

    public List weightList() {
         List<String> l = new ArrayList();
        List l1 = null,l2=null;
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        String a1 = null, a2 = null, a3 = null;
        Float final_weight = 0.0f;
        try {
            Criteria c = s.createCriteria(PackPatterns.class).add(Restrictions.eq("typeOfPacking", "Bag"));
            l1 = c.list();
            System.out.println("@@@@@@@@@@@@@@@" + l1+"________________"+l2);
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
        List l2=null;
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        String a1 = null, a2 = null, a3 = null;
        Float final_weight = 0.0f;
        List<PackPatterns> real_list=new ArrayList<>();
        try {
            Criteria c1 = s.createCriteria(PackPatterns.class).add(Restrictions.eq("typeOfPacking", "Box"));
            l2 = c1.list();
            System.out.println("@@@@@@@@@@@@@@@" +"________________"+l2);
            for (Object o : l2) {
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
                t.commit();
                s.close();
            }
        } catch (Exception e) {

        }
        System.out.println("################" + l);
        return l;
    }
    public List bagtarelist(){
         Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        System.out.println("999999999999999999999999999999999999999999999");
        List l=null;
        try{
          Criteria c = s.createCriteria(PackPatterns.class).add(Restrictions.eq("typeOfPacking", "Bag"));
            c.setProjection(Projections.property("tareWeight"));
            l=c.list();
            System.out.println("^^^$$$$$-----------$$$$$$"+l);
        }
        catch(Exception e){
            
        }
        return l;
    }
     public List boxtarelist(){
         Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        System.out.println("999999999999999999999999999999999999999999999");
        List l=null;
        try{
          Criteria c = s.createCriteria(PackPatterns.class).add(Restrictions.eq("typeOfPacking", "Box"));
            c.setProjection(Projections.property("tareWeight"));
            l=c.list();
            System.out.println("^^^$$$$$--77777777777---------$$$$$$"+l);
        }
        catch(Exception e){
            
        }
        return l;
    }
      public void deletecarding(int id1) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        PkDispatched pc = new PkDispatched();
        Criteria cr = s.createCriteria(PkDispatched.class);
        pc = (PkDispatched) cr.add(Restrictions.eq("idk", id1)).uniqueResult();
        s.delete(pc);
        t.commit();

    }

   public List editDispatch(int idk,String type,String date,int count) throws ParseException {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        System.out.println("ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ");
        SimpleDateFormat sf=new SimpleDateFormat("dd-MM-yy");
        Date d=sf.parse(date);
        List l = null;
        List l1 = null;
        try {
            Criteria cr = s.createCriteria(PkDispatched.class);
            cr.add(Restrictions.eq("idk", idk)).uniqueResult();
            Criteria c = s.createCriteria(ChildPacking.class);
            c.add(Restrictions.eq("boxType", type)).add(Restrictions.eq("actualDate", d)).add(Restrictions.eq("countDb", count));
            l=cr.list();
            l1=c.list();
            l1.add(l);
            System.out.println("dfhgkhg-------------dkg" + l1 +idk);
             System.out.println("dfhgkhg-------------dkg" + l1 +type+date+count);
        } catch (HibernateException e) {
            e.printStackTrace();
            System.out.println("\n bbbbbbbbbbbbbbbbbbbb" + l1 + idk);
        }
        return l;
    }
    
     public List<dispatchDTO> editDispatch(int idk) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        System.out.println("ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ");
        List l = null;
        try {
            Criteria cr = s.createCriteria(PkDispatched.class);
            cr.add(Restrictions.eq("idk", idk)).uniqueResult();
            l = cr.list();
            System.out.println("dfhgkhg-------------dkg" + l +idk);
        } catch (Exception e) {
            System.out.println("\n bbbbbbbbbbbbbbbbbbbb" + l + idk);
        }
        return l;
    }

   public void updateDispatch(dispatchDTO f1, int idk, String box, String boxtare) {
         Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        try {
            PkDispatched p = (PkDispatched) s.get(PkDispatched.class, idk);
            p.setCustomer(f1.getCustomer());
            p.setCount(f1.getCount());
            if(f1.getPackingType().equals("Bag")){
            p.setPackingWeight(f1.getPackingWeight());
            p.setTareWeight(f1.getTareWeight());
            }
            else{
               p.setPackingWeight(box); 
               p.setTareWeight(boxtare);
            }
            p.setLotNo(f1.getLotNo());
            p.setNetWt(f1.getNetWt());
            p.setNoOfBags(f1.getNoOfBags());
            p.setPackingType(f1.getPackingType());
            p.setRemarks(f1.getRemarks());
            p.setVehicleNo(f1.getVehicleNo());
            p.setWeighingBridge(f1.getWeighingBridge());
            p.setExtraYarnCent(f1.getExtraYarnCent());
            p.setExpectedGrossWt(f1.getExpectedGrossWt());
            p.setBagSerialNo(f1.getBagSerialNo());
            s.update(p);
            //t.commit();
            System.out.println("Updated Successfully!!!!!!!!!!!!");
            
            
            
            
            ChildPacking p1 = new ChildPacking();
             List lis = null;
             Date dd = p.getDate();
//            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yy");
//            Date ddd = sdf.parse(dd);
             Criteria c2 = s.createCriteria(ChildPacking.class).add(Restrictions.eq("actualDate",dd)).add(Restrictions.eq("countDb", p.getCount())).add(Restrictions.eq("boxType", p.getPackingType()));
            lis = c2.list();
            if (lis != null) {
                for (Object o : lis) {
                    ChildPacking cq = (ChildPacking) o;
                    Date date=cq.getActualDate();
                    int count=cq.getCountDb();
                    String type=cq.getBoxType();
                    Float op,pb,dis,dis1;
                      op=cq.getOpeningStock();
                  pb=cq.getPackedBags();
                 
                   List list=null;
                   List list1=null;
//                  Criteria c3 = s.createCriteria(ChildPacking.class);
//                  c3.add(Restrictions.eq("actualDate", date)).add(Restrictions.eq("countDb", count)).add(Restrictions.eq("boxType", type));
//                  list=c3.list();
                  Criteria c4 = s.createCriteria(PkDispatched.class);
                  c4.add(Restrictions.eq("date", date)).add(Restrictions.eq("count", count)).add(Restrictions.eq("packingType", type));
                  list1=c4.list();
                    System.out.println("\n pawannnnnnnnnnnnnnnnnnnnnn"+list1);
                    Float bg1=0.0f;
                  for(Object o1 : list1)
                  {
                      PkDispatched pk=(PkDispatched) o1;
                      Integer i=pk.getNoOfBags();
                      Float fl1=Float.valueOf(i);
                      System.out.println("\n pkpkpkppkpkpkpkpkpkpkpkppk"+fl1);
                      bg1+=fl1;
                      System.out.println("\n kalyannnnnnnnnnnnnnnnnnn"+bg1);
                  }
                   dis=(op+pb)-bg1;
                    System.out.println("dizzzzzzzzzzzzzzz"+dis);
                  String weight=cq.getCClose();
                  Float w=Float.valueOf(weight);
                  dis1=w*dis;
                    System.out.println("dissssssssssss"+dis1);
                
                   cq.setDispatch(bg1);
                   cq.setDisclose(dis1);
                   s.update(cq);
                  
                }
            t.commit();
            s.close();
    }
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
    
    
      public packingdto updatePacking(packingdto form,String evocher) throws ParseException {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        ParentPacking p = new ParentPacking();

        int id = form.getIdpq();
        Float tos = form.getTotalOpeningStock();
        float tp = form.getTotalPackedBags();
        float tdp = form.getTotalDispatch();
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
            p.setTotalDispatch(tdp);
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
         /*   if (lis != null) {
                for (Object o : lis) {
                    System.out.println("kjdgh---------dhg+++++++++++++++");
                    ChildPacking cq = (ChildPacking) o;
                    s1.delete(cq);
                }

            }*/

            System.out.println("kjdgh---------dhg+++++54787897++++++++++");

            //List<String> l1 = form.getCount1();

            List<Float> l2 = form.getOpen();
            List<Float> l3 = form.getPack();
            List<Float> l4 = form.getDis();
           // List<Float> l5 = form.getClose();
            List<Integer> l6 = form.getCountdb();
            List<String> l7 = form.getBoxtype();
            List<String> l8 = form.getWeight();
            
            for (int i = 0; i < l2.size(); i++) {
                ChildPacking c = new ChildPacking();

                c.setParentPacking(p1);
                //c.setCount(l1.get(i));
                c.setOpeningStock(l2.get(i));
                c.setPackedBags(l3.get(i));
                c.setDispatch(l4.get(i));
                //c.setDisclose(l5.get(i));
                c.setActualDate(d);
                c.setCountDb(l6.get(i));
                c.setBoxType(l7.get(i));
                c.setWeight(l8.get(i));

                System.out.println("tttttttttttttttttttttttttttttt" + l8.get(i));

                s1.update(c);
                System.out.println("iiiiiiiiiii" + c);
                s1.flush();
                s1.clear();
                // System.out.println("---------->"+l.get(i) +""+l1.get(i));
            }
            t1.commit();
            s1.close();

            System.out.println("\n Packing Updated Successfully");

        } catch (Exception e) {
            System.out.println(e);
        }
        return form;
    }
    
      
   public void deletedispatch(int id1,String type,String date,int count) throws ParseException {
       Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        try
        {
            SimpleDateFormat sf=new SimpleDateFormat("dd-MM-yy");
            Date d=sf.parse(date);
            PkDispatched pc = new PkDispatched();
            List l=null,l1=null;
            Criteria cr = s.createCriteria(PkDispatched.class);
            pc = (PkDispatched) cr.add(Restrictions.eq("idk", id1)).uniqueResult();
            s.delete(pc);

            Float bg1=0.0f,fl1=0.0f;
            ChildPacking cp=new ChildPacking();
            Criteria c4 = s.createCriteria(PkDispatched.class);
            c4.add(Restrictions.eq("date", d)).add(Restrictions.eq("count", count)).add(Restrictions.eq("packingType", type));
            l1=c4.list();
            PkDispatched pk=new PkDispatched();
            for(Object o1 : l1)
            {
                   pk=(PkDispatched) o1;
                   Integer i=pk.getNoOfBags();
                   fl1=Float.valueOf(i);
                   bg1+=fl1;
            }
            
            Criteria c1 = s.createCriteria(ChildPacking.class);
            c1.add(Restrictions.eq("boxType", type)).add(Restrictions.eq("actualDate", d)).add(Restrictions.eq("countDb", count));
            l=c1.list();
            for(Object o: l)
            {
                  cp=(ChildPacking) o;
                  cp.setDispatch(bg1);
                  s.update(cp);
            }
            t.commit();
            s.close();
        }
        catch(Exception e){
                e.printStackTrace();
        }
    }
      
    /*  public List generateList(packingdto p){
          Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        ParentPacking p1 = new ParentPacking();
        List l=new ArrayList();
        try{
            
        }
        catch(Exception e){
            System.out.println(e);
        }
      }*/
    
}