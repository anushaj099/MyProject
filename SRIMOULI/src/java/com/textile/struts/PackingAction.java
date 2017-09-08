/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.textile.struts;

import com.opensymphony.xwork2.ActionSupport;
import com.textile.dto.countform;
import com.textile.dto.dispatchDTO;
import com.textile.dto.packingdto;
import com.textile.manager.AddPurchaseManager;
import com.textile.manager.PackingManager;
import com.textile.manager.YearManager;
import com.textile.manager.dispatchManager;
import com.textile.model.ChildPacking;
import com.textile.model.Login;
import com.textile.model.ParentPacking;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author anusha
 */
public class PackingAction extends ActionSupport {

    private PackingManager m = new PackingManager();
    private packingdto form;
    private packingdto form1;
    private List glist;
    private List clist;
    private List countlist11,stocklist,countlist22,stocklist2,boxlist,weightlistbf;
    private List weightlist1=new ArrayList();

    public List getWeightlistbf() {
        return weightlistbf;
    }

    public void setWeightlistbf(List weightlistbf) {
        this.weightlistbf = weightlistbf;
    }

    public List getBoxlist() {
        return boxlist;
    }

    public void setBoxlist(List boxlist) {
        this.boxlist = boxlist;
    }

    public List getWeightlist1() {
        return weightlist1;
    }

    public void setWeightlist1(List weightlist1) {
        this.weightlist1 = weightlist1;
    }

    public List getCountlist22() {
        return countlist22;
    }

    public void setCountlist22(List countlist22) {
        this.countlist22 = countlist22;
    }

    public List getStocklist2() {
        return stocklist2;
    }

    public void setStocklist2(List stocklist2) {
        this.stocklist2 = stocklist2;
    }

    public List getCountlist11() {
        return countlist11;
    }

    public void setCountlist11(List countlist11) {
        this.countlist11 = countlist11;
    }

    public List getStocklist() {
        return stocklist;
    }

    public void setStocklist(List stocklist) {
        this.stocklist = stocklist;
    }

    public List getClist() {
        return clist;
    }

    public void setClist(List clist) {
        this.clist = clist;
    }
    
    private int purchaseid=0;
    private Date startdate,enddate;
     private AddPurchaseManager apm=new AddPurchaseManager();
     YearManager ym=new YearManager();
    private List year=null;

    public List getYear() {
        return year;
    }

    public void setYear(List year) {
        this.year = year;
    }

    public int getPurchaseid() {
        return purchaseid;
    }

    public void setPurchaseid(int purchaseid) {
        this.purchaseid = purchaseid;
    }

    public Date getStartdate() {
        return startdate;
    }

    public void setStartdate(Date startdate) {
        this.startdate = startdate;
    }

    public Date getEnddate() {
        return enddate;
    }

    public void setEnddate(Date enddate) {
        this.enddate = enddate;
    }
    
    private List ppList;

    public List getPpList() {
        return ppList;
    }

    public void setPpList(List ppList) {
        this.ppList = ppList;
    }

    public List getPacklist() {
        return packlist;
    }

    public void setPacklist(List packlist) {
        this.packlist = packlist;
    }

    private List list, list1, list2, list3, list4, list5, list6, list7, list8, list9, list10, list11,list12,list13,list14,list15;
    private List ulist,packlist;
    private List<String> superList = new ArrayList<>();
    private static int id;
    private int id1;
    private List<ParentPacking> l;
    private List<ChildPacking> list_chp;

    public List<ChildPacking> getList_chp() {
        return list_chp;
    }

    public void setList_chp(List<ChildPacking> list_chp) {
        this.list_chp = list_chp;
    }

    public List<ParentPacking> getL() {
        return l;
    }

    public void setL(List<ParentPacking> l) {
        this.l = l;
    }

    public int getId1() {
        return id1;
    }

    public void setId1(int id1) {
        this.id1 = id1;
    }

    public packingdto getForm1() {
        return form1;
    }

    public void setForm1(packingdto form1) {
        this.form1 = form1;
    }

    public List getGlist() {
        return glist;
    }

    public void setGlist(List glist) {
        this.glist = glist;
    }

    public List getList1() {
        return list1;
    }

    public void setList1(List list1) {
        this.list1 = list1;
    }

    public List getList2() {
        return list2;
    }

