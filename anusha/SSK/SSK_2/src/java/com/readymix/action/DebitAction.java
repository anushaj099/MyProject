/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.readymix.action;

import com.opensymphony.xwork2.ActionSupport;
import com.readymix.manager.DebitManager;
import com.readymix.manager.LoginManager;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Swathi
 */
public class DebitAction extends ActionSupport{
    private LoginManager umanager;
    private DebitManager dm;
    private List ulist;
    private static int lid;
    private List stateslist;
    private List codelist;

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

    public List getStateslist() {
        return stateslist;
    }

    public void setStateslist(List stateslist) {
        this.stateslist = stateslist;
    }

    public List getCodelist() {
        return codelist;
    }

    public void setCodelist(List codelist) {
        this.codelist = codelist;
    }

    public int getLid() {
        return lid;
    }

    public void setLid(int lid) {
        this.lid = lid;
    }

    public DebitAction() {
        umanager=new LoginManager();
        ulist=new ArrayList();
        dm=new DebitManager();
    }
    
    
    
    public String debitPage() {
        try {
              this.ulist = umanager.dataRetrieve(getLid());
        System.out.println("dkjghdh---------------dkgkjdh2222222222222dgkhg" + ulist);
        this.stateslist=dm.getStates();
        this.codelist=dm.getCodes();
            System.out.println("states"+stateslist);
               System.out.println("codes"+codelist);
         }
        catch(Exception e) {
            e.printStackTrace();
        }
        return "success";
    }
    
    
}
