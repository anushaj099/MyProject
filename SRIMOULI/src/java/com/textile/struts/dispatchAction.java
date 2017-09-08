/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.struts;

import com.opensymphony.xwork2.ActionSupport;
import com.textile.dto.dispatchDTO;
import com.textile.dto.packingdto;
import com.textile.manager.AddPurchaseManager;
import com.textile.manager.PackingManager;
import com.textile.manager.YearManager;
import com.textile.manager.dispatchManager;
import com.textile.model.FinancialYearBackup;
import com.textile.model.Login;
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
 * @author anusha
 */
public class dispatchAction extends ActionSupport{
    
    dispatchManager dm;
    PackingManager m;

    public PackingManager getM() {
        return m;
    }

    public void setM(PackingManager m) {
        this.m = m;
    }
    
   private dispatchDTO f1;
   private List countlist;
   private static List ulist1;
   private List weightlist = new ArrayList();
    private List weightlist1 = new ArrayList();
    private List bagtare=new ArrayList();
    private List boxtarel=new ArrayList();
 private List<String> bag = new ArrayList();
 private static int idk;
 private List list=new ArrayList();
   private AddPurchaseManager apm=new AddPurchaseManager();
   YearManager ym=new YearManager();
    private List year=null;

    public List getYear() {
        return year;
    }

    public void setYear(List year) {
        this.year = year;
    }

    public List getList() {
        return list;
    }

    public void setList(List list) {
        this.list = list;
    }

    public int getIdk() {
        return idk;
    }

    public void setIdk(int idk) {
        this.idk = idk;
    }
 

    public List getBoxtarel() {
        return boxtarel;
    }

    public void setBoxtarel(List boxtarel) {
        this.boxtarel = boxtarel;
    }
    private String count;

    public String getCount() {
        return count;
    }

    public void setCount(String count) {
        this.count = count;
    }
 

    public List getBagtare() {
        return bagtare;
    }

    public void setBagtare(List bagtare) {
        this.bagtare = bagtare;
    }

    

    public List getWeightlist1() {
        return weightlist1;
    }

    public void setWeightlist1(List weightlist1) {
        this.weightlist1 = weightlist1;
    }

 private static String box;
private static String boxtare;

    public String getBoxtare() {
        return boxtare;
    }

    public void setBoxtare(String boxtare) {
        this.boxtare = boxtare;
    }


    public String getBox() {
        return box;
    }

    public void setBox(String box) {
        this.box = box;
    }
 

    public List getBag() {
        return bag;
    }

    public void setBag(List bag) {
        this.bag = bag;
    }
 
    public List getWeightlist() {
        return weightlist;
    }

    public void setWeightlist(List weightlist) {
        this.weightlist = weightlist;
    }
   

    public List getUlist1() {
        return ulist1;
    }

    public void setUlist1(List ulist1) {
        this.ulist1 = ulist1;
    }

    public List getCountlist() {
        return countlist;
    }

    public void setCountlist(List countlist) {
        this.countlist = countlist;
    }
   

   

    public dispatchDTO getF1() {
        return f1;
    }

    public void setF1(dispatchDTO f1) {
        this.f1 = f1;
    }
   
    
     
    public dispatchManager getDm() {
        return dm;
    }

    public void setDm(dispatchManager dm) {
        this.dm = dm;
    }

   

       public dispatchAction()
       {
           dm=new dispatchManager();
          countlist=new ArrayList();
          ulist1=new ArrayList();
          
       }
       private packingdto form;

    public packingdto getForm() {
        return form;
    }

    public void setForm(packingdto form) {
        this.form = form;
    }
       