    public void setList2(List list2) {
        this.list2 = list2;
    }

    public List getList3() {
        return list3;
    }

    public void setList3(List list3) {
        this.list3 = list3;
    }

    public List getList4() {
        return list4;
    }

    public List getList11() {
        return list11;
    }

    public void setList11(List list11) {
        this.list11 = list11;
    }

    public void setList4(List list4) {
        this.list4 = list4;
    }

    public List getList5() {
        return list5;
    }

    public void setList5(List list5) {
        this.list5 = list5;
    }

    public List getList6() {
        return list6;
    }

    public void setList6(List list6) {
        this.list6 = list6;
    }

    public List getList7() {
        return list7;
    }

    public void setList7(List list7) {
        this.list7 = list7;
    }

    public List getList8() {
        return list8;
    }

    public void setList8(List list8) {
        this.list8 = list8;
    }

    public List getList9() {
        return list9;
    }

    public void setList9(List list9) {
        this.list9 = list9;
    }

    public List getList10() {
        return list10;
    }

    public void setList10(List list10) {
        this.list10 = list10;
    }

    public List getList12() {
        return list12;
    }

    public void setList12(List list12) {
        this.list12 = list12;
    }

    public List getList13() {
        return list13;
    }

    public void setList13(List list13) {
        this.list13 = list13;
    }

    public List getList14() {
        return list14;
    }

    public void setList14(List list14) {
        this.list14 = list14;
    }

    public List getList15() {
        return list15;
    }

