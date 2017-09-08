/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.struts;

import com.opensymphony.xwork2.ActionSupport;
import com.textile.dto.Pproduction;
import com.textile.manager.RtproductionManager;
import com.textile.model.ChildGdProduction;
import com.textile.model.FinancialYearBackup;
import com.textile.model.ParentGdProduction;
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
public class RtproductionAction extends ActionSupport {

    RtproductionManager pm = new RtproductionManager();
    private Pproduction pp;
    List<ChildGdProduction> list;
    List<ParentGdProduction> list1 = new ArrayList<>();
    private int purchaseid=0;
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

    public List<ChildGdProduction> getList() {
        return list;
    }

    public void setList(List<ChildGdProduction> list) {
        this.list = list;
    }

    public List<ParentGdProduction> getList1() {
        return list1;
    }

    public void setList1(List<ParentGdProduction> list1) {
        this.list1 = list1;
    }

    List ulist;
    private List<String> superList = new ArrayList<>();

    public List<String> getSuperList() {
        return superList;
    }

    public void setSuperList(List<String> superList) {
        this.superList = superList;
    }

    public List getUlist() {
        return ulist;
    }

    public void setUlist(List ulist) {
        this.ulist = ulist;
    }
    private static int id;

    private String date, date1;
    private int employeeId;
    private String shifts;

    public RtproductionManager getPm() {
        return pm;
    }

    public void setPm(RtproductionManager pm) {
        this.pm = pm;
    }

    public Pproduction getPp() {
        return pp;
    }

    public void setPp(Pproduction pp) {
        this.pp = pp;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public RtproductionAction() {
        pm = new RtproductionManager();
        ulist = new ArrayList();
    }
    private int abcd = 0;

    public int getAbcd() {
        return abcd;
    }

    public void setAbcd(int abcd) {
        this.abcd = abcd;
    }

    public String retrieve1() throws ParseException {
       
        superList = pm.getSuperviser();
        this.ulist = pm.productionList1(getId());
        abcd = 12;
        try {

            System.out.println("is is" + getId());

            if (pp.getDate().length() == 0) {
                addFieldError("pp.date", "From date Should not be Empty");
            }
            if (pp.getDate1().length() == 0) {
                addFieldError("pp.date1", "To date Should not be Empty");
            }

            list = pm.RetrivePtp(getPp());
            list1 = pm.retrieveCtp(getPp());
            System.out.println("jhgvfffffffffffffffffffffffffffffffffffffsdk------------------" + list.size() + "-----" + list1.size());
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

    public String viewProduction() throws ParseException {
        list = pm.RetrivePtp(getPp());
        return "success";
    }

    public String exportExcel() {

        return "success";
    }
}
