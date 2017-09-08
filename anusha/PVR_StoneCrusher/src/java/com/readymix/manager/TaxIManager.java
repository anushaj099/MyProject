/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.readymix.manager;

import com.readymix.dto.TaxInvoiceDto;
import com.readymix.model.ChTaxIntra;
import com.readymix.model.Grades;
import com.readymix.model.Login;
import com.readymix.model.PrTaxIntra;
import com.readymix.model.Uom;
import com.readymix.util.HibernateUtil;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Distinct;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Masrat
 */
public class TaxIManager {

    public List getGrades() {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<Grades> list = new ArrayList<>();
      
        try {
           String hql="select distinct g.grade from Grades g where g.grade not like 'P%'";
            Query c=s.createQuery(hql);
            
            list = c.list();
            System.out.println("llllllloooooooo"+list);
        } catch (Exception e) {
            System.out.println("the error in retrieving grades in taximanager is------>"+e);

        }finally{
            t.commit();
            s.close();
        }
        System.out.println("Grades list is:------->>>>" + list);
        return list;
    }
    
    public List getGrades2() {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<String> list = new ArrayList<>();
         List<String> list1 = new ArrayList<>();
      
        try {
           String hql="select distinct g.grade from Grades g where g.grade like 'P%'";
            Query c=s.createQuery(hql);
            
            list = c.list();
            System.out.println("llllllloooooooo"+list);
          
//            for(String str:list){
//                for( String st:str.split("PCIL-")){
//                    System.out.println("sttttttt::"+st);
//                     list1.add(st);
//                     list1.remove("");
//                   
//                }
//               
//            }
//              System.out.println("list1111111::"+list1);
            
        } catch (Exception e) {
            System.out.println("the error in retrieving grades in taximanager is------>"+e);

        }finally{
            t.commit();
            s.close();
        }
        System.out.println("Grades list is:------->>>>" + list);
        return list;
    }
    
     public List getGrades3() {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<String> list = new ArrayList<>();
         List<String> list1 = new ArrayList<>();
      
        try {
           String hql="select distinct g.grade from Grades g where g.grade like 'P%'";
            Query c=s.createQuery(hql);
            
            list = c.list();
            System.out.println("llllllloooooooo"+list);
          
            for(String str:list){
                for( String st:str.split("PCIL-")){
                    System.out.println("sttttttt::"+st);
                     list1.add(st);
                     list1.remove("");
                   
                }
               
            }
              System.out.println("list1111111::"+list1);
            
        } catch (Exception e) {
            System.out.println("the error in retrieving grades in taximanager is------>"+e);

        }finally{
            t.commit();
            s.close();
        }
        System.out.println("Grades list is:------->>>>" + list1);
        return list1;
    }

