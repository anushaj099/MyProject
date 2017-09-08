/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.struts;

import com.opensymphony.xwork2.ActionSupport;
import com.textile.dto.empdto;
import com.textile.manager.AddPurchaseManager;
import com.textile.manager.EmployeeManager;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Swathi
 */
public class EmployeeAction extends ActionSupport{
    private EmployeeManager em;
    private List emp=new ArrayList();
     private AddPurchaseManager apm=new AddPurchaseManager();
    private List year=null;

    public List getYear() {
        return year;
    }

    public void setYear(List year) {
        this.year = year;
    }

    public List getEmp() {
        return emp;
    }

    public void setEmp(List emp) {
        this.emp = emp;
    }
   private int eid;
   private String ename,desg;

    public int getEid() {
        return eid;
    }

    public void setEid(int eid) {
        this.eid = eid;
    }

    public String getEname() {
        return ename;
    }

    public void setEname(String ename) {
        this.ename = ename;
    }

    public String getDesg() {
        return desg;
    }

    public void setDesg(String desg) {
        this.desg = desg;
    }
   
    
    private  List ulist;
    private static int id,id1;
    private  empdto e;
    private  int xyz;

    public int getId1() {
        return id1;
    }

    public void setId1(int id1) {
        this.id1 = id1;
    }
    

    public int getXyz() {
        return xyz;
    }

    public void setXyz(int xyz) {
        this.xyz = xyz;
    }

    public empdto getE() {
        return e;
    }

    public void setE(empdto e) {
        this.e = e;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public EmployeeManager getEm() {
        return em;
    }

    public void setEm(EmployeeManager em) {
        this.em = em;
    }

    public List getUlist() {
        return ulist;
    }

    public void setUlist(List ulist) {
        this.ulist = ulist;
    }

    public EmployeeAction() {
        em=new EmployeeManager();
        ulist=new ArrayList();
    }
   
    
    public String dispemployee()
    {
       try {
            this.year=apm.getYear();
        this.ulist=em.empList1(getId());
         }
         catch(Exception e) {
             e.printStackTrace();
         }
        return "success";
    }
    
    public String insertEmployee() 
    {
         this.ulist=em.empList1(getId()); 
   try {
        if (!em.validateUser(getE())) {
         addFieldError("e.eid", "Employee ID already exists, choose other ID ");
         return "fail";
   }
        else {
             em.insertEmp(getE());
            emp=em.display();
        }
       xyz=1000;
        return "success";
        }
        catch(Exception e) {
            
        }
        return "fail";
    }
    
    public String sethome() 
    {
        this.ulist=em.empList1(getId());
        return "success";
    }
    public String viewEmployee()
    {
         this.year=apm.getYear();
        try {
       emp=em.display();
        }
         catch(Exception e) {
             e.printStackTrace();
         }
        return "success";
    }
    public String editEmployee()
    {
        try {
        emp=em.empEdit(getId1());
         }
         catch(Exception e) {
             e.printStackTrace();
         }
        return "success";
    }
    public String deleteEmployee()
    {
        try {
         em.empDelete(getId1()) ;
         emp=em.display();
          }
         catch(Exception e) {
             e.printStackTrace();
         }
         return "success";
    }
    public String updateEmployee()
    {
         emp=em.display();
        try {
        System.out.println("\n kkkkkkkkkkkkkkkkkk"+getId1()+"+++++++++"+getId());
     //  emp=em.empEdit(getId1());
              em.empUpdate(e.getEid(),e.getEname(),e.getDesg());
              System.out.println("------->>>>>/////");
        emp=em.display();
         System.out.println("disssssssspllllllllaayyy");
     
        }
         catch(Exception e) {
             e.printStackTrace();
         }
        return "success";
    }
    private static int a,b,c,d;

    @Override
    public void validate() {
         
          try {
              this.ulist=em.empList1(getId());
                this.year=apm.getYear();
               emp=em.empEdit(getId1());
               System.out.println("LLLLLLLLLLLL");
              if(e.getEname().length() == 0) {
                
                a++;
                System.out.println("lkfhj-------------fjj----------"+a);
                    if (a % 2 != 0) {
                         addFieldError("e.ename", "Please fill Employee Name First");
                         
                    } else {
                        addFieldError("e.ename", "");
                       a = 0;
                    }
            }
              
              else {
                  if (e.getEid()==null || e.getEid()==0) {
                 System.out.println("DDDDDDDDDD");
                 b++;
                    if (b % 2 != 0) {
                         addFieldError("e.eid", "Employee ID is required");
                         
                    } else {
                        addFieldError("e.eid", "");
                       b = 0;
                    }
            }
              else if (e.getDesg().length()==0 || e.getDesg()==null) {
                
                 d++;
                    if (d % 2 != 0) {
                         addFieldError("e.desg", "Designation is required");
                         
                    } else {
                        addFieldError("e.desg", "");
                       d = 0;
                    }
            }  

            
            }
//            if(getDesg().length()==0)
//            {
//                addFieldError("desg", "Designation is required");
//            }
                
          }
          catch(Exception e) {
              
          }
      
    }
    
    
}