       public String insertDispatch() throws ParseException
       {
          System.out.println("heloooooooooooooooooo");
          this.ulist = dm.dispatchList1(getId());
          this.ulist1=dm.shiftExists();
          shift_date=dm.getDd();
          try{
          if(f1.getDate()!=null){
              
               this.year=apm.getYear();
       if(apm.dateCheck(f1.getDate())){
           Date date=ym.getDateFrom();
                       addFieldError("f1.date","Year is already closed. Please select date from "+date);
                        return "input";
       }
              
                 if(!dm.check(getF1())){
                      System.out.println("]]]]]]]]]...........]]]]]]]]]]]]]]]"+getF1());
                        addFieldError("f1.date","Please fill date value linearly");
                        return "input";
                  }
             
                dm.insert(getF1(),getForm(),getBox(),getBoxtare());
            }
            this.ulist1 = dm.dispatchList(getF1());
             this.ulist1=dm.dispatchList();
            for(Object o:ulist) {
            Login l=(Login)o;
             System.out.println("type is---------"+l.getLoginType());
          if(l.getLoginType().equals("packing"))
                return "view";
          if(l.getLoginType().equals("control"))
                return "view";
        }
          }
          catch(Exception e)
          {
              System.out.println(e);
          }
           return "fail";
       }
       
       private int abcd=0,xyz=0;

    public int getXyz() {
        return xyz;
    }

    public void setXyz(int xyz) {
        this.xyz = xyz;
    }
        private static List ulist;

    public int getAbcd() {
        return abcd;
    }

    public void setAbcd(int abcd) {
        this.abcd = abcd;
    }

    public List getUlist() {
        return ulist;
    }

    public void setUlist(List ulist) {
        this.ulist = ulist;
    }
     private static int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    private Date shift_date;

    public Date getShift_date() {
        return shift_date;
    }

    public void setShift_date(Date shift_date) {
        this.shift_date = shift_date;
    }
     private static int a,b,c,d,e,f,g,h,i,j,k,check;
        public String dispatchHome() {
       // abcd = 5;
        abcd=22;
        xyz=100;
          this.year=apm.getYear();
        countlist=dm.count();
        this.ulist1=dm.shiftExists();
        shift_date=dm.getDd();
        //bag=dm.baglist(getF1());
        weightlist=dm.weightList();
        weightlist1=dm.weightList1();
        bagtare=dm.bagtarelist();
        boxtarel=dm.boxtarelist();
         this.ulist = dm.dispatchList1(getId());
        for (Object o : ulist) {
            Login l = (Login) o;
            System.out.println("type is---------" + l.getLoginType());
            if (l.getLoginType().equals("packing")) {
                return "dispatch";
            }
            if (l.getLoginType().equals("control")) {
                return "dispatch";
            }
        }

        return "success";
    }
     
        public String dispatchView() {
            xyz=100;
            abcd=22;
             this.year=apm.getYear();
            this.ulist = dm.dispatchList1(getId());
            this.ulist1=dm.dispatchList();
            
            return "success";
        }
        
        public String dispatchStock() {
            this.ulist = dm.dispatchList1(getId());  
            countlist=dm.count1();
            purchaseid=1000;
            return "success";
        }
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
       public String dispatchretrieve(){
           try{ 
              xyz=100;
            abcd=22;
             countlist=dm.countList1();
            this.ulist = dm.dispatchList1(getId());
            this.ulist1=dm.dispatchList();
          
            if (f1.getDate().length() == 0) {
                addFieldError("f1.date", "From date Should not be Empty");
            }
            if (f1.getDate1().length() == 0) {
                addFieldError("f1.date1", "To date Should not be Empty");
            }
         
              list = dm.retrieveDispatch(getF1(),getCount());
            
            Date d1 = new SimpleDateFormat("dd-MM-yyyy").parse(f1.getDate());
            Date d2 = new SimpleDateFormat("dd-MM-yyyy").parse(f1.getDate1());
              if (list.isEmpty()) {
                addFieldError("f1.date", "Data not exists");
            }
            
              if (d1.after(d2)) {
                addFieldError("f1.date", "From date must be lessthan To date");
            }
               if(getCount().equals("-1"))
            {
                addFieldError("count", "Select Count");
            }
           else if(f1.getPackingType().equals("-1"))
            {
                addFieldError("f1.packingType", "Select packing type");
            }
        
               
         
            }
            catch(Exception e) {
                
            }
            
            return "input";
        }
    public String dispatchDelete() throws ParseException {
        xyz=100;
            abcd=22;
        dm.deletedispatch(getIdk(),getBoxType(),getActualDate(),getCountDb());
        this.ulist = dm.dispatchList1(getId());
       this.ulist1=dm.dispatchList();
        return "success";
    }
    private static String boxType;