    public void insertTaxInvoice(TaxInvoiceDto tdto) {
        System.out.println("the invoice innnsertionnnnn");
       Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        System.out.println("****************"+tdto.getBillToName()+"**********"+tdto.getBillToAddress());
        PrTaxIntra pc = new PrTaxIntra();
        try {
         //   int iw=Math.round(tdto.getTotalInv());
          if (!validateUser(tdto)) {
              
              
          }
          else 
          {
            String doj = tdto.getInvoiceDate();
            String dojs=tdto.getDateOfSupply();
            System.out.println(tdto.getInvoiceDate()+"mmmmmmmmmmmmm" + tdto.getDateOfSupply());
            SimpleDateFormat sf = new SimpleDateFormat("dd/MM/yy");
            Date doj1 = sf.parse(doj);
            Date doj2=sf.parse(dojs);
            System.out.println("-------------date--------" + doj1);
            pc.setInvoiceNo(tdto.getInvoiceNo());
            pc.setTransportMode(tdto.getTransportMode());
            pc.setInvoiceDate(doj1);
            pc.setVehNo(tdto.getVehNo());
            pc.setReverseCharge(tdto.getReverseCharge());
            pc.setDateOfSupply(doj2);
            pc.setState(tdto.getState());
            pc.setCode(tdto.getCode());
            pc.setPlaceOfSupply(tdto.getPlaceOfSupply());
            pc.setBillToName(tdto.getBillToName());
            pc.setBillToAddress(tdto.getBillToAddress());
            pc.setBillToGstin(tdto.getBillToGstin());
            pc.setBillTostate(tdto.getBillTostate());
            pc.setBillToCode(tdto.getBillToCode());
            pc.setShipToName(tdto.getShipToName());
            pc.setShipAddress(tdto.getShipAddress());
            pc.setShipToGstin(tdto.getShipToGstin());
            pc.setShipToState(tdto.getShipToState());
            pc.setShipToCode(tdto.getShipToCode());
            pc.setPrTotal(tdto.getPrTotal());
            pc.setGstReverseCharge(tdto.getGstReverseCharge());
            pc.setTotalInv(tdto.getTotalInv());
            pc.setTotalQty(tdto.getTotalQty());
            pc.setTotalValAtax(tdto.getTotalValAtax());
            pc.setTotalValBtax(tdto.getTotalValBtax());
            pc.setTotalTaxval(tdto.getTotalTaxval());
            pc.setTotalCgstAmt(tdto.getTotalCgstAmt());
            pc.setTotalSgstAmt(tdto.getTotalSgstAmt());
            pc.setGstReverseCharge(tdto.getGstReverseCharge());
            pc.setBankAc(tdto.getBankAc());
            pc.setBankIfsc(tdto.getBankIfsc());
            pc.setTermsCond(tdto.getTermsCond());
            pc.setBankName(tdto.getBankName());
            pc.setBankBranch(tdto.getBankBranch());
         //   pc.setInvTot(iw);
            s.save(pc);
            t.commit();

            Criteria c = s.createCriteria(PrTaxIntra.class);
            pc = (PrTaxIntra) c.add(Restrictions.eq("invoiceDate", doj1)).add(Restrictions.eq("invoiceNo", tdto.getInvoiceNo())).uniqueResult();
            s.close();

            Session s1 = HibernateUtil.getSessionFactory().openSession();
            // System.out.println("-------pc---------->"+pc);
            List<String> l1 = tdto.getProductDesc();
            System.out.println("----------------+-------->" + l1.size());
           
            List<String> l2 =tdto.getHsnCode();
            System.out.println("-------------------09------------->" + l2);
            List<Float> l3 = tdto.getQty();
            System.out.println("-------------------09-46------------>" + l3);
            List<Float> l4 = tdto.getBeforeTax();
            List<Float> l5 = tdto.getAfterTax();
            List<Float> l6 = tdto.getTaxableValue();
            List<Float> l7 =tdto.getCgRate();
            List<Float> l8 =tdto.getCgAmt();
            List<Float> l9 = tdto.getSgRate();
            List<Float> l = tdto.getSgAmt();
            List<Float> lf=tdto.getChTotal();
             List<String> um =tdto.getUom();

            Transaction t1 = s1.beginTransaction();
            for (int i = 0; i < l1.size(); i++) {
                ChTaxIntra cc = new ChTaxIntra();
                cc.setPrTaxIntra(pc);
                System.out.println("--------------------child--------------" + l1.get(i) + "&&&&&" + l5.get(i) + "(((((((((");
                System.out.println("------------------" + l2.get(i) + ")))))))))))" + l3.get(i) + "**" + l4.get(i));
               
                
                List list1=new ArrayList();
            String string="";
             for(String str:l1){
                for( String st:str.split("PCIL-")){
                    System.out.println("sttttttt::"+st);
                    string=st;
                   string.replace("PCIL-","");
                    System.out.println("stringgggggggggggg///>>>>>"+string);
                   
                }
               
            }
             
             
                cc.setProductDesc(l1.get(i));
                cc.setProductDesc2(string);
                if(l2.get(i)!=null)
                cc.setHsnCode(l2.get(i));
                if(l3.get(i)!=null)
                cc.setQty(l3.get(i));
                if(l4.get(i)!=null)
                cc.setBeforeTax(l4.get(i));
                if(l5.get(i)!=null)
                cc.setAfterTax(l5.get(i));
                if(l6.get(i)!=null)
                cc.setTaxableValue(l6.get(i));
                if(l7.get(i)!=null)
                cc.setCgRate(l7.get(i));
                if(l8.get(i)!=null)
                cc.setCgAmt(l8.get(i));
                if(l9.get(i)!=null)
                cc.setSgRate(l9.get(i));
                if(l.get(i)!=null)
                cc.setSgAmt(l.get(i));
                if(lf.get(i)!=null)
                cc.setChTotal(lf.get(i));
                 if(um.get(i)!=null)
                cc.setUom(um.get(i));
                System.out.println("--------------------4444444444--------------" + l.get(i));
                s1.save(cc);
                s1.flush();
                s1.clear();
                System.out.println("---------->" + l2.get(i));

            }
            
             Criteria c3 = s1.createCriteria(Login.class);
             c3.add(Restrictions.eq("LType","control"));
             List ctlist=c3.list();
             String mobile=null;
             for(Object o:ctlist)
             {
                 Login list=(Login) o;
                 mobile=list.getMobileNo();
             }
             System.out.println("&&&&&&&&&&&&&&");
           
//             String invdate = tdto.getInvoiceDate();
//             SimpleDateFormat sf1 = new SimpleDateFormat("dd/MM/yy");
//            Date  invdate1= sf1.parse(invdate);
//            System.out.println("dateeeeeeeee############@@@@"+invdate1);
//          String bname=tdto.getBillToName();
//          System.out.println("nameeeeeeee>>>"+bname);
//          Float totalInv=tdto.getTotalInv();
//          int ff=Math.round(totalInv);
//          System.out.println("invvvvvvvvv:::"+ff);
//          String dest=tdto.getShipAddress();
//          System.out.println("addrrrrrrr"+dest);
//        //  String number=ld.getMobileNo();
//          
//          String user = "Nivriti";
//        int randomPIN = (int)(Math.random()*900000)+100000;
//            // Replace with your API KEY (We have sent API KEY on activation email, also available on panel)
//            String apikey = "sDBGKLZExIm73SEAu8RH";
//
//            // Replace with the destination mobile Number to which you want to send sms
//          //  String mobile = "8099616198";
//
//            // Replace if you have your own Sender ID, else donot change
//            String senderid = "SVKRMI";
//
//            // Replace with your Message content
//            String message ="Dear%20Admin%2C%20Bill%20has%20been%20generated%20on%20"+invdate+"%20";
//            System.out.println("msgggggggggg//////"+message);
//            String m=null;
//             String s10=null;String message1="";
//             List<String> grade=tdto.getProductDesc();
//         System.out.println("lllllliiiiiiii"+grade);
//       for(int i1=0;i1<grade.size();i1++){
//            s10=grade.get(i1);
//             System.out.println("llllllllllll"+s10);
//              message1 +=s10;
//             System.out.println("msgggggg"+message1);
//              m="With%20Grade:%20"+message1+"%20and%20Quantity:";
//       }
//            String f5="%20Party%20Name:%20"+bname+"%20with%20an%20amount%20of%20Rs."+ff+"%20to%20"+dest;
//            String message3=message.concat(m);
//                System.out.println("msggg33333333"+message3);
//                 int ss=0;String message4="";
//              Float qty=tdto.getTotalQty();
//                System.out.println("qqqqq"+qty+"Cum");
//                int qty1=Math.round(tdto.getTotalQty());
//                System.out.println("quantity isss"+qty1);
//                String qty_str=Integer.toString(qty1);
//
//                String m5=message3.concat("%20"+qty_str+"CuM");
//                System.out.println("MMMMMMMMM55555555555%%%%"+m5);
//
//           String final_str=m5.concat(f5);
//                
//            // For Plain Text, use "txt" ; for Unicode symbols or regional Languages like hindi/tamil/kannada use "uni"
//            String type = "txt";
//            URLConnection myURLConnection = null;
//            URL myURL = null;
//            BufferedReader reader = null;
//
//            String mainUrl ="http://smshorizon.co.in/api/sendsms.php?";//"http://smshorizon.co.in/compose-sms.php";// ;
//            //Prepare parameter string
//            StringBuilder sbPostData = new StringBuilder(mainUrl);
//            sbPostData.append("user=" + user);
//            sbPostData.append("&apikey=" +apikey );
//            //sbPostData.append("&message=" +"OTP%20is"+String.valueOf(randomPIN) );
//        //    sbPostData.append("&message="+ message3);
//            sbPostData.append("&message="+ final_str);
//          //  sbPostData.append("&message11111111111="+ m5);
//              
//            System.out.println("\n ddddddddd"+randomPIN);
//            sbPostData.append("&mobile=" + mobile);
//            sbPostData.append("&senderid=" + senderid);
//            sbPostData.append("&type=" + type);
//
//            //final string
//            mainUrl = sbPostData.toString();
//            System.out.println("URL to Send SMS-" + mainUrl);
//            try {
//                //prepare connection
//                myURL = new URL(mainUrl);
//                myURLConnection = myURL.openConnection();
//                myURLConnection.connect();
//                
//                System.out.println("\n mmmmmmmmmmmmmmm"+myURLConnection);
//                
//                reader = new BufferedReader(new InputStreamReader(myURLConnection.getInputStream()));
//                System.out.println("\n hhhhhhhhhhhhhhh"+reader);
//                //reading response
//                String response = null;
//                System.out.println("\n bbbbbbbbbbbbb"+response);
//                while ((response = reader.readLine()) != null) {
//                    //print response
//                    System.out.println("\n sssssssssss"+response+reader.readLine());
//                    
//                }
//                System.out.println(response);
//                //finally close connection
//               reader.close();
//
//
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//            
            
            t1.commit();
            s1.close();
          }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("the exception in insertion off tax in tax manager is----->"+e);
        }

    }
    
    
     public boolean validateUser(TaxInvoiceDto l) {
        System.out.println("---------home----??????????------------");

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();

        System.out.println("-------------------ssssssssssss");
        int invoiceNo = l.getInvoiceNo();
     //   String password = l.getPassword();
        String sql = "select * from pr_tax_intra  where  invoice_no=:invoiceNo";
        Query query = session.createSQLQuery(sql);
        query.setParameter("invoiceNo", invoiceNo);
  //      query.setParameter("password", password);
        List list = query.list();
        
         System.out.println("swathiiiiiiiiiiii------------->>>>>>>>>>>>>"+list);

        if (list.size() > 0) {
            //session.close();
            return false;
        }
        t.commit();
        session.close();

        //session.getTransaction().rollback();
        return true;

    }
     
