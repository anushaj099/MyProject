/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.struts;

import com.opensymphony.xwork2.ActionSupport;
import com.textile.dto.Logindto;
import com.textile.manager.LoginManager;
import com.textile.model.Login;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import static java.util.concurrent.TimeUnit.MILLISECONDS;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

/**
 *
 * @author Swathi
 */
public class LoginAction extends ActionSupport implements ServletRequestAware {

    private HttpServletRequest request;
    private LoginManager umanager;
    private static Logindto login;
    private List ulist;
    private List list;
    //private List olist;
    private static int id;
    private static int a, b, c;
    private int xyz = 0;
    private static String username;
    private static String password;

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

    public int getXyz() {
        return xyz;
    }

    public void setXyz(int xyz) {
        this.xyz = xyz;
    }

    private List<String> superList = new ArrayList<>();
    private List<String> countlist = new ArrayList<>();
    private List<String> productlist = new ArrayList<>();

    public List<String> getCountlist() {
        return countlist;
    }

    public void setCountlist(List<String> countlist) {
        this.countlist = countlist;
    }

    public List<String> getSuperList() {
        return superList;
    }

    public void setSuperList(List<String> superList) {
        this.superList = superList;
    }

    public List<String> getProductlist() {
        return productlist;
    }

    public void setProductlist(List<String> productlist) {
        this.productlist = productlist;
    }

    public List getList() {
        return list;
    }

