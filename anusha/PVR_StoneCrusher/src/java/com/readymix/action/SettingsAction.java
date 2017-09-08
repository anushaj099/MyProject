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
    private static int lid,gid,id;
    private int a,b,c,xyz;
    private List ulist;

    private SettingsManager sm;
    private gradedto grade;
    private gradedto grade34;
    private LoginManager umanager;
    private int count_reg,count_common,count_supply;
    private List cilist;
    private List glist,updatelist;
      private gstdto gstdto=new gstdto();

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

   
      

    public gstdto getGstdto() {
        return gstdto;
    }

    public void setGstdto(gstdto gstdto) {
        this.gstdto = gstdto;
    }

      
      
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
         addFieldError("grade.grade1", "Data already Exists");
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
    
   
     public String getRatePage()
    {
         try {
            this.ulist = sm.dataRetrieve(getLid());
            System.out.println(lid+"++++++++++++++++");
            this.glist=sm.quantRetrieve();
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
    
     public String insertQuant()
    {
        this.ulist = sm.dataRetrieve(getLid());
        System.out.println(lid+"++++++++++++++++"+gstdto.getQuant());
           try {
               this.glist=sm.quantRetrieve();
        if(gstdto.getUnits().equals("-1") || gstdto.getQuant()==null )
        {
            if (gstdto.getUnits().equals("-1")) {
               
                  System.out.println("****************");
                     a++;
                    if (a % 2 != 0) {
                       
                            addFieldError("gstdto.units", "Please select Units of Measure");
                    } else {
                        addFieldError("gstdto.units", "");
                       a = 0;
                      
                    }
                    return "input";
            }
            
              if (gstdto.getQuant()==null) {
               
                  System.out.println("****************");
                     b++;
                    if (b % 2 != 0) {
                       
                            addFieldError("gstdto.quant", "Please enter Quantity");
                    } else {
                        addFieldError("gstdto.quant", "");
                       b = 0;
                      
                    }
                    return "input";
            }
              
//                 if (gstdto.getBasicrate()==null) {
//               
//                  System.out.println("****************");
//                     c++;
//                    if (c % 2 != 0) {
//                       
//                            addFieldError("gstdto.basicrate", "Please select Basic Rate");
//                    } else {
//                        addFieldError("gstdto.basicrate", "");
//                       c = 0;
//                      
//                    }
//                    return "input";
//            }
                 
        }
         else  if (!sm.validateUser3(gstdto)) {
         System.out.println("enterrrrrrrrrrrrrrrrrrrr");
         addFieldError("gstdto.quant", "Data already exists with this Quantity");
         return "input";
             }
          else  if (!sm.validateUser2(gstdto)) {
         System.out.println("enterrrrrrrrrrrrrrrrrrrr");
         addFieldError("gstdto.units", "Data already exists, Please choose other combinations");
         return "input";
             }   
        else 
        {
             sm.insertQuant(gstdto);
             return "success";
        }
         
           }
           catch(Exception e)
           {
               
           }
      
             
        return "input";
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
    public String delQuant(){
        
         try {
            this.ulist = sm.dataRetrieve(getLid());
             System.out.println(lid+"++++++++++++++++"+id);
             sm.deleteQunt(getId());
             this.glist=sm.gradeRetrieve();
         }
         catch(Exception e) {
             
         }
        return "success";
    }
    
}
