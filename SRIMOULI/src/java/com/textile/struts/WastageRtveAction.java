/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.struts;

import com.opensymphony.xwork2.ActionSupport;
import com.textile.dto.WastageDto;
import com.textile.manager.WastageRtveManager;
import com.textile.model.ChildGdWastage;
import com.textile.model.FinancialYearBackup;
import com.textile.model.ParentGdWastage;
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
public class WastageRtveAction extends ActionSupport{
    
    
     WastageRtveManager pm = new WastageRtveManager();
    private WastageDto pp;
    List<ChildGdWastage> list;
    List<ParentGdWastage> list1 = new ArrayList<>();
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

    public List<ChildGdWastage> getList() {
        return list;
    }

    public void setList(List<ChildGdWastage> list) {
        this.list = list;
    }

    public List<ParentGdWastage> getList1() {
        return list1;
    }

    public void setList1(List<ParentGdWastage> list1) {
        this.list1 = list1;
    }

   

    List ulist;
    public List getUlist() {
        return ulist;
    }

    public void setUlist(List ulist) {
        this.ulist = ulist;
    }
    private  int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

   
    private String date, date1,receipt;
    
   public WastageRtveManager getPm() {
        return pm;
    }

    public void setPm(WastageRtveManager pm) {
        this.pm = pm;
    }

    public WastageDto getPp() {
        return pp;
    }

    public void setPp(WastageDto pp) {
        this.pp = pp;
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

    public String getReceipt() {
        return receipt;
    }

    public void setReceipt(String receipt) {
        this.receipt = receipt;
    }
    
    

    public WastageRtveAction() {
        pm = new WastageRtveManager();
        ulist = new ArrayList();
    }
    private int abcd = 0;

    public int getAbcd() {
        return abcd;
    }

    public void setAbcd(int abcd) {
        this.abcd = abcd;
    }

    public String retrieves() throws ParseException {
       System.out.println("sssssssssss");
        this.ulist = pm.wastageList1(getId());
        abcd = 14;
        try {

            System.out.println("is is" + getId());

            if (pp.getDate().length() == 0) {
                addFieldError("pp.date", "From date Should not be Empty");
            }
            if (pp.getDate1().length() == 0) {
                addFieldError("pp.date1", "To date Should not be Empty");
            }
            if(pp.getReceipt().length()==0)
            {
                addFieldError("pp.receipt", "Please enter receipt Number");
            }
            System.out.println("ffffffddddddddddddddddddd");
            list = pm.RetriveWastage(getPp());
             System.out.println("jhgvffffffmmmmmmmmmmmmmmmmmmmmmmmmmmmm"+list);
            list1 = pm.retrieveCtp(getPp());
             
            Date d1 = new SimpleDateFormat("dd-MM-yyyy").parse(pp.getDate());
            Date d2 = new SimpleDateFormat("dd-MM-yyyy").parse(pp.getDate1());
            if (d1.after(d2)) {
                addFieldError("pp.date1", "From date must be lessthan To date");
            } 
            else if (list.isEmpty() || list1.isEmpty()) {
                addFieldError("pp.date", "Data not Exists");
            }
        } catch (Exception e) {

        }
        return "success";
    }

   
}

    

