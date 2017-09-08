/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.struts;

import com.opensymphony.xwork2.ActionSupport;
import com.textile.dto.Stockform;
import com.textile.dto.productname;
import com.textile.manager.AddPurchaseManager;
import com.textile.manager.YearManager;
import com.textile.manager.productmanager;
import com.textile.model.ProductsSample;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author nsg
 */
public class productaction  extends ActionSupport{
    productmanager pmm=new productmanager();
    private String productName;
    private static int idl;
    private productname form;
    private Stockform stock;
    private List ulist;
    private  List productlist=new ArrayList();
    private  List productlist1=new ArrayList();
    private int id1;
    private static int id;
    private int a,b;
    private static int ids;
    private static String variety;
    private AddPurchaseManager apm=new AddPurchaseManager();
     YearManager ym=new YearManager();
    private List year=null;

    public List getYear() {
        return year;
    }

    public void setYear(List year) {
        this.year = year;
    }

    public String getVariety() {
        return variety;
    }

    public void setVariety(String variety) {
        this.variety = variety;
    }

    public List getProductlist1() {
        return productlist1;
    }

    public void setProductlist1(List productlist1) {
        this.productlist1 = productlist1;
    }
    

    public int getIds() {
        return ids;
    }

    public void setIds(int ids) {
        this.ids = ids;
    }
    

    public Stockform getStock() {
        return stock;
    }

    public void setStock(Stockform stock) {
        this.stock = stock;
    }

    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId1() {
        return id1;
    }

    public void setId1(int id1) {
        this.id1 = id1;
    }

    public List getUlist() {
        return ulist;
    }

    public void setUlist(List ulist) {
        this.ulist = ulist;
    }

    public List getProductlist() {
        return productlist;
    }

    public void setProductlist(List productlist) {
        this.productlist = productlist;
    }

    public productmanager getPmm() {
        return pmm;
    }

    public void setPmm(productmanager pmm) {
        this.pmm = pmm;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getIdl() {
        return idl;
    }

    public void setIdl(int idl) {
        this.idl = idl;
    }

    public productname getForm() {
        return form;
    }

    public void setForm(productname form) {
        this.form = form;
    }
    
     public productaction(){
        
        ulist=new ArrayList();
    }
    
    public String insertproduct(){
         this.ulist=pmm.settingsList1(getId());
          this.year=apm.getYear();
         System.out.println("fgsdghsfdsga"+ulist);
         try
         {
         if(form.getProductName().length()==0){
                a++;
                if(a%2!=0){
                    addFieldError("form.productName","Please enter the product name");
                }
                else{
                    addFieldError("form.productName","");
                    a=0;
                }
                
            }
            else if(form.getPartialType().length()==0)
            {
                b++;
                if(b%2!=0){
                    addFieldError("form.partialType","Please select an option ");
                }
                else{
                    addFieldError("form.partialType","");
                    b=0;
                }
            }
            else if(pmm.productvalidate(form.getProductName())){
                addFieldError("form.productName","Product already exists");
          }
            else if(stock.getDate().length()==0){
                addFieldError("stock.date","Please select date");
          }
         else
            {
                if(stock.getDate()!=null){
                    
       if(apm.dateCheck(stock.getDate())){
           Date date=ym.getDateFrom();
           if(date!=null){
                       addFieldError("stock.date","Year is already closed. Please select date from "+date);
                        return "fail";
           }
       }
    }
           pmm.insert2(getForm(),getStock());
           this.productlist=pmm.retrieve1();
           System.out.println("dfgfadsg"+id);
        return "success";
            } 
         }
         catch(Exception e)
         {
             
         }
         return "fail";
    }
    
    public String retrieveproduct(){
         this.year=apm.getYear();
        this.ulist=pmm.settingsList1(getId());
        System.out.println("bbbbbbbbbbbbbbbbbbbbbb"+ulist);
         this.productlist=pmm.retrieve1();
         System.out.println("sssssssssssssssssssss"+id);
        return "success";
        
    }
    private String productType[];

    public String[] getProductType() {
        return productType;
    }

    public void setProductType(String[] productType) {
        this.productType = productType;
    }
 
    
    public String editproduct()
    {
        this.ulist=pmm.settingsList1(getId());
        System.out.println("bbbbbbbbbbbbbbbbbbbbbb"+ulist);
        productlist1=pmm.productEdit1(getIdl());
        productlist=pmm.productEdit(getIdl(),getVariety());
        for (Object sub :  productlist1) 
                {
                    ProductsSample ep = (ProductsSample) sub;
                    String x=ep.getPartialType();
                    String y=ep.getProductName();
                     if(x!=null){
                     productType= x.split(", ");
                     }
                }
         System.out.println("sssssssssssssssssssss"+id);
        return "success";
    }
    public String updateproduct()
    {
        this.ulist=pmm.settingsList1(getId());
        System.out.println("bbbbbbbbbbbbbbbbbbbbbb"+ulist);
        pmm.productUpdate(getForm(),getIdl(),getStock());
        productlist=pmm.retrieve1();
        return "success";
    }
    public String deleteproduct(){
        this.ulist=pmm.settingsList1(getId());
        System.out.println("hhhhhhhhhhhhhhhhhhh"+ulist);
        
        pmm.delete1(getIdl());
        productlist=pmm.retrieve1();
        System.out.println("iiiiiiiiiiiiii"+idl);
        return "success";
    }
    
    
    /*public void validate(){
        try{
            this.ulist=pmm.settingsList1(getId());
            if(form.getProductName().length()==0){
                a++;
                if(a%2!=0){
                    addFieldError("form.productName","Please enter the product name");
                }
                else{
                    addFieldError("form.productName","");
                    a=0;
                }
                
            }
            else if(form.getPartialType().length()==0)
            {
                b++;
                if(b%2!=0){
                    addFieldError("form.partialType","Please select an option ");
                }
                else{
                    addFieldError("form.partialType","");
                    b=0;
                }
            }
                
        }
        catch(Exception e){
            //System.out.println("Exception caught");
        }
    }*/
    
    
    
}