   public void deleteTax(TaxInvoiceDto tdto) {
         Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        try {

            PrTaxIntra pq = new PrTaxIntra();
            Criteria cr = s.createCriteria(PrTaxIntra.class);
            pq = (PrTaxIntra) cr.add(Restrictions.eq("ptId", tdto.getPtId())).uniqueResult();
            s.delete(pq);
            t.commit();
            System.out.println("/n deleted successfully");

        } 
        catch (Exception e) {
            System.out.println("Exception during delete is caught" + e);
        }
       
   }
    
    public TaxInvoiceDto updateTax(TaxInvoiceDto tdto) throws ParseException {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();

        try {
            PrTaxIntra pc = (PrTaxIntra) s.get(PrTaxIntra.class, tdto.getInvoiceNo());

            String doj = tdto.getInvoiceDate();
            String dojs=tdto.getDateOfSupply();
            System.out.println("\n mmmmmmmmmmmmm" + doj+"_____________________============"+tdto.getTransportMode());
            SimpleDateFormat sf = new SimpleDateFormat("dd/MM/yy");
            Date doj1 = sf.parse(doj);
            Date doj2=sf.parse(dojs);
            System.out.println("-------------date--------" + doj1);
            System.out.println("invoice number izzzzzzzzzzzzzzzzzzzzzzzzzzz"+tdto.getInvoiceNo());
             System.out.println(tdto.getTransportMode()+doj1+"invoice number izzzzzzzzzzzzzzzzzzzzzzzzzzz"+tdto.getInvoiceNo());
            
            
            
            pc.setInvoiceNo(tdto.getInvoiceNo());
            pc.setTransportMode(tdto.getTransportMode());
            pc.setInvoiceDate(doj1);
            pc.setVehNo(tdto.getVehNo());
            pc.setReverseCharge(tdto.getReverseCharge());
            pc.setDateOfSupply(doj2);
            pc.setState(tdto.getState());
            pc.setCode(tdto.getCode());
            pc.setPlaceOfSupply(tdto.getPlaceOfSupply());
            pc.setBillToName(tdto.getBillToName());
            pc.setBillToAddress(tdto.getBillToAddress());
            pc.setBillToGstin(tdto.getBillToGstin());
            pc.setBillTostate(tdto.getBillTostate());
            pc.setBillToCode(tdto.getBillToCode());
            pc.setShipToName(tdto.getShipToName());
            pc.setShipAddress(tdto.getShipAddress());
            pc.setShipToGstin(tdto.getShipToGstin());
            pc.setShipToState(tdto.getShipToState());
            pc.setShipToCode(tdto.getShipToCode());
            pc.setPrTotal(tdto.getPrTotal());
            pc.setGstReverseCharge(tdto.getGstReverseCharge());
            pc.setTotalInv(tdto.getTotalInv());
            pc.setTotalQty(tdto.getTotalQty());
            pc.setTotalValAtax(tdto.getTotalValAtax());
            pc.setTotalValBtax(tdto.getTotalValBtax());
            pc.setTotalTaxval(tdto.getTotalTaxval());
            pc.setTotalCgstAmt(tdto.getTotalCgstAmt());
            pc.setTotalSgstAmt(tdto.getTotalSgstAmt());
            pc.setGstReverseCharge(tdto.getGstReverseCharge());
            pc.setBankAc(tdto.getBankAc());
            pc.setBankIfsc(tdto.getBankIfsc());
            pc.setTermsCond(tdto.getTermsCond());
            pc.setBankName(tdto.getBankName());
            pc.setBankBranch(tdto.getBankBranch());
            // p.setIdc(form.getIdc());
//       p.setTotalActualProduction(act);
//       p.setTotalEfficiency(eff);
//       p.setTotalExpectedProduction(exp);
           
            s.update(pc);
       //     System.out.println("hiiiiiiiiiiiiiiii" + form.getSuperviser() + "" + form.getDate());

            PrTaxIntra p1 = new PrTaxIntra();
            Criteria c1 = s.createCriteria(PrTaxIntra.class);
            p1 = (PrTaxIntra) c1.add(Restrictions.eq("invoiceNo", tdto.getInvoiceNo()));
            System.out.println("kjdgh-------32131321--dhg+++++++++++++++");
            t.commit();
            s.close();

            Session s1 = HibernateUtil.getSessionFactory().openSession();
            Transaction t1 = s1.beginTransaction();

//           String sql="delete from ChildQuality ac where ac.parentQuality.id=:id";
//           Query q=s1.createSQLQuery(sql);
//           q.setParameter("id", id);
//           q.executeUpdate();
            List lis = null;

            Criteria c2 = s1.createCriteria(ChTaxIntra.class);
            lis = c2.add(Restrictions.eq("prTaxIntra.ptId", tdto.getPtId())).list();
            if (lis != null) {
                for (Object o : lis) {
                    System.out.println("kjdgh---------dhg+++++++++++++++");
                    ChTaxIntra cq = (ChTaxIntra) o;
                    s1.delete(cq);
                }
            }

            System.out.println("kjdgh---------dhg+++++54787897++++++++++");

            // int id=p1.getId();
            System.out.println("\n vvvvvvvvvvvvv" + tdto.getPtId());
            // Session  s1=HibernateUtil.getSessionFactory().openSession();

            List<String> l1 = tdto.getProductDesc();
            System.out.println("----------------+-------->" + l1.size());
            List<String> l2 =tdto.getHsnCode();
            System.out.println("-------------------09------------->" + l2);
            List<Float> l3 = tdto.getQty();
            System.out.println("-------------------09-46------------>" + l3);
            List<Float> l4 = tdto.getBeforeTax();
            List<Float> l5 = tdto.getAfterTax();
            List<Float> l6 = tdto.getTaxableValue();
            List<Float> l7 =tdto.getCgRate();
            List<Float> l8 =tdto.getCgAmt();
            List<Float> l9 = tdto.getSgRate();
            List<Float> l = tdto.getSgAmt();
            List<Float> lf=tdto.getChTotal();
            List<String> um = tdto.getUom();

            //  Transaction t1=s1.beginTransaction();
            for (int i = 0; i < l1.size(); i++) {
               ChTaxIntra cc = new ChTaxIntra();
                cc.setPrTaxIntra(pc);
                System.out.println("--------------------child--------------" + l1.get(i) + "&&&&&" + l5.get(i) + "(((((((((");
                System.out.println("------------------" + l2.get(i) + ")))))))))))" + l3.get(i) + "**" + l4.get(i));
                if(l1.get(i)!=null)
                cc.setProductDesc(l1.get(i));
                if(l2.get(i)!=null)
                cc.setHsnCode(l2.get(i));
                if(l3.get(i)!=null)
                cc.setQty(l3.get(i));
                if(l4.get(i)!=null)
                cc.setBeforeTax(l4.get(i));
                if(l5.get(i)!=null)
                cc.setAfterTax(l5.get(i));
                if(l6.get(i)!=null)
                cc.setTaxableValue(l6.get(i));
                if(l7.get(i)!=null)
                cc.setCgRate(l7.get(i));
                if(l8.get(i)!=null)
                cc.setCgAmt(l8.get(i));
                if(l9.get(i)!=null)
                cc.setSgRate(l9.get(i));
                if(l.get(i)!=null)
                cc.setSgAmt(l.get(i));
                if(lf.get(i)!=null)
                cc.setChTotal(lf.get(i));
                if(um.get(i)!=null)
                cc.setUom(um.get(i));
                System.out.println("--------------------4444444444--------------" + l.get(i));
                s1.save(cc);
                System.out.println("iiiiiiiiiii" + cc);
                s1.flush();
                s1.clear();
                // System.out.println("---------->"+l.get(i) +""+l1.get(i));
            }
            t1.commit();
            s1.close();

            System.out.println("\n Quality Inserted Successfully");

        } catch (Exception e) {
            System.out.println(e);
            e.printStackTrace();
        }
        // t.commit();
        //s.close();
        return tdto;
    }
    
    
    
