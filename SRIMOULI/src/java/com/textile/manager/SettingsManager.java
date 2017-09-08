/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.manager;

import com.textile.dto.Settingsdto;
import com.textile.model.ChildCarding;
import com.textile.model.ChildDrawing;
import com.textile.model.ChildOpenend;
import com.textile.model.Employee;
import com.textile.model.Login;
import com.textile.model.ParentCarding;
import com.textile.model.ParentDrawing;
import com.textile.model.ParentOpenend;
import com.textile.util.HibernateUtil;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
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
public class SettingsManager {
     public Settingsdto insertLogin(Settingsdto rf) {
        Session s=HibernateUtil.getSessionFactory().openSession();
        Transaction t=s.beginTransaction();
       System.out.println("kjdgh--1111111111111111--jhgh=--1111111111----");
        try{
            System.out.println("kjdgh--1111111111111111--jhgh=--1111111111----");
            String desg=rf.getDesignation();
            System.out.println("@@@@@@@@@@@@@@@"+rf.getLoginType());
           String sq=rf.getLoginType();
           String pass=rf.getPassword();
           String user=rf.getUserName();
            String[] ect=sq.split(", ");
             System.out.println("kjdgh----jhgh=-0000000000-----"+user+pass+desg);
            for(int i=0;i<ect.length;i++){
                System.out.println("kjdgh----jhgh=------"+ect[i]);
                  Login rq=new Login();
          
            rq.setDesignation(desg);
            if(ect[i].equals("Godown"))
            rq.setLoginType("godown");
            else if(ect[i].equals("Carding"))
            rq.setLoginType("carding");
            else if(ect[i].equals("Drawing"))
            rq.setLoginType("drawing");
            else if(ect[i].equals("Openend"))
            rq.setLoginType("openend");
            else if(ect[i].equals("Quality"))
            rq.setLoginType("quality");
            else if(ect[i].equals("Electricity"))
            rq.setLoginType("electricity");
            else if(ect[i].equals("Packing"))
            rq.setLoginType("packing");
            rq.setPassword(pass);
            rq.setUserName(user);
            rq.setPartialType(rf.getLoginType());
            s.save(rq);
            }
           System.out.println("insert login types-----------------------"+rf.getLoginType());
           System.out.println("insert login types-----------------------"+rf.getLoginType());
            t.commit();
        }
        catch(HibernateException he){
            System.out.println("Exception during insert login-------------->"+he.getMessage());
        }
        finally{
           
        }
         s.close();
        return rf;
          }

    public List getLoginTypeList() {
       Session session = HibernateUtil.getSessionFactory().openSession();
       Transaction t = session.beginTransaction();
       Criteria c = session.createCriteria(Login.class);
       c.setProjection(Projections.distinct(Projections.property("loginType")));
       List<Login> l=c.list();
       return l;
    }

    
    
    public List settingsList(Settingsdto rf) {
      Session s=HibernateUtil.getSessionFactory().openSession();
        Transaction t=s.beginTransaction();
        String control="control";
        List<Login> list=null;
         System.out.println("list is-------------"+rf.getId());
        try {
            Criteria c=s.createCriteria(Login.class);
            c.add(Restrictions.eq("id",rf.getId()));         
            list = c.list();            
        }
        catch(Exception e) {
            
        }
        System.out.println("list is:------->>>>"+list);
        return list;
    }

    public List settingsList1(int id) {
         Session s=HibernateUtil.getSessionFactory().openSession();
        Transaction t=s.beginTransaction();
        String control="control";
        List<Login> list=null;
        try {
            Criteria c=s.createCriteria(Login.class);
            c.add(Restrictions.eq("id",id));         
            list = c.list();            
        }
        catch(Exception e) {
            
        }
        t.commit();
        s.close();
        System.out.println("list is:---....---->>>>"+list);
        return list; 
    }

    public boolean validUser(String userName) {
        Session s=HibernateUtil.getSessionFactory().openSession();
        Transaction t=s.beginTransaction();
        boolean state=false;
        List<Login> list=null;
        try {
            Criteria c=s.createCriteria(Login.class);
            c.add(Restrictions.eq("userName",userName));         
            list = c.list();            
        }
        catch(Exception e) {
            
        }
        if(list.size()>0)
            state=true;
        
        System.out.println("list is:---....---->>>>"+state);
        t.commit();
        s.close();
        return state; 
    }

