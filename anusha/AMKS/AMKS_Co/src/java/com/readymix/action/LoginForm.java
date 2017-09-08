/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.readymix.action;

import com.opensymphony.xwork2.ActionSupport;
import com.readymix.dto.LoginDto;
import com.readymix.manager.LoginManager;
import java.util.ArrayList;
import java.util.List;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author Swathi
 */
public class LoginForm extends ActionSupport{
    private  LoginDto logindto;
   
    LoginManager umanager;
     private List ulist;
     private static int a,b,c;

    public LoginManager getUmanager() {
        return umanager;
    }

    public void setUmanager(LoginManager umanager) {
        this.umanager = umanager;
    }

    public LoginForm() {
        umanager=new LoginManager();
        ulist=new ArrayList();
    }


    public List getUlist() {
        return ulist;
    }

    public void setUlist(List ulist) {
        this.ulist = ulist;
    }

    public LoginDto getLogindto() {
        return logindto;
    }

    public void setLogindto(LoginDto logindto) {
        this.logindto = logindto;
    }
    
    public String login() {
         String loggedUserName = null;
     //    System.out.println("kj---------00000.........000000----------***********---------hgf"+logindto.getLoginid()+logindto.getPassword()+"?????????");
System.out.println("****************");
        try {
            System.out.println("++++++++++++++++");
              if(getLogindto()!=null){
                     System.out.println("entered=================");
            if (logindto.getLoginid().length() == 0) {
               
                 
                     a++;
                    if (a % 2 != 0) {
                        System.out.println("****************");
                         addFieldError("logindto.loginid", "Login ID can't be blank");
                         return "fail";
                         
                    } else {
                        addFieldError("logindto.loginid", "");
                       a = 0;
                        return "fail";
                    }
            }
            
            if (logindto.getPassword().length() == 0) {
                
                 b++;
                    if (b % 2 != 0) {
                         addFieldError("logindto.password", "Password can't be blank");
                          return "fail";
                         
                    } else {
                        addFieldError("logindto.password", "");
                       b = 0;
                        return "fail";
                    }
            } 
               
            else if(umanager.validateUser(logindto)) {
                System.out.println("$$$$$$$$$$$$$$$$");
               
                 c++;
                    if (c % 2 != 0) {
                         addFieldError("logindto.loginid", "Invalid User Name or Password");
                          return "fail";
                         
                    } else {
                        addFieldError("logindto.loginid", "");
                       c = 0;
                        return "fail";
                    }
            }
       }
            
            
            
            System.out.println("sdfsfsfg"+logindto.getLoginid());
            
              ServletActionContext.getRequest().getSession().setAttribute("loggedInUser", logindto.getLoginid());
              ServletActionContext.getRequest().getSession().setAttribute("loggedInPass", logindto.getPassword());
            

        }
        catch(Exception e) {
            
        }
        return "forward";
    }
}