    public void setList(List list) {
        this.list = list;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public List getUlist() {
        return ulist;
    }

    public void setUlist(List ulist) {
        this.ulist = ulist;
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

    public LoginAction() {
        umanager = new LoginManager();
        ulist = new ArrayList();
    }
    private int abcd = 0;

    public int getAbcd() {
        return abcd;
    }

    public void setAbcd(int abcd) {
        this.abcd = abcd;
    }

    public String controlHome() {
        try {
            System.out.println("the id in home is.............................");
            this.ulist = umanager.cardingList(getId());

        } catch (NullPointerException n) {
            System.out.println("lkdjg==------------" + n);
        }
//        for(Object o:ulist) {
//            Login l=(Login)o;
//             System.out.println("type is---------"+l.getLoginType());
//             if(l.getLoginType().equals("control"))
//                   return "success";
//              if(l.getLoginType().equals("carding"))
//                   return "success";
//               if(l.getLoginType().equals("drawing"))
//                   return "success";
//                if(l.getLoginType().equals("openend"))
//                   return "success";
//                 if(l.getLoginType().equals("godown"))
//                   return "success";
//                  if(l.getLoginType().equals("quality"))
//                   return "success";
//                   if(l.getLoginType().equals("electricity"))
//                   return "success";
//                    if(l.getLoginType().equals("packing"))
//                   return "success";
//      
//    }
        return "success";
    }

    public String login() {

        String USER_HANDLE = "loggedInUser";
        String HANDLE = "loggedInPass";

        HttpSession session = request.getSession(true);

        // Is there a "user" object stored in the user's HttpSession?
        Object user = session.getAttribute(USER_HANDLE);
        Object pass = session.getAttribute(HANDLE);
        System.out.println("...........***************<<<<<<<<----------------" + user + ">>>>>>>>" + pass);

        System.out.println("kjhgf");

        this.ulist = umanager.loginmanager(user.toString(), pass.toString());
        System.out.println("dkjghdh---------------dkgkjdh2222222222222dgkhg" + ulist);
        try {
            for (Object o : ulist) {
                Login l = (Login) o;
                System.out.println("type is---........------" + l.getDesignation());
                if (l.getDesignation().equals("Data Entry")) {
                    System.out.println("type is---....11....------" + l.getDesignation());
                    return "dataentry";
                } else if (l.getLoginType().equals("control")) {
                    System.out.println("type is---........------" + l.getDesignation());
                    return "control";
                } else if (l.getLoginType().equals("drawing") || l.getDesignation().equals("Data Entry")) {
                    return "drawing";
                } else if (l.getLoginType().equals("carding")) {
                    return "carding";
                } else if (l.getLoginType().equals("godown")) {
                    return "godown";
                } else if (l.getLoginType().equals("openend")) {
                    return "openend";
                } else if (l.getLoginType().equals("quality")) {
                    return "quality";
                } else if (l.getLoginType().equals("packing")) {
                    return "packing";
                } else if (l.getLoginType().equals("electricity")) {
                    return "electricity";
                }
                
            }
        } catch (Exception e) {

        }
        return INPUT;
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
            return SUCCESS;
    }

    public String cardingHome() {
        try {
        this.ulist = umanager.cardingList(getId());
        for (Object o : ulist) {
            Login l = (Login) o;
            System.out.println("type is---------" + l.getLoginType());
            if (l.getLoginType().equals("carding")) {
                return "carding";
            } else if (l.getLoginType().equals("control")) {
                return "carding";
            }

        }
         }
         catch(Exception e) {
             e.printStackTrace();
         }
        return "fail";
    }

    public String cardingHome1() {
        try {
        this.ulist = umanager.cardingList(getId());
        for (Object o : ulist) {
            Login l = (Login) o;
            System.out.println("type is---------" + l.getLoginType());
            if (l.getLoginType().equals("carding")) {
                return "cardinghome";
            } else if (l.getLoginType().equals("control")) {
                return "cardinghome";
            }

        }
         }
         catch(Exception e) {
             e.printStackTrace();
         }
        return "cardinghome";
    }
//     public String cardingCancel() {
//       
//        this.ulist=umanager.cardingList(getId());
//        for(Object o:ulist) {
//            Login l=(Login)o;
//             System.out.println("type is---------"+l.getLoginType());
//            if(l.getLoginType().equals("carding"))
//                return "cardingcancel";
//            else if(l.getLoginType().equals("control"))
//                return "cardingcancel";
//            
//            
//        }
//       
//        return null;
//    }

    public String cardingprofile() {
        System.out.println("---------/////////----------++++++++++++++ffffffffff->");
        try {
        superList = umanager.getSuperviser();
        this.ulist = umanager.cardingList(getId());
        abcd = 1;
        purchaseid=1000;
        //  System.out.println(ulist.get(0));
        System.out.println("-------------------++++++++++++++ffffffffff->" + ulist);
         }
         catch(Exception e) {
             e.printStackTrace();
         }
        return "success";
    }

    public String openendHome() {
        try {
        this.ulist = umanager.openendList(getId());
        for (Object o : ulist) {
            Login l = (Login) o;
            System.out.println("type is---------" + l.getLoginType());
            if (l.getLoginType().equals("openend")) {
                return "openend";
            } else if (l.getLoginType().equals("control")) {
                return "openend";
            }
        }
         }
         catch(Exception e) {
             e.printStackTrace();
         }

        return "fail";
    }

    public String openendHome1() {
        try {
        this.ulist = umanager.openendList(getId());
        for (Object o : ulist) {
            Login l = (Login) o;
            System.out.println("type is---------" + l.getLoginType());
            if (l.getLoginType().equals("openend")) {
                return "openendhome";
            } else if (l.getLoginType().equals("control")) {
                return "openendhome";
            }
        }
         }
         catch(Exception e) {
             e.printStackTrace();
         }

        return null;
    }

    public String openendprofile() {
        try {
        superList = umanager.getSuperviser();
        countlist = umanager.getCount();
        this.ulist = umanager.openendList(getId());
        purchaseid=1000;
        abcd = 3;
        System.out.println("-------------------++++++++++++++ffffffffff->" + ulist + countlist);
         }
         catch(Exception e) {
             e.printStackTrace();
         }
        return "success";
    }

    public String drawingHome() {
        try {
        this.ulist = umanager.drawingList(getId());
        for (Object o : ulist) {
            Login l = (Login) o;
            System.out.println("type is---------" + l.getLoginType());
//            if(l.getLoginType().equals("carding"))
//                return "carding";
            if (l.getLoginType().equals("drawing")) {
                return "drawing";
            } else if (l.getLoginType().equals("control")) {
                return "drawing";
            }
        }
 }
         catch(Exception e) {
             e.printStackTrace();
         }
        return "fail";
    }

    public String drawingHome1() {
try {
        this.ulist = umanager.drawingList(getId());
        for (Object o : ulist) {
            Login l = (Login) o;
            System.out.println("type is---------" + l.getLoginType());
            if (l.getLoginType().equals("drawing")) {
                return "drawinghome";
            }
            if (l.getLoginType().equals("control")) {
                return "drawinghome";
            }
        }
 }
         catch(Exception e) {
             e.printStackTrace();
         }
        return null;
    }

    public String drawingprofile() {
        try {
        superList = umanager.getSuperviser();
        this.ulist = umanager.drawingList(getId());
        abcd = 2;
        //System.out.println(list.get(0));
        purchaseid=1000;
         }
         catch(Exception e) {
             e.printStackTrace();
         }
        return "success";

    }

    public String qualityHome() {
        try {
        this.ulist = umanager.qualityList(getId());
        for (Object o : ulist) {
            Login l = (Login) o;
            System.out.println("type is---------" + l.getLoginType());
//            if(l.getLoginType().equals("carding"))
//                return "carding";
            if (l.getLoginType().equals("quality")) {
                return "quality";
            } else if (l.getLoginType().equals("control")) {
                return "quality";
            }
        }
 }
         catch(Exception e) {
             e.printStackTrace();
         }
        return "fail";

    }

    public String qualityHome1() {
        abcd = 4;
        this.ulist = umanager.qualityList(getId());
        try {
        for (Object o : ulist) {
            Login l = (Login) o;
            System.out.println("type is---------" + l.getLoginType());
            if (l.getLoginType().equals("quality")) {
                return "qualityhome";
            }
            if (l.getLoginType().equals("control")) {
                return "qualityhome";
            }
        }
 }
         catch(Exception e) {
             e.printStackTrace();
         }
        return null;
    }

    public String qualityprofile() {
        try {
        superList = umanager.getSuperviser();
        this.ulist = umanager.qualityList(getId());
        abcd = 4;
        purchaseid=1000;
        //System.out.println(list.get(0));
 }
         catch(Exception e) {
             e.printStackTrace();
         }
        return "success";

    }
    
    
     public String dispatchprofile(){
         try {
        abcd = 22;
        xyz=100;
        purchaseid=1000;
       superList = umanager.getSuperviser();
       countlist = umanager.getCount();
        this.ulist = umanager.dispatchList(getId());
        
        //System.out.println(list.get(0));
         }
         catch(Exception e) {
             e.printStackTrace();
         }
        return "success";
    }
    

    public String updatepwd() {
        //  System.out.println("id is ----------))))))))))))"+login.getId());
        this.ulist = umanager.cardingList(getId());
        System.out.println("password");
        try {
            String dbpwd = null;
            String pass = login.getPassword();
            System.out.println("<<<<<<<<<<<<hehe" + pass);
            if (login.getPassword().length() == 0) {

                this.ulist = umanager.cardingList(getId());
                addFieldError("login.password", "Please Fill Current password First");
                return "fail";
            } else {
                this.ulist = umanager.cardingList(getId());
                if (login.getNewpwd().length() == 0) {
                    addFieldError("login.newpwd", "New Password cannot be Empty");
                    return "fail";
                }
                if (login.getConfirmpwd().length() == 0) {
                    addFieldError("login.confirmpwd", "Confirm Password cannot be Empty");
                    return "fail";
                }

                this.ulist = umanager.cardingList(getId());
                System.out.println("List is" + ulist);
                for (Object o : ulist) {
                    Login l = (Login) o;
                    dbpwd = l.getPassword();
                    System.out.println("type is---------" + l.getPassword());
                }

                if (!dbpwd.equals(login.getPassword())) {
                    this.ulist = umanager.cardingList(getId());
                    addFieldError("login.password", "Incorrect Current Password");
                    return "fail";
                }
                if (!login.getNewpwd().equals(login.getConfirmpwd())) {
                    this.ulist = umanager.cardingList(getId());
                    addFieldError("login.newpwd", "New Password and Confirm Password doesn't match");
                    return "fail";
                }

                umanager.changepassword(getLogin(), getId());
                xyz = 1000;
                return "success";

            }

        } catch (Exception e) {

        }
        return "fail";
    }

    public String purchaseHome() {
try {
        this.ulist = umanager.purchaseList(getId());
        for (Object o : ulist) {
            Login l = (Login) o;
            System.out.println("type is---------" + l.getLoginType());
            if (l.getLoginType().equals("godown")) {
                return "purchase";
            }
            if (l.getLoginType().equals("control")) {
                return "purchase";
            }
        }
 }
         catch(Exception e) {
             e.printStackTrace();
         }
        return "fail";
    }

    public String purchaseHome1() {
        try {
        this.ulist = umanager.cardingList(getId());
        for (Object o : ulist) {
            Login l = (Login) o;
            System.out.println("type is---------" + l.getLoginType());
            if (l.getLoginType().equals("godown")) {
                return "godownhome";
            }
            if (l.getLoginType().equals("control")) {
                return "control";
            }

        }
 }
         catch(Exception e) {
             e.printStackTrace();
         }
        return "fail";
    }
private int purchaseid=0;

    public int getPurchaseid() {
        return purchaseid;
    }

    public void setPurchaseid(int purchaseid) {
        this.purchaseid = purchaseid;
    }
    public String purchaseprofile() {
        try {
        this.ulist = umanager.purchaseList(getId());
        this.productlist = umanager.getPurchaseProductList();
        purchaseid=1000;
        System.out.println(ulist);
        abcd = 11;
         }
         catch(Exception e) {
             e.printStackTrace();
         }
        return "success";
    }

    public String saleHome() {
try {
        this.ulist = umanager.saleList(getId());
        for (Object o : ulist) {
            Login l = (Login) o;
            System.out.println("type is---------" + l.getLoginType());
//          
            if (l.getLoginType().equals("godown")) {
                return "sale";
            }
            if (l.getLoginType().equals("control")) {
                return "sale";
            }

        }
 }
         catch(Exception e) {
             e.printStackTrace();
         }
        return "fail";
    }

    public String saleHome1() {
try {
        this.ulist = umanager.saleList(getId());
        for (Object o : ulist) {
            Login l = (Login) o;
            System.out.println("type is---------" + l.getLoginType());
            if (l.getLoginType().equals("godown")) {
                return "salehome";
            }
            if (l.getLoginType().equals("control")) {
                return "salehome";
            }

        }
 }
         catch(Exception e) {
             e.printStackTrace();
         }
        return "fail";
    }

    public String saleprofile() {
        try {
        this.ulist = umanager.saleList(getId());
        this.productlist = umanager.getSaleProductList();
        purchaseid=1000;
        abcd = 13;
         }
         catch(Exception e) {
             e.printStackTrace();
         }
        // System.out.println(ulist.get(0));
        return "success";
    }

    public String productionHome() {
try {
        this.ulist = umanager.productionList(getId());
        for (Object o : ulist) {
            Login l = (Login) o;
            System.out.println("type is---------" + l.getLoginType());
            if (l.getLoginType().equals("godown")) {
                return "production";
            }
            if (l.getLoginType().equals("control")) {
                return "production";
            }
        }
 }
         catch(Exception e) {
             e.printStackTrace();
         }
        return "fail";
    }

    public String productionHome1() {
try {
        this.ulist = umanager.productionList(getId());
        for (Object o : ulist) {
            Login l = (Login) o;
            System.out.println("type is---------" + l.getLoginType());
            if (l.getLoginType().equals("godown")) {
                return "productionhome";
            }
            if (l.getLoginType().equals("control")) {
                return "productionhome";
            }
        }
 }
         catch(Exception e) {
             e.printStackTrace();
         }
        return "fail";
    }

    public String productionprofile() {
        try {
        superList = umanager.getSuperviser();
        this.ulist = umanager.productionList(getId());
        purchaseid=1000;
        abcd = 12;
        //System.out.println(ulist.get(0));
        System.out.println("-------------------++++++++++++++ffffffffff->" + ulist);
         }
         catch(Exception e) {
             e.printStackTrace();
         }
        return "success";
    }

    public String settingsHome1() {
try {
        this.ulist = umanager.settingsList(getId());
        for (Object o : ulist) {
            Login l = (Login) o;
            System.out.println("type is---------" + l.getLoginType());
            if (l.getDesignation().equals("Data Entry")) {
                System.out.println("type is---....11....------" + l.getDesignation());
                return "settingshome";
            }
            if (l.getLoginType().equals("control")) {
                return "settingshome";
            }

        }
 }
         catch(Exception e) {
             e.printStackTrace();
         }
        return "fail";
    }

    public String wastageHome() {
        try {
        this.ulist = umanager.wastageList(getId());
        for (Object o : ulist) {
            Login l = (Login) o;
            System.out.println("type is---------" + l.getLoginType());
            if (l.getLoginType().equals("godown")) {
                return "wastage";
            }
            if (l.getLoginType().equals("control")) {
                return "wastage";
            }
        }
 }
         catch(Exception e) {
             e.printStackTrace();
         }
        return "fail";
    }

    public String wastageHome1() {
try {
        this.ulist = umanager.wastageList(getId());
        for (Object o : ulist) {
            Login l = (Login) o;
            System.out.println("type is---------" + l.getLoginType());
            if (l.getLoginType().equals("godown")) {
                return "wastagehome";
            }
            if (l.getLoginType().equals("control")) {
                return "wastagehome";
            }
        }
 }
         catch(Exception e) {
             e.printStackTrace();
         }
        return "fail";
    }

    public String wastageprofile() {
        try {
        this.ulist = umanager.wastageList(getId());
        abcd = 14;
        purchaseid=1000;
         }
         catch(Exception e) {
             e.printStackTrace();
         }
        // System.out.println(ulist.get(0));
        return "success";
    }

    public String precleaningHome() {
try {
        abcd = 18;
        for (Object o : ulist) {
            Login l = (Login) o;
            System.out.println("type is---------" + l.getLoginType());
            if (l.getLoginType().equals("godown")) {
                return "precleaning";
            }
            if (l.getLoginType().equals("control")) {
                return "precleaning";
            }
        }
 }
         catch(Exception e) {
             e.printStackTrace();
         }
        return "success";
    }

    public String precleaningHome1() {
try {
        this.ulist = umanager.productionList(getId());
        for (Object o : ulist) {
            Login l = (Login) o;
            System.out.println("type is---------" + l.getLoginType());
            if (l.getLoginType().equals("godown")) {
                return "precleaninghome";
            }
            if (l.getLoginType().equals("control")) {
                return "precleaninghome";
            }
        }
 }
         catch(Exception e) {
             e.printStackTrace();
         }
        return "fail";
    }

    public String precleaningprofile() {
        try {
        superList = umanager.getSuperviser();
        this.ulist = umanager.productionList(getId());
        purchaseid=1000;
        abcd = 18;
        //System.out.println(ulist.get(0));
        System.out.println("-------------------++++++++++++++ffffffffff->" + ulist);
         }
         catch(Exception e) {
             e.printStackTrace();
         }
        return "success";
    }

    @Override
    public void setServletRequest(HttpServletRequest request) {
        this.request = request;
    }

}