    public List invlist(int inv) {
         Session s = HibernateUtil.getSessionFactory().openSession();
         Transaction t = s.beginTransaction();
         List l=new ArrayList();
         Float tot=0.0f;
        try {
          Criteria c = s.createCriteria(PrTaxIntra.class);
          c.add(Restrictions.eq("invoiceNo", inv));
          l=c.list();
          for(Object o:l) {
              PrTaxIntra pr=(PrTaxIntra) o;
               tot=pr.getTotalInv();
          }
            System.out.println("tot iss"+tot);
            getNumberinWords(tot);
        }
        catch(Exception e) {
            
        }
        return l;
    }
    
    private String words;

    public String getWords() {
        return words;
    }

    public void setWords(String words) {
        this.words = words;
    }
      
           public String getNumberinWords(Float f)
           {
               NumberToWord n=new NumberToWord();
               int i=Math.round(f);
               System.out.println("number issssss"+i);
              String word=n.convertNumberToWords(i);
               System.out.println("word isssssss"+word);
               words=word+"\tonly";
               return word;
           }
    
     public List invlistChild(int inv) {
         Session s = HibernateUtil.getSessionFactory().openSession();
         Transaction t = s.beginTransaction();
         List l=new ArrayList();
         List l1=new ArrayList();
         int id=0;
        try {
          Criteria c = s.createCriteria(PrTaxIntra.class);
          c.add(Restrictions.eq("invoiceNo", inv));
          l=c.list();
          Float tot_inv=0.0f,tot=0.0f;
          for(Object o:l) {
              PrTaxIntra pr=(PrTaxIntra) o;
              id=pr.getPtId();
              tot_inv=pr.getTotalInv();
              System.out.println("id isssssssssssss"+id);
          }
          Criteria c1 = s.createCriteria(ChTaxIntra.class);
          c1.add(Restrictions.eq("prTaxIntra.ptId", id));
          l1=c1.list();
          for(Object o:l1) {
              ChTaxIntra c2=(ChTaxIntra) o;
               tot=c2.getChTotal();
               if(tot!=0.0f) {
                   roundValue(tot,tot_inv);
               }
               
         }
          
           
            System.out.println("Child list is***********"+l1);
          
        }
        catch(Exception e) {
            
        }
        return l1;
    }
    