    public List getEfficiency(Settingsdto rf,Float percent) throws ParseException {
        List list = null;
        List total = new ArrayList();
        System.out.println("slkj123245-----------------------"+total);
        String doj=rf.getDate();
        String doj2=rf.getDate2();
        Integer empid=rf.getEmpid();
        System.out.println("sljfeffici------------------"+doj+"id---------------"+empid);
        SimpleDateFormat sf=new SimpleDateFormat("dd-MM-yy");
        Date doj1=sf.parse(doj);
        Date oj=sf.parse(doj2);
        Session s=HibernateUtil.getSessionFactory().openSession();
        Transaction t=s.beginTransaction();
         try {
            Criteria c=s.createCriteria(ParentCarding.class);
            c.add(Restrictions.between("date", doj1, oj));         
            list = c.list();
            Integer idc = 0;
            int act = 0;
                float eff = 0,exp = 0;  
            for(Object o:list){
                List l=null;
                ParentCarding pc=(ParentCarding)o;
                idc=pc.getIdc();
             Criteria c1=s.createCriteria(ChildCarding.class);
             c1.add(Restrictions.eq("parentCarding.idc",idc)).add(Restrictions.eq("emId",empid)).add(Restrictions.gt("efficiency", percent));
             l=c1.list();
             total.addAll(l);
        
            }
           
            }

        
        catch(Exception e) {
            e.printStackTrace();
            System.out.println("error in retrieving efficiency-------------->"+e);
        }
        System.out.println("list is:---efficiency....---->>>>"+total);
        t.commit();
        s.close();
        return total;
    }

    public List getParentEff(Settingsdto rf) throws ParseException {
         List total = new ArrayList();
       String doj=rf.getDate();
        String doj2=rf.getDate2();
        Integer empid=rf.getEmpid();
        System.out.println("sljfeffici-----------....-------"+doj+"id---------...------"+empid);
        SimpleDateFormat sf=new SimpleDateFormat("dd-MM-yy");
        Date doj1=sf.parse(doj);
        Date oj=sf.parse(doj2);
           Session s=HibernateUtil.getSessionFactory().openSession();
        Transaction t=s.beginTransaction();
        try {
            Criteria c=s.createCriteria(ParentCarding.class);
            c.add(Restrictions.between("date", doj1, oj));         
            total = c.list();
             }
        catch(Exception e) {
            e.printStackTrace();
            System.out.println("error in retrieving efficiency-------------->"+e);
        }
        System.out.println("list is:--pcarding-efficiency....---->>>>"+total);
        t.commit();
        s.close();
        return total;
    }

    public List getPatentEff2(Settingsdto rf) throws ParseException {
        List total = new ArrayList();
        String doj=rf.getDate();
        String doj2=rf.getDate2();
        Integer empid=rf.getEmpid();
        System.out.println("sljfeffici-----------....-------"+doj+"id---------...------"+empid);
        SimpleDateFormat sf=new SimpleDateFormat("dd-MM-yy");
        Date doj1=sf.parse(doj);
        Date oj=sf.parse(doj2);
        Session s=HibernateUtil.getSessionFactory().openSession();
        Transaction t=s.beginTransaction();
        try {
            Criteria c=s.createCriteria(ParentDrawing.class);
            c.add(Restrictions.between("date", doj1, oj));         
            total = c.list();
             }
        catch(Exception e) {
            e.printStackTrace();
            System.out.println("error in retrieving efficiency-------------->"+e);
        }
        System.out.println("list is:--pdrawing-efficiency....---->>>>"+total);
        t.commit();
        s.close();
        return total;
    }

