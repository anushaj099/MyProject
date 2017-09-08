/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.struts;

import com.opensymphony.xwork2.ActionSupport;
import com.textile.dto.StockDTO;
import com.textile.dto.StockReportDto;
import com.textile.manager.StockManager;
import com.textile.model.FinancialYearBackup;
import com.textile.model.StockReport;
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
 * @author Swathi
 */
public class StockReportAction extends ActionSupport {

    private StockManager sm;
    private StockDTO pcard;
    private List ulist, rlist1, rlist2, rlist3,productlist;
    ArrayList[] lis = new ArrayList[5];
    private List slist;
    private static int id;
    private StockReportDto sd;
    private String variety1, variety2, variety3;
    private String status;
    private static String dat;
    String var[];
    private static int purchaseid=0;
    private Date startdate,enddate;

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

    public int getPurchaseid() {
        return purchaseid;
    }

    public void setPurchaseid(int purchaseid) {
        this.purchaseid = purchaseid;
    }

    public List getProductlist() {
        return productlist;
    }

    public void setProductlist(List productlist) {
        this.productlist = productlist;
    }

     
    public String[] getVar() {
        return var;
    }

    public void setVar(String[] var) {
        this.var = var;
    }
     
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public ArrayList[] getLis() {
        return lis;
    }

    public void setLis(ArrayList[] lis) {
        this.lis = lis;
    }

    public String getVariety1() {
        return variety1;
    }

    public void setVariety1(String variety1) {
        this.variety1 = variety1;
    }

    public String getVariety2() {
        return variety2;
    }

    public void setVariety2(String variety2) {
        this.variety2 = variety2;
    }

    public String getVariety3() {
        return variety3;
    }

    public void setVariety3(String variety3) {
        this.variety3 = variety3;
    }

    private int size = 0;

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public List getRlist1() {
        return rlist1;
    }

    public void setRlist1(List rlist1) {
        this.rlist1 = rlist1;
    }

    public List getRlist2() {
        return rlist2;
    }

    public void setRlist2(List rlist2) {
        this.rlist2 = rlist2;
    }

    public List getRlist3() {
        return rlist3;
    }

    public void setRlist3(List rlist3) {
        this.rlist3 = rlist3;
    }

    public StockDTO getPcard() {
        return pcard;
    }

    public void setPcard(StockDTO pcard) {
        this.pcard = pcard;
    }

    public List getSlist() {
        return slist;
    }

    public void setSlist(List slist) {
        this.slist = slist;
    }

    public StockReportDto getSd() {
        return sd;
    }

    public void setSd(StockReportDto sd) {
        this.sd = sd;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public StockManager getSm() {
        return sm;
    }

    public void setSm(StockManager sm) {
        this.sm = sm;
    }

    public List getUlist() {
        return ulist;
    }

    public void setUlist(List ulist) {
        this.ulist = ulist;
    }

    public StockReportAction() {
        sm = new StockManager();
        ulist = new ArrayList();
        rlist1 = new ArrayList();
        rlist2 = new ArrayList();
        rlist3 = new ArrayList();
    }

    public String stockboard() {
        this.ulist = sm.settingsList1(getId());
        productlist=sm.getProductlist();
        purchaseid=1000;
//        this.slist=sm.stockrte();
//        if(slist.isEmpty()) {
//            return "stock";
//        }
        return "success";
    }
    
  
     public String stockInsertChick() throws ParseException
     {
        this.ulist = sm.settingsList1(getId());
        productlist=sm.getProductlist();
        if(!sm.checkDate(getPcard())){
            this.ulist = sm.settingsList1(getId());
            status="12345";
             addFieldError("pcard.date", "Please select earlier date of Production beginning date");
        }
        if(status==null){
            status="123";
            dat=pcard.getDate();
        }
        return "success"; 
    }
        public String stockInsert() 
   {
       productlist=sm.getProductlist();
        pcard.setDate(dat);
       sm.insertStock(getPcard());
        System.out.println("anushaaaaaaaa");
      return "success"; 
   }
     
    public String stockRt() throws ParseException {
         this.ulist = sm.settingsList1(getId());
        productlist=sm.getProductlist();
        try {
           
           this.lis=(ArrayList[]) sm.getListV1(getSd());
            System.out.println("the size is-----------------------------"+lis.length);
            var=sd.getPtype().split(", ");
            switch (var.length) {
                case 1:
                    if(lis[0].size()==0){
                     addFieldError("sd.date", "Data not Exists");
                     return "back";
                    }
                    this.rlist1=lis[0];
                    size=1;
                    variety1=var[0];
                    break;
                case 2:
                    if(lis[0].isEmpty() && lis[1].isEmpty()){
                     addFieldError("sd.date", "Data not Exists");
                     return "back";
                    }
                     this.rlist1=lis[0];
                      this.rlist2=lis[1];
                    size=2;
                     variety1=var[0];
                     variety2=var[1];
                    break;
                case 3:
                     if(lis[0].isEmpty() && lis[1].isEmpty() && lis[2].isEmpty()){
                     addFieldError("sd.date", "Data not Exists");
                     return "back";
                    }
                     this.rlist1=lis[0];
                      this.rlist2=lis[1];
                      this.rlist3=lis[2];
                      variety1=var[0];
                     variety2=var[1];
                       variety3=var[2];
                    size=3;
                    break;
                    default:break;
            }
      } catch (Exception e) {
          e.printStackTrace();
            System.out.println("the exception in stockreportaction of stockRt------------>"+e);
        }
        return "fail";
    }
            
 


    @Override
    public void validate() {
        this.ulist = sm.settingsList1(getId());
        productlist=sm.getProductlist();
        try {

           if (sd.getDate().length() == 0) {
                addFieldError("sd.date", "Date Should not be Empty");
            }
            else {
                Date d1 = new SimpleDateFormat("dd-MM-yyyy").parse(sd.getDate());
            Date d2 = new SimpleDateFormat("dd-MM-yyyy").parse(sd.getDate1());
            
            
            
            
            
            if (d1.after(d2)) {
                addFieldError("sd.date1", "From date must be lessthan To date");
            }
            
            if (!(sd.getDate().length() == 0)) {
                if (sd.getDate1().length() == 0) {
                    addFieldError("sd.date1", "To date Should not be Empty");
                }
                if (sd.getPtype().length() == 0) {
                    addFieldError("sd.ptype", "Please check atleast one variety");
                }
                if (sm.stockRt(getSd())) {
                    addFieldError("sd.date1", "Absolute Data not exists to generate report");
                }
            }
            }
          

        } catch (Exception e) {

        }
    }

}