    public void setList15(List list15) {
        this.list15 = list15;
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

    public List<String> getSuperList() {
        return superList;
    }

    public void setSuperList(List<String> superList) {
        this.superList = superList;
    }

    public List getList() {
        return list;
    }

    public void setList(List list) {
        this.list = list;
    }

    public PackingManager getM() {
        return m;
    }

    public void setM(PackingManager m) {
        this.m = m;
    }

    public packingdto getForm() {
        return form;
    }

    public void setForm(packingdto form) {
        this.form = form;
    }

    public PackingAction() {
        m = new PackingManager();
        ulist = new ArrayList();
    }
    private int abcd = 0, xyz = 0;

    public int getXyz() {
        return xyz;
    }

    public void setXyz(int xyz) {
        this.xyz = xyz;
    }

    public int getAbcd() {
        return abcd;
    }

    public void setAbcd(int abcd) {
        this.abcd = abcd;
    }

    public String superviser() {
        try {
            abcd = 5;
            xyz = 100;
             this.year=apm.getYear();
            this.ulist = m.packingList1(getId());
            System.out.println("iiiiiiiiiiiiiiiiddddddddddd is" + getId());
            superList = m.packerList();
            this.glist = m.shiftExists();
            shift_date = m.getDd();

        } catch (Exception e) {
            System.out.println("effgfb" + e);
        }

        return "pack";
    }

    public String packingHome1() {
        abcd = 5;
        xyz = 100;
        this.ulist = m.packingList1(getId());
        for (Object o : ulist) {
            Login l = (Login) o;
            System.out.println("type is---------" + l.getLoginType());
            if (l.getLoginType().equals("packing")) {
                return "success";
            }
        }
        return null;
    }

    private String status;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    private static String date, superviser;

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getSuperviser() {
        return superviser;
    }

    public void setSuperviser(String superviser) {
        this.superviser = superviser;
    }
    private List countlist = new ArrayList();
    private List weightlist = new ArrayList();
    
    private List openingstocklist = new ArrayList();

    public List getOpeningstocklist() {
        return openingstocklist;
    }

    public void setOpeningstocklist(List openingstocklist) {
        this.openingstocklist = openingstocklist;
    }
    

    public List getWeightlist() {
        return weightlist;
    }

    public void setWeightlist(List weightlist) {
        this.weightlist = weightlist;
    }

    public List getCountlist() {
        return countlist;
    }

    public void setCountlist(List countlist) {
        this.countlist = countlist;
    }

    
   public String packval() {
        abcd = 5;
        xyz = 100;
        System.out.println("dddddddddddddddd" + getId());
        this.ulist = m.packingList1(getId());
        this.glist = m.shiftExists();
        shift_date = m.getDd();
        countlist = m.countList();
        
        weightlist = m.weightList();
        weightlist1=m.weightList1();
        System.out.println("weightlist isss"+weightlist);
        System.out.println("weightlist1 isss"+weightlist1);
        //  this.list = m.packProcedure();
        superList = m.packerList();
        String val = "";
        //     this.list = m.packProcedure();
        // int z = list.size();
        // System.out.println("kdfjgh-----------------54654dkjhg--------------" + z);
        try {
            System.out.println("dddddddddd****************--**dddddd" + form.getDate());
            // ParentPacking pc=new ParentPacking();
            if (getForm() != null) {
                if (form.getDate() == null || form.getDate().length() == 0) {
                    System.out.println("dddddddddd*********date*******--**dddddd");
                    status = "12345";
                    addFieldError("form.date", "Please Fill Date first");
                    //  return "input";
                    // this.clist=cm.packingvallist(getPcard());
                } else {
                    this.ulist = m.packingList1(getId());

                    superList = m.packerList();

                    if (form.getDate().length() == 0 || form.getDate() == null) {

                        status = "12345";
                        addFieldError("form.date", "Please Select Date");
                    }
                    if (form.getSupervisor().equals("-1")) {
                        System.out.println("dddddddddd*********supervisor*******--**dddddd");
                        status = "12345";
                        addFieldError("form.supervisor", "Please Select Packer Name");
                    }
                    val = m.productionInsVal(getForm());
                     this.year=apm.getYear();
//                 if(apm.dateCheck(form.getDate())){
//                       Date date=ym.getDateFrom();
//                       status = "12345";
//                       addFieldError("form.date","Year is already closed. Please select date from "+date);
//                                                  }
                    if (m.packingDataVal(form)) {
                        status = "12345";
                        superList = m.packerList();
                        addFieldError("form.date", "Data already exists with this packer name on this Date");
                    } else if (val.equals("error")) {
                        status = "12345";
                        superList = m.packerList();
                        date = form.getDate();
                        addFieldError("form.date", "Please select Date linearly");
                    }
                  }
                if (status == null) {
                    status = "123";
                    date = form.getDate();
                    superviser = form.getSupervisor();

                    System.out.println("kdjgh+dare" + date + superviser);
                }
                System.out.println(" the date of packing form is.............................>" + date);
           
                this.openingstocklist=m.getopeningstock(form.getDate());
                System.out.println("^^^^^^^^^^^^^^^^^");
                this.packlist=m.display();
                System.out.println("$$$$$$$$$$$$$$$"+packlist);
//                if(packlist.isEmpty()) {
//                    this.countlist22=m.getCount1();
//                    this.stocklist2=m.getopenStock();
//                }
//                else {
//                    
//                }
    
                this.countlist22=m.getCount1();
                this.stocklist2=m.getopenStock();
                System.out.println(countlist22+"**************"+stocklist2);
                System.out.println("\n triveni1111111111111111111111111");
                this.countlist11=m.getCount(form.getDate());
                this.stocklist=m.getClosingStock(form.getDate());
                System.out.println(countlist+"Hehhhhhhheeee<<<<<<<<<<<<<<<<<<<<<<<--------------*******************--------------------->>>>>>>>>>>>>>>>>>");
              //  this.boxlist=m.getBoxtype(form.getDate());
                this.weightlistbf=m.countdbcheck();
                String counttype="All";
                
                this.boxlist=m.retrieveReadyToPk1(form.getDate(),countlist);
              
                System.out.println(countlist11+"%%%%%%%%%%%%%%%%%"+stocklist+"$$$$$$$$$$$$$$$"+boxlist);
            }
        } catch (ArrayIndexOutOfBoundsException e) {
            System.out.println("the exception in pack-------------->"+ e);
            e.printStackTrace();
         }
        catch(Exception e)
        {
            
        }
        System.out.println("I am successsssssssssssssssssseeeeeeeeeee");
        return "packing";
    }
   private  String evocher;

    public String getEvocher() {
        return evocher;
    }

    public void setEvocher(String evocher) {
        this.evocher = evocher;
    }
    List alist=new ArrayList();

    public List getAlist() {
        return alist;
    }

    public void setAlist(List alist) {
        this.alist = alist;
    }

  
    
   private dispatchDTO pform;
   private dispatchManager dm;

    public dispatchManager getDm() {
        return dm;
    }

    public void setDm(dispatchManager dm) {
        this.dm = dm;
    }
   

    public dispatchDTO getPform() {
        return pform;
    }

    public void setPform(dispatchDTO pform) {
        this.pform = pform;
    }
    
    public countform cform;

    public countform getCform() {
        return cform;
    }

    public void setCform(countform cform) {
        this.cform = cform;
    }
    
    public String insertPack() throws ParseException {
        abcd = 5;
        xyz = 100;
        try {
        System.out.println("vocher issssssssssssssss"+evocher);
      /*  alist=m.anusha(pform);
        System.out.println("vvvvvvvvvvvvvvvvvppppppppppppp"+alist);*/
        m.insertPacking(form, date, superviser, evocher);
        //m.generate(pform, form);
        glist = m.packingList(getForm());
        clist=m.count(getCform());
            System.out.println("ccccccccccc"+clist);
        System.out.println("uuuuuuuuuuuu" + glist);
        this.glist = m.display();
        this.ulist = m.packingList1(getId());
//           l=m.Pretrieve(getForm());
        //System.out.println("anushaaaaaaaaaaaaa"+l);
        System.out.println("ggggggggggggg" + glist);
        superList = m.getSuperviser();

        for (Object o : ulist) {
            Login l = (Login) o;
            System.out.println("type is----+++++++-----" + l.getLoginType());
            if (l.getLoginType().equals("packing")) {
                return "packreports";
            } else if (l.getLoginType().equals("control")) {
                return "packView";
            }
        }
         }
         catch(Exception e) {
             e.printStackTrace();
         }
        return null;
    }

    private static int idpq;

    public int getIdpq() {
        return idpq;
    }

    public void setIdpq(int idpq) {
        this.idpq = idpq;
    }

    public String packingEdit() throws ParseException {
        System.out.println("\n oooooooooooooooooooo" + id1+"------..===**"+getId());
        ppList = m.editPacking(getIdpq());
        this.ulist = m.packingList1(getId());
        System.out.println("\n the list after edit in packing edit iss..-------->"+ulist);
        System.out.println("iiiiid is" + getId());
        
        try {
            glist = m.display();
            System.out.println("the id of child packing in pack action << is------>"+getIdpq());
        list_chp= m.displayChild(getIdpq());
        countlist = m.countList();
        weightlist = m.weightList();
        weightlist1=m.weightList1();
        
        Date beforedate=null;
            System.out.println("****<<< the list chp is----->"+list_chp);
            for(Object o:list_chp) {
                ChildPacking ch=(ChildPacking) o;
                beforedate=ch.getActualDate();
                System.out.println("YYYYYYYYYYYYY"+beforedate);
            }
           String date=null;
           date=beforedate.toString();
           
            System.out.println("\n triveni1111111111111111111111111"+date);
                this.countlist11=m.getCount(beforedate);
                this.stocklist=m.getClosingStock(beforedate);
               
                System.out.println(countlist11+"**************"+stocklist);
                if(countlist11.isEmpty()) {
                    this.countlist22=m.getCount1();
                 this.stocklist2=m.getopenStock();
                }
                this.countlist22=m.getCount1();
                 this.stocklist2=m.getopenStock();
//                 this.boxlist=m.getBoxtype(beforedate);
                   this.weightlistbf=m.countdbcheck();
               // String counttype="All";
              //  this.boxlist=m.retrieveReadyToPk1(date,countlist);
                 System.out.println(countlist22+"?????????????????"+stocklist2);
            int z = list_chp.size();
            System.out.println("kdfjgh-----------------54654dkjhg------88888888--------" + z);
            list11 = (list_chp.subList(0, 1));
            System.out.println("fkljh6540000000000o77777777777oooooooo" + list11);
            list1 = (list_chp.subList(1, 2));
            list2 = (list_chp.subList(2, 3));
            list3 = (list_chp.subList(3, 4));
            list4 = (list_chp.subList(4, 5));
            list5 = (list_chp.subList(5, 6));
            list6 = (list_chp.subList(6, 7));
            list7 = (list_chp.subList(7, 8));
            list8 = (list_chp.subList(8, 9));
            list9 = (list_chp.subList(9, 10));
            list10 = (list_chp.subList(10, 11));
            list12 = (list_chp.subList(11, 12));
            list13 = (list_chp.subList(12, 13));
            list14 = (list_chp.subList(13, 14));
            list15 = (list_chp.subList(14, 15));
        }
        catch (IndexOutOfBoundsException | NullPointerException m)
        {
           // m.printStackTrace();
            System.out.println("the exception in packing edit of packing action------>"+m);

        }
        
        abcd = 5;
        xyz = 100;
        superList = m.getSuperviser();
        return "success";
    }
    private Date shift_date = null;

    public Date getShift_date() {
        return shift_date;
    }

    public void setShift_date(Date shift_date) {
        this.shift_date = shift_date;
    }

    public String packingHome() {
        abcd = 5;
        xyz = 100;
        try {
        superList = m.packerList();
        this.ulist = m.packingList1(getId());
        this.glist = m.shiftExists();
        shift_date = m.getDd();
        System.out.println(">>>>>>>>>>>>>>" + shift_date);
        for (Object o : ulist) {
            Login l = (Login) o;
            System.out.println("type is---------" + l.getLoginType());
            if (l.getLoginType().equals("packing")) {
                return "packing";
            }
            if (l.getLoginType().equals("control")) {
                return "packing";
            }
        }
 }
         catch(Exception e) {
             e.printStackTrace();
         }
        return "success";
    }

   public String retrievePack() throws ParseException {
       try {
            abcd = 5;
            xyz = 100;
            this.ulist = m.packingList1(getId());
            System.out.println("+++++++++" + getForm1());
            System.out.println("================" + list);
            this.superList = m.packerList();
            countlist = m.countList1();
            if (form1.getDate().length() == 0) {
                addFieldError("form1.date", "From date Should not be Empty");
            }
            if (form1.getDate1().length() == 0) {
                addFieldError("form1.date1", "To date Should not be Empty");
            }
                list=m.display();
            list1 = m.RetrivePack(getForm1(),getCountdb());
            System.out.println("KKKKKKKKKKKKKKKKKKKK"+list);
            Date d1 = new SimpleDateFormat("dd-MM-yyyy").parse(form1.getDate());
            Date d2 = new SimpleDateFormat("dd-MM-yyyy").parse(form1.getDate1());
            if (d1.after(d2)) {
                addFieldError("form1.date1", "From date must be lessthan To date");
            } else if (list.isEmpty()) {
                addFieldError("form1.date", "Data not Exists");
            }
        } catch (Exception e) {

        }
        return "success";
    }
    private String evocher1;

    public String getEvocher1() {
        return evocher1;
    }

    public void setEvocher1(String evocher1) {
        this.evocher1 = evocher1;
    }
    

    public String packingUpdate() throws ParseException {
        try {
        this.ulist = m.packingList1(form.getId());
        m.updatePacking(getForm(),getEvocher1());
    //    m.updatePackingNew(getForm(), getEvocher1());
         // m.generate(pform, form);
        glist = m.display();
        System.out.println("hshfhfhjfhgffjjjhghg");
        abcd = 5;
        xyz = 100;
         }
         catch(Exception e) {
             e.printStackTrace();
         }
        return "success";
    }

    public String packingDelete() throws ParseException {
        try {
        m.deletePack(getIdpq());
        glist = m.display();
        this.ulist = m.packingList1(getId());
        abcd = 5;
        xyz = 100;
         }
         catch(Exception e) {
             e.printStackTrace();
         }
        return "success";
    }

    public String packingretrieve() {
        try {
        this.ulist = m.packingList1(getId());
        this.superList = m.packerList();
         countlist = m.countList1();
         purchaseid=1000;
        abcd = 5;
        xyz = 100;
         }
         catch(Exception e) {
             e.printStackTrace();
         }
        return "success";
    }

    public String packingView() {
        try {
            System.out.println("the system is packing viewwww...");
          this.year=apm.getYear();
        this.ulist = m.packingList1(getId());
        this.glist = m.display();
        abcd = 5;
        xyz = 100;
         }
         catch(Exception e) {
             e.printStackTrace();
         }
        return "success";
    }

    public String dispatchHome() {
        try {
        this.ulist = m.packingList1(getId());
        abcd = 22;
        xyz = 100;
         }
         catch(Exception e) {
             e.printStackTrace();
         }
        return "dispatch";
    }

    public String packingreports() {
        try {
        this.ulist = m.packingList1(getId());
         countlist = m.countList1();
         purchaseid=1000;
        abcd = 22;
        xyz = 100;
         }
         catch(Exception e) {
             e.printStackTrace();
         }
        return "success";
    }

    public String dispatchReport() {
        try {
            abcd = 22;
            xyz = 100;
            this.ulist = m.packingList1(getId());
            System.out.println("+++++++++" + getForm1());
            System.out.println("================" + list);
            // this.superList = m.getSuperviser();

            if (form1.getDate().length() == 0) {
                addFieldError("form1.date", "From date Should not be Empty");
            }
            if (form1.getDate1().length() == 0) {
                addFieldError("form1.date1", "To date Should not be Empty");
            }
            list = m.retrieveDispatch(getForm1());
            Date d1 = new SimpleDateFormat("dd-MM-yyyy").parse(form1.getDate());
            Date d2 = new SimpleDateFormat("dd-MM-yyyy").parse(form1.getDate1());
            if (d1.after(d2)) {
                addFieldError("form1.date1", "From date must be lessthan To date");
            } else if (list.isEmpty()) {
                addFieldError("form1.date", "Data not Exists");
            }
        } catch (Exception e) {

        }
        return "success";
    }
    List plist=new ArrayList();

    public List getPlist() {
        return plist;
    }

    public void setPlist(List plist) {
        this.plist = plist;
    }
    private String countdb;

    public String getCountdb() {
        return countdb;
    }

    public void setCountdb(String countdb) {
        this.countdb = countdb;
    }

    
    private String count;

    public String getCount() {
        return count;
    }

    public void setCount(String count) {
        this.count = count;
    }
    
   private List<String> countlist1 = new ArrayList<>();

    public List<String> getCountlist1() {
        return countlist1;
    }

    public void setCountlist1(List<String> countlist1) {
        this.countlist1 = countlist1;
    }
   
    
    
    public String stockRetrieve() throws ParseException {
         this.ulist = m.packingList1(getId());
        countlist = m.countList();
    List countlist1 = new ArrayList();
    countlist1=m.countList();
         countlist.add("All");
        try {
            if (form1.getDate().length() == 0) {
                addFieldError("form1.date", "From date Should not be Empty");
                return "fail";
            } else {
                if (form1.getDate1().length() == 0) {
                    addFieldError("form1.date1", "To date Should not be Empty");
                     return "fail";
                }
                 if (getCountdb().equals("-1")) {
                    addFieldError("countdb", "Please select Count");
                     return "fail";
                }
                list = m.retrieveStock(getForm1(),getCountdb(),countlist1);
                 plist=m.parentPack(getForm1());
                Date d1 = new SimpleDateFormat("dd-MM-yyyy").parse(form1.getDate());
                Date d2 = new SimpleDateFormat("dd-MM-yyyy").parse(form1.getDate1());
                if (d1.after(d2)) {
                    addFieldError("form1.date1", "From date must be lessthan To date");
                     return "fail";
                } else if (list.isEmpty()) {
                    addFieldError("form1.date", "Data not Exists");
                     return "fail";
                }
            }
        } catch (Exception e) {

        }
        return "success";
    }

    
    public String stockRetrieve1() throws ParseException {
        
        this.ulist = m.packingList1(getId());
        countlist = m.countList();
    List countlist1 = new ArrayList();
    countlist1=m.countList();
         countlist.add("All");
        try {
            if (form1.getDate().length() == 0) {
                addFieldError("form1.date", "From date Should not be Empty");
                return "fail";
            } else {
                if (form1.getDate1().length() == 0) {
                    addFieldError("form1.date1", "To date Should not be Empty");
                     return "fail";
                }
                 if (form1.getCount().equals("-1")) {
                    addFieldError("form1.count", "Please select Count");
                     return "fail";
                }
             
		  list = m.retrieveReadyToPk(getForm1(),countlist1);
                Date d1 = new SimpleDateFormat("dd-MM-yyyy").parse(form1.getDate());
                Date d2 = new SimpleDateFormat("dd-MM-yyyy").parse(form1.getDate1());
                
           
                }
             
              
            }
         catch (Exception e) {

        }
        return "success";
    }

}
