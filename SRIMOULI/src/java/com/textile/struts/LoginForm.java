/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.struts;

import static com.opensymphony.xwork2.Action.INPUT;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import com.textile.dto.Logindto;
import com.textile.manager.LoginManager;
import java.util.ArrayList;
import java.util.List;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author Masrat
 */
public class LoginForm extends ActionSupport{
    
     private String username;
    private String password;
    private LoginManager umanager;
    private static Logindto login;
    private List ulist;
     private static int a,b,c;

      public LoginForm()  {
        umanager=new LoginManager();
        ulist=new ArrayList();
    }
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public LoginManager getUmanager() {
        return umanager;
    }

    public void setUmanager(LoginManager umanager) {
        this.umanager = umanager;
    }

    public Logindto getLogin() {
        return login;
    }

    public void setLogin(Logindto login) {
        this.login = login;
    }

    public List getUlist() {
        return ulist;
    }

    public void setUlist(List ulist) {
        this.ulist = ulist;
    }
    
    
    public String login() {
        String loggedUserName = null;
         System.out.println("kj---------00000.........000000----------***********---------hgf"+username+password+"?????????"+login.getUsername()+login.getPassword());
         try{
             
          
                if(getLogin()!=null){
            if (login.getUsername().length() == 0) {
               
                 
                     a++;
                    if (a % 2 != 0) {
                         addFieldError("login.username", "User Name can't be blank");
                         return "fail";
                         
                    } else {
                        addFieldError("login.username", "");
                       a = 0;
                        return "fail";
                    }
            }
            
            if (login.getPassword().length() == 0) {
                
                 b++;
                    if (b % 2 != 0) {
                         addFieldError("login.password", "Password can't be blank");
                          return "fail";
                         
                    } else {
                        addFieldError("login.password", "");
                       b = 0;
                        return "fail";
                    }
            } 
            else if (umanager.validateUser(getLogin())) {
               
                 c++;
                    if (c % 2 != 0) {
                         addFieldError("login.username", "Invalid User Name or Password");
                          return "fail";
                         
                    } else {
                        addFieldError("login.username", "");
                       c = 0;
                        return "fail";
                    }
            }
        }
        System.out.println("kjhgf");
        username=login.getUsername();
        password=login.getPassword();
       
        System.out.println("kj---------00000000000----------***********---------hgf"+username+password);
         }catch(NullPointerException n){
             
         }
       // System.out.println("kj-------------------***********---------hgf"+username+password+"........"+userName);
        
           // check if the userName is already stored in the session 
//           if(userName!=null)
//		if (sessionMap.containsKey("userName")) {
//                     System.out.println("kj-------------------*******......****---------hgf"+username+password+userName);
//			loggedUserName = (String) sessionMap.get("userName");
//                        this.ulist=umanager.loginmanager(username,password);
//                }
//		if (loggedUserName != null && loggedUserName.equals(username)) {
//			return SUCCESS;	// return welcome page
//		}
//		 System.out.println("the user anf dpa lsjf343544---000000000---------..--"+userName);
//		// if no userName stored in the session, 
//		// check the entered userName and password
//		if (username != null && username.equals(username) 
//				&& password != null && password.equals(password)) {
//                      System.out.println("kj-----11111111--------------*******......****---------hgf"+username+password+userName);
//			                 System.out.println("the user anf dpa lsjf343544------------..--"+userName);
//			// add userName to the session
//			sessionMap.put("userName", username);
//			this.ulist=umanager.loginmanager(username,password);
//			//return SUCCESS;	// return welcome page
//		}
//		
		// in other cases, return login page
		//return INPUT;
                
        
        
        
//        this.ulist=umanager.loginmanager(login.getUsername(),login.getPassword());
//        System.out.println("dkjghdh---------------dkgkjdh2222222222222dgkhg"+ulist);
        try {
            
              ServletActionContext.getRequest().getSession().setAttribute("loggedInUser", username);
              ServletActionContext.getRequest().getSession().setAttribute("loggedInPass", password);
            
//       for(Object o:ulist) {
//            com.textile.model.Login l=(com.textile.model.Login)o;
//             System.out.println("type is---........------"+l.getDesignation());
//             if(l.getDesignation().equals("Data Entry")){
//                  System.out.println("type is---....11....------"+l.getDesignation());
//                return "dataentry";
//             }
//             else if(l.getLoginType().equals("control")){
//                 System.out.println("type is---........------"+l.getDesignation());
//                 return "control";
//             }
//             else if(l.getLoginType().equals("drawing")||l.getDesignation().equals("Data Entry"))
//                return "drawing";
//            else if(l.getLoginType().equals("carding"))
//                return "carding";
//            else if(l.getLoginType().equals("godown"))
//                return "godown";
//            else if(l.getLoginType().equals("openend"))
//                return "openend";
//            else if(l.getLoginType().equals("quality"))
//                return "quality";
//            else if(l.getLoginType().equals("packing"))
//                return "packing";
//            else if(l.getLoginType().equals("electricity"))
//                return "electricity";
//             
//        }
        }
        catch(Exception e) {
            
        }
        return "forward";
    }
    
    
}