    public String getBoxType() {
        return boxType;
    }

    public void setBoxType(String boxType) {
        this.boxType = boxType;
    }
    
    private static  String actualDate;
    private static int countDb;

    public String getActualDate() {
        return actualDate;
    }

    public void setActualDate(String actualDate) {
        this.actualDate = actualDate;
    }

    public int getCountDb() {
        return countDb;
    }

    public void setCountDb(int countDb) {
        this.countDb = countDb;
    }

      /*  public String dispatchEdit() throws ParseException {
        xyz=100;
            abcd=22;
            SimpleDateFormat sf=new SimpleDateFormat("dd-MM-yy");
        Date d=sf.parse(actualDate);
            System.out.println("nnnnnnnnnnnnnnnn"+d);
            System.out.println("HHHHHHHHHHHH"+getIdk()+"**********"+getId()+getBoxType()+getActualDate()+getCountDb());
        ulist1=dm.editDispatch(getIdk(),getBoxType(),getActualDate(),getCountDb());
        this.ulist = dm.dispatchList1(getId());
   
       weightlist=dm.weightList();
        weightlist1=dm.weightList1();
        bagtare=dm.bagtarelist();
        boxtarel=dm.boxtarelist();
        return "success";
    }*/
    
   public String dispatchEdit() throws ParseException {
       try {
        xyz=100;
            abcd=22;
            SimpleDateFormat sf=new SimpleDateFormat("dd-MM-yy");
        Date d=sf.parse(actualDate);
            System.out.println("nnnnnnnnnnnnnnnn"+d);
            System.out.println("HHHHHHHHHHHH"+getIdk()+"**********"+getId()+getBoxType()+getActualDate()+getCountDb());
        ulist1=dm.editDispatch(getIdk(),getBoxType(),getActualDate(),getCountDb());
        System.out.println("-------------------->>>>>>>>>>>>>>>"+ulist1);
        this.ulist = dm.dispatchList1(getId());
   
       weightlist=dm.weightList();
        weightlist1=dm.weightList1();
        bagtare=dm.bagtarelist();
        boxtarel=dm.boxtarelist();
       }
       catch(Exception e) {
           
       }
        return "success";
    }
        
    private String evocher1;

    public String getEvocher1() {
        return evocher1;
    }

