/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.readymix.action;

import static com.opensymphony.xwork2.Action.INPUT;
import com.opensymphony.xwork2.ActionSupport;
import com.readymix.dto.LoginDto;
import com.readymix.manager.LoginManager;

import com.readymix.model.Login;
import com.sun.javafx.scene.control.skin.VirtualFlow;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;


/**
 *
 * @author Swathi
 */
public class LoginAction extends ActionSupport implements ServletRequestAware{
  private  LoginDto logindto;
  private HttpServletRequest request;
  private List ulist;
  private LoginManager umanager;
  private static int lid;
  private static int cid;
  private static int sid;
  private int count_reg,count_common,count_supply,xyz=0;
  private List cilist,list2;
  private static int a,b,d,n,p,q,r,e,ma,check,mb;
  private static int did=0;
  public String word;

    public String getWord() {
        return word;
    }

    public void setWord(String word) {
        this.word = word;
    }

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }
  
    
  private List plist;
  private List clist;

    public List getPlist() {
        return plist;
    }

    public void setPlist(List plist) {
        this.plist = plist;
    }

    public List getClist() {
        return clist;
    }

    public void setClist(List clist) {
        this.clist = clist;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public int getDid() {
        return did;
    }

    public void setDid(int did) {
        this.did = did;
    }

    public List getList2() {
        return list2;
    }

    public void setList2(List list2) {
        this.list2 = list2;
    }
  
  

    public int getXyz() {
        return xyz;
    }

    public void setXyz(int xyz) {
        this.xyz = xyz;
    }

  
    public List getCilist() {
        return cilist;
    }

    public void setCilist(List cilist) {
        this.cilist = cilist;
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

    public int getCount_supply() {
        return count_supply;
    }

    public void setCount_supply(int count_supply) {
        this.count_supply = count_supply;
    }
  
  

    public int getLid() {
        return lid;
    }

    public void setLid(int lid) {
        this.lid = lid;
    }

    public LoginManager getUmanager() {
        return umanager;
    }

    public void setUmanager(LoginManager umanager) {
        this.umanager = umanager;
    }
  
    public List getUlist() {
        return ulist;
    }

    public void setUlist(List ulist) {
        this.ulist = ulist;
    }

    public LoginAction() {
        ulist=new ArrayList();
        umanager=new LoginManager();
        cilist=new ArrayList();
        list2=new ArrayList();
        plist=new ArrayList();
        clist=new ArrayList();
         clist1=new ArrayList();
          clist2=new ArrayList();
           clist3=new ArrayList();
            clist4=new ArrayList();
             clist5=new ArrayList();
              clist6=new ArrayList();
               clist7=new ArrayList();
                clist8=new ArrayList();
                 clist9=new ArrayList();
                  clist10=new ArrayList();
                   clist11=new ArrayList();
                    clist12=new ArrayList();
                     clist13=new ArrayList();
                      clist14=new ArrayList();
                       clist15=new ArrayList();
    }
  
  

    public LoginDto getLogindto() {
        return logindto;
    }

    public void setLogindto(LoginDto logindto) {
        this.logindto = logindto;
    }
  
    
    public String login() {
        System.out.println("&&&&&&&&&&&&&&&&&&&");
        String USER_HANDLE = "loggedInUser";
        String HANDLE = "loggedInPass";
        
        System.out.println(request.getSession(true));
        HttpSession session=request.getSession(true);

        // Is there a "user" object stored in the user's HttpSession?
        Object user = session.getAttribute(USER_HANDLE);
        Object pass = session.getAttribute(HANDLE);
        System.out.println("...........***************<<<<<<<<----------------" + user + ">>>>>>>>" + pass);

        System.out.println(user.toString()+"kjhgf"+pass.toString());
        
        
        try {
            this.ulist = umanager.loginmanager(user.toString(), pass.toString());
        System.out.println("dkjghdh---------------dkgkjdh2222222222222dgkhg" + ulist);
        
        this.count_reg=umanager.countLogin();
        this.count_common=umanager.countCommonInvoice();
//        this.count_supply=umanager.countSupplyInvoice();
        this.cilist=umanager.commonInvoiceList();

        
            System.out.println("%%%%%%%%%%%%"+count_reg);
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
        return "success";
    }
    
    public String logout() {
          try {
        System.out.println("yrljjjlj..............sf...............");
        // remove userName from the session

        ServletActionContext.getRequest().getSession().invalidate();
        System.out.println("You are successfully logout!......");
        addActionMessage("You are successfully logout!");
        
                     
 }
         catch(Exception e) {
             e.printStackTrace();
         }       
          return "success";
    }
    
    
    public String displayDashboard() {
        try {
             this.ulist = umanager.dataRetrieve(getLid());
        System.out.println("dkjghdh---------------dkgkjdh2222222222222dgkhg" + ulist);
        
             this.count_reg=umanager.countLogin();
        this.count_common=umanager.countCommonInvoice();
        this.cilist=umanager.commonInvoiceList();
//         this.clist1=umanager.supplyInvoiceList();
         
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
    
    public String myProfile() {
        try {
            this.ulist = umanager.dataRetrieve(getLid());
        System.out.println("dkjghdh---------------dkgkjdh2222222222222dgkhg" + ulist);
       }
        catch(Exception e) {
            e.printStackTrace();
        }
        return "success";
    }
    
    public String userView() {
        try {
            this.ulist = umanager.dataRetrieve(getLid());
            System.out.println("dkjghdh---------------dkgkjdh2222222222222dgkhg" + ulist);
            this.cilist=umanager.dataRetrieve();
       }
        catch(Exception e) {
            e.printStackTrace();
        }
        return "success";
    }

    
    public String insertLogin(){
        try{
                this.ulist = umanager.dataRetrieve(getLid());
        System.out.println("dkjghdh---------------dkgkjdh2222222222222dgkhg" + ulist);
            System.out.println("password length iss"+logindto.getPassword().length());
        
            if(logindto.getLoginid().length()==0 || logindto.getEmail().length()==0 || logindto.getPassword().length()==0||logindto.getDesignation().length()==0||logindto.getFullName().length()==0||logindto.getDesignation().length()==0) {
            if (logindto.getLoginid().length() == 0) {
               
                 
                     a++;
                    if (a % 2 != 0) {
                        System.out.println("****************");
                         addFieldError("logindto.loginid", "Login ID can't be blank");
                        
                         
                    } else {
                        addFieldError("logindto.loginid", "");
                       a = 0;
                      
                    }
            }
            
            if (logindto.getPassword().length() == 0) {
                
                 b++;
                    if (b % 2 != 0) {
                         addFieldError("logindto.password", "Password can't be blank");
                         
                         
                    } else {
                        addFieldError("logindto.password", "");
                       b = 0;
                       
                    }
            } 
            
             if (logindto.getDesignation().length() == 0) {
                
                 d++;
                    if (d % 2 != 0) {
                         addFieldError("logindto.designation", "Designation can't be blank");
                         
                         
                    } else {
                        addFieldError("logindto.designation", "");
                       d = 0;
                       
                    }
            } 
             
               if (logindto.getEmail().length()==0) {
                   
                     q++;
                    if (q % 2 != 0) {
                        addFieldError("logindto.email", "Email ID can't be blank");
                         
                    } else {
                        addFieldError("lodindto.email", "");
                       q = 0;
                    }
                }
            
              if (logindto.getFullName().length() == 0) {
                
                 e++;
                    if (e % 2 != 0) {
                         addFieldError("logindto.fullName", "Name can't be blank");
                         
                         
                    } else {
                        addFieldError("logindto.fullName", "");
                       e = 0;
                       
                    }
            } 
            
               if (logindto.getLType().length() == 0) {
                
                 n++;
                    if (n % 2 != 0) {
                         addFieldError("logindto.LType", "Type can't be blank");
                         
                         
                    } else {
                        addFieldError("logindto.LType", "");
                       n = 0;
                       
                    }
            } 
            
                if (logindto.getMobileNo().length() == 0) {
                
                 p++;
                    if (p % 2 != 0) {
                         addFieldError("logindto.mobileNo", "Mobile Number can't be blank");
                         
                         
                    } else {
                        addFieldError("logindto.mobileNo", "");
                       p = 0;
                       
                    }
            } 
            
           
            }
            else if (logindto.getMobileNo().length() < 10||logindto.getMobileNo().length() > 10) {
                   
                     ma++;
                    if (ma % 2 != 0) {
                       addFieldError("logindto.mobileNo", "Mobile number must have 10 digits");
                        return "fail";
                         
                    } else {
                        addFieldError("logindto.mobileNo", "");
                       ma = 0;
                        return "fail";
                    }
                } else if (!(logindto.getMobileNo().matches("^((\\+[1-9]?[0-9])|0)?[7-9][0-9]{9}$"))) {
                   
                    mb++;
                    if (mb % 2 != 0) {
                       addFieldError("logindto.mobileNo", "invalid mobile number");
                        return "fail";
                         
                    } else {
                        addFieldError("logindto.mobileNo", "");
                       mb = 0;
                        return "fail";
                    }
                }
          else if (!logindto.getEmail().matches("^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$")) {
                   
                     r++;
                    if (r % 2 != 0) {
                        addFieldError("logindto.email", "Please enter valid Email address");
                         
                    } else {
                        addFieldError("logindto.email", "");
                       r = 0;
                    }
                }    
            
            
        else      if (!umanager.validateUser1(logindto)) {
         System.out.println("enterrrrrrrrrrrrrrrrrrrr");
         addFieldError("logindto.fullName", "LoginId or Mobile number is already Exists");
         return "fail";
   }
        else {
             
             System.out.println("inssssrrtttttr//////////");
             umanager.insertLogin(logindto);
              this.count_reg=umanager.countLogin();
        this.count_common=umanager.countCommonInvoice();

        this.cilist=umanager.commonInvoiceList();

             xyz=1000;
              return "success";
        }
      
       
        }
        catch(Exception e){
            System.out.println(e);
        }
       
        
        return "fail";
    }
     
     public String newUser() {
         try {
            this.ulist = umanager.dataRetrieve(getLid());
        System.out.println("dkjghdh---------------dkgkjdh2222222222222dgkhg" + ulist);
       }
        catch(Exception e) {
            e.printStackTrace();
        } 
         return "success";
     }
     
     public String deleteUser() {
          try {
            this.ulist = umanager.dataRetrieve(getLid());
        System.out.println("dkjghdh---------------dkgkjdh2222222222222dgkhg" + ulist);
              System.out.println("deleted id iss"+did);
        umanager.deleteUser(getDid());
         this.cilist=umanager.dataRetrieve();
       }
        catch(Exception e) {
            e.printStackTrace();
        } 
         return "success";
     }
     
     public String editUser() {
        try {
            System.out.println(lid+"id"+did);
            this.ulist = umanager.dataRetrieve(getLid());
        System.out.println("dkjghdh---------------dkgkjdh2222222222222dgkhg" + ulist);
              System.out.println("deleted id iss"+did);
       this.list2=umanager.editUser(getDid());
       }
        catch(Exception e) {
            e.printStackTrace();
        } 
         return "success"; 
     }
     
   
     
     public String updateUser() {
         try {
             System.out.println(lid+"id"+did);
            this.ulist = umanager.dataRetrieve(getLid());
            System.out.println("dkjghdh---------------dkgkjdh2222222222222dgkhg" + ulist);
              System.out.println(logindto.getDesignation().length()+"deleted id iss"+did);
              this.list2=umanager.editUser(getDid());
      
                if(logindto.getLoginid().length()==0 || logindto.getEmail().length()==0 || logindto.getPassword().length()==0||logindto.getDesignation().length()==0||logindto.getFullName().length()==0||logindto.getMobileNo().length()==0) {
            if (logindto.getLoginid().length() == 0) {
               
                 
                     a++;
                    if (a % 2 != 0) {
                        System.out.println("****************");
                         addFieldError("logindto.loginid", "Login ID can't be blank");
                        
                         
                    } else {
                        addFieldError("logindto.loginid", "");
                       a = 0;
                      
                    }
            }
            
            if (logindto.getPassword().length() == 0) {
                
                 b++;
                    if (b % 2 != 0) {
                         addFieldError("logindto.password", "Password can't be blank");
                         
                         
                    } else {
                        addFieldError("logindto.password", "");
                       b = 0;
                       
                    }
            } 
            
             if (logindto.getDesignation().length() == 0) {
                
                 d++;
                    if (d % 2 != 0) {
                         addFieldError("logindto.designation", "Designation can't be blank");
                         return "fail";
                         
                    } else {
                        addFieldError("logindto.designation", "");
                       d = 0;
                       
                    }
            } 
            
              if (logindto.getFullName().length() == 0) {
                
                 e++;
                    if (e % 2 != 0) {
                         addFieldError("logindto.fullName", "Name can't be blank");
                         
                         
                    } else {
                        addFieldError("logindto.fullName", "");
                       e = 0;
                       
                    }
            } 
            
               if (logindto.getLType().length() == 0) {
                
                 n++;
                    if (n % 2 != 0) {
                         addFieldError("logindto.LType", "Type can't be blank");
                         
                         
                    } else {
                        addFieldError("logindto.LType", "");
                       n = 0;
                       
                    }
            } 
            
                if (logindto.getMobileNo().length() == 0) {
                
                 p++;
                    if (p % 2 != 0) {
                         addFieldError("logindto.mobileNo", "Mobile Number can't be blank");
                         
                         
                    } else {
                        addFieldError("logindto.mobileNo", "");
                       p = 0;
                       
                    }
            } 
                if (logindto.getEmail().length()==0) {
                   
                     q++;
                    if (q % 2 != 0) {
                        addFieldError("logindto.email", "Email ID can't be blank");
                         
                    } else {
                        addFieldError("lodindto.email", "");
                       q = 0;
                    }
                } 
           
           
            }
                else if (logindto.getMobileNo().length() < 10||logindto.getMobileNo().length() > 10) {
                   
                     ma++;
                    if (ma % 2 != 0) {
                       addFieldError("logindto.mobileNo", "Mobile number must have 10 digits");
                        return "fail";
                         
                    } else {
                        addFieldError("logindto.mobileNo", "");
                       ma = 0;
                        return "fail";
                    }
                } else if (!(logindto.getMobileNo().matches("^((\\+[1-9]?[0-9])|0)?[7-9][0-9]{9}$"))) {
                   
                    mb++;
                    if (mb % 2 != 0) {
                       addFieldError("logindto.mobileNo", "invalid mobile number");
                        return "fail";
                         
                    } else {
                        addFieldError("logindto.mobileNo", "");
                       mb = 0;
                        return "fail";
                    }
                }
              else if (!logindto.getEmail().matches("^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$")) {
                   
                     r++;
                    if (r % 2 != 0) {
                        addFieldError("logindto.email", "Please enter valid Email address");
                         
                    } else {
                        addFieldError("logindto.email", "");
                       r = 0;
                    }
                }
              else if(!umanager.validateUser2(logindto)) 
        {
         System.out.println("enterrrrrrrrrrrrrrrrrrrr");
         addFieldError("logindto.fullName", "LoginId with this Mobile number is already Exists");
         return "fail";
        }
                
                
       
        else {
             System.out.println("inssssrrtttttr//////////");
           umanager.updateUser(logindto);
             
             xyz=1000;
              return "success";
        }
       }
        catch(Exception e) {
            e.printStackTrace();
        } 
         return "fail";
     }
     
     
    @Override
    public void setServletRequest(HttpServletRequest request) {
         this.request = request;
    }
    
    private List clist1,clist2,clist3,clist4,clist5,clist6,clist7,clist8,clist9,clist10,clist11,clist12,clist13,clist14,clist15;

    public List getClist1() {
        return clist1;
    }

    public void setClist1(List clist1) {
        this.clist1 = clist1;
    }

    public List getClist2() {
        return clist2;
    }

    public void setClist2(List clist2) {
        this.clist2 = clist2;
    }

    public List getClist3() {
        return clist3;
    }

    public void setClist3(List clist3) {
        this.clist3 = clist3;
    }

    public List getClist4() {
        return clist4;
    }

    public void setClist4(List clist4) {
        this.clist4 = clist4;
    }

    public List getClist5() {
        return clist5;
    }

    public void setClist5(List clist5) {
        this.clist5 = clist5;
    }

    public List getClist6() {
        return clist6;
    }

    public void setClist6(List clist6) {
        this.clist6 = clist6;
    }

    public List getClist7() {
        return clist7;
    }

    public void setClist7(List clist7) {
        this.clist7 = clist7;
    }

    public List getClist8() {
        return clist8;
    }

    public void setClist8(List clist8) {
        this.clist8 = clist8;
    }

    public List getClist9() {
        return clist9;
    }

    public void setClist9(List clist9) {
        this.clist9 = clist9;
    }

    public List getClist10() {
        return clist10;
    }

    public void setClist10(List clist10) {
        this.clist10 = clist10;
    }

    public List getClist11() {
        return clist11;
    }

    public void setClist11(List clist11) {
        this.clist11 = clist11;
    }

    public List getClist12() {
        return clist12;
    }

    public void setClist12(List clist12) {
        this.clist12 = clist12;
    }

    public List getClist13() {
        return clist13;
    }

    public void setClist13(List clist13) {
        this.clist13 = clist13;
    }

    public List getClist14() {
        return clist14;
    }

    public void setClist14(List clist14) {
        this.clist14 = clist14;
    }

    public List getClist15() {
        return clist15;
    }

    public void setClist15(List clist15) {
        this.clist15 = clist15;
    }
    
      public String viewInvoice() {
          try {
                 System.out.println(lid+"id"+cid);
            this.ulist = umanager.dataRetrieve(getLid());
        System.out.println("dkjghdh---------------dkgkjdh2222222222222dgkhg" + ulist);
//        this.plist=umanager.viewparentCommonInvoice(getCid());
//        this.clist=umanager.viewChildCommonInvoice(getCid());
        word=umanager.getWords();
        
        int size=clist.size();
              System.out.println("yyyyyyyyyyyyyyyyy"+size);
              
          
            clist2 = (clist.subList(0, 1));
            clist3 = (clist.subList(1, 2));
            clist4 = (clist.subList(2, 3));
            clist5 = (clist.subList(3, 4));
            clist6 = (clist.subList(4, 5));
            clist7 = (clist.subList(5, 6));
            clist8 = (clist.subList(6, 7));
            clist9 = (clist.subList(7, 8));
            clist10 = (clist.subList(8, 9));
            clist11 = (clist.subList(9, 10));
            clist12 = (clist.subList(10, 11));
            clist13 = (clist.subList(11, 12));
            clist14 = (clist.subList(13, 14));
            clist15 = (clist.subList(14, 15));
            
       }
        catch(IndexOutOfBoundsException e) {
            e.printStackTrace();
        } 
         return "success";
     }
      
      public String viewsupplyInvoice() {
          try {
                 System.out.println(lid+"id"+sid);
            this.ulist = umanager.dataRetrieve(getLid());
        System.out.println("dkjghdh---------------dkgkjdh2222222222222dgkhg" + ulist);
//        this.plist=umanager.viewparentSupplyInvoice(getSid());
//        this.clist=umanager.viewChildSupplyInvoice(getSid());
        word=umanager.getWords();
        
        int size=clist.size();
              System.out.println("yyyyyyyyyyyyyyyyy"+size);
            
            clist2 = (clist.subList(0, 1));
            clist3 = (clist.subList(1, 2));
            clist4 = (clist.subList(2, 3));
            clist5 = (clist.subList(3, 4));
            clist6 = (clist.subList(4, 5));
            clist7 = (clist.subList(5, 6));
            clist8 = (clist.subList(6, 7));
            clist9 = (clist.subList(7, 8));
            clist10 = (clist.subList(8, 9));
            clist11 = (clist.subList(9, 10));
            clist12 = (clist.subList(10, 11));
            clist13 = (clist.subList(11, 12));
            clist14 = (clist.subList(13, 14));
            clist15 = (clist.subList(14, 15));
            
       }
        catch(IndexOutOfBoundsException e) {
            e.printStackTrace();
        } 
          return "success";
      }
    
}