    public List getEfficiency2(Settingsdto rf,Float percent) throws ParseException {
        List list = null;
        List total = new ArrayList();
        System.out.println("slkj123245-----------------------"+total);
        String doj=rf.getDate();
        String doj2=rf.getDate2();
        Integer empid=rf.getEmpid();
        System.out.println("sljfeffici------------------"+doj+"id---------------"+empid);
        SimpleDateFormat sf=new SimpleDateFormat("dd-MM-yy");
        Date doj1=sf.parse(doj);
        Date oj=sf.parse(doj2);
        Session s=HibernateUtil.getSessionFactory().openSession();
        Transaction t=s.beginTransaction();
         try {
            Criteria c=s.createCriteria(ParentDrawing.class);
            c.add(Restrictions.between("date", doj1, oj));         
            list = c.list();
            Integer idc = 0;
             
            for(Object o:list){
                List l=null;
                ParentDrawing pc=(ParentDrawing)o;
                idc=pc.getIdd();
             Criteria c1=s.createCriteria(ChildDrawing.class);
             c1.add(Restrictions.eq("parentDrawing.idd",idc)).add(Restrictions.eq("empId",empid)).add(Restrictions.gt("efficiency", percent));
             l=c1.list();
             total.addAll(l);
            }
            
         }
           
        catch(Exception e) {
            e.printStackTrace();
            System.out.println("error in retrieving efficiency-------------->"+e);
        }
        System.out.println("list is:---efficiency....---->>>>"+total);
        t.commit();
        s.close();
        return total;
         }

    public List getPatentEff3(Settingsdto rf) throws ParseException {
        List total = new ArrayList();
        String doj=rf.getDate();
        String doj2=rf.getDate2();
        Integer empid=rf.getEmpid();
        System.out.println("sljfeffici-----------....-------"+doj+"id---------...------"+empid);
        SimpleDateFormat sf=new SimpleDateFormat("dd-MM-yy");
        Date doj1=sf.parse(doj);
        Date oj=sf.parse(doj2);
           Session s=HibernateUtil.getSessionFactory().openSession();
        Transaction t=s.beginTransaction();
        try {
            Criteria c=s.createCriteria(ParentOpenend.class);
            c.add(Restrictions.between("date", doj1, oj));         
            total = c.list();
             }
        catch(Exception e) {
            e.printStackTrace();
            System.out.println("error in retrieving efficiency-------------->"+e);
        }
        System.out.println("list is:--popenend-efficiency....---->>>>"+total);
        t.commit();
        s.close();
        return total;
    }

    public List getEfficiency3(Settingsdto rf,Float percent) throws ParseException {
        List list = null;
        List total = new ArrayList();
        System.out.println("slkj123245-----------------------"+total+"............"+percent);
        String doj=rf.getDate();
        String doj2=rf.getDate2();
        Integer empid=rf.getEmpid();
        System.out.println("sljfeffici------------------"+doj+"id---------------"+empid);
        SimpleDateFormat sf=new SimpleDateFormat("dd-MM-yy");
        Date doj1=sf.parse(doj);
        Date oj=sf.parse(doj2);
        Session s=HibernateUtil.getSessionFactory().openSession();
        Transaction t=s.beginTransaction();
         try {
            Criteria c=s.createCriteria(ParentOpenend.class);
            c.add(Restrictions.between("date", doj1, oj));         
            list = c.list();
            Integer idc = 0;
             
            for(Object o:list){
                List l=null;
                ParentOpenend pc=(ParentOpenend)o;
                idc=pc.getIdo();
             Criteria c1=s.createCriteria(ChildOpenend.class);
             c1.add(Restrictions.eq("parentOpenend.ido",idc)).add(Restrictions.eq("empId",empid)).add(Restrictions.gt("efficiency", percent));
             l=c1.list();
             total.addAll(l);
            }
            
         }
           
        catch(Exception e) {
            e.printStackTrace();
            System.out.println("error in retrieving efficiency-------------->"+e);
        }
        System.out.println("list is:---efficiency....---->>>>"+total);
        t.commit();
        s.close();
        return total;
    }
    
     public List editLogin(int ids) {
        Session s=HibernateUtil.getSessionFactory().openSession();
        Transaction t=s.beginTransaction();
        List<Login> l=new ArrayList<>();
         System.out.println("id is"+ids);
        try {
          Criteria c=s.createCriteria(Login.class);
          c.add(Restrictions.eq("id",ids));
          l=c.list();
        }
        catch(Exception e) {
            
        }
         System.out.println("Login is -------"+l);
        return l;
    }
    