    public int invoiceno() {
        List l,l1=null;
        int invno=1;
        try {
             Session s = HibernateUtil.getSessionFactory().openSession();
             Transaction t = s.beginTransaction();
             System.out.println("%%%%%%%%%%%%%%%%%%%%%");
             Date d=new Date();
            
            Criteria c = s.createCriteria(PrTaxIntra.class);
            l=c.list();
            System.out.println("list sssssssssssss"+l);
            if(l.isEmpty()) {
               invno=1; 
            }
            else {
               Criteria c1 = s.createCriteria(PrTaxIntra.class);  
                c1.addOrder(Order.asc("invoiceNo"));
                l1=c1.list();
                System.out.println("second list osssss"+l1);
               for(Object o:l1) {
                   PrTaxIntra pr=(PrTaxIntra) o;
                   invno=pr.getInvoiceNo();
                   System.out.println("&&&&&&&&&&&&"+invno);
                   invno=invno+1;
               }
                
            }
            
        }
        catch(Exception e) {
            
        }
        return invno;
    }
    
    private Double round_val;

    public Double getRound_val() {
        return round_val;
    }

    public void setRound_val(Double round_val) {
        this.round_val = round_val;
    }
    
    
    public Double roundValue(Float f1,Float f2) {
             Session s = HibernateUtil.getSessionFactory().openSession();
             Transaction t = s.beginTransaction();
             Float f3=0.0f;
             Double d=0.0d;
        try {
            System.out.println(f2+"child iss"+f1);
             f3=f2-f1;
           // round_val=f3;
             d=Math.round(f3*100.0)/100.0;
             round_val=d;
            System.out.println(Math.round(f3*100.0)/100.0+"round val isssssssss"+f3);
        }
        catch(Exception e) {
            
        }
        return d;
    }

