/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.readymix.action;

import com.opensymphony.xwork2.ActionSupport;
import com.readymix.manager.LoginManager;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Swathi
 */
public class CommonInvoiceAction extends ActionSupport{
    
    private LoginManager umanager;
    private List ulist;
    private int lid;

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

    
    public CommonInvoiceAction() {
        umanager=new LoginManager();
        ulist=new ArrayList();
    }
    
    
    public String commonPage() {
        try {
         this.ulist=umanager.dataRetrieve(getLid());
            System.out.println("login list isssss"+ulist);
            }
        catch(Exception e) {
            
        }
        return "success";
    }
    
}