     public void deleteLgn(int ids) 
    {
         Session  s=HibernateUtil.getSessionFactory().openSession();
         Transaction t=s.beginTransaction();
         List l=null;
         try
         {
             Login e=(Login) s.get(Login.class,ids);
             System.out.println("ehgrtfeyfgrgghruh---===="+e.getUserName()+e.getPassword());
             System.out.println("");
             Criteria c=s.createCriteria(Login.class);
             c.add(Restrictions.eq("userName",e.getUserName()));
             c.add(Restrictions.eq("password",e.getPassword()));
             l=c.list();
             System.out.println(";;;;;;;;;;;;;;;;"+l);
           //  s.delete(e);
           for(Object o:l) {
               e=(Login) o;
               System.out.println("'''''''''''''''"+e.getId());
               int id=e.getId();
               e=(Login) s.get(Login.class,id); 
               s.delete(e);
           }
            t.commit();
             System.out.println("\n deleted successfully");
         }
         catch(Exception h)
         {
             System.out.println("HibernateException during deletion:"+h);
             s.close();
         }
            
    }

    
      public List<Login> display()
    {
        Session s=HibernateUtil.getSessionFactory().openSession();
        Transaction t=s.beginTransaction();
      
         List<Login> glist=null;
        try
        {
//           Criteria c=s.createCriteria(Login.class).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
//           //c.add(Restrictions.eq("employeeId", employeeId));
//          glist=c.list();
            Query q = s.createQuery("from Login group by userName");
            glist=q.list();
            System.out.println("list is"+glist);
           t.commit();
        }
        catch(Exception e)
        {
             System.out.println(e); 
        }
        System.out.println(glist);
        return glist;
    }
public Settingsdto updateL(Settingsdto rf) {
         Session  s=HibernateUtil.getSessionFactory().openSession();
         Transaction t=s.beginTransaction();
         List l=null;
         try
         {
             Login e=(Login) s.get(Login.class,rf.getId());
             System.out.println("ehgrtfeyfgrgghruh---===="+e.getUserName()+e.getPassword());
             System.out.println("");
             Criteria c=s.createCriteria(Login.class);
             c.add(Restrictions.eq("userName",e.getUserName()));
             c.add(Restrictions.eq("password",e.getPassword()));
             l=c.list();
             System.out.println(";;;;;;;;;;;;;;;;"+l);
           //  s.delete(e);
           for(Object o:l) {
               e=(Login) o;
               System.out.println("'''''''''''''''"+e.getId());
               int id1=e.getId();
               e=(Login) s.get(Login.class,id1); 
               s.delete(e);
           }
            t.commit();
            System.out.println("\n deleted successfully");
             
            System.out.println("kjdgh--1111111111111111--jhgh=--1111111111----");
            String desg=rf.getDesignation();
            System.out.println("@@@@@@@@@@@@@@@"+rf.getLoginType());
            String sq=rf.getLoginType();
            String pass=rf.getPassword();
            String user=rf.getUserName();
            String[] ect=sq.split(", ");
            System.out.println("kjdgh----jhgh=-0000000000-----"+user+pass+desg);
            for(int i=0;i<ect.length;i++){
                System.out.println("kjdgh----jhgh=------"+ect[i]);
                Login rq=new Login();
          
            rq.setDesignation(desg);
            if(ect[i].equals("Godown"))
            rq.setLoginType("godown");
            else if(ect[i].equals("Carding"))
            rq.setLoginType("carding");
            else if(ect[i].equals("Drawing"))
            rq.setLoginType("drawing");
            else if(ect[i].equals("Openend"))
            rq.setLoginType("openend");
            else if(ect[i].equals("Quality"))
            rq.setLoginType("quality");
            else if(ect[i].equals("Electricity"))
            rq.setLoginType("electricity");
            else if(ect[i].equals("Packing"))
            rq.setLoginType("packing");
            rq.setPassword(pass);
            rq.setUserName(user);
            rq.setPartialType(rf.getLoginType());
            s.save(rq);
            }
           System.out.println("insert login types-----------------------"+rf.getLoginType());
           System.out.println("insert login types-----------------------"+rf.getLoginType());
           t.commit();
             
             
             
         }
         catch(Exception h)
         {
             System.out.println("HibernateException during deletion:"+h);
             s.close();
         }
          return rf;
}
      
public Settingsdto updateLogin(Settingsdto rf,int id) {
         
         System.out.println("Enter into Update");
         try {
         System.out.println("kjdgh--1111111111111111--jhgh=--1111111111----");
           String desg=rf.getDesignation();
           String sq=rf.getLoginType();
           String pass=rf.getPassword();
           String user=rf.getUserName();
           String[] ect=sq.split(", ");
             System.out.println("kjdgh----jhgh=-0000000000-----"+ect);
             if(ect.length==1){
             Session s=HibernateUtil.getSessionFactory().openSession();
             Transaction t=s.beginTransaction();
            for(int i=0;i<ect.length;i++){
                System.out.println("kjdgh----jhgh=------"+ect[i]+id);
                int ids=id;
                  //Login rq=new Login();
            Login rq=(Login)s.get(Login.class,ids);
            rq.setDesignation(desg);
            rq.setId(ids);
                System.out.println("dfgrdtr=============="+ids);
                
            if(ect[i].equals("godown"))
            rq.setLoginType("godown");
            else if(ect[i].equals("carding"))
            rq.setLoginType("carding");
            else if(ect[i].equals("drawing"))
            rq.setLoginType("drawing");
            else if(ect[i].equals("openend"))
            rq.setLoginType("openend");
            else if(ect[i].equals("quality"))
            rq.setLoginType("quality");
            else if(ect[i].equals("electricity"))
            rq.setLoginType("electricity");
            else if(ect[i].equals("packing"))
            rq.setLoginType("packing");
            rq.setPassword(pass);
            rq.setUserName(user);
            s.update(rq);
            t.commit();
            }
          
            }
              else{
           Session  s1=HibernateUtil.getSessionFactory().openSession();
           Transaction t1=s1.beginTransaction();
           List lis=null;
                Criteria c2=s1.createCriteria(Login.class);
                lis= c2.add(Restrictions.eq("id", id)).list();
                if(lis!=null){
                for(Object o:lis){
                      System.out.println("kjdgh---------dhg+++++++++++++++");
                      Login cq=(Login)o;
                      s1.delete(cq);
                }
                }  
                t1.commit();
                s1.close();
           }
        }
        catch(Exception e) {
          
        }
         
        return rf;
}