   public List getTaxList() {
        Session s = HibernateUtil.getSessionFactory().openSession();
         Transaction t = s.beginTransaction();
         List l=new ArrayList();
           try {
          Criteria c = s.createCriteria(PrTaxIntra.class);
         l=c.list();
        }
        catch(Exception e) {
            
        }
        return l;
    }
    
      public List getQuant2()
     {
          Session s = HibernateUtil.getSessionFactory().openSession();
          Transaction t = s.beginTransaction();
          List l1=null;
        
          try 
          {
              Criteria c= s.createCriteria(Uom.class);
              c.add(Restrictions.eq("uom","Units"));
              c.setProjection(Projections.property("quantity"));
              l1=c.list();
              
//              String hql="select distinct quantity from Uom where uom='Units'";
//              Query q=s.createQuery(hql);
//              l1=c.list();
          }
          catch(Exception e)
          {
              
          }
         System.out.println("List issssssssss"+l1);  
         return l1;
     }
      
      public List getQuant1(int id)
     {
          Session s = HibernateUtil.getSessionFactory().openSession();
          Transaction t = s.beginTransaction();
          List l1=null;
          try 
          {
              Criteria c= s.createCriteria(Uom.class);
              c.add(Restrictions.eq("uom","MTs"));
              c.setProjection(Projections.property("quantity"));
              l1=c.list();
              
//              String hql="select distinct quantity from Uom where uom='Units'";
//              Query q=s.createQuery(hql);
//              l1=c.list();
          }
          catch(Exception e)
          {
              e.printStackTrace();
          }
         System.out.println("List issssssssss"+l1);  
         return l1;
     }
    
//    public List getQuant1(int id)
//     {
//          Session s = HibernateUtil.getSessionFactory().openSession();
//          Transaction t = s.beginTransaction();
//          List l1=new ArrayList();
//           List l2=new ArrayList();
//             List l3=new ArrayList();
//               List l4=new ArrayList();
//          try 
//          {
//              System.out.println("iddddddddddoooooooo::"+id);
//              Criteria c= s.createCriteria(PrTaxIntra.class).add(Restrictions.eq("invoiceNo", id));
//              l1=c.list();
//              System.out.println("&&&&&&&LLLLLLLLLLL:::::"+l1);
//              for(Object o:l1){
//                  PrTaxIntra p=(PrTaxIntra)o;
//                  id=p.getPtId();
//                  System.out.println("iiinnnnnnn::://"+id);
//              }
//               Criteria c1= s.createCriteria(ChTaxIntra.class).add(Restrictions.eq("prTaxIntra.ptId", id));
//              l2=c1.list();
//                 System.out.println("&&&&&&&yyyyyyyyy:::::"+l2);
//                 String uom="";
//                 for(Object obj:l2){
//              ChTaxIntra ch=(ChTaxIntra)obj;
//              uom=ch.getUom();
//                     System.out.println("uuuuuuooooommmmm::////"+uom);
//            }
//                 if(uom.equals("Units")){
//                     Criteria c2= s.createCriteria(Uom.class);
//                     String hql="select distinct quantity from Uom where uom='Units'";
//            Query q=s.createQuery(hql);
//            l3=q.list();
//                     System.out.println("%%%%%%^^^&&****list333333333::;"+l3);
//                 }
//                 else{
//                       Criteria c2= s.createCriteria(Uom.class);
//                     String hql="select distinct quantity from Uom where uom='MTs'";
//            Query q=s.createQuery(hql);
//            l3=q.list();
//                     System.out.println("*******//////LLLLLL44444::;"+l3);
//                 }
//              
//          }
//          catch(Exception e)
//          {
//              
//          }
//         System.out.println("List issssssssss"+l3);  
//         return l3;
//     }
      public List<String> gradeRetrieve1() {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<Grades> list = new ArrayList<>();
        List<String> list1 = new ArrayList<>();
        try {
           Criteria c = s.createCriteria(Grades.class);
            list = c.list();
            for(Object o:list)
            {
                Grades g=(Grades) o;
                list1.add("'"+g.getGrade()+"'");
            }
            System.out.println("list issssss"+list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        s.close();
        t.commit();
        System.out.println("Final list is:------->>>>" + list1);
        return list1;
     }


    public List getUomList() {
       Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<Grades> list = new ArrayList<>();
        List<String> list1 = new ArrayList<>();
        try {
           Criteria c = s.createCriteria(Grades.class);
            list = c.list();
            for(Object o:list)
            {
                Grades g=(Grades) o;
                list1.add("'"+g.getUom()+"'");
            }
            System.out.println("list issssss"+list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        s.close();
        t.commit();
        System.out.println("Final list is:------->>>>" + list1);
        return list1;
    }

    public List getRateList() {
       Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<Grades> list = new ArrayList<>();
        List<String> list1 = new ArrayList<>();
        try {
           Criteria c = s.createCriteria(Grades.class);
            list = c.list();
            for(Object o:list)
            {
                Grades g=(Grades) o;
                list1.add("'"+g.getBasicRate()+"'");
            }
            System.out.println("list issssss"+list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        s.close();
        t.commit();
        System.out.println("Final list is:------->>>>" + list1);
        return list1;
    }

    
     public void deleteTax1(int inv) {
         Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        try {

            PrTaxIntra pq = new PrTaxIntra();
            Criteria cr = s.createCriteria(PrTaxIntra.class);
            pq = (PrTaxIntra) cr.add(Restrictions.eq("invoiceNo",inv)).uniqueResult();
            s.delete(pq);
            t.commit();
            System.out.println("\n deleted successfully");

        } 
        catch (Exception e) {
            System.out.println("Exception during delete is caught" + e);
        }
       
   }
    
    
    
}
