/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.readymix.action;

import com.opensymphony.xwork2.ActionSupport;
import com.readymix.dto.gradedto;
import com.readymix.dto.gstdto;
import com.readymix.manager.LoginManager;
import com.readymix.manager.SettingsManager;
import com.readymix.model.Login;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Swathi
 */
public class SettingsAction extends ActionSupport{
    private static int lid,gid;
    private int a,b,c,xyz;
    private List ulist;

    private SettingsManager sm;
    private gradedto grade;
    private gradedto grade34;
    private LoginManager umanager;
    private int count_reg,count_common,count_supply;
    private List cilist;
    private List glist,updatelist;

    public List getUpdatelist() {
        return updatelist;
    }

    public void setUpdatelist(List updatelist) {
        this.updatelist = updatelist;
    }

    public gradedto getGrade34() {
        return grade34;
    }

    public void setGrade34(gradedto grade34) {
        this.grade34 = grade34;
    }

    
    public int getGid() {
        return gid;
    }

    public void setGid(int gid) {
        this.gid = gid;
    }

    public List getGlist() {
        return glist;
    }

    public void setGlist(List glist) {
        this.glist = glist;
    }

    public int getXyz() {
        return xyz;
    }

    public void setXyz(int xyz) {
        this.xyz = xyz;
    }

    public int getCount_supply() {
        return count_supply;
    }

    public void setCount_supply(int count_supply) {
        this.count_supply = count_supply;
    }

    public LoginManager getUmanager() {
        return umanager;
    }

    public void setUmanager(LoginManager umanager) {
        this.umanager = umanager;
    }

    public int getCount_reg() {
        return count_reg;
    }

    public void setCount_reg(int count_reg) {
        this.count_reg = count_reg;
    }

    public int getCount_common() {
        return count_common;
    }

    public void setCount_common(int count_common) {
        this.count_common = count_common;
    }

    public List getCilist() {
        return cilist;
    }

    public void setCilist(List cilist) {
        this.cilist = cilist;
    }

    public gradedto getGrade() {
        return grade;
    }

    public void setGrade(gradedto grade) {
        this.grade = grade;
    }

    public int getLid() {
        return lid;
    }

    public void setLid(int lid) {
        this.lid = lid;
    }
    
    
    public SettingsAction() {
        ulist=new ArrayList();
        sm=new SettingsManager();
        umanager=new LoginManager();
        cilist=new ArrayList();
        glist=new ArrayList();
    }

  
    public List getUlist() {
        return ulist;
    }

    public void setUlist(List ulist) {
        this.ulist = ulist;
    }

    public SettingsManager getSm() {
        return sm;
    }

    public void setSm(SettingsManager sm) {
        this.sm = sm;
    }
   
    
    public String gradePage() {
         try {
            this.ulist = sm.dataRetrieve(getLid());
        System.out.println("dkjghdh---------------dkgkjdh2222222222222dgkhg" + ulist);
        this.glist=sm.gradeRetrieve();
       }
        catch(Exception e) {
            e.printStackTrace();
        }
        return "success";
    }
    
    
     public String getgst() {
         try {
            this.ulist = sm.dataRetrieve(getLid());
        System.out.println("dkjghdh---------------dkgkjdh2222222222222dgkhg" + ulist);
        this.gstlist=sm.getGst();
       }
        catch(Exception e) {
            e.printStackTrace();
        }
        return "success";
    }
    
    public String displayDash() {
        try {
             this.ulist = umanager.dataRetrieve(getLid());
        System.out.println("dkjghdh---------------dkgkjdh2222222222222dgkhg" + ulist);
        
             this.count_reg=umanager.countLogin();
//        this.count_common=umanager.countCommonInvoice();
//        this.cilist=umanager.commonInvoiceList();
       
            String ltype=null;
            for(Object o:ulist) {
                 Login l=(Login) o;
                 ltype=l.getLType();
                 System.out.println("login type iss"+ltype);
            }
            if(ltype.equals("control")) {
                 return "control";
            }
            else {
                return "user";
            }
         
        } catch (Exception e) {

        }
        return "404err";
    }
    public String gradeInsert() {
        
          try {
            this.ulist = sm.dataRetrieve(getLid());
            this.glist=sm.gradeRetrieve();
            System.out.println("dkjghdh---------------dkgkjdh2222222222222dgkhg" + ulist);
            
              System.out.println(grade.getGrade1().length());
              
              
             if (grade.getGrade1().length() == 0) {
               
                 
                     a++;
                    if (a % 2 != 0) {
                        System.out.println("****************");
                         addFieldError("grade.grade1", "Grade can't be blank");
                        
                         
                    } else {
                        addFieldError("grade.grade1", "");
                       a = 0;
                      
                    }
                    return "input";
          
              }
               else      if (!sm.validateUser1(grade)) {
         System.out.println("enterrrrrrrrrrrrrrrrrrrr");
         addFieldError("grade.grade1", "Grade already Exists");
         return "input";
             }              
              else {
                  xyz=1000;
                  sm.insertGrade(grade);
                  this.count_reg=umanager.countLogin();
//                  this.count_common=umanager.countCommonInvoice();
//                  this.cilist=umanager.commonInvoiceList();
                  return "success";
              }
        
        
       }
        catch(Exception e) {
            e.printStackTrace();
        }
        return "input";
    }
    
    
    private List gstlist;
    private gstdto gstdto;