    public void setEvocher1(String evocher1) {
        this.evocher1 = evocher1;
    }
    
    
      public String dispatchUpdate() throws ParseException {
                System.out.println("dissssssssssssssss updatedddddddd");
          xyz=100;
          abcd=22;
          try{    
       dm.updateDispatch(getF1(), idk, box, boxtare);
       //  dm.generate(getF1());
        // m.updatePacking(getForm(),getEvocher1());
             System.out.println("packingggggggggggggg updateeeeeeeedddddddddd");
          }
          catch(Exception e){
              System.out.println(e);
          }
       
        this.ulist = dm.dispatchList1(getId());
       this.ulist1=dm.dispatchList();
       weightlist=dm.weightList();
        weightlist1=dm.weightList1();
        bagtare=dm.bagtarelist();
        boxtarel=dm.boxtarelist();
        return "success";
    }
    
        
    @Override
      public void validate()
      {
          
          try
          {
               weightlist=dm.weightList();
        weightlist1=dm.weightList1();
        bagtare=dm.bagtarelist();
        boxtarel=dm.boxtarelist();
              
         ulist1=dm.editDispatch(getIdk(),getBoxType(),getActualDate(),getCountDb());     
              countlist=dm.count();
     //   this.ulist1=dm.shiftExists();
     //   shift_date=dm.getDd();
            System.out.println("KKKKKKKKKKKKKKKK");
            this.ulist = dm.dispatchList1(getId());
            abcd=22;
            xyz=100;
       //     countlist=dm.count();  
            if(getF1()!=null)
               if(f1.getDate().length() == 0 || f1.getDate()==null) {
                   System.out.println("##############");
                     a++;
                   if(a%2!=0){
                addFieldError("f1.date", "Please Fill Date First");
                   }
                   else {
                        addFieldError("f1.date", "");
                       a = 0;
                    }
                   
                    }
            else
               {
                   System.out.println("!!!!!!!!!!!!!!!!!!!!!");
            if(!(f1.getDate().length()==0 && f1.getCustomer().length()==0 && f1.getPackingType().equals("-1")
                   && f1.getBagSerialNo().length()==0 && f1.getCount().equals("-1") && f1.getNetWt()==0 && 
                      f1.getLotNo().length()==0  && f1.getRemarks().length()==0)){
          if(f1.getDate().length()==0)
          {
              b++;
              if(b%2!=0)
              {
              addFieldError("f1.date","Please Enter Date");
              }
              else{
                  addFieldError("f1.date", "");
              }
          }
          if(f1.getNoOfBags()==null) {
              k++;
              if(k%2!=0)
              {
              addFieldError("f1.noOfBags", "Please Enter Number of Bags");
              }
              else {
                   addFieldError("f1.noOfBags", "");
              }
          }
          if(f1.getBagSerialNo().length()==0)
          {
              c++;
              if(c%2!=0)
              {
              addFieldError("f1.bagSerialNo", "Please Enter Bag Serial Number");
              }
              else {
                   addFieldError("f1.bagSerialNo", "");
              }
          }
           if(f1.getCustomer().length()==0)
          {
                System.out.println("SSSSSSSSSSSSSSSSSSSS");
              d++;
              if(d%2!=0){
              addFieldError("f1.customer", "Please Enter Customer Name");
              }
              else{
                  addFieldError("f1.customer", "");
              }
          }
            if(f1.getCount()==-1)
          {
              e++;
              if(e%2!=0){
              addFieldError("f1.count", "Count is required");
              }
              else{
                  addFieldError("f1.count", "");
              }
          }
             if(f1.getPackingType().equals("-1"))
          {
              f++;
              if(f%2!=0){
              addFieldError("f1.packingType", "Pattern type is required");
              }
              else{
                   addFieldError("f1.packingType", "");
              }
          }
              if(f1.getNetWt()==null)
          {
              g++;
              if(g%2!=0){
              addFieldError("f1.netWt", "Please Enter Net Weight");
              }
              else{
                   addFieldError("f1.netWt", "");
              }
          }
               
           if(f1.getLotNo().length()==0)
          {
              h++;
              if(h%2!=0){
              addFieldError("f1.lotNo", "LOT Number is required");
              }
              else{
                 addFieldError("f1.lotNo", ""); 
              }
          }
          if(f1.getWeighingBridge()==null)
          {
              i++;
              if(i%2!=0){
              addFieldError("f1.weighingBridge", "Please Enter Weighing Bridge");
              }
              else{
                   addFieldError("f1.weighingBridge", "");
              }
          }
          if(f1.getRemarks().length()==0)
          {
              j++;
              if(j%2!=0){
              addFieldError("f1.remarks", "Remarks are required");
              }
              else{
                   addFieldError("f1.remarks", "");
              }
          }
          else
          {
//              
          }
            }
               }
          }
          catch(Exception e)
          {
              System.out.println(e);
          }
      }
    
}
