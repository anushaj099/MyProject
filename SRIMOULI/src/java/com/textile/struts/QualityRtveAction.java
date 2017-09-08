/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.struts;

import com.opensymphony.xwork2.ActionSupport;
import com.textile.dto.QualityRtve;
import com.textile.manager.QualityRtveManager;
import com.textile.model.FinancialYearBackup;
import com.textile.model.ParentQuality;
import com.textile.util.HibernateUtil;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author ch.mounika
 */
public class QualityRtveAction  extends ActionSupport{
     QualityRtveManager qlrm=new QualityRtveManager();
     private QualityRtve qlt;
   List<ParentQuality> list;
    List<ParentQuality> list1;
    private int purchaseid=0;
    private Date startdate,enddate;

    public int getPurchaseid() {
        return purchaseid;
    }

    public void setPurchaseid(int purchaseid) {
        this.purchaseid = purchaseid;
    }

    public Date getStartdate() {
        return startdate;
    }

    public void setStartdate(Date startdate) {
        this.startdate = startdate;
    }

    public Date getEnddate() {
        return enddate;
    }

    public void setEnddate(Date enddate) {
        this.enddate = enddate;
    }

    public List<ParentQuality> getList1() {
        return list1;
    }

    public void setList1(List<ParentQuality> list1) {
        this.list1 = list1;
    }
    
   private List ulist;

    public List getUlist() {
        return ulist;
    }

    public void setUlist(List ulist) {
        this.ulist = ulist;
    }
   
   
   private  List<String> superList=new ArrayList<>();

    public List<String> getSuperList() {
        return superList;
    }

    public void setSuperList(List<String> superList) {
        this.superList = superList;
    }

     private String date,date1;
     private String superName;
     private String shifts;
     private String count;

    public QualityRtveManager getQlrm() {
        return qlrm;
    }

    public void setQlrm(QualityRtveManager qlrm) {
        this.qlrm = qlrm;
    }

    public QualityRtve getQlt() {
        return qlt;
    }

    public void setQlt(QualityRtve qlt) {
        this.qlt = qlt;
    }

    public List<ParentQuality> getList() {
        return list;
    }

    public void setList(List<ParentQuality> list) {
        this.list = list;
    }

    
   private int abcd=0;

    public int getAbcd() {
        return abcd;
    }

    public void setAbcd(int abcd) {
        this.abcd = abcd;
    }
  
    public String getSuperName() {
        return superName;
    }

    public void setSuperName(String superName) {
        this.superName = superName;
    }

    public String getCount() {
        return count;
    }

    public void setCount(String count) {
        this.count = count;
    }
   
    public String getShifts() {
        return shifts;
    }

    public void setShifts(String shifts) {
        this.shifts = shifts;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getDate1() {
        return date1;
    }

    public void setDate1(String date1) {
        this.date1 = date1;
    }
    
   public QualityRtveAction()
   {
       qlrm=new QualityRtveManager();
       ulist=new ArrayList();
   }

   private static int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    private List qlist=new ArrayList();
    private List qlist1=new ArrayList();
    private List qlist2=new ArrayList();
    private List qlist3=new ArrayList();
    private List qlist4=new ArrayList();

    public List getQlist4() {
        return qlist4;
    }

    public void setQlist4(List qlist4) {
        this.qlist4 = qlist4;
    }

    public List getQlist3() {
        return qlist3;
    }

    public void setQlist3(List qlist3) {
        this.qlist3 = qlist3;
    }

    public List getQlist2() {
        return qlist2;
    }

    public void setQlist2(List qlist2) {
        this.qlist2 = qlist2;
    }
    public List getQlist1() {
        return qlist1;
    }

    public void setQlist1(List qlist1) {
        this.qlist1 = qlist1;
    }
    public List getQlist() {
        return qlist;
    }

    public void setQlist(List qlist) {
        this.qlist = qlist;
    }
    private String testtype=null;

    public String getTesttype() {
        return testtype;
    }

    public void setTesttype(String testtype) {
        this.testtype = testtype;
    }
     public String retrieveQty() throws ParseException {
         
        try
      {
         //supList=qlrm.getDepts();
         abcd=4;
         System.out.println("+++++++++"+getQlt());
         System.out.println("================"+list);
         this.ulist=qlrm.qualityList1(getId());
          superList=qlrm.getSuperviser();
          String machines=qlt.getMctype();
          String shifts=qlt.getShifts();
          if(qlt.getDate().length()==0) {
                addFieldError("qlt.date","From date Should not be Empty"); 
            }
            if(qlt.getDate1().length()==0) {
                addFieldError("qlt.date1","To date Should not be Empty"); 
            }
            if(machines.length()==0) {
                if(shifts.equals("M/C Testing")) {
                      addFieldError("qlt.shifts","Please select atleast one Machine"); 
                }
                else {
                     addFieldError("qlt.shifts","Please select atleast one Sample"); 
                }
            }
           String shifts1=qlt.getShifts();
           testtype=qlt.getShifts();
           String mctype=qlt.getMctype();
           System.out.println("++++++++++++++++"+mctype+shifts1);
            String[] ect = mctype.split(", ");
            int size=ect.length;
         System.out.println("----->>>>-------->>>>-------->>>------>"+size);
         list1=qlrm.RetriveQltyPar(getQlt());
          if(size==1) {
              list=qlrm.RetriveQlty(getQlt());
          }
          else if(size==2) {
               list=qlrm.RetriveQlty(getQlt());
               qlist=qlrm.RetriveQlty2(getQlt());
          }
          else if(size==3) {
               list=qlrm.RetriveQlty(getQlt());
               qlist=qlrm.RetriveQlty2(getQlt());
               qlist1=qlrm.RetriveQlty3(getQlt()); 
          }
          else if(size==4) {
               list=qlrm.RetriveQlty(getQlt());
               qlist=qlrm.RetriveQlty2(getQlt());
               qlist1=qlrm.RetriveQlty3(getQlt()); 
               qlist2=qlrm.RetriveQlty4(getQlt()); 
          }
          else if(size==5) {
               list=qlrm.RetriveQlty(getQlt());
               qlist=qlrm.RetriveQlty2(getQlt());
               qlist1=qlrm.RetriveQlty3(getQlt()); 
               qlist2=qlrm.RetriveQlty4(getQlt()); 
               qlist3=qlrm.RetriveQlty5(getQlt());
          }
           else if(size==6) {
               list=qlrm.RetriveQlty(getQlt());
               qlist=qlrm.RetriveQlty2(getQlt());
               qlist1=qlrm.RetriveQlty3(getQlt()); 
               qlist2=qlrm.RetriveQlty4(getQlt()); 
               qlist3=qlrm.RetriveQlty5(getQlt());
               qlist4=qlrm.RetriveQlty6(getQlt());
          }
       
         Date d1 = new SimpleDateFormat("dd-MM-yyyy").parse(qlt.getDate());
         Date d2 = new SimpleDateFormat("dd-MM-yyyy").parse(qlt.getDate1());
         if(d1.after(d2))
         {
             addFieldError("qlt.date1","From date must be lessthan To date"); 
         }
          else  if(qlt.getShifts().equals("-1")) {
                addFieldError("qlt.shifts","Test Type should not be empty"); 
            }
       
      }
      catch(Exception e)
      {
          
      }
      return "success";
     }
  
}