    public gstdto getGstdto() {
        return gstdto;
    }

    public void setGstdto(gstdto gstdto) {
        this.gstdto = gstdto;
    }
    

    public List getGstlist() {
        return gstlist;
    }

    public void setGstlist(List gstlist) {
        this.gstlist = gstlist;
    }
    private static int a1;
     public String gstInsert() {
        
          try {
            this.ulist = sm.dataRetrieve(getLid());
            this.gstlist=sm.getGst();
            System.out.println("dkjghdh---------------dkgkjdh2222222222222dgkhg" + ulist);
            this.cilist=sm.getGst();
            
            
             // System.out.println(grade.getGrade1().length());
             
              System.out.println("size isssss"+cilist.size());
             
             
              
              
             if (gstdto.getGstNumber().length() == 0) {
               
                 
                     a1++;
                    if (a1 % 2 != 0) {
                        System.out.println("****************");
                         addFieldError("gstdto.gstNumber", "GSTIN can't be blank");
                        
                         
                    } else {
                        addFieldError("gstdto.gstNumber", "");
                       a1 = 0;
                      
                    }
                    return "input";
          
              }
             
             else if(cilist.size()>=1) {
                   addFieldError("gstdto.gstNumber", "GSTIN already exists");
             }
                        
              else {
                  xyz=1000;
                  sm.insertGst(gstdto);
                  gstlist=sm.getGst();
                  this.count_reg=umanager.countLogin();
//                  this.count_common=umanager.countCommonInvoice();
//                  this.cilist=umanager.commonInvoiceList();
                  return "success";
              }
        
        
       }
        catch(Exception e) {
            e.printStackTrace();
        }
        return "input";
    }
     
     private int gstid;

    public int getGstid() {
        return gstid;
    }

    public void setGstid(int gstid) {
        this.gstid = gstid;
    }
    
    public String deleteGst() {
        
        
         try {
            this.ulist = sm.dataRetrieve(getLid());
             System.out.println(lid+"++++++++++++++++"+gid);
             sm.deleteGst(gstid);
             this.glist=sm.gradeRetrieve();
         }
         catch(Exception e) {
             
         }
        return "success";
    }
    
   
    
    public String deleteGrade() {
        
        
         try {
            this.ulist = sm.dataRetrieve(getLid());
             System.out.println(lid+"++++++++++++++++"+gid);
             sm.deleteUser(getGid());
             this.glist=sm.gradeRetrieve();
         }
         catch(Exception e) {
             
         }
        return "success";
    }
    
    //------------------------- PASSWORD ------------------------------------------
    
    public String pwdPage() {
     try {
            this.ulist = sm.dataRetrieve(getLid());
             System.out.println(lid+"++++++++++++++++");
         }
         catch(Exception e) {
             
         }
        return "success";   
    }
    
    public String changePwd() {
         try {
            this.ulist = sm.dataRetrieve(getLid());
            System.out.println("dkjghdh---------------dkgkjdh2222222222222dgkhg" + ulist);
            String newpwd=null;
            String confmpwd=null;
          //    System.out.println(grade.getGrade1().length());
          if(grade.getNewpwd().length() != 0 && grade.getConfirmpwd().length() != 0) {
              newpwd=grade.getNewpwd();
              confmpwd=grade.getConfirmpwd();  
          }
             
              if(grade.getPassword().length() == 0 || grade.getNewpwd().length() == 0 || grade.getConfirmpwd().length()==0) {
             if (grade.getPassword().length() == 0) {
               
                 
                     a++;
                    if (a % 2 != 0) {
                        System.out.println("****************");
                            addFieldError("grade.password", "Password can't be blank");
                        
                         
                    } else {
                        addFieldError("grade.password", "");
                       a = 0;
                      
                    }
                    return "input";
            }
              if (grade.getNewpwd().length() == 0) {
               
                 
                     b++;
                    if (b % 2 != 0) {
                        System.out.println("****************");
                         addFieldError("grade.newpwd", "New Password can't be blank");
                        
                         
                    } else {
                        addFieldError("grade.newpwd", "");
                       b = 0;
                      
                    }
                    return "input";
            }
              
               if (grade.getConfirmpwd().length() == 0) {
               
                 
                    c++;
                    if (c % 2 != 0) {
                        System.out.println("****************");
                         addFieldError("grade.confirmpwd", "Confirm Password can't be blank");
                   } else {
                        addFieldError("grade.confirmpwd", "");
                       c = 0;
                      
                    }
                    return "input";
            }
              }
           else   if(!(newpwd.equals(confmpwd))) {
                   addFieldError("grade.confirmpwd", "New Password and Confirm Password doesn't match");
                     return "input";
              }
              
              else      if (sm.validatePwd(grade)) {
         System.out.println("enterrrrrrrrrrrrrrrrrrrr");
         addFieldError("grade.password", "Current password doesn't match the records");
         return "input";
             }              
              else {
                  xyz=999;
                  sm.updatePwd(grade);
                  this.count_reg=umanager.countLogin();
//                  this.count_common=umanager.countCommonInvoice();
//                  this.cilist=umanager.commonInvoiceList();
                  return "success";
              }
        
        
       }
        catch(Exception e) {
            e.printStackTrace();
        }
        
        return "input";
    }
    
}