    public boolean empValidate(Settingsdto rf) {
        Session s=HibernateUtil.getSessionFactory().openSession();
        Transaction t=s.beginTransaction();
        boolean state=false;
        List<Login> list=null;
        try {
            Criteria c=s.createCriteria(Employee.class);
            c.add(Restrictions.eq("empId",rf.getEmpid()));         
            list = c.list();            
        }
        catch(Exception e) {
            
        }
        if(list.size()>0)
            state=true;
        
        System.out.println("list is:---....---->>>>"+state);
        t.commit();
        s.close();
        return state; 
    }



    public int getTotalDays(Settingsdto rf, Float percent,String[] var) throws ParseException {
        
        
     List<String> listOfString = new ArrayList<String>();
     for(int i=0;i<var.length;i++){
             if(var[i].equals("Openend")){
    List l=getEfficiency3(rf,percent);
                 for(Object o:l){
         
         ChildOpenend dc=(ChildOpenend)o;
         ParentOpenend p=dc.getParentOpenend();
         System.out.println("the lsjflj-------openend-dhgkg=-----------dfg"+p.getDate());
         listOfString.add(p.getDate().toString());
         
     }
    }
              if(var[i].equals("Drawing")){
      List l2=getEfficiency2(rf,percent);
     for(Object o:l2){
         
         ChildDrawing dc=(ChildDrawing)o;
         ParentDrawing p=dc.getParentDrawing();
         System.out.println("the lsjflj--------drawing-dhgkg=-----------dfg"+p.getDate()+"***drawww******"+listOfString.size());
           listOfString.add(p.getDate().toString());
         
     }
              }
               if(var[i].equals("Carding")){
     List l3=getEfficiency(rf,percent);
     for(Object o:l3){
         
         ChildCarding dc=(ChildCarding)o;
         ParentCarding p=dc.getParentCarding();
         System.out.println("the lsjflj---------dhgkg=-----------dfg"+p.getDate()+"******cardddd***"+listOfString.size());
          listOfString.add(p.getDate().toString());
         
     }
               }
     }
     for(int j=0;j<listOfString.size();j++){
     System.out.println(".................."+listOfString.get(j));
     }
     
      Set<String> unique = new HashSet<String>();
    for (String val : listOfString) {
        unique.add(String.valueOf(val)); // will only be added if a is not in unique
        
    }
    System.out.println("unique values are.---openend------------>"+unique.toString());
     System.out.println("the unique days are......openend........----->"+unique.size());

    return unique.size();
    }

 
}
    

