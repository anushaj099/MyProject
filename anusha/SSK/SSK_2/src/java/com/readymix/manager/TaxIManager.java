/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.readymix.manager;

import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.readymix.dto.TaxInvoiceDto;
import com.readymix.model.ChTaxIntra;
import com.readymix.model.Grades;
import com.readymix.model.Login;
import com.readymix.model.PrTaxIntra;
import com.readymix.util.HibernateUtil;
import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.Properties;
import java.util.StringTokenizer;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.util.ByteArrayDataSource;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Masrat
 */
public class TaxIManager {
    
    
      public  byte[] getPdf(List l1,  List l2,Double round_val,String word)
    {
        byte[] b1=null;
        
        try {
        
           
            
            for(Object o:l1)
            {
                PrTaxIntra pr=(PrTaxIntra) o;
            ByteArrayOutputStream b=new ByteArrayOutputStream();
            
            DecimalFormat df=new DecimalFormat("0.00");
            
            //  OutputStream file = new FileOutputStream(new File("D:\\PDF_svk.pdf"));
	          Document document = new Document(PageSize.A4, 40f, 40f, 100f, 0f);
	       //   PdfWriter.getInstance(document, file);
                  
                   PdfWriter.getInstance(document, b);
                  
                  Font regular = new Font(Font.FontFamily.TIMES_ROMAN, 9);
                       Font boldFont = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD);
                              Font boldFont2 = new Font(Font.FontFamily.TIMES_ROMAN, 10, Font.BOLD);
                              Font boldFont4 = new Font(Font.FontFamily.TIMES_ROMAN, 9, Font.BOLD);
                              Font boldFont3 = new Font(Font.FontFamily.TIMES_ROMAN, 9, Font.UNDERLINE | Font.BOLD);
                              Font normalfont = new Font(Font.FontFamily.TIMES_ROMAN,9 , Font.NORMAL);
                               Font normalfont2 = new Font(Font.FontFamily.UNDEFINED,8 , Font.NORMAL);
               String FONT1=null;
                      Font playfair =FontFactory.getFont(FONT1, BaseFont.IDENTITY_H, BaseFont.EMBEDDED, 8);
                 Font playfair2 =FontFactory.getFont(FONT1, BaseFont.IDENTITY_H, BaseFont.EMBEDDED, 7);

			//Inserting Image in PDF
                         //    Image image = Image.getInstance ("E://Java//VSK_SC//SSK_Logo.png");
                             Image image = Image.getInstance ("D://anusha//anusha//SSK//SSK_2//web//dist//img//SSK_Logo.png");
			//     Image image = Image.getInstance ("E://Java//SVK_RMC//svkl2.jpg");
			     image.scaleAbsolute(120f, 90f);//image width,height	
                             
                            //  Image image1 = Image.getInstance ("E://Java//VSK_SC//vsk-head1.jpg");
                            Image image1 = Image.getInstance ("D://anusha//anusha//SSK//SSK_2//web//dist//img//ssk_head.jpg");
                       //        Image image1 = Image.getInstance ("E://Java//SVK_RMC//SVk_Head_1.png");
                          //     image1.setAlignment(Image.LEFT| Image.TEXTWRAP); 
			   image1.scaleAbsolute(70f, 35f);

			//Inserting Table in PDF
                        
                        
//			     PdfPTable table=new PdfPTable(3);
//                             table.setTotalWidth(500);
//                             table.setLockedWidth(true);
//                  
//                         
                              Phrase p=new Phrase("          ",regular);
                           //  p.add(new Chunk(image1, 0, 0));
                            p.add(new Chunk(Chunk.NEWLINE+"TAX INVOICE",boldFont));
                             p.add(new Chunk(Chunk.NEWLINE+"SRI SAI KRISHNA STONE CRUSHER",boldFont));
                             p.add(new Chunk(Chunk.NEWLINE+"GSTIN:37AAVFS3232K1ZN, PAN: AAVFS3232K",boldFont2));
                             p.add(new Chunk(Chunk.NEWLINE));
                           //  p.add(new Chunk(Chunk.NEWLINE+"\n Plant: Survey No. 398/A1, PERECHERLA, Guntur Dist. (A.P). ",regular));
                             p.add(new Chunk(Chunk.NEWLINE+"D.No: 9/533, Perecherla Donka, Perecherla, Medikonduru Mandal, Guntur, Andhra Pradesh, 522005 ",new Font(Font.FontFamily.TIMES_ROMAN,9,Font.NORMAL)));
                          //   p.add(new Chunk(Chunk.NEWLINE+" Sub-station, PERECHERLA,Guntur Dist. (A.P).",new Font(Font.FontFamily.TIMES_ROMAN,9,Font.NORMAL)));
                         
//    p.add(new Chunk(Chunk.NEWLINE+"\n ",new Font(Font.FontFamily.TIMES_ROMAN,9,Font.NORMAL)));
                             p.add(new Chunk(Chunk.NEWLINE+"Mobile No: 8886961913, e-mail: ssksc134@gmail.com",new Font(Font.FontFamily.TIMES_ROMAN,9,Font.NORMAL)));
                             
                                      
				 

                    PdfPTable table = new PdfPTable(3);
                    table.setTotalWidth(500);
                    table.setLockedWidth(true);
                

                    PdfPCell side1;
                    
                    side1=new PdfPCell(new Phrase("        ",boldFont4));
                    side1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side1.setBorder(Rectangle.TOP | Rectangle.LEFT);
                    table.addCell(side1);

                    side1=new PdfPCell(new Phrase("        ",boldFont4));
                    side1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side1.setBorder(Rectangle.TOP | Rectangle.LEFT);
                    table.addCell(side1);

                    side1=new PdfPCell(new Phrase("        ",boldFont4));
                    side1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side1.setBorder(Rectangle.TOP | Rectangle.LEFT | Rectangle.RIGHT);
                    table.addCell(side1);

                    
                    
                    side1=new PdfPCell(new Phrase("      ",boldFont4));
                    side1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side1.setBorder(Rectangle.LEFT);
                    table.addCell(side1);

                  
                    side1=new PdfPCell(image1);
                    side1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side1.setBorder(Rectangle.LEFT);
                    table.addCell(side1);

                    side1=new PdfPCell(new Phrase("     ",boldFont4));
                    side1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side1.setBorder(Rectangle.LEFT | Rectangle.RIGHT);
                    table.addCell(side1);
                
                    
                    
                    
                    side1=new PdfPCell(image);
                    side1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side1.setBorder(Rectangle.LEFT);
                    table.addCell(side1);
                    
                    side1=new PdfPCell(p);
                    side1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side1.setBorder(Rectangle.LEFT);
                    table.addCell(side1);
                    

                    side1=new PdfPCell(new Phrase("ORIGINAL"+"\n \n FOR"+"\n \n RECEIPIENT",boldFont4));
                    side1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side1.setBorder(Rectangle.LEFT | Rectangle.RIGHT);
                    table.addCell(side1);
                    
                    
                    side1=new PdfPCell(new Phrase("        ",boldFont4));
                    side1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side1.setBorder(Rectangle.LEFT  | Rectangle.BOTTOM);
                    table.addCell(side1);

                    side1=new PdfPCell(new Phrase("        ",boldFont4));
                    side1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side1.setBorder(Rectangle.LEFT  | Rectangle.BOTTOM);
                    table.addCell(side1);

                    side1=new PdfPCell(new Phrase("        ",boldFont4));
                    side1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side1.setBorder(Rectangle.LEFT | Rectangle.RIGHT  | Rectangle.BOTTOM);
                    table.addCell(side1);
                    
                    table.setWidths(new int[]{25,60,15});











                    //-------------------------- end of table 1 -------------------
                    
                    PdfPTable table2 = new PdfPTable(4);
                    table2.setTotalWidth(500);
                    table2.setLockedWidth(true);
                    
                    SimpleDateFormat sdfr = new SimpleDateFormat("dd-MM-yyyy");
                             
                    PdfPCell cellOne = new PdfPCell(new Phrase("InvoiceNo:",boldFont4));
                    PdfPCell cellTwo = new PdfPCell(new Phrase("00"+Integer.toString(pr.getInvoiceNo()),normalfont2));
                    PdfPCell cellthree = new PdfPCell(new Phrase("Transportation Mode:",boldFont4));
                    PdfPCell cellfour = new PdfPCell(new Phrase(pr.getTransportMode(),normalfont2));
                    
                    PdfPCell cellfive = new PdfPCell(new Phrase("Invoice Date:",boldFont4));
                    PdfPCell cellsix = new PdfPCell(new Phrase(sdfr.format(pr.getInvoiceDate()),normalfont2));
                    PdfPCell cellseven = new PdfPCell(new Phrase("Vehicle No:",boldFont4));
                    PdfPCell celleight = new PdfPCell(new Phrase(pr.getVehNo(),normalfont2));
                    
                    PdfPCell nine = new PdfPCell(new Phrase("Reverse Charge:",boldFont4));
                    PdfPCell ten = new PdfPCell(new Phrase(pr.getReverseCharge(),normalfont2));
                    PdfPCell eleven = new PdfPCell(new Phrase("Date of Supply:",boldFont4));
                    PdfPCell twelve = new PdfPCell(new Phrase(sdfr.format(pr.getDateOfSupply()),normalfont2));
                    
                    
                    

                    cellfive.setBorder(Rectangle.LEFT);
                    cellsix.setBorder(Rectangle.NO_BORDER);
                    cellseven.setBorder(Rectangle.NO_BORDER);
                    celleight.setBorder(Rectangle.RIGHT);
                    
                    cellOne.setBorder(Rectangle.LEFT);
                    cellTwo.setBorder(Rectangle.NO_BORDER);
                    cellthree.setBorder(Rectangle.NO_BORDER);
                    cellfour.setBorder(Rectangle.RIGHT);
                    
                    nine.setBorder(Rectangle.LEFT);
                    ten.setBorder(Rectangle.NO_BORDER);
                    eleven.setBorder(Rectangle.NO_BORDER);
                    twelve.setBorder(Rectangle.RIGHT);
                    

                    table2.addCell(cellOne);
                    table2.addCell(cellTwo);
                    table2.addCell(cellthree);
                    table2.addCell(cellfour);
                    table2.addCell(cellfive);
                    table2.addCell(cellsix);
                    table2.addCell(cellseven);
                    table2.addCell(celleight);
                    table2.addCell(nine);
                    table2.addCell(ten);
                    table2.addCell(eleven);
                    table2.addCell(twelve);
                    
                    table2.setWidths(new int[]{25,25,25,25});    
            
                    // ------------------------- END OF TABLE2 -------------------------------
                    
                    PdfPTable table3 = new PdfPTable(6);
                    table3.setTotalWidth(500);
                    table3.setLockedWidth(true);
                    
                    PdfPCell side2;
                    
                    side2=new PdfPCell(new Phrase("State:",boldFont4));
                    side2.setBorder(Rectangle.LEFT);
                    table3.addCell(side2);
                    side2=new PdfPCell(new Phrase(pr.getState(),normalfont2));
                    side2.setBorder(Rectangle.NO_BORDER);
                     table3.addCell(side2);
                    side2=new PdfPCell(new Phrase("Code:",boldFont4));
                     side2.setBorder(Rectangle.NO_BORDER);
                     table3.addCell(side2);
                    side2=new PdfPCell(new Phrase(pr.getCode(),normalfont2));
                     side2.setBorder(Rectangle.NO_BORDER);
                     table3.addCell(side2);
                    side2=new PdfPCell(new Phrase("Place of Supply",boldFont4));
                     side2.setBorder(Rectangle.NO_BORDER);
                     table3.addCell(side2);
                    side2=new PdfPCell(new Phrase(pr.getPlaceOfSupply(),normalfont2));
                     side2.setBorder(Rectangle.RIGHT);
                     table3.addCell(side2);
                    
                    PdfPCell one = new PdfPCell(new Phrase("        ",boldFont4));
                    PdfPCell two = new PdfPCell(new Phrase("         ",normalfont2));
                    PdfPCell three = new PdfPCell(new Phrase("          ",boldFont4));
                    PdfPCell four = new PdfPCell(new Phrase("          ",normalfont2));
                    PdfPCell five = new PdfPCell(new Phrase("        ",boldFont4));
                    PdfPCell six = new PdfPCell(new Phrase("           ",normalfont2));
                    
                    one.setBorder(Rectangle.LEFT | Rectangle.BOTTOM);
                   
                    two.setBorder(Rectangle.BOTTOM);
                 
                    three.setBorder(Rectangle.BOTTOM);
                    four.setBorder(Rectangle.BOTTOM);
                    five.setBorder(Rectangle.BOTTOM);
                    six.setBorder(Rectangle.RIGHT);
                     six.setBorder(Rectangle.BOTTOM | Rectangle.RIGHT);
                    
                        
                    table3.addCell(one);
                    table3.addCell(two);
                    table3.addCell(three);
                    table3.addCell(four);
                    table3.addCell(five);
                    table3.addCell(six);
                    table3.setWidths(new int[]{10,15,10,15,25,25});
			
                    
                    // ------------------------- END OF TABLE3 --------------------------
                    
                     PdfPTable table4 = new PdfPTable(2);
                    table4.setTotalWidth(500);
                    table4.setLockedWidth(true);
                    
                     PdfPCell one1 = new PdfPCell(new Phrase("B I L L  T O P A R T Y",boldFont3));
                    PdfPCell two2 = new PdfPCell(new Phrase("S H I P T O P A R T Y",boldFont3));
                    one1.setBorder(Rectangle.LEFT);
                    two2.setBorder(Rectangle.RIGHT);
                    
                    one1.setHorizontalAlignment (Element.ALIGN_CENTER);
                    two2.setHorizontalAlignment (Element.ALIGN_CENTER); 
                   
                    
                    table4.addCell(one1);
                    table4.addCell(two2);
                 
                    
                    // ------------------- END OF TABLE4 -----------------------------------
                    
                     PdfPTable table5 = new PdfPTable(4);
                    table5.setTotalWidth(500);
                    table5.setLockedWidth(true);
                    
                    Phrase p6=new Phrase(pr.getBillToAddress(),normalfont2);
                    p6.add(new Chunk(Chunk.NEWLINE+"              "));
                    p6.add(new Chunk(Chunk.NEWLINE+"              "));
                    p6.add(new Chunk(Chunk.NEWLINE+"              "));
                    p6.add(new Chunk(Chunk.NEWLINE+"              "));
                    
                  Phrase p7=new Phrase(pr.getShipAddress(),normalfont2);
                    p7.add(new Chunk(Chunk.NEWLINE+"              "));
                    p7.add(new Chunk(Chunk.NEWLINE+"              "));
                    p7.add(new Chunk(Chunk.NEWLINE+"              "));
                    p7.add(new Chunk(Chunk.NEWLINE+"              "));   
                             
                    PdfPCell ONE1 = new PdfPCell(new Phrase("Name:",boldFont4));
                    PdfPCell TWO1 = new PdfPCell(new Phrase(pr.getBillToName(),normalfont2));
                    PdfPCell THREE1 = new PdfPCell(new Phrase("Name:",boldFont4));
                    PdfPCell FOUR4 = new PdfPCell(new Phrase(pr.getShipToName(),normalfont2));
                    
                    PdfPCell FIVE5 = new PdfPCell(new Phrase("Address:",boldFont4));
                    PdfPCell SIX6 = new PdfPCell(p6);
                    PdfPCell SEVEN7 = new PdfPCell(new Phrase("Address:",boldFont4));
                    PdfPCell EIGHT8 = new PdfPCell(p7);
                    
                    
                    Phrase p1=new Phrase("State:",boldFont4);
                    p1.add(new Chunk(pr.getBillTostate(),normalfont2));
                    Phrase p3=new Phrase("State:",boldFont4);
                    p3.add(new Chunk(pr.getShipToState(),normalfont2));
                   
                    Phrase p4=new Phrase("State Code:",boldFont4);
                    p4.add(new Chunk(pr.getBillToCode(),normalfont2));
                    Phrase p5=new Phrase("State Code:",boldFont4);
                    p5.add(new Chunk(pr.getShipToCode(),normalfont2));
                     
                    PdfPCell NINE9 = new PdfPCell(p1);
                    PdfPCell TEN10 = new PdfPCell(p4);
                    PdfPCell ELEVEN11 = new PdfPCell(p3);
                    PdfPCell TWELVE12 = new PdfPCell(p5);
                    
                    PdfPCell THRITEEN17 = new PdfPCell(new Phrase("GSTIN Number:",boldFont4));
                    PdfPCell FOURTEEN18 = new PdfPCell(new Phrase(pr.getBillToGstin(),normalfont2));
                    PdfPCell FIFTEEN19 = new PdfPCell(new Phrase("GSTIN Number:",boldFont4));
                    PdfPCell SIXTEEN20 = new PdfPCell(new Phrase(pr.getShipToGstin(),normalfont2));
                    
                    
                    PdfPCell THRITEEN13 = new PdfPCell(new Phrase("          ",boldFont4));
                    PdfPCell FOURTEEN14 = new PdfPCell(new Phrase("          ",normalfont2));
                    PdfPCell FIFTEEN15 = new PdfPCell(new Phrase("          ",boldFont4));
                    PdfPCell SIXTEEN16 = new PdfPCell(new Phrase("         ",normalfont2));
                    
                    THRITEEN17.setBorder(Rectangle.LEFT);
                    FOURTEEN18.setBorder(Rectangle.NO_BORDER);
                    FIFTEEN19.setBorder(Rectangle.NO_BORDER);
                    SIXTEEN20.setBorder(Rectangle.RIGHT);
                   
                    

                    FIVE5.setBorder(Rectangle.LEFT);
                    SIX6.setBorder(Rectangle.NO_BORDER);
                    SEVEN7.setBorder(Rectangle.NO_BORDER);
                    EIGHT8.setBorder(Rectangle.RIGHT);
                    
                    ONE1.setBorder(Rectangle.LEFT);
                    TWO1.setBorder(Rectangle.NO_BORDER);
                    THREE1.setBorder(Rectangle.NO_BORDER);
                    FOUR4.setBorder(Rectangle.RIGHT);
                    
                    NINE9.setBorder(Rectangle.LEFT);
                    TEN10.setBorder(Rectangle.NO_BORDER);
                    ELEVEN11.setBorder(Rectangle.NO_BORDER);
                    TWELVE12.setBorder(Rectangle.RIGHT);
                    
                    THRITEEN13.setBorder(Rectangle.LEFT | Rectangle.BOTTOM);
                    FOURTEEN14.setBorder(Rectangle.BOTTOM);
                    FIFTEEN15.setBorder(Rectangle.BOTTOM);
                    SIXTEEN16.setBorder(Rectangle.RIGHT | Rectangle.BOTTOM);
                    
                    
                    

                    table5.addCell(ONE1);
                    table5.addCell(TWO1);
                    table5.addCell(THREE1);
                    table5.addCell(FOUR4);
                    table5.addCell(FIVE5);
                    table5.addCell(SIX6);
                    table5.addCell(SEVEN7);
                    table5.addCell(EIGHT8);
                    table5.addCell(NINE9);
                    table5.addCell(TEN10);
                    table5.addCell(ELEVEN11);
                    table5.addCell(TWELVE12);
                    table5.addCell(THRITEEN17);
                    table5.addCell(FOURTEEN18);
                    table5.addCell(FIFTEEN19);
                    table5.addCell(SIXTEEN20);
                    table5.addCell(THRITEEN13);
                    table5.addCell(FOURTEEN14);
                    table5.addCell(FIFTEEN15);
                    table5.addCell(SIXTEEN16);
                    
                    table5.setWidths(new int[]{25,25,25,25});    
                  
                    //--------------------- END OF TABLE5 -----------------------------
            
                  
                    PdfPTable table6 = new PdfPTable(12);
                    table6.setTotalWidth(500);
                    table6.setLockedWidth(true);
             ChTaxIntra cc=(ChTaxIntra)l2.get(0);
                    PdfPCell A = new PdfPCell(new Phrase("S.No:",boldFont4));
                    A.setRowspan(2);
                    PdfPCell B = new PdfPCell(new Phrase("Description"+Chunk.NEWLINE+"Of Goods",boldFont4));
                    B.setRowspan(2);
                    PdfPCell C=null;
                    for(int i=0;i<1;i++){
                     C= new PdfPCell(new Phrase("HSN Code:"+Chunk.NEWLINE+"(GST)",boldFont4));
                    C.setRowspan(2);
                    }
                    PdfPCell D = new PdfPCell(new Phrase("Qty"+Chunk.NEWLINE+cc.getUom(),boldFont4));
                    D.setRowspan(2);
                    PdfPCell E = new PdfPCell(new Phrase("Value Before"+Chunk.NEWLINE+"Tax \n /"+cc.getUom(),boldFont4));
                    E.setRowspan(2);
                    PdfPCell F = new PdfPCell(new Phrase("Value After"+Chunk.NEWLINE+"Tax \n  /"+cc.getUom(),boldFont4));
                    F.setRowspan(2);
                    PdfPCell G = new PdfPCell(new Phrase("Total Taxable "+Chunk.NEWLINE+"Value \u20B9",playfair));
                    G.setRowspan(2);
                    PdfPCell H = new PdfPCell(new Phrase("CGST",boldFont4));
                    H.setColspan(2);
                    PdfPCell I = new PdfPCell(new Phrase("SGST",boldFont4));
                    I.setColspan(2);
                    PdfPCell J = new PdfPCell(new Phrase("Total \u20B9",playfair));
                    J.setRowspan(2);
                    PdfPCell K = new PdfPCell(new Phrase("Rate %",boldFont4));
                    PdfPCell L = new PdfPCell(new Phrase("Amount \u20B9",playfair2));
                    PdfPCell M = new PdfPCell(new Phrase("Rate %",boldFont4));
                    PdfPCell N = new PdfPCell(new Phrase("Amount \u20B9",playfair2));
                    
                    
                    A.setBorder(Rectangle.LEFT | Rectangle.BOTTOM  | Rectangle.RIGHT);
                    B.setBorder(Rectangle.BOTTOM | Rectangle.RIGHT);
                    C.setBorder(Rectangle.BOTTOM  | Rectangle.RIGHT);
                    D.setBorder(Rectangle.BOTTOM  | Rectangle.RIGHT);
                    E.setBorder(Rectangle.BOTTOM  | Rectangle.RIGHT);
                    F.setBorder(Rectangle.BOTTOM | Rectangle.RIGHT);
                    G.setBorder(Rectangle.BOTTOM | Rectangle.RIGHT);
                    H.setBorder(Rectangle.BOTTOM | Rectangle.RIGHT);
                    I.setBorder(Rectangle.BOTTOM | Rectangle.RIGHT);
                    J.setBorder(Rectangle.BOTTOM | Rectangle.RIGHT);
                    K.setBorder(Rectangle.BOTTOM | Rectangle.RIGHT);  
                    L.setBorder(Rectangle.BOTTOM | Rectangle.RIGHT);
                    M.setBorder(Rectangle.BOTTOM | Rectangle.RIGHT);
                    N.setBorder(Rectangle.BOTTOM | Rectangle.RIGHT);
                    
                     A.setHorizontalAlignment (Element.ALIGN_CENTER);
                      B.setHorizontalAlignment (Element.ALIGN_CENTER);
                       C.setHorizontalAlignment (Element.ALIGN_CENTER);
                        D.setHorizontalAlignment (Element.ALIGN_CENTER);
                         E.setHorizontalAlignment (Element.ALIGN_CENTER);
                         F.setHorizontalAlignment (Element.ALIGN_CENTER);
                          G.setHorizontalAlignment (Element.ALIGN_CENTER);
                    H.setHorizontalAlignment (Element.ALIGN_CENTER);   
                    I.setHorizontalAlignment (Element.ALIGN_CENTER);
                     J.setHorizontalAlignment (Element.ALIGN_CENTER);
                      K.setHorizontalAlignment (Element.ALIGN_CENTER);
                       L.setHorizontalAlignment (Element.ALIGN_CENTER);
                        M.setHorizontalAlignment (Element.ALIGN_CENTER);
                         N.setHorizontalAlignment (Element.ALIGN_CENTER);
                         
                   
                    
                    table6.addCell(A);
                    table6.addCell(B);
                    table6.addCell(C);
                    table6.addCell(D);
                    table6.addCell(E);
                    table6.addCell(F);
                    table6.addCell(G);
                    table6.addCell(H);
                    table6.addCell(I);
                    table6.addCell(J);
                    table6.addCell(K);
                    table6.addCell(L);
                    table6.addCell(M);
                    table6.addCell(N);
//             for(Object o2:l2){
//                 
//             ChTaxIntra cc=(ChTaxIntra)o2;
//                 
//                    
//             }
              
                     PdfPCell celll,celll2;
                      Integer id=0;
                     
             for(Object o1:l2) 
             {    
                    ChTaxIntra cr=(ChTaxIntra) o1;
                   id++;
                   
                   System.out.println("0000000000iiiiiiiiiddddddd00::"+id);
                    celll=new PdfPCell(new Phrase(id.toString(), boldFont));
                    celll.setHorizontalAlignment(Element.ALIGN_CENTER);
                    table6.addCell(celll);
                    celll=new PdfPCell(new Phrase(cr.getProductDesc(),normalfont2));
                    celll.setHorizontalAlignment(Element.ALIGN_CENTER);
                    table6.addCell(celll);
                    celll=new PdfPCell(new Phrase(cr.getHsnCode(),normalfont2));
                    celll.setHorizontalAlignment(Element.ALIGN_CENTER);
                    table6.addCell(celll);
                    if(cr.getQty()==null){
                         celll=new PdfPCell(new Phrase());
                    celll.setHorizontalAlignment(Element.ALIGN_CENTER);
                    table6.addCell(celll);
                    }
                    else{
                    celll=new PdfPCell(new Phrase(df.format(cr.getQty()),normalfont2));
                    celll.setHorizontalAlignment(Element.ALIGN_CENTER);
                    table6.addCell(celll);
                    }
                    celll=new PdfPCell(new Phrase(df.format(cr.getBeforeTax()),normalfont2));
                    celll.setHorizontalAlignment(Element.ALIGN_CENTER);
                    table6.addCell(celll);
                    
                    
                      if(cr.getAfterTax()==null || cr.getAfterTax()==0)
                   {
                    celll=new PdfPCell(new Phrase("         ",boldFont4));
//                    celll.setHorizontalAlignment(Element.ALIGN_LEFT);
                 celll.setHorizontalAlignment(Element.ALIGN_CENTER);
                    table6.addCell(celll);
                   }
                   else {
                       celll=new PdfPCell(new Phrase(Float.toString(cr.getAfterTax()),boldFont4));
//                    celll.setHorizontalAlignment(Element.ALIGN_LEFT);
                  celll.setHorizontalAlignment(Element.ALIGN_CENTER);
                    table6.addCell(celll); 
                   }
                    
//                    celll=new PdfPCell(new Phrase(df.format(cr.getAfterTax()),normalfont2));
//                    celll.setHorizontalAlignment(Element.ALIGN_CENTER);
//                    table6.addCell(celll);
                    celll=new PdfPCell(new Phrase(df.format(cr.getTaxableValue()),normalfont2));
                    celll.setHorizontalAlignment(Element.ALIGN_CENTER);
                    table6.addCell(celll);
                    celll=new PdfPCell(new Phrase(df.format(cr.getCgRate()),normalfont2));
                    celll.setHorizontalAlignment(Element.ALIGN_CENTER);
                    table6.addCell(celll);
                    celll=new PdfPCell(new Phrase(df.format(cr.getCgAmt()),normalfont2));
                    celll.setHorizontalAlignment(Element.ALIGN_CENTER);
                    table6.addCell(celll);
                    celll=new PdfPCell(new Phrase(df.format(cr.getSgRate()),normalfont2));
                    celll.setHorizontalAlignment(Element.ALIGN_CENTER);
                    table6.addCell(celll);
                    celll=new PdfPCell(new Phrase(df.format(cr.getSgAmt()),normalfont2));
                    celll.setHorizontalAlignment(Element.ALIGN_CENTER);
                    table6.addCell(celll);
                    celll=new PdfPCell(new Phrase(df.format(cr.getChTotal()),normalfont2));
                    celll.setHorizontalAlignment(Element.ALIGN_CENTER);
                    table6.addCell(celll);
                 }   
                  // -- END OF 2ND ROW--------------  
                  
                    celll2=new PdfPCell(new Phrase("     ",boldFont4));
                    celll2.setHorizontalAlignment(Element.ALIGN_CENTER);
                    celll2.setBorder(Rectangle.BOTTOM | Rectangle.LEFT);
                    table6.addCell(celll2);
                  
                    celll2=new PdfPCell(new Phrase("Total",boldFont4));
                    celll2.setHorizontalAlignment(Element.ALIGN_CENTER);
                    celll2.setBorder(Rectangle.BOTTOM);
                    table6.addCell(celll2);
                    
                    celll2=new PdfPCell(new Phrase("     ",boldFont4));
                    celll2.setHorizontalAlignment(Element.ALIGN_CENTER);
                    celll2.setBorder(Rectangle.BOTTOM);
                    table6.addCell(celll2);
                    
                    celll2=new PdfPCell(new Phrase(df.format(pr.getTotalQty()),boldFont4));
                    celll2.setHorizontalAlignment(Element.ALIGN_CENTER);
                    celll2.setBorder(Rectangle.BOTTOM);
                    table6.addCell(celll2);
                    celll2=new PdfPCell(new Phrase(df.format(pr.getTotalValBtax()),boldFont4));
                    celll2.setHorizontalAlignment(Element.ALIGN_CENTER);
                    celll2.setBorder(Rectangle.BOTTOM);
                    table6.addCell(celll2);
                    celll2=new PdfPCell(new Phrase(df.format(pr.getTotalValAtax()),boldFont4));
                    celll2.setHorizontalAlignment(Element.ALIGN_CENTER);
                    celll2.setBorder(Rectangle.BOTTOM);
                    table6.addCell(celll2);
                    celll2=new PdfPCell(new Phrase(df.format(pr.getTotalTaxval()),boldFont4));
                    celll2.setHorizontalAlignment(Element.ALIGN_CENTER);
                    celll2.setBorder(Rectangle.BOTTOM);
                    table6.addCell(celll2);
                    celll2=new PdfPCell(new Phrase("     ",boldFont4));
                    celll2.setHorizontalAlignment(Element.ALIGN_CENTER);
                    celll2.setBorder(Rectangle.BOTTOM);
                    table6.addCell(celll2);
                    celll2=new PdfPCell(new Phrase(df.format(pr.getTotalCgstAmt()),boldFont4));
                    celll2.setHorizontalAlignment(Element.ALIGN_CENTER);
                    celll2.setBorder(Rectangle.BOTTOM);
                    table6.addCell(celll2);
                    celll2=new PdfPCell(new Phrase("     ",boldFont4));
                    celll2.setHorizontalAlignment(Element.ALIGN_CENTER);
                    celll2.setBorder(Rectangle.BOTTOM);
                    table6.addCell(celll2);
                    celll2=new PdfPCell(new Phrase(df.format(pr.getTotalSgstAmt()),boldFont4));
                    celll2.setHorizontalAlignment(Element.ALIGN_CENTER);
                    celll2.setBorder(Rectangle.BOTTOM);
                    table6.addCell(celll2);
                    celll2=new PdfPCell(new Phrase(df.format(pr.getTotalInv()),boldFont4));
                    celll2.setHorizontalAlignment(Element.ALIGN_CENTER);
                    celll2.setBorder(Rectangle.BOTTOM | Rectangle.RIGHT);
                    table6.addCell(celll2);
                    
                    
                    table6.setWidths(new int[]{5,14,8,8,8,8,8,5,6,5,6,9});
                       
                  // -------------- END OF TABLE6 ---------------------------------
                  
                    PdfPTable table7 = new PdfPTable(3);
                    table7.setTotalWidth(500);
                    table7.setLockedWidth(true);
                  
                    PdfPCell cel1,cel2,cel3;
                    cel1=new PdfPCell(new Phrase("Total Invoice amount in words:",boldFont4));
                    cel1.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cel1.setBorder(Rectangle.LEFT);
                    table7.addCell(cel1);
                    
                    cel1=new PdfPCell(new Phrase("Total Amount before Tax:",boldFont4));
                    cel1.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cel1.setBorder(Rectangle.LEFT | Rectangle.RIGHT );
                    table7.addCell(cel1);
                    
                    cel1=new PdfPCell(new Phrase(df.format(pr.getTotalTaxval()),normalfont2));
                    cel1.setHorizontalAlignment(Element.ALIGN_RIGHT);
                    cel1.setBorder(Rectangle.RIGHT);
                    table7.addCell(cel1);
                    
                    
                    cel2=new PdfPCell(new Phrase(word,normalfont2));
                    cel2.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cel2.setBorder(Rectangle.BOTTOM | Rectangle.LEFT);
                    table7.addCell(cel2);
                    
                    cel2=new PdfPCell(new Phrase("           ",normalfont2));
                    cel2.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cel2.setBorder(Rectangle.BOTTOM | Rectangle.LEFT  | Rectangle.RIGHT);
                    table7.addCell(cel2);
                    
                    cel2=new PdfPCell(new Phrase("          ",normalfont2));
                    cel2.setHorizontalAlignment(Element.ALIGN_RIGHT);
                    cel2.setBorder(Rectangle.BOTTOM | Rectangle.RIGHT);
                    table7.addCell(cel2);
                    
                    cel3=new PdfPCell(new Phrase("Bank Details",boldFont4));
                    cel3.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cel3.setBorder(Rectangle.BOTTOM | Rectangle.LEFT | Rectangle.ALIGN_CENTER);
                    table7.addCell(cel3);
                    
                    cel2=new PdfPCell(new Phrase("Add:CGST :  2.5%",boldFont4));
                    cel2.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cel2.setBorder(Rectangle.BOTTOM | Rectangle.LEFT  | Rectangle.RIGHT);
                    table7.addCell(cel2);
                    
                    cel2=new PdfPCell(new Phrase(df.format(pr.getTotalCgstAmt()),normalfont2));
                    cel2.setHorizontalAlignment(Element.ALIGN_RIGHT);
                    cel2.setBorder(Rectangle.BOTTOM | Rectangle.RIGHT);
                    table7.addCell(cel2);
                 
                    table7.setWidths(new int[]{50,35,15});
                  
                   //---------------------- END OF TABLE7 ---------------------------
                   
                    PdfPTable table8 = new PdfPTable(4);
                    table8.setTotalWidth(500);
                    table8.setLockedWidth(true);
                    
                    PdfPCell cel4,cel5,cel6,cel7;
                   
                    cel4=new PdfPCell(new Phrase("Bank Name:",boldFont4));
                    cel4.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cel4.setBorder(Rectangle.BOTTOM | Rectangle.LEFT);
                    table8.addCell(cel4);
                    
                    cel4=new PdfPCell(new Phrase(pr.getBankName(),normalfont2));
                    cel4.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cel4.setBorder(Rectangle.BOTTOM | Rectangle.LEFT);
                    table8.addCell(cel4);
                    
                    cel4=new PdfPCell(new Phrase("Add:SGST :  2.5%",boldFont4));
                    cel4.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cel4.setBorder(Rectangle.BOTTOM | Rectangle.LEFT);
                    table8.addCell(cel4);
                    
                     cel4=new PdfPCell(new Phrase(df.format(pr.getTotalSgstAmt()),normalfont2));
                    cel4.setHorizontalAlignment(Element.ALIGN_RIGHT);
                    cel4.setBorder(Rectangle.BOTTOM | Rectangle.LEFT | Rectangle.RIGHT);
                    table8.addCell(cel4);
                    
                    cel5=new PdfPCell(new Phrase("Bank Branch:",boldFont4));
                    cel5.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cel5.setBorder(Rectangle.BOTTOM | Rectangle.LEFT);
                    table8.addCell(cel5);
                    
                    cel5=new PdfPCell(new Phrase(pr.getBankBranch(),normalfont2));
                    cel5.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cel5.setBorder(Rectangle.BOTTOM | Rectangle.LEFT);
                    table8.addCell(cel5);
                    
                    cel5=new PdfPCell(new Phrase("Total Tax Amount:",boldFont4));
                    cel5.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cel5.setBorder(Rectangle.BOTTOM | Rectangle.LEFT);
                    table8.addCell(cel5);
                    
                    cel5=new PdfPCell(new Phrase(df.format(pr.getTotalCgstAmt()+pr.getTotalSgstAmt()),normalfont2));
                    cel5.setHorizontalAlignment(Element.ALIGN_RIGHT);
                    cel5.setBorder(Rectangle.BOTTOM | Rectangle.LEFT | Rectangle.RIGHT);
                    table8.addCell(cel5);
                    
                    cel6=new PdfPCell(new Phrase("Bank A/C:",boldFont4));
                    cel6.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cel6.setBorder(Rectangle.BOTTOM | Rectangle.LEFT);
                    table8.addCell(cel6);
                    
                    cel6=new PdfPCell(new Phrase(pr.getBankAc(),normalfont2));
                    cel6.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cel6.setBorder(Rectangle.BOTTOM | Rectangle.LEFT);
                    table8.addCell(cel6);
                    
                    cel6=new PdfPCell(new Phrase("Add:Round Value :",boldFont4));
                    cel6.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cel6.setBorder(Rectangle.BOTTOM | Rectangle.LEFT);
                    table8.addCell(cel6);
                    
                    cel6=new PdfPCell(new Phrase(df.format(this.round_val),normalfont2));
                    cel6.setHorizontalAlignment(Element.ALIGN_RIGHT);
                    cel6.setBorder(Rectangle.BOTTOM | Rectangle.LEFT | Rectangle.RIGHT);
                    table8.addCell(cel6);
                    
                    cel7=new PdfPCell(new Phrase("Bank IFSC: ",boldFont4));
                    cel7.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cel7.setBorder(Rectangle.BOTTOM | Rectangle.LEFT);
                    table8.addCell(cel7);
                    
                    cel7=new PdfPCell(new Phrase(pr.getBankIfsc(),normalfont2));
                    cel7.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cel7.setBorder(Rectangle.BOTTOM | Rectangle.LEFT);
                    table8.addCell(cel7);
                    
                    cel7=new PdfPCell(new Phrase("Total Amount after Tax:",boldFont4));
                    cel7.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cel7.setBorder(Rectangle.BOTTOM | Rectangle.LEFT);
                    table8.addCell(cel7);
                    
                    cel7=new PdfPCell(new Phrase(df.format(pr.getTotalInv()),normalfont2));
                    cel7.setHorizontalAlignment(Element.ALIGN_RIGHT);
                    cel7.setBorder(Rectangle.BOTTOM | Rectangle.LEFT | Rectangle.RIGHT);
                    table8.addCell(cel7);
                    
                    
                    
                   table8.setWidths(new int[]{25,25,35,15});
                   
                  // ----------------- END OF TABLE8 --------------------------------
                  
                  PdfPTable table9 = new PdfPTable(4);
                    table9.setTotalWidth(500);
                    table9.setLockedWidth(true);
                  
                   PdfPCell cel8;
                   
                    cel8=new PdfPCell(new Phrase("Terms & conditions ",boldFont4));
                    cel8.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cel8.setBorder(Rectangle.BOTTOM | Rectangle.LEFT);
                    table9.addCell(cel8);
                    
                    cel8=new PdfPCell(new Phrase("                ",boldFont4));
                    cel8.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cel8.setBorder(Rectangle.LEFT);
                    table9.addCell(cel8);
                    
                    cel8=new PdfPCell(new Phrase("GST on Reverse Charge ",boldFont4));
                    cel8.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cel8.setBorder(Rectangle.BOTTOM | Rectangle.LEFT);
                    table9.addCell(cel8);
                    
                   System.out.println("reverse charge issssssssss"+pr.getGstReverseCharge());
                   if(pr.getGstReverseCharge()==null)
                   {
                    cel8=new PdfPCell(new Phrase("         ",boldFont4));
                    cel8.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cel8.setBorder(Rectangle.BOTTOM | Rectangle.LEFT | Rectangle.RIGHT);
                    table9.addCell(cel8);
                   }
                   else {
                       cel8=new PdfPCell(new Phrase(Float.toString(pr.getGstReverseCharge()),boldFont4));
                    cel8.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cel8.setBorder(Rectangle.BOTTOM | Rectangle.LEFT | Rectangle.RIGHT);
                    table9.addCell(cel8); 
                   }
                    
                    table9.setWidths(new int[]{50,19,16,15});
                    
                  // ----------------- END OF TABLE9 -------------------------------------
                  
                  PdfPTable table10 = new PdfPTable(3);
                    table10.setTotalWidth(500);
                    table10.setLockedWidth(true);
                  
                    PdfPCell cel9,cel10,cel11,cel12,cel13;
                    
                    cel9=new PdfPCell(new Phrase("1. We declare that this invoice shows the actual price of the goods\n" +
"described and that all are true and correct. 2. We declare to the best\n" +
"of our knowledge and belief that particulars stated herein are true\n" 
,normalfont2));
                    cel9.setPadding (0.0f);
                    cel9.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cel9.setBorder(Rectangle.LEFT);
                    table10.addCell(cel9);
                    
                    cel9=new PdfPCell(new Phrase("           ",boldFont4));
                    cel9.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cel9.setBorder(Rectangle.LEFT);
                    table10.addCell(cel9);
                    
                    cel9=new PdfPCell(new Phrase("Ceritified that the particulars given\n" +
"above are true and correct",normalfont2));
                    cel9.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cel9.setBorder(Rectangle.BOTTOM | Rectangle.LEFT | Rectangle.RIGHT);
                    table10.addCell(cel9);
                    
                     cel10=new PdfPCell(new Phrase("and correct and there is no additional consideration accuring to use\n" +
"either  directly or indirectly in any manner other amounts indicated\n" +
"here. 3. Interest: We charge interest @24% p.a after 15days from the sale of invoice date." 
,normalfont2));
                    cel10.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cel10.setBorder(Rectangle.LEFT | Rectangle.BOTTOM);
                    table10.addCell(cel10);
                    
                    cel10=new PdfPCell(new Phrase("           ",boldFont4));
                    cel10.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cel10.setBorder(Rectangle.LEFT);
                    table10.addCell(cel10);
                    
                    cel10=new PdfPCell(new Phrase("For Sri Sai Krishna\n" +
"Stone Crusher",boldFont4));
                    cel10.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cel10.setBorder(Rectangle.BOTTOM | Rectangle.LEFT | Rectangle.RIGHT);
                    table10.addCell(cel10);
                    
                    
                    cel11=new PdfPCell(new Phrase("Received the goods correctly and good condition",boldFont4));
                    cel11.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cel11.setBorder(Rectangle.LEFT | Rectangle.BOTTOM);
                    table10.addCell(cel11);
                    
                    cel11=new PdfPCell(new Phrase("           ",boldFont4));
                    cel11.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cel11.setBorder(Rectangle.LEFT);
                    table10.addCell(cel11);
                    
                    cel11=new PdfPCell(new Phrase("             ",boldFont4));
                    cel11.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cel11.setBorder(Rectangle.LEFT | Rectangle.RIGHT);
                    table10.addCell(cel11);
                    
                    
                    
                    cel12=new PdfPCell(new Phrase("          "+"\n"+"\n"+"\n",boldFont4));
                    cel12.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cel12.setBorder(Rectangle.LEFT | Rectangle.BOTTOM);
                    table10.addCell(cel12);
                    
                    cel12=new PdfPCell(new Phrase("           ",boldFont4));
                    cel12.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cel12.setBorder(Rectangle.LEFT);
                    table10.addCell(cel12);
                    
                    cel12=new PdfPCell(new Phrase("             ",boldFont4));
                    cel12.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cel12.setBorder(Rectangle.LEFT | Rectangle.RIGHT);
                    table10.addCell(cel12);
                    
                    cel13=new PdfPCell(new Phrase("Signature of the Customer",normalfont2));
                    cel13.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cel13.setBorder(Rectangle.LEFT | Rectangle.BOTTOM);
                    table10.addCell(cel13);
                    
                    cel13=new PdfPCell(new Phrase("Common Seal",boldFont4));
                    cel13.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cel13.setBorder(Rectangle.LEFT | Rectangle.TOP | Rectangle.BOTTOM);
                    table10.addCell(cel13);
                    
                    cel13=new PdfPCell(new Phrase(" Authorised Signatory ",normalfont2));
                    cel13.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cel13.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
                    table10.addCell(cel13);
                   
                    
                     table10.setWidths(new int[]{50,19,31});
                    
                    // ---------------------------- END OF TABVE10 -----------------------------------------------
                     PdfPTable table11 = new PdfPTable(1);
                    table11.setTotalWidth(500);
                    table11.setLockedWidth(true);
                    
                    PdfPCell cel14;
                    
                    cel14=new PdfPCell(new Phrase("Subject to Guntur Jurisdiction only.",normalfont2));
                    cel14.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cel14.setBorder(Rectangle.NO_BORDER);
                    table11.addCell(cel14);
                    
                    
                     table11.setWidths(new int[]{100});
                    
                    // ------------------------ END OF TABLE11 --------------------------------
                    
                        PdfPTable table12 = new PdfPTable(3);
                    table12.setTotalWidth(500);
                    table12.setLockedWidth(true);
                

                    PdfPCell side3;
                    
                    side3=new PdfPCell(new Phrase("        ",boldFont4));
                    side3.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side3.setBorder(Rectangle.TOP | Rectangle.LEFT);
                    table12.addCell(side3);

                    side3=new PdfPCell(new Phrase("        ",boldFont4));
                    side3.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side3.setBorder(Rectangle.TOP | Rectangle.LEFT);
                    table12.addCell(side3);

                    side3=new PdfPCell(new Phrase("        ",boldFont4));
                    side3.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side3.setBorder(Rectangle.TOP | Rectangle.LEFT | Rectangle.RIGHT);
                    table12.addCell(side3);

                    
                    
                    side3=new PdfPCell(new Phrase("      ",boldFont4));
                    side3.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side3.setBorder(Rectangle.LEFT);
                    table12.addCell(side3);

                  
                    side3=new PdfPCell(image1);
                    side3.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side3.setBorder(Rectangle.LEFT);
                    table12.addCell(side3);

                    side3=new PdfPCell(new Phrase("     ",boldFont4));
                    side3.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side3.setBorder(Rectangle.LEFT | Rectangle.RIGHT);
                    table12.addCell(side3);
                
                    
                    
                    
                    side3=new PdfPCell(image);
                    side3.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side3.setBorder(Rectangle.LEFT);
                    table12.addCell(side3);
                    
                    side3=new PdfPCell(p);
                    side3.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side3.setBorder(Rectangle.LEFT);
                    table12.addCell(side3);
                    

                    side3=new PdfPCell(new Phrase("DUPLICATE"+"\n \n FOR"+"\n \n TRANSPORTER",boldFont4));
                    side3.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side3.setBorder(Rectangle.LEFT | Rectangle.RIGHT);
                    table12.addCell(side3);
                    
                    
                    side3=new PdfPCell(new Phrase("        ",boldFont4));
                    side3.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side3.setBorder(Rectangle.LEFT  | Rectangle.BOTTOM);
                    table12.addCell(side3);

                    side3=new PdfPCell(new Phrase("        ",boldFont4));
                    side3.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side3.setBorder(Rectangle.LEFT  | Rectangle.BOTTOM);
                    table12.addCell(side3);

                    side3=new PdfPCell(new Phrase("        ",boldFont4));
                    side3.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side3.setBorder(Rectangle.LEFT | Rectangle.RIGHT  | Rectangle.BOTTOM);
                    table12.addCell(side3);
                    
                    table12.setWidths(new int[]{25,60,15});

                    // ------------------------------- END OF  TABLE12 ------------------------------
                    
                     PdfPTable table13 = new PdfPTable(3);
                    table13.setTotalWidth(500);
                    table13.setLockedWidth(true);
                

                    PdfPCell side4;
                    
                    side4=new PdfPCell(new Phrase("        ",boldFont4));
                    side4.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side4.setBorder(Rectangle.TOP | Rectangle.LEFT);
                    table13.addCell(side4);

                    side4=new PdfPCell(new Phrase("        ",boldFont4));
                    side4.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side4.setBorder(Rectangle.TOP | Rectangle.LEFT);
                    table13.addCell(side4);

                    side4=new PdfPCell(new Phrase("        ",boldFont4));
                    side4.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side4.setBorder(Rectangle.TOP | Rectangle.LEFT | Rectangle.RIGHT);
                    table13.addCell(side4);

                    
                    
                    side4=new PdfPCell(new Phrase("      ",boldFont4));
                    side4.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side4.setBorder(Rectangle.LEFT);
                    table13.addCell(side4);

                  
                    side4=new PdfPCell(image1);
                    side4.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side4.setBorder(Rectangle.LEFT);
                    table13.addCell(side4);

                    side4=new PdfPCell(new Phrase("     ",boldFont4));
                    side4.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side4.setBorder(Rectangle.LEFT | Rectangle.RIGHT);
                    table13.addCell(side4);
                
                    
                    
                    
                    side4=new PdfPCell(image);
                    side4.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side4.setBorder(Rectangle.LEFT);
                    table13.addCell(side4);
                    
                    side4=new PdfPCell(p);
                    side4.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side4.setBorder(Rectangle.LEFT);
                    table13.addCell(side4);
                    

                    side4=new PdfPCell(new Phrase("TRIPLICATE"+"\n \n FOR"+"\n \n SUPPLIER",boldFont4));
                    side4.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side4.setBorder(Rectangle.LEFT | Rectangle.RIGHT);
                    table13.addCell(side4);
                    
                    
                    side4=new PdfPCell(new Phrase("        ",boldFont4));
                    side4.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side4.setBorder(Rectangle.LEFT  | Rectangle.BOTTOM);
                    table13.addCell(side4);

                    side4=new PdfPCell(new Phrase("        ",boldFont4));
                    side4.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side4.setBorder(Rectangle.LEFT  | Rectangle.BOTTOM);
                    table13.addCell(side4);

                    side4=new PdfPCell(new Phrase("        ",boldFont4));
                    side4.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side4.setBorder(Rectangle.LEFT | Rectangle.RIGHT  | Rectangle.BOTTOM);
                    table13.addCell(side4);
                    
                    table13.setWidths(new int[]{25,60,15});
                    
                    
                    
                    
                    
                    
                    
                    
		       
                     
                     
                     document.open();		       

			
					document.add(table);
                                        document.add(table2);
                                        document.add(table3);
                                        document.add(table4);
                                        document.add(table5);
                                        document.add(table6);
                                        document.add(table7);
                                        document.add(table8);
                                        document.add(table9);
                                        document.add(table10);
                                        document.add(table11);
                                      
												    

       				       document.newPage();            //Opened new page
                                       
                                       document.add(table12);
                                        document.add(table2);
                                        document.add(table3);
                                        document.add(table4);
                                        document.add(table5);
                                        document.add(table6);
                                        document.add(table7);
                                        document.add(table8);
                                        document.add(table9);
                                        document.add(table10);
                                        document.add(table11);
                                       
                                       document.newPage(); 
                                       
                                       document.add(table13);
                                        document.add(table2);
                                        document.add(table3);
                                        document.add(table4);
                                        document.add(table5);
                                        document.add(table6);
                                        document.add(table7);
                                        document.add(table8);
                                        document.add(table9);
                                        document.add(table10);
                                        document.add(table11);
					
		         document.close();

//			             file.close();
                          
        b1=b.toByteArray();
                                    

            System.out.println("Pdf created successfully..");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } 
        
        
        
        
        
        return b1;
    }  
        
    
    

    public List getGrades() {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        List<Grades> list = new ArrayList<>();
      
        try {
            Criteria c = s.createCriteria(Grades.class);
           c.setProjection(Projections.property("grade"));
            list = c.list();
        } catch (Exception e) {
            System.out.println("the error in retrieving grades in taximanager is------>"+e);

        }finally{
            t.commit();
            s.close();
        }
        System.out.println("Grades list is:------->>>>" + list);
        return list;
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

    public void insertTaxInvoice(TaxInvoiceDto tdto) {
        System.out.println("the invoice innnsertionnnnn");
       Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        System.out.println("****************"+tdto.getBillToName()+"**********"+tdto.getBillToAddress());
        PrTaxIntra pc = new PrTaxIntra();
          List listt=new ArrayList();
        try {
         //   int iw=Math.round(tdto.getTotalInv());
         
         int ids=tdto.getInvoiceNo();
            System.out.println("idddddddssssssss:::"+ids);
           Criteria cl = s.createCriteria(PrTaxIntra.class);
             cl.add(Restrictions.eq("invoiceNo",ids));
            listt=cl.list();
            int id=0;
           for(Object o:listt){
               PrTaxIntra pt=(PrTaxIntra)o;
               id=pt.getInvoiceNo();
           }
           if(tdto.getInvoiceNo()==id){
               System.out.println("nooooooooo");
           }
           else{
              // System.out.println("sssssssss");
           List<String> lg=tdto.getProductDesc();
               System.out.println("pprrrrrrroooooo::"+lg);
               String grades = null;
               for(int il=0;il<lg.size();il++){
                   grades=lg.get(0);
                   System.out.println("gradessssssss:::"+grades);
               }
           
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
            System.out.println("gradeeeeeee:::"+tdto.getGrade());
            pc.setGrade(grades);
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
            pc.setBankName(tdto.getBankname());
            pc.setBankBranch(tdto.getBankbranch());
//            pc.setMining(tdto.getMining());
//            pc.setWaybill(tdto.getWaybill());
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
            List<String> l10=tdto.getUom();
            System.out.println("----------09999999--------->>>>>"+l10);
            List<Float> l4 = tdto.getBeforeTax();
            List<Float> l5 = tdto.getAfterTax();
            List<Float> l6 = tdto.getTaxableValue();
            List<Float> l7 =tdto.getCgRate();
            List<Float> l8 =tdto.getCgAmt();
            List<Float> l9 = tdto.getSgRate();
            List<Float> l = tdto.getSgAmt();
            List<Float> lf=tdto.getChTotal();

            Transaction t1 = s1.beginTransaction();
            for (int i = 0; i < l1.size(); i++) {
                ChTaxIntra cc = new ChTaxIntra();
                cc.setPrTaxIntra(pc);
                System.out.println("--------------------child--------------" + l1.get(i) + "&&&&&" + l5.get(i) + "(((((((((");
               // System.out.println("------------------" + l2.get(i) + ")))))))))))" + l3.get(i) + "**" + l4.get(i));
                if(l1.get(i)!=null)
                cc.setProductDesc(l1.get(i));
                if(l2.get(i)!=null)
                cc.setHsnCode(l2.get(i));
                if((!"Frieght Charges".equals(l1.get(i)))||(!"FRIEGHT CHARGES".equals(l1.get(i)))){
                if(i==0)
                cc.setQty(l3.get(i));
                }
//                if(l3.get(i)!=null)
//                cc.setQty(l3.get(i));
                if(l10.get(i)!=null)
                cc.setUom(l10.get(i));
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
             String mail=null;
             for(Object o:ctlist)
             {
                 Login list=(Login) o;
                 mobile=list.getMobileNo();
                 mail=list.getEmail();
             }
             System.out.println("&&&&&&&&&&&&&&");
           
             String invdate = tdto.getInvoiceDate();
             SimpleDateFormat sf1 = new SimpleDateFormat("dd/MM/yy");
            Date  invdate1= sf1.parse(invdate);
            System.out.println("dateeeeeeeee############@@@@"+invdate1);
        
          Float totalInv=tdto.getTotalInv();
          int ff=Math.round(totalInv);
          System.out.println("invvvvvvvvv:::"+ff);
         
        //  String number=ld.getMobileNo();
           // sendMail(tdto,mail,);
             String user = "Nivriti";
        int randomPIN = (int)(Math.random()*900000)+100000;
            // Replace with your API KEY (We have sent API KEY on activation email, also available on panel)
            String apikey = "sDBGKLZExIm73SEAu8RH";

            // Replace with the destination mobile Number to which you want to send sms
          //  String mobile = "8099616198";

            // Replace if you have your own Sender ID, else donot change
            String senderid = "SVKRMI";
            
          String s10=null;String message1="";String arr[]=null,arr1[]=null;
              List<String> grade=tdto.getProductDesc();
         System.out.println("lllllliiiiiiii"+grade);
       for(int i1=0;i1<1;i1++){
            s10=grade.get(0);
             System.out.println("llllllllllll"+s10);
              message1 +=s10;
             System.out.println("msgggggg"+message1);
              arr=message1.split(" ");
             System.out.println("%%%%%%%%%%$$$$$$$$$$"+arr);
       }
        String str="%20";
       for(int i1=0;i1<arr.length;i1++){
      str+=arr[i1]+"%20";
          
               }
        System.out.println("44444444444444444"+str);
        
        
        
        String message22="";
         String bname=tdto.getBillToName();
          System.out.println("nameeeeeeee>>>"+bname);
          message22+=bname;
          arr1=message22.split(" ");
            System.out.println("aaaaarrrrrrrr1111111111"+arr1);
         String str1="%20";
       for(int i2=0;i2<arr1.length;i2++){
      str1+=arr1[i2]+"%20";
          
               }
        System.out.println("55555555555555555"+str1);
        
        
         String dest=tdto.getShipAddress();
          String fin_dest="%20";
             String sso[] = dest.split("\\r?\\n");
             ArrayList<String> arrList = new ArrayList<>(Arrays.asList(sso)) ;
             System.out.println("list issss"+arrList);
          for(int i=0;i<arrList.size();i++) {
             String fp="%20";
              fin_dest+=arrList.get(i).replace(" ","%20")+"%20";
               
          }
           System.out.println("addrrrrrrr"+fin_dest);
          
          
             Float qty=tdto.getTotalQty();
                System.out.println("qqqqq"+qty);
                int qty1=Math.round(tdto.getTotalQty());
                System.out.println("qqqqqqq111111111"+qty1);
                
                
                String s11=null;String message2="";
                List<String> uom=tdto.getUom();
                System.out.println("uuuuuuuuuu"+uom);
                for(int i2=0;i2<uom.size();i2++){
            s11=uom.get(i2);
             System.out.println("uuuooooooommmmmmm"+s10);
              message2 +=s11;
             System.out.println("msgggggg222222222"+message2);
             
       }
                
                
            // Replace with your Message content
            String message ="Dear%20Admin%2C%20Bill%20has%20been%20generated%20on%20"+invdate+"%20With%20Grade:%20"+str+"%20and%20Quantity:"+qty1+message2+"%20Party%20Name:"+str1+"%20With%20an%20amount%20of%20Rs."+ff+"%20to%20"+fin_dest;
            System.out.println("msgggggggggg//////"+message);
           
            // For Plain Text, use "txt" ; for Unicode symbols or regional Languages like hindi/tamil/kannada use "uni"
            String type = "txt";
            URLConnection myURLConnection = null;
            URL myURL = null;
            BufferedReader reader = null;

            String mainUrl ="http://smshorizon.co.in/api/sendsms.php?";//"http://smshorizon.co.in/compose-sms.php";// ;
            //Prepare parameter string
            StringBuilder sbPostData = new StringBuilder(mainUrl);
            sbPostData.append("user=" + user);
            sbPostData.append("&apikey=" +apikey );
            //sbPostData.append("&message=" +"OTP%20is"+String.valueOf(randomPIN) );
        //    sbPostData.append("&message="+ message3);
        
            sbPostData.append("&message="+ message);
          //  sbPostData.append("&message11111111111="+ m5);
              
            System.out.println("\n ddddddddd"+randomPIN);
            sbPostData.append("&mobile=" + mobile);
            sbPostData.append("&senderid=" + senderid);
            sbPostData.append("&type=" + type);

            //final string
            mainUrl = sbPostData.toString();
            System.out.println("URL to Send SMS-" + mainUrl);
            try {
                //prepare connection
                myURL = new URL(mainUrl);
                myURLConnection = myURL.openConnection();
                myURLConnection.connect();
                
                System.out.println("\n mmmmmmmmmmmmmmm"+myURLConnection);
                
                reader = new BufferedReader(new InputStreamReader(myURLConnection.getInputStream()));
                System.out.println("\n hhhhhhhhhhhhhhh"+reader);
                //reading response
                String response = null;
                System.out.println("\n bbbbbbbbbbbbb"+response);
                while ((response = reader.readLine()) != null) {
                    //print response
                    System.out.println("\n sssssssssss"+response+reader.readLine());
                    
                }
                System.out.println(response);
                //finally close connection
               reader.close();


            } catch (IOException e) {
                e.printStackTrace();
            }            
            
            t1.commit();
            s1.close();
           }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("the exception in insertion off tax in tax manager is-----*******%%#$$$$$$$$$$########>"+e);
        }

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
   
   public void deleteTax1(int inv) {
         Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        try {

            PrTaxIntra pq = new PrTaxIntra();
            Criteria cr = s.createCriteria(PrTaxIntra.class);
            pq = (PrTaxIntra) cr.add(Restrictions.eq("invoiceNo",inv)).uniqueResult();
            s.delete(pq);
            t.commit();
            System.out.println("/n deleted successfully");

        } 
        catch (Exception e) {
            System.out.println("Exception during delete is caught" + e);
        }
       
   }
   
   
    public void updateInvoice(TaxInvoiceDto tdto,int lid) {
          System.out.println("the invoice innnsertionnnnn");
       Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        System.out.println("****************"+tdto.getBillToName()+"**********"+tdto.getBillToAddress());
        PrTaxIntra pc = new PrTaxIntra();
          List listt=new ArrayList();
        try {
         //   int iw=Math.round(tdto.getTotalInv());
          Criteria c2 = s.createCriteria(Login.class);
             c2.add(Restrictions.eq("lid",lid));
            List list2=c2.list();
          String loginid=null;
           for(Object o:list2){
               Login pt=(Login)o;
              loginid=pt.getLoginId();
               System.out.println("loginiddddd::"+loginid);
           }
           
         pc.setGeneratedby(loginid);
         int ids=tdto.getInvoiceNo();
            System.out.println("idddddddssssssss:::"+ids);
           Criteria cl = s.createCriteria(PrTaxIntra.class);
             cl.add(Restrictions.eq("invoiceNo",ids));
            listt=cl.list();
            int id=0;
           for(Object o:listt){
               PrTaxIntra pt=(PrTaxIntra)o;
               id=pt.getInvoiceNo();
           }
           if(tdto.getInvoiceNo()==id){
               System.out.println("nooooooooo");
           }
           else{
              // System.out.println("sssssssss");
           List<String> lg=tdto.getProductDesc();
               System.out.println("pprrrrrrroooooo::"+lg);
               String grades = null;
               for(int il=0;il<lg.size();il++){
                   grades=lg.get(0);
                   System.out.println("gradessssssss:::"+grades);
               }
         
               
            String doj = tdto.getInvoiceDate();
            String dojs=tdto.getDateOfSupply();
            System.out.println(tdto.getInvoiceDate()+"mmmmmmmmmmmmm" + tdto.getDateOfSupply());
            SimpleDateFormat sf = new SimpleDateFormat("dd/MM/yy");
            Date doj1 = sf.parse(doj);
            Date doj2=sf.parse(dojs);
            System.out.println("-------------date--------" + doj1);
            pc.setGeneratedby(tdto.getGeneratedby());
            pc.setEditedby(loginid);
            pc.setInvoiceNo(tdto.getInvoiceNo());
            pc.setTransportMode(tdto.getTransportMode());
            pc.setInvoiceDate(doj1);
            pc.setVehNo(tdto.getVehNo());
            pc.setReverseCharge(tdto.getReverseCharge());
            pc.setDateOfSupply(doj2);
            System.out.println("gradeeeeeee:::"+tdto.getGrade());
            pc.setGrade(grades);
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
            pc.setBankName(tdto.getBankname());
            pc.setBankBranch(tdto.getBankbranch());
          //  pc.setMining(tdto.getMining());
         //   pc.setWaybill(tdto.getWaybill());
         //   pc.setInvTot(iw);
            s.save(pc);
            t.commit();

            Criteria c = s.createCriteria(PrTaxIntra.class);
            pc = (PrTaxIntra) c.add(Restrictions.eq("invoiceDate", doj1)).add(Restrictions.eq("invoiceNo", tdto.getInvoiceNo())).uniqueResult();
            s.close();

            Session s1 = HibernateUtil.getSessionFactory().openSession();
            // System.out.println("-------pc---------->"+pc);
            List<String> l1 =tdto.getProductDesc();
            System.out.println("----------------+-------->" + l1.size());
            List<String> l2 =tdto.getHsnCode();
            System.out.println("-------------------09------------->" + l2);
            List<Float> l3 = tdto.getQty();
            System.out.println("-------------------09-46------------>" + l3);
            List<String> l10=tdto.getUom();
            System.out.println("----------09999999--------->>>>>"+l10);
            List<Float> l4 = tdto.getBeforeTax();
            List<Float> l5 = tdto.getAfterTax();
            List<Float> l6 = tdto.getTaxableValue();
            List<Float> l7 = tdto.getCgRate();
            List<Float> l8 = tdto.getCgAmt();
            List<Float> l9 = tdto.getSgRate();
            List<Float> l  = tdto.getSgAmt();
            List<Float> lf =tdto.getChTotal();

            Transaction t1 = s1.beginTransaction();
            for (int i = 0; i < l1.size(); i++) {
                ChTaxIntra cc = new ChTaxIntra();
                cc.setPrTaxIntra(pc);
                System.out.println("--------------------child--------------" + l1.get(i) + "&&&&&" + l5.get(i) + "(((((((((");
               // System.out.println("------------------" + l2.get(i) + ")))))))))))" + l3.get(i) + "**" + l4.get(i));
                if(l1.get(i)!=null)
                cc.setProductDesc(l1.get(i));
                if(l2.get(i)!=null)
                cc.setHsnCode(l2.get(i));
                if((!"Frieght Charges".equals(l1.get(i)))||(!"FRIEGHT CHARGES".equals(l1.get(i)))){
                if(i==0)
                cc.setQty(l3.get(i));
                }
//                if(l3.get(i)!=null)
//                cc.setQty(l3.get(i));
                if(l10.get(i)!=null)
                cc.setUom(l10.get(i));
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
             String mail=null;
             for(Object o:ctlist)
             {
                 Login list=(Login) o;
                 mobile=list.getMobileNo();
                 mail=list.getEmail();
             }
             System.out.println("&&&&&&&&&&&&&&");
           
             String invdate = tdto.getInvoiceDate();
             SimpleDateFormat sf1 = new SimpleDateFormat("dd/MM/yy");
            Date  invdate1= sf1.parse(invdate);
            System.out.println("dateeeeeeeee############@@@@"+invdate1);
        
          Float totalInv=tdto.getTotalInv();
          int ff=Math.round(totalInv);
          System.out.println("invvvvvvvvv:::"+ff);
         
        //  String number=ld.getMobileNo();
          //  sendMail(tdto,mail);
             String user = "Nivriti";
        int randomPIN = (int)(Math.random()*900000)+100000;
            // Replace with your API KEY (We have sent API KEY on activation email, also available on panel)
            String apikey = "sDBGKLZExIm73SEAu8RH";

            // Replace with the destination mobile Number to which you want to send sms
          //  String mobile = "8099616198";

            // Replace if you have your own Sender ID, else donot change
            String senderid = "SVKRMI";
            
          String s10=null;String message1="";String arr[]=null,arr1[]=null;
              List<String> grade=tdto.getProductDesc();
         System.out.println("lllllliiiiiiii"+grade);
       for(int i1=0;i1<1;i1++){
            s10=grade.get(0);
             System.out.println("llllllllllll"+s10);
              message1 +=s10;
             System.out.println("msgggggg"+message1);
              arr=message1.split(" ");
             System.out.println("%%%%%%%%%%$$$$$$$$$$"+arr);
       }
        String str="%20";
       for(int i1=0;i1<arr.length;i1++){
      str+=arr[i1]+"%20";
          
               }
        System.out.println("44444444444444444"+str);
        
        
        
        String message22="";
         String bname=tdto.getBillToName();
          System.out.println("nameeeeeeee>>>"+bname);
          message22+=bname;
          arr1=message22.split(" ");
            System.out.println("aaaaarrrrrrrr1111111111"+arr1);
         String str1="%20";
       for(int i2=0;i2<arr1.length;i2++){
      str1+=arr1[i2]+"%20";
          
               }
        System.out.println("55555555555555555"+str1);
        
        
         String dest=tdto.getShipAddress();
          String fin_dest="%20";
             String sso[] = dest.split("\\r?\\n");
             ArrayList<String> arrList = new ArrayList<>(Arrays.asList(sso)) ;
             System.out.println("list issss"+arrList);
          for(int i=0;i<arrList.size();i++) {
             String fp="%20";
              fin_dest+=arrList.get(i).replace(" ","%20")+"%20";
               
          }
           System.out.println("addrrrrrrr"+fin_dest);
          
          
             Float qty=tdto.getTotalQty();
                System.out.println("qqqqq"+qty);
                int qty1=Math.round(tdto.getTotalQty());
                System.out.println("qqqqqqq111111111"+qty1);
                
                
                String s11=null;String message2="";
                List<String> uom=tdto.getUom();
                System.out.println("uuuuuuuuuu"+uom);
                for(int i2=0;i2<uom.size();i2++){
            s11=uom.get(i2);
             System.out.println("uuuooooooommmmmmm"+s10);
              message2 +=s11;
             System.out.println("msgggggg222222222"+message2);
             
       }
                
                
            // Replace with your Message content
            String message ="Dear%20Admin%2C%20Bill%20has%20been%20generated%20on%20"+invdate+"%20With%20Grade:%20"+str+"%20and%20Quantity:"+qty1+message2+"%20Party%20Name:"+str1+"%20With%20an%20amount%20of%20Rs."+ff+"%20to%20"+fin_dest;
            System.out.println("msgggggggggg//////"+message);
           
            // For Plain Text, use "txt" ; for Unicode symbols or regional Languages like hindi/tamil/kannada use "uni"
            String type = "txt";
            URLConnection myURLConnection = null;
            URL myURL = null;
            BufferedReader reader = null;

            String mainUrl ="http://smshorizon.co.in/api/sendsms.php?";//"http://smshorizon.co.in/compose-sms.php";// ;
            //Prepare parameter string
            StringBuilder sbPostData = new StringBuilder(mainUrl);
            sbPostData.append("user=" + user);
            sbPostData.append("&apikey=" +apikey );
            //sbPostData.append("&message=" +"OTP%20is"+String.valueOf(randomPIN) );
        //    sbPostData.append("&message="+ message3);
        
            sbPostData.append("&message="+ message);
          //  sbPostData.append("&message11111111111="+ m5);
              
            System.out.println("\n ddddddddd"+randomPIN);
            sbPostData.append("&mobile=" + mobile);
            sbPostData.append("&senderid=" + senderid);
            sbPostData.append("&type=" + type);

            //final string
            mainUrl = sbPostData.toString();
            System.out.println("URL to Send SMS-" + mainUrl);
            try {
                //prepare connection
                myURL = new URL(mainUrl);
                myURLConnection = myURL.openConnection();
                myURLConnection.connect();
                
                System.out.println("\n mmmmmmmmmmmmmmm"+myURLConnection);
                
                reader = new BufferedReader(new InputStreamReader(myURLConnection.getInputStream()));
                System.out.println("\n hhhhhhhhhhhhhhh"+reader);
                //reading response
                String response = null;
                System.out.println("\n bbbbbbbbbbbbb"+response);
                while ((response = reader.readLine()) != null) {
                    //print response
                    System.out.println("\n sssssssssss"+response+reader.readLine());
                    
                }
                System.out.println(response);
                //finally close connection
               reader.close();


            } catch (IOException e) {
                e.printStackTrace();
            }            
            
            t1.commit();
            s1.close();
           }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("the exception in insertion off tax in tax manager is-----*******%%#$$$$$$$$$$########>"+e);
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
            pc.setBankName(tdto.getBankname());
            pc.setBankBranch(tdto.getBankbranch());
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
             List<String> um =tdto.getUom();
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
                if(l.get(i)!=null)
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
    
   public void sendMail(TaxInvoiceDto tdto,String emailToAddress,List l1,List l2,Double round_cal,String word) 
    {
       
//       TaxIManager tm=new TaxIManager();
//       tm.getPdf(l1, l2, round_val, word);
        
         byte[] b1=null;
        
        try {
        
            for(Object o:l1)
            {
                PrTaxIntra pr=(PrTaxIntra) o;
            ByteArrayOutputStream b=new ByteArrayOutputStream();
            
            DecimalFormat df=new DecimalFormat("0.00");
            
            //  OutputStream file = new FileOutputStream(new File("D:\\PDF_svk.pdf"));
	          Document document = new Document(PageSize.A4, 40f, 40f, 100f, 0f);
	       //   PdfWriter.getInstance(document, file);
                  
                   PdfWriter.getInstance(document, b);
                  
                  Font regular = new Font(Font.FontFamily.TIMES_ROMAN, 9);
                       Font boldFont = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD);
                              Font boldFont2 = new Font(Font.FontFamily.TIMES_ROMAN, 10, Font.BOLD);
                              Font boldFont4 = new Font(Font.FontFamily.TIMES_ROMAN, 9, Font.BOLD);
                              Font boldFont3 = new Font(Font.FontFamily.TIMES_ROMAN, 9, Font.UNDERLINE | Font.BOLD);
                              Font normalfont = new Font(Font.FontFamily.TIMES_ROMAN,9 , Font.NORMAL);
                               Font normalfont2 = new Font(Font.FontFamily.UNDEFINED,8 , Font.NORMAL);
                String FONT1 = null;
                      Font playfair =FontFactory.getFont(FONT1, BaseFont.IDENTITY_H, BaseFont.EMBEDDED, 8);
                 Font playfair2 =FontFactory.getFont(FONT1, BaseFont.IDENTITY_H, BaseFont.EMBEDDED, 7);

			//Inserting Image in PDF
                          //   Image image = Image.getInstance ("E://Java//VSK_SC//SSK_Logo.png");
                             Image image = Image.getInstance ("D://anusha//anusha//SSK//SSK_2//web//dist//img//SSK_Logo.png");
			//     Image image = Image.getInstance ("E://Java//SVK_RMC//svkl2.jpg");
			     image.scaleAbsolute(120f, 90f);//image width,height	
                             
                            //  Image image1 = Image.getInstance ("E://Java//VSK_SC//vsk-head1.jpg");
                            Image image1 = Image.getInstance ("D://anusha//anusha//SSK//SSK_2//web//dist//img//ssk_head.jpg");
                       //        Image image1 = Image.getInstance ("E://Java//SVK_RMC//SVk_Head_1.png");
                          //     image1.setAlignment(Image.LEFT| Image.TEXTWRAP); 
			   image1.scaleAbsolute(70f, 35f);


			//Inserting Table in PDF
                        
                        
//			     PdfPTable table=new PdfPTable(3);
//                             table.setTotalWidth(500);
//                             table.setLockedWidth(true);
//                  
//                         
                              Phrase p=new Phrase("          ",regular);
                           //  p.add(new Chunk(image1, 0, 0));
                             p.add(new Chunk(Chunk.NEWLINE+"TAX INVOICE",boldFont));
                             p.add(new Chunk(Chunk.NEWLINE+"SRI SAI KRISHNA STONE CRUSHER",boldFont));
                             p.add(new Chunk(Chunk.NEWLINE+"GSTIN:37AAVFS3232K1ZN, PAN: AAVFS3232K",boldFont2));
                             p.add(new Chunk(Chunk.NEWLINE));
                           //  p.add(new Chunk(Chunk.NEWLINE+"\n Plant: Survey No. 398/A1, PERECHERLA, Guntur Dist. (A.P). ",regular));
                             p.add(new Chunk(Chunk.NEWLINE+"D.No: 9/533, Perecherla Donka, Perecherla, Medikonduru Mandal, Guntur, Andhra Pradesh, 522005 ",new Font(Font.FontFamily.TIMES_ROMAN,9,Font.NORMAL)));
                          //   p.add(new Chunk(Chunk.NEWLINE+" Sub-station, PERECHERLA,Guntur Dist. (A.P).",new Font(Font.FontFamily.TIMES_ROMAN,9,Font.NORMAL)));
                         
//    p.add(new Chunk(Chunk.NEWLINE+"\n ",new Font(Font.FontFamily.TIMES_ROMAN,9,Font.NORMAL)));
                             p.add(new Chunk(Chunk.NEWLINE+"Mobile No: 8886961913, e-mail: ssksc134@gmail.com",new Font(Font.FontFamily.TIMES_ROMAN,9,Font.NORMAL)));
                           
                     
                             
                             
                                      
				 

                    PdfPTable table = new PdfPTable(3);
                    table.setTotalWidth(500);
                    table.setLockedWidth(true);
                

                    PdfPCell side1;
                    
                    side1=new PdfPCell(new Phrase("        ",boldFont4));
                    side1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side1.setBorder(Rectangle.TOP | Rectangle.LEFT);
                    table.addCell(side1);

                    side1=new PdfPCell(new Phrase("        ",boldFont4));
                    side1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side1.setBorder(Rectangle.TOP | Rectangle.LEFT);
                    table.addCell(side1);

                    side1=new PdfPCell(new Phrase("        ",boldFont4));
                    side1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side1.setBorder(Rectangle.TOP | Rectangle.LEFT | Rectangle.RIGHT);
                    table.addCell(side1);

                    
                    
                    side1=new PdfPCell(new Phrase("      ",boldFont4));
                    side1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side1.setBorder(Rectangle.LEFT);
                    table.addCell(side1);

                  
                    side1=new PdfPCell(image1);
                    side1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side1.setBorder(Rectangle.LEFT);
                    table.addCell(side1);

                    side1=new PdfPCell(new Phrase("     ",boldFont4));
                    side1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side1.setBorder(Rectangle.LEFT | Rectangle.RIGHT);
                    table.addCell(side1);
                
                    
                    
                    
                    side1=new PdfPCell(image);
                    side1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side1.setBorder(Rectangle.LEFT);
                    table.addCell(side1);
                    
                    side1=new PdfPCell(p);
                    side1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side1.setBorder(Rectangle.LEFT);
                    table.addCell(side1);
                    

                    side1=new PdfPCell(new Phrase("ORIGINAL"+"\n \n FOR"+"\n \n RECEIPIENT",boldFont4));
                    side1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side1.setBorder(Rectangle.LEFT | Rectangle.RIGHT);
                    table.addCell(side1);
                    
                    
                    side1=new PdfPCell(new Phrase("        ",boldFont4));
                    side1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side1.setBorder(Rectangle.LEFT  | Rectangle.BOTTOM);
                    table.addCell(side1);

                    side1=new PdfPCell(new Phrase("        ",boldFont4));
                    side1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side1.setBorder(Rectangle.LEFT  | Rectangle.BOTTOM);
                    table.addCell(side1);

                    side1=new PdfPCell(new Phrase("        ",boldFont4));
                    side1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side1.setBorder(Rectangle.LEFT | Rectangle.RIGHT  | Rectangle.BOTTOM);
                    table.addCell(side1);
                    
                    table.setWidths(new int[]{25,60,15});











                    //-------------------------- end of table 1 -------------------
                    
                    PdfPTable table2 = new PdfPTable(4);
                    table2.setTotalWidth(500);
                    table2.setLockedWidth(true);
                    
                    SimpleDateFormat sdfr = new SimpleDateFormat("dd-MM-yyyy");
                             
                    PdfPCell cellOne = new PdfPCell(new Phrase("InvoiceNo:",boldFont4));
                    PdfPCell cellTwo = new PdfPCell(new Phrase("00"+Integer.toString(pr.getInvoiceNo()),normalfont2));
                    PdfPCell cellthree = new PdfPCell(new Phrase("Transportation Mode:",boldFont4));
                    PdfPCell cellfour = new PdfPCell(new Phrase(pr.getTransportMode(),normalfont2));
                    
                    PdfPCell cellfive = new PdfPCell(new Phrase("Invoice Date:",boldFont4));
                    PdfPCell cellsix = new PdfPCell(new Phrase(sdfr.format(pr.getInvoiceDate()),normalfont2));
                    PdfPCell cellseven = new PdfPCell(new Phrase("Vehicle No:",boldFont4));
                    PdfPCell celleight = new PdfPCell(new Phrase(pr.getVehNo(),normalfont2));
                    
                    PdfPCell nine = new PdfPCell(new Phrase("Reverse Charge:",boldFont4));
                    PdfPCell ten = new PdfPCell(new Phrase(pr.getReverseCharge(),normalfont2));
                    PdfPCell eleven = new PdfPCell(new Phrase("Date of Supply:",boldFont4));
                    PdfPCell twelve = new PdfPCell(new Phrase(sdfr.format(pr.getDateOfSupply()),normalfont2));
                    
                    
                    

                    cellfive.setBorder(Rectangle.LEFT);
                    cellsix.setBorder(Rectangle.NO_BORDER);
                    cellseven.setBorder(Rectangle.NO_BORDER);
                    celleight.setBorder(Rectangle.RIGHT);
                    
                    cellOne.setBorder(Rectangle.LEFT);
                    cellTwo.setBorder(Rectangle.NO_BORDER);
                    cellthree.setBorder(Rectangle.NO_BORDER);
                    cellfour.setBorder(Rectangle.RIGHT);
                    
                    nine.setBorder(Rectangle.LEFT);
                    ten.setBorder(Rectangle.NO_BORDER);
                    eleven.setBorder(Rectangle.NO_BORDER);
                    twelve.setBorder(Rectangle.RIGHT);
                    

                    table2.addCell(cellOne);
                    table2.addCell(cellTwo);
                    table2.addCell(cellthree);
                    table2.addCell(cellfour);
                    table2.addCell(cellfive);
                    table2.addCell(cellsix);
                    table2.addCell(cellseven);
                    table2.addCell(celleight);
                    table2.addCell(nine);
                    table2.addCell(ten);
                    table2.addCell(eleven);
                    table2.addCell(twelve);
                    
                    table2.setWidths(new int[]{25,25,25,25});    
            
                    // ------------------------- END OF TABLE2 -------------------------------
                    
                    PdfPTable table3 = new PdfPTable(6);
                    table3.setTotalWidth(500);
                    table3.setLockedWidth(true);
                    
                    PdfPCell side2;
                    
                    side2=new PdfPCell(new Phrase("State:",boldFont4));
                    side2.setBorder(Rectangle.LEFT);
                    table3.addCell(side2);
                    side2=new PdfPCell(new Phrase(pr.getState(),normalfont2));
                    side2.setBorder(Rectangle.NO_BORDER);
                     table3.addCell(side2);
                    side2=new PdfPCell(new Phrase("Code:",boldFont4));
                     side2.setBorder(Rectangle.NO_BORDER);
                     table3.addCell(side2);
                    side2=new PdfPCell(new Phrase(pr.getCode(),normalfont2));
                     side2.setBorder(Rectangle.NO_BORDER);
                     table3.addCell(side2);
                    side2=new PdfPCell(new Phrase("Place of Supply",boldFont4));
                     side2.setBorder(Rectangle.NO_BORDER);
                     table3.addCell(side2);
                    side2=new PdfPCell(new Phrase(pr.getPlaceOfSupply(),normalfont2));
                     side2.setBorder(Rectangle.RIGHT);
                     table3.addCell(side2);
                    
                    PdfPCell one = new PdfPCell(new Phrase("        ",boldFont4));
                    PdfPCell two = new PdfPCell(new Phrase("         ",normalfont2));
                    PdfPCell three = new PdfPCell(new Phrase("          ",boldFont4));
                    PdfPCell four = new PdfPCell(new Phrase("          ",normalfont2));
                    PdfPCell five = new PdfPCell(new Phrase("        ",boldFont4));
                    PdfPCell six = new PdfPCell(new Phrase("           ",normalfont2));
                    
                    one.setBorder(Rectangle.LEFT | Rectangle.BOTTOM);
                   
                    two.setBorder(Rectangle.BOTTOM);
                 
                    three.setBorder(Rectangle.BOTTOM);
                    four.setBorder(Rectangle.BOTTOM);
                    five.setBorder(Rectangle.BOTTOM);
                    six.setBorder(Rectangle.RIGHT);
                     six.setBorder(Rectangle.BOTTOM | Rectangle.RIGHT);
                    
                        
                    table3.addCell(one);
                    table3.addCell(two);
                    table3.addCell(three);
                    table3.addCell(four);
                    table3.addCell(five);
                    table3.addCell(six);
                    table3.setWidths(new int[]{10,15,10,15,25,25});
			
                    
                    // ------------------------- END OF TABLE3 --------------------------
                    
                     PdfPTable table4 = new PdfPTable(2);
                    table4.setTotalWidth(500);
                    table4.setLockedWidth(true);
                    
                     PdfPCell one1 = new PdfPCell(new Phrase("B I L L  T O P A R T Y",boldFont3));
                    PdfPCell two2 = new PdfPCell(new Phrase("S H I P T O P A R T Y",boldFont3));
                    one1.setBorder(Rectangle.LEFT);
                    two2.setBorder(Rectangle.RIGHT);
                    
                    one1.setHorizontalAlignment (Element.ALIGN_CENTER);
                    two2.setHorizontalAlignment (Element.ALIGN_CENTER); 
                   
                    
                    table4.addCell(one1);
                    table4.addCell(two2);
                 
                    
                    // ------------------- END OF TABLE4 -----------------------------------
                    
                     PdfPTable table5 = new PdfPTable(4);
                    table5.setTotalWidth(500);
                    table5.setLockedWidth(true);
                    
                    Phrase p6=new Phrase(pr.getBillToAddress(),normalfont2);
                    p6.add(new Chunk(Chunk.NEWLINE+"              "));
                    p6.add(new Chunk(Chunk.NEWLINE+"              "));
                    p6.add(new Chunk(Chunk.NEWLINE+"              "));
                    p6.add(new Chunk(Chunk.NEWLINE+"              "));
                    
                  Phrase p7=new Phrase(pr.getShipAddress(),normalfont2);
                    p7.add(new Chunk(Chunk.NEWLINE+"              "));
                    p7.add(new Chunk(Chunk.NEWLINE+"              "));
                    p7.add(new Chunk(Chunk.NEWLINE+"              "));
                    p7.add(new Chunk(Chunk.NEWLINE+"              "));   
                             
                    PdfPCell ONE1 = new PdfPCell(new Phrase("Name:",boldFont4));
                    PdfPCell TWO1 = new PdfPCell(new Phrase(pr.getBillToName(),normalfont2));
                    PdfPCell THREE1 = new PdfPCell(new Phrase("Name:",boldFont4));
                    PdfPCell FOUR4 = new PdfPCell(new Phrase(pr.getShipToName(),normalfont2));
                    
                    PdfPCell FIVE5 = new PdfPCell(new Phrase("Address:",boldFont4));
                    PdfPCell SIX6 = new PdfPCell(p6);
                    PdfPCell SEVEN7 = new PdfPCell(new Phrase("Address:",boldFont4));
                    PdfPCell EIGHT8 = new PdfPCell(p7);
                    
                    
                    Phrase p1=new Phrase("State:",boldFont4);
                    p1.add(new Chunk(pr.getBillTostate(),normalfont2));
                    Phrase p3=new Phrase("State:",boldFont4);
                    p3.add(new Chunk(pr.getShipToState(),normalfont2));
                   
                    Phrase p4=new Phrase("State Code:",boldFont4);
                    p4.add(new Chunk(pr.getBillToCode(),normalfont2));
                    Phrase p5=new Phrase("State Code:",boldFont4);
                    p5.add(new Chunk(pr.getShipToCode(),normalfont2));
                     
                    PdfPCell NINE9 = new PdfPCell(p1);
                    PdfPCell TEN10 = new PdfPCell(p4);
                    PdfPCell ELEVEN11 = new PdfPCell(p3);
                    PdfPCell TWELVE12 = new PdfPCell(p5);
                    
                    PdfPCell THRITEEN17 = new PdfPCell(new Phrase("GSTIN Number:",boldFont4));
                    PdfPCell FOURTEEN18 = new PdfPCell(new Phrase(pr.getBillToGstin(),normalfont2));
                    PdfPCell FIFTEEN19 = new PdfPCell(new Phrase("GSTIN Number:",boldFont4));
                    PdfPCell SIXTEEN20 = new PdfPCell(new Phrase(pr.getShipToGstin(),normalfont2));
                    
                    
                    PdfPCell THRITEEN13 = new PdfPCell(new Phrase("          ",boldFont4));
                    PdfPCell FOURTEEN14 = new PdfPCell(new Phrase("          ",normalfont2));
                    PdfPCell FIFTEEN15 = new PdfPCell(new Phrase("          ",boldFont4));
                    PdfPCell SIXTEEN16 = new PdfPCell(new Phrase("         ",normalfont2));
                    
                    THRITEEN17.setBorder(Rectangle.LEFT);
                    FOURTEEN18.setBorder(Rectangle.NO_BORDER);
                    FIFTEEN19.setBorder(Rectangle.NO_BORDER);
                    SIXTEEN20.setBorder(Rectangle.RIGHT);
                   
                    

                    FIVE5.setBorder(Rectangle.LEFT);
                    SIX6.setBorder(Rectangle.NO_BORDER);
                    SEVEN7.setBorder(Rectangle.NO_BORDER);
                    EIGHT8.setBorder(Rectangle.RIGHT);
                    
                    ONE1.setBorder(Rectangle.LEFT);
                    TWO1.setBorder(Rectangle.NO_BORDER);
                    THREE1.setBorder(Rectangle.NO_BORDER);
                    FOUR4.setBorder(Rectangle.RIGHT);
                    
                    NINE9.setBorder(Rectangle.LEFT);
                    TEN10.setBorder(Rectangle.NO_BORDER);
                    ELEVEN11.setBorder(Rectangle.NO_BORDER);
                    TWELVE12.setBorder(Rectangle.RIGHT);
                    
                    THRITEEN13.setBorder(Rectangle.LEFT | Rectangle.BOTTOM);
                    FOURTEEN14.setBorder(Rectangle.BOTTOM);
                    FIFTEEN15.setBorder(Rectangle.BOTTOM);
                    SIXTEEN16.setBorder(Rectangle.RIGHT | Rectangle.BOTTOM);
                    
                    
                    

                    table5.addCell(ONE1);
                    table5.addCell(TWO1);
                    table5.addCell(THREE1);
                    table5.addCell(FOUR4);
                    table5.addCell(FIVE5);
                    table5.addCell(SIX6);
                    table5.addCell(SEVEN7);
                    table5.addCell(EIGHT8);
                    table5.addCell(NINE9);
                    table5.addCell(TEN10);
                    table5.addCell(ELEVEN11);
                    table5.addCell(TWELVE12);
                    table5.addCell(THRITEEN17);
                    table5.addCell(FOURTEEN18);
                    table5.addCell(FIFTEEN19);
                    table5.addCell(SIXTEEN20);
                    table5.addCell(THRITEEN13);
                    table5.addCell(FOURTEEN14);
                    table5.addCell(FIFTEEN15);
                    table5.addCell(SIXTEEN16);
                    
                    table5.setWidths(new int[]{25,25,25,25});    
                  
                    //--------------------- END OF TABLE5 -----------------------------
            
                  
                    PdfPTable table6 = new PdfPTable(12);
                    table6.setTotalWidth(500);
                    table6.setLockedWidth(true);
                    ChTaxIntra cc=(ChTaxIntra)l2.get(0);
                    PdfPCell A = new PdfPCell(new Phrase("S.No:",boldFont4));
                    A.setRowspan(2);
                    PdfPCell B = new PdfPCell(new Phrase("Description"+Chunk.NEWLINE+"Of Goods",boldFont4));
                    B.setRowspan(2);
                    PdfPCell C = null; 
                    for(int i=0;i<1;i++){
                    C= new PdfPCell(new Phrase("HSN Code:"+Chunk.NEWLINE+"(GST)",boldFont4));
                    C.setRowspan(2);
                    }
                    PdfPCell D = new PdfPCell(new Phrase("Qty"+Chunk.NEWLINE+cc.getUom(),boldFont4));
                    D.setRowspan(2);
                    PdfPCell E = new PdfPCell(new Phrase("Value Before"+Chunk.NEWLINE+"Tax \n /"+cc.getUom(),boldFont4));
                    E.setRowspan(2);
                    PdfPCell F = new PdfPCell(new Phrase("Value After"+Chunk.NEWLINE+"Tax \n  /"+cc.getUom(),boldFont4));
                    F.setRowspan(2);
                    PdfPCell G = new PdfPCell(new Phrase("Total Taxable "+Chunk.NEWLINE+"Value \u20B9",playfair));
                    G.setRowspan(2);
                    PdfPCell H = new PdfPCell(new Phrase("CGST",boldFont4));
                    H.setColspan(2);
                    PdfPCell I = new PdfPCell(new Phrase("SGST",boldFont4));
                    I.setColspan(2);
                    PdfPCell J = new PdfPCell(new Phrase("Total \u20B9",playfair));
                    J.setRowspan(2);
                    PdfPCell K = new PdfPCell(new Phrase("Rate %",boldFont4));
                    PdfPCell L = new PdfPCell(new Phrase("Amount \u20B9",playfair2));
                    PdfPCell M = new PdfPCell(new Phrase("Rate %",boldFont4));
                    PdfPCell N = new PdfPCell(new Phrase("Amount \u20B9",playfair2));
                    
                    
                    A.setBorder(Rectangle.LEFT | Rectangle.BOTTOM  | Rectangle.RIGHT);
                    B.setBorder(Rectangle.BOTTOM | Rectangle.RIGHT);
                    C.setBorder(Rectangle.BOTTOM  | Rectangle.RIGHT);
                    D.setBorder(Rectangle.BOTTOM  | Rectangle.RIGHT);
                    E.setBorder(Rectangle.BOTTOM  | Rectangle.RIGHT);
                    F.setBorder(Rectangle.BOTTOM | Rectangle.RIGHT);
                    G.setBorder(Rectangle.BOTTOM | Rectangle.RIGHT);
                    H.setBorder(Rectangle.BOTTOM | Rectangle.RIGHT);
                    I.setBorder(Rectangle.BOTTOM | Rectangle.RIGHT);
                    J.setBorder(Rectangle.BOTTOM | Rectangle.RIGHT);
                    K.setBorder(Rectangle.BOTTOM | Rectangle.RIGHT);  
                    L.setBorder(Rectangle.BOTTOM | Rectangle.RIGHT);
                    M.setBorder(Rectangle.BOTTOM | Rectangle.RIGHT);
                    N.setBorder(Rectangle.BOTTOM | Rectangle.RIGHT);
                    
                     A.setHorizontalAlignment (Element.ALIGN_CENTER);
                      B.setHorizontalAlignment (Element.ALIGN_CENTER);
                       C.setHorizontalAlignment (Element.ALIGN_CENTER);
                        D.setHorizontalAlignment (Element.ALIGN_CENTER);
                         E.setHorizontalAlignment (Element.ALIGN_CENTER);
                         F.setHorizontalAlignment (Element.ALIGN_CENTER);
                          G.setHorizontalAlignment (Element.ALIGN_CENTER);
                    H.setHorizontalAlignment (Element.ALIGN_CENTER);   
                    I.setHorizontalAlignment (Element.ALIGN_CENTER);
                     J.setHorizontalAlignment (Element.ALIGN_CENTER);
                      K.setHorizontalAlignment (Element.ALIGN_CENTER);
                       L.setHorizontalAlignment (Element.ALIGN_CENTER);
                        M.setHorizontalAlignment (Element.ALIGN_CENTER);
                         N.setHorizontalAlignment (Element.ALIGN_CENTER);
                         
                   
                    
                    table6.addCell(A);
                    table6.addCell(B);
                    table6.addCell(C);
                    table6.addCell(D);
                    table6.addCell(E);
                    table6.addCell(F);
                    table6.addCell(G);
                    table6.addCell(H);
                    table6.addCell(I);
                    table6.addCell(J);
                    table6.addCell(K);
                    table6.addCell(L);
                    table6.addCell(M);
                    table6.addCell(N);
//             for(Object o2:l2){
//                 
//             ChTaxIntra cc=(ChTaxIntra)o2;
//                 
//                    
//             }
              
                     PdfPCell celll,celll2;
                      Integer id=0;
                     
             for(Object o1:l2) 
             {    
                    ChTaxIntra cr=(ChTaxIntra) o1;
                   id++;
                   
                   System.out.println("0000000000iiiiiiiiiddddddd00::"+id);
                    celll=new PdfPCell(new Phrase(id.toString(), boldFont));
                    celll.setHorizontalAlignment(Element.ALIGN_CENTER);
                    table6.addCell(celll);
                    celll=new PdfPCell(new Phrase(cr.getProductDesc(),normalfont2));
                    celll.setHorizontalAlignment(Element.ALIGN_CENTER);
                    table6.addCell(celll);
                    celll=new PdfPCell(new Phrase(cr.getHsnCode(),normalfont2));
                    celll.setHorizontalAlignment(Element.ALIGN_CENTER);
                    table6.addCell(celll);
                    if(cr.getQty()==null){
                         celll=new PdfPCell(new Phrase());
                    celll.setHorizontalAlignment(Element.ALIGN_CENTER);
                    table6.addCell(celll);
                    }
                    else{
                    celll=new PdfPCell(new Phrase(df.format(cr.getQty()),normalfont2));
                    celll.setHorizontalAlignment(Element.ALIGN_CENTER);
                    table6.addCell(celll);
                    }
                    celll=new PdfPCell(new Phrase(df.format(cr.getBeforeTax()),normalfont2));
                    celll.setHorizontalAlignment(Element.ALIGN_CENTER);
                    table6.addCell(celll);
                    
                     if(cr.getAfterTax()==null || cr.getAfterTax()==0)
                   {
                    celll=new PdfPCell(new Phrase("         ",boldFont4));
//                    celll.setHorizontalAlignment(Element.ALIGN_LEFT);
                 celll.setHorizontalAlignment(Element.ALIGN_CENTER);
                    table6.addCell(celll);
                   }
                   else {
                       celll=new PdfPCell(new Phrase(Float.toString(cr.getAfterTax()),boldFont4));
//                    celll.setHorizontalAlignment(Element.ALIGN_LEFT);
                  celll.setHorizontalAlignment(Element.ALIGN_CENTER);
                    table6.addCell(celll); 
                   }
                    
                    
//                    celll=new PdfPCell(new Phrase(df.format(cr.getAfterTax()),normalfont2));
//                    celll.setHorizontalAlignment(Element.ALIGN_CENTER);
//                    table6.addCell(celll);
                    celll=new PdfPCell(new Phrase(df.format(cr.getTaxableValue()),normalfont2));
                    celll.setHorizontalAlignment(Element.ALIGN_CENTER);
                    table6.addCell(celll);
                    celll=new PdfPCell(new Phrase(df.format(cr.getCgRate()),normalfont2));
                    celll.setHorizontalAlignment(Element.ALIGN_CENTER);
                    table6.addCell(celll);
                    celll=new PdfPCell(new Phrase(df.format(cr.getCgAmt()),normalfont2));
                    celll.setHorizontalAlignment(Element.ALIGN_CENTER);
                    table6.addCell(celll);
                    celll=new PdfPCell(new Phrase(df.format(cr.getSgRate()),normalfont2));
                    celll.setHorizontalAlignment(Element.ALIGN_CENTER);
                    table6.addCell(celll);
                    celll=new PdfPCell(new Phrase(df.format(cr.getSgAmt()),normalfont2));
                    celll.setHorizontalAlignment(Element.ALIGN_CENTER);
                    table6.addCell(celll);
                    celll=new PdfPCell(new Phrase(df.format(cr.getChTotal()),normalfont2));
                    celll.setHorizontalAlignment(Element.ALIGN_CENTER);
                    table6.addCell(celll);
                 }   
                  // -- END OF 2ND ROW--------------  
                  
                    celll2=new PdfPCell(new Phrase("     ",boldFont4));
                    celll2.setHorizontalAlignment(Element.ALIGN_CENTER);
                    celll2.setBorder(Rectangle.BOTTOM | Rectangle.LEFT);
                    table6.addCell(celll2);
                  
                    celll2=new PdfPCell(new Phrase("Total",boldFont4));
                    celll2.setHorizontalAlignment(Element.ALIGN_CENTER);
                    celll2.setBorder(Rectangle.BOTTOM);
                    table6.addCell(celll2);
                    
                    celll2=new PdfPCell(new Phrase("     ",boldFont4));
                    celll2.setHorizontalAlignment(Element.ALIGN_CENTER);
                    celll2.setBorder(Rectangle.BOTTOM);
                    table6.addCell(celll2);
                    
                    celll2=new PdfPCell(new Phrase(df.format(pr.getTotalQty()),boldFont4));
                    celll2.setHorizontalAlignment(Element.ALIGN_CENTER);
                    celll2.setBorder(Rectangle.BOTTOM);
                    table6.addCell(celll2);
                    celll2=new PdfPCell(new Phrase(df.format(pr.getTotalValBtax()),boldFont4));
                    celll2.setHorizontalAlignment(Element.ALIGN_CENTER);
                    celll2.setBorder(Rectangle.BOTTOM);
                    table6.addCell(celll2);
                    celll2=new PdfPCell(new Phrase(df.format(pr.getTotalValAtax()),boldFont4));
                    celll2.setHorizontalAlignment(Element.ALIGN_CENTER);
                    celll2.setBorder(Rectangle.BOTTOM);
                    table6.addCell(celll2);
                    celll2=new PdfPCell(new Phrase(df.format(pr.getTotalTaxval()),boldFont4));
                    celll2.setHorizontalAlignment(Element.ALIGN_CENTER);
                    celll2.setBorder(Rectangle.BOTTOM);
                    table6.addCell(celll2);
                    celll2=new PdfPCell(new Phrase("     ",boldFont4));
                    celll2.setHorizontalAlignment(Element.ALIGN_CENTER);
                    celll2.setBorder(Rectangle.BOTTOM);
                    table6.addCell(celll2);
                    celll2=new PdfPCell(new Phrase(df.format(pr.getTotalCgstAmt()),boldFont4));
                    celll2.setHorizontalAlignment(Element.ALIGN_CENTER);
                    celll2.setBorder(Rectangle.BOTTOM);
                    table6.addCell(celll2);
                    celll2=new PdfPCell(new Phrase("     ",boldFont4));
                    celll2.setHorizontalAlignment(Element.ALIGN_CENTER);
                    celll2.setBorder(Rectangle.BOTTOM);
                    table6.addCell(celll2);
                    celll2=new PdfPCell(new Phrase(df.format(pr.getTotalSgstAmt()),boldFont4));
                    celll2.setHorizontalAlignment(Element.ALIGN_CENTER);
                    celll2.setBorder(Rectangle.BOTTOM);
                    table6.addCell(celll2);
                    celll2=new PdfPCell(new Phrase(df.format(pr.getTotalInv()),boldFont4));
                    celll2.setHorizontalAlignment(Element.ALIGN_CENTER);
                    celll2.setBorder(Rectangle.BOTTOM | Rectangle.RIGHT);
                    table6.addCell(celll2);
                    
                    
                    table6.setWidths(new int[]{5,14,8,8,8,8,8,5,6,5,6,9});
                       
                  // -------------- END OF TABLE6 ---------------------------------
                  
                    PdfPTable table7 = new PdfPTable(3);
                    table7.setTotalWidth(500);
                    table7.setLockedWidth(true);
                  
                    PdfPCell cel1,cel2,cel3;
                    cel1=new PdfPCell(new Phrase("Total Invoice amount in words:",boldFont4));
                    cel1.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cel1.setBorder(Rectangle.LEFT);
                    table7.addCell(cel1);
                    
                    cel1=new PdfPCell(new Phrase("Total Amount before Tax:",boldFont4));
                    cel1.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cel1.setBorder(Rectangle.LEFT | Rectangle.RIGHT );
                    table7.addCell(cel1);
                    
                    cel1=new PdfPCell(new Phrase(df.format(pr.getTotalTaxval()),normalfont2));
                    cel1.setHorizontalAlignment(Element.ALIGN_RIGHT);
                    cel1.setBorder(Rectangle.RIGHT);
                    table7.addCell(cel1);
                    
                    
                    cel2=new PdfPCell(new Phrase(word,normalfont2));
                    cel2.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cel2.setBorder(Rectangle.BOTTOM | Rectangle.LEFT);
                    table7.addCell(cel2);
                    
                    cel2=new PdfPCell(new Phrase("           ",normalfont2));
                    cel2.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cel2.setBorder(Rectangle.BOTTOM | Rectangle.LEFT  | Rectangle.RIGHT);
                    table7.addCell(cel2);
                    
                    cel2=new PdfPCell(new Phrase("          ",normalfont2));
                    cel2.setHorizontalAlignment(Element.ALIGN_RIGHT);
                    cel2.setBorder(Rectangle.BOTTOM | Rectangle.RIGHT);
                    table7.addCell(cel2);
                    
                    cel3=new PdfPCell(new Phrase("Bank Details",boldFont4));
                    cel3.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cel3.setBorder(Rectangle.BOTTOM | Rectangle.LEFT | Rectangle.ALIGN_CENTER);
                    table7.addCell(cel3);
                    
                    cel2=new PdfPCell(new Phrase("Add:CGST :  2.5%",boldFont4));
                    cel2.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cel2.setBorder(Rectangle.BOTTOM | Rectangle.LEFT  | Rectangle.RIGHT);
                    table7.addCell(cel2);
                    
                    cel2=new PdfPCell(new Phrase(df.format(pr.getTotalCgstAmt()),normalfont2));
                    cel2.setHorizontalAlignment(Element.ALIGN_RIGHT);
                    cel2.setBorder(Rectangle.BOTTOM | Rectangle.RIGHT);
                    table7.addCell(cel2);
                 
                    table7.setWidths(new int[]{50,35,15});
                  
                   //---------------------- END OF TABLE7 ---------------------------
                   
                    PdfPTable table8 = new PdfPTable(4);
                    table8.setTotalWidth(500);
                    table8.setLockedWidth(true);
                    
                    PdfPCell cel4,cel5,cel6,cel7;
                   
                    cel4=new PdfPCell(new Phrase("Bank Name:",boldFont4));
                    cel4.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cel4.setBorder(Rectangle.BOTTOM | Rectangle.LEFT);
                    table8.addCell(cel4);
                    
                    cel4=new PdfPCell(new Phrase(pr.getBankName(),normalfont2));
                    cel4.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cel4.setBorder(Rectangle.BOTTOM | Rectangle.LEFT);
                    table8.addCell(cel4);
                    
                    cel4=new PdfPCell(new Phrase("Add:SGST :  2.5%",boldFont4));
                    cel4.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cel4.setBorder(Rectangle.BOTTOM | Rectangle.LEFT);
                    table8.addCell(cel4);
                    
                     cel4=new PdfPCell(new Phrase(df.format(pr.getTotalSgstAmt()),normalfont2));
                    cel4.setHorizontalAlignment(Element.ALIGN_RIGHT);
                    cel4.setBorder(Rectangle.BOTTOM | Rectangle.LEFT | Rectangle.RIGHT);
                    table8.addCell(cel4);
                    
                    cel5=new PdfPCell(new Phrase("Bank Branch:",boldFont4));
                    cel5.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cel5.setBorder(Rectangle.BOTTOM | Rectangle.LEFT);
                    table8.addCell(cel5);
                    
                    cel5=new PdfPCell(new Phrase(pr.getBankBranch(),normalfont2));
                    cel5.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cel5.setBorder(Rectangle.BOTTOM | Rectangle.LEFT);
                    table8.addCell(cel5);
                    
                    cel5=new PdfPCell(new Phrase("Total Tax Amount:",boldFont4));
                    cel5.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cel5.setBorder(Rectangle.BOTTOM | Rectangle.LEFT);
                    table8.addCell(cel5);
                    
                    cel5=new PdfPCell(new Phrase(df.format(pr.getTotalCgstAmt()+pr.getTotalSgstAmt()),normalfont2));
                    cel5.setHorizontalAlignment(Element.ALIGN_RIGHT);
                    cel5.setBorder(Rectangle.BOTTOM | Rectangle.LEFT | Rectangle.RIGHT);
                    table8.addCell(cel5);
                    
                    cel6=new PdfPCell(new Phrase("Bank A/C:",boldFont4));
                    cel6.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cel6.setBorder(Rectangle.BOTTOM | Rectangle.LEFT);
                    table8.addCell(cel6);
                    
                    cel6=new PdfPCell(new Phrase(pr.getBankAc(),normalfont2));
                    cel6.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cel6.setBorder(Rectangle.BOTTOM | Rectangle.LEFT);
                    table8.addCell(cel6);
                    
                    cel6=new PdfPCell(new Phrase("Add:Round Value :",boldFont4));
                    cel6.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cel6.setBorder(Rectangle.BOTTOM | Rectangle.LEFT);
                    table8.addCell(cel6);
                    
                    cel6=new PdfPCell(new Phrase(df.format(this.round_val),normalfont2));
                    cel6.setHorizontalAlignment(Element.ALIGN_RIGHT);
                    cel6.setBorder(Rectangle.BOTTOM | Rectangle.LEFT | Rectangle.RIGHT);
                    table8.addCell(cel6);
                    
                    cel7=new PdfPCell(new Phrase("Bank IFSC: ",boldFont4));
                    cel7.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cel7.setBorder(Rectangle.BOTTOM | Rectangle.LEFT);
                    table8.addCell(cel7);
                    
                    cel7=new PdfPCell(new Phrase(pr.getBankIfsc(),normalfont2));
                    cel7.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cel7.setBorder(Rectangle.BOTTOM | Rectangle.LEFT);
                    table8.addCell(cel7);
                    
                    cel7=new PdfPCell(new Phrase("Total Amount after Tax:",boldFont4));
                    cel7.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cel7.setBorder(Rectangle.BOTTOM | Rectangle.LEFT);
                    table8.addCell(cel7);
                    
                    cel7=new PdfPCell(new Phrase(df.format(pr.getTotalInv()),normalfont2));
                    cel7.setHorizontalAlignment(Element.ALIGN_RIGHT);
                    cel7.setBorder(Rectangle.BOTTOM | Rectangle.LEFT | Rectangle.RIGHT);
                    table8.addCell(cel7);
                    
                    
                    
                   table8.setWidths(new int[]{25,25,35,15});
                   
                  // ----------------- END OF TABLE8 --------------------------------
                  
                  PdfPTable table9 = new PdfPTable(4);
                    table9.setTotalWidth(500);
                    table9.setLockedWidth(true);
                  
                   PdfPCell cel8;
                   
                    cel8=new PdfPCell(new Phrase("Terms & conditions ",boldFont4));
                    cel8.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cel8.setBorder(Rectangle.BOTTOM | Rectangle.LEFT);
                    table9.addCell(cel8);
                    
                    cel8=new PdfPCell(new Phrase("                ",boldFont4));
                    cel8.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cel8.setBorder(Rectangle.LEFT);
                    table9.addCell(cel8);
                    
                    cel8=new PdfPCell(new Phrase("GST on Reverse Charge ",boldFont4));
                    cel8.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cel8.setBorder(Rectangle.BOTTOM | Rectangle.LEFT);
                    table9.addCell(cel8);
                    
                   System.out.println("reverse charge issssssssss"+pr.getGstReverseCharge());
                   if(pr.getGstReverseCharge()==null)
                   {
                    cel8=new PdfPCell(new Phrase("         ",boldFont4));
                    cel8.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cel8.setBorder(Rectangle.BOTTOM | Rectangle.LEFT | Rectangle.RIGHT);
                    table9.addCell(cel8);
                   }
                   else {
                       cel8=new PdfPCell(new Phrase(Float.toString(pr.getGstReverseCharge()),boldFont4));
                    cel8.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cel8.setBorder(Rectangle.BOTTOM | Rectangle.LEFT | Rectangle.RIGHT);
                    table9.addCell(cel8); 
                   }
                    
                    table9.setWidths(new int[]{50,19,16,15});
                    
                  // ----------------- END OF TABLE9 -------------------------------------
                  
                  PdfPTable table10 = new PdfPTable(3);
                    table10.setTotalWidth(500);
                    table10.setLockedWidth(true);
                  
                    PdfPCell cel9,cel10,cel11,cel12,cel13;
                    
                    cel9=new PdfPCell(new Phrase("1. We declare that this invoice shows the actual price of the goods\n" +
"described and that all are true and correct. 2. We declare to the best\n" +
"of our knowledge and belief that particulars stated herein are true\n" 
,normalfont2));
                    cel9.setPadding (0.0f);
                    cel9.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cel9.setBorder(Rectangle.LEFT);
                    table10.addCell(cel9);
                    
                    cel9=new PdfPCell(new Phrase("           ",boldFont4));
                    cel9.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cel9.setBorder(Rectangle.LEFT);
                    table10.addCell(cel9);
                    
                    cel9=new PdfPCell(new Phrase("Ceritified that the particulars given\n" +
"above are true and correct",normalfont2));
                    cel9.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cel9.setBorder(Rectangle.BOTTOM | Rectangle.LEFT | Rectangle.RIGHT);
                    table10.addCell(cel9);
                    
                     cel10=new PdfPCell(new Phrase("and correct and there is no additional consideration accuring to use\n" +
"either  directly or indirectly in any manner other amounts indicated\n" +
"here. 3. Interest: We charge interest @24% p.a after 15days from the sale of invoice date." 
,normalfont2));
                    cel10.setHorizontalAlignment(Element.ALIGN_LEFT);
                    cel10.setBorder(Rectangle.LEFT | Rectangle.BOTTOM);
                    table10.addCell(cel10);
                    
                    cel10=new PdfPCell(new Phrase("           ",boldFont4));
                    cel10.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cel10.setBorder(Rectangle.LEFT);
                    table10.addCell(cel10);
                    
                    cel10=new PdfPCell(new Phrase("For Sri Sai Krishna\n" +
"Stone Crusher",boldFont4));
                    cel10.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cel10.setBorder(Rectangle.BOTTOM | Rectangle.LEFT | Rectangle.RIGHT);
                    table10.addCell(cel10);
                    
                    
                    cel11=new PdfPCell(new Phrase("Received the goods correctly and good condition",boldFont4));
                    cel11.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cel11.setBorder(Rectangle.LEFT | Rectangle.BOTTOM);
                    table10.addCell(cel11);
                    
                    cel11=new PdfPCell(new Phrase("           ",boldFont4));
                    cel11.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cel11.setBorder(Rectangle.LEFT);
                    table10.addCell(cel11);
                    
                    cel11=new PdfPCell(new Phrase("             ",boldFont4));
                    cel11.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cel11.setBorder(Rectangle.LEFT | Rectangle.RIGHT);
                    table10.addCell(cel11);
                    
                    
                    
                    cel12=new PdfPCell(new Phrase("          "+"\n"+"\n"+"\n",boldFont4));
                    cel12.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cel12.setBorder(Rectangle.LEFT | Rectangle.BOTTOM);
                    table10.addCell(cel12);
                    
                    cel12=new PdfPCell(new Phrase("           ",boldFont4));
                    cel12.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cel12.setBorder(Rectangle.LEFT);
                    table10.addCell(cel12);
                    
                    cel12=new PdfPCell(new Phrase("             ",boldFont4));
                    cel12.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cel12.setBorder(Rectangle.LEFT | Rectangle.RIGHT);
                    table10.addCell(cel12);
                    
                    cel13=new PdfPCell(new Phrase("Signature of the Customer",normalfont2));
                    cel13.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cel13.setBorder(Rectangle.LEFT | Rectangle.BOTTOM);
                    table10.addCell(cel13);
                    
                    cel13=new PdfPCell(new Phrase("Common Seal",boldFont4));
                    cel13.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cel13.setBorder(Rectangle.LEFT | Rectangle.TOP | Rectangle.BOTTOM);
                    table10.addCell(cel13);
                    
                    cel13=new PdfPCell(new Phrase(" Authorised Signatory ",normalfont2));
                    cel13.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cel13.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.TOP);
                    table10.addCell(cel13);
                   
                    
                     table10.setWidths(new int[]{50,19,31});
                    
                    // ---------------------------- END OF TABVE10 -----------------------------------------------
                     PdfPTable table11 = new PdfPTable(1);
                    table11.setTotalWidth(500);
                    table11.setLockedWidth(true);
                    
                    PdfPCell cel14;
                    
                    cel14=new PdfPCell(new Phrase("Subject to Guntur Jurisdiction only.",normalfont2));
                    cel14.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cel14.setBorder(Rectangle.NO_BORDER);
                    table11.addCell(cel14);
                    
                    
                     table11.setWidths(new int[]{100});
                    
                    // ------------------------ END OF TABLE11 --------------------------------
                    
                        PdfPTable table12 = new PdfPTable(3);
                    table12.setTotalWidth(500);
                    table12.setLockedWidth(true);
                

                    PdfPCell side3;
                    
                    side3=new PdfPCell(new Phrase("        ",boldFont4));
                    side3.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side3.setBorder(Rectangle.TOP | Rectangle.LEFT);
                    table12.addCell(side3);

                    side3=new PdfPCell(new Phrase("        ",boldFont4));
                    side3.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side3.setBorder(Rectangle.TOP | Rectangle.LEFT);
                    table12.addCell(side3);

                    side3=new PdfPCell(new Phrase("        ",boldFont4));
                    side3.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side3.setBorder(Rectangle.TOP | Rectangle.LEFT | Rectangle.RIGHT);
                    table12.addCell(side3);

                    
                    
                    side3=new PdfPCell(new Phrase("      ",boldFont4));
                    side3.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side3.setBorder(Rectangle.LEFT);
                    table12.addCell(side3);

                  
                    side3=new PdfPCell(image1);
                    side3.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side3.setBorder(Rectangle.LEFT);
                    table12.addCell(side3);

                    side3=new PdfPCell(new Phrase("     ",boldFont4));
                    side3.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side3.setBorder(Rectangle.LEFT | Rectangle.RIGHT);
                    table12.addCell(side3);
                
                    
                    
                    
                    side3=new PdfPCell(image);
                    side3.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side3.setBorder(Rectangle.LEFT);
                    table12.addCell(side3);
                    
                    side3=new PdfPCell(p);
                    side3.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side3.setBorder(Rectangle.LEFT);
                    table12.addCell(side3);
                    

                    side3=new PdfPCell(new Phrase("DUPLICATE"+"\n \n FOR"+"\n \n TRANSPORTER",boldFont4));
                    side3.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side3.setBorder(Rectangle.LEFT | Rectangle.RIGHT);
                    table12.addCell(side3);
                    
                    
                    side3=new PdfPCell(new Phrase("        ",boldFont4));
                    side3.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side3.setBorder(Rectangle.LEFT  | Rectangle.BOTTOM);
                    table12.addCell(side3);

                    side3=new PdfPCell(new Phrase("        ",boldFont4));
                    side3.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side3.setBorder(Rectangle.LEFT  | Rectangle.BOTTOM);
                    table12.addCell(side3);

                    side3=new PdfPCell(new Phrase("        ",boldFont4));
                    side3.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side3.setBorder(Rectangle.LEFT | Rectangle.RIGHT  | Rectangle.BOTTOM);
                    table12.addCell(side3);
                    
                    table12.setWidths(new int[]{25,60,15});

                    // ------------------------------- END OF  TABLE12 ------------------------------
                    
                     PdfPTable table13 = new PdfPTable(3);
                    table13.setTotalWidth(500);
                    table13.setLockedWidth(true);
                

                    PdfPCell side4;
                    
                    side4=new PdfPCell(new Phrase("        ",boldFont4));
                    side4.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side4.setBorder(Rectangle.TOP | Rectangle.LEFT);
                    table13.addCell(side4);

                    side4=new PdfPCell(new Phrase("        ",boldFont4));
                    side4.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side4.setBorder(Rectangle.TOP | Rectangle.LEFT);
                    table13.addCell(side4);

                    side4=new PdfPCell(new Phrase("        ",boldFont4));
                    side4.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side4.setBorder(Rectangle.TOP | Rectangle.LEFT | Rectangle.RIGHT);
                    table13.addCell(side4);

                    
                    
                    side4=new PdfPCell(new Phrase("      ",boldFont4));
                    side4.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side4.setBorder(Rectangle.LEFT);
                    table13.addCell(side4);

                  
                    side4=new PdfPCell(image1);
                    side4.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side4.setBorder(Rectangle.LEFT);
                    table13.addCell(side4);

                    side4=new PdfPCell(new Phrase("     ",boldFont4));
                    side4.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side4.setBorder(Rectangle.LEFT | Rectangle.RIGHT);
                    table13.addCell(side4);
                
                    
                    
                    
                    side4=new PdfPCell(image);
                    side4.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side4.setBorder(Rectangle.LEFT);
                    table13.addCell(side4);
                    
                    side4=new PdfPCell(p);
                    side4.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side4.setBorder(Rectangle.LEFT);
                    table13.addCell(side4);
                    

                    side4=new PdfPCell(new Phrase("TRIPLICATE"+"\n \n FOR"+"\n \n SUPPLIER",boldFont4));
                    side4.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side4.setBorder(Rectangle.LEFT | Rectangle.RIGHT);
                    table13.addCell(side4);
                    
                    
                    side4=new PdfPCell(new Phrase("        ",boldFont4));
                    side4.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side4.setBorder(Rectangle.LEFT  | Rectangle.BOTTOM);
                    table13.addCell(side4);

                    side4=new PdfPCell(new Phrase("        ",boldFont4));
                    side4.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side4.setBorder(Rectangle.LEFT  | Rectangle.BOTTOM);
                    table13.addCell(side4);

                    side4=new PdfPCell(new Phrase("        ",boldFont4));
                    side4.setHorizontalAlignment(Element.ALIGN_CENTER);
                    side4.setBorder(Rectangle.LEFT | Rectangle.RIGHT  | Rectangle.BOTTOM);
                    table13.addCell(side4);
                    
                    table13.setWidths(new int[]{25,60,15});
                    
                    
                    
                    
                    
                    
                    
                    
		       
                     
                     
                     document.open();		       

			
					document.add(table);
                                        document.add(table2);
                                        document.add(table3);
                                        document.add(table4);
                                        document.add(table5);
                                        document.add(table6);
                                        document.add(table7);
                                        document.add(table8);
                                        document.add(table9);
                                        document.add(table10);
                                        document.add(table11);
                                      
												    

       				       document.newPage();            //Opened new page
                                       
                                       document.add(table12);
                                        document.add(table2);
                                        document.add(table3);
                                        document.add(table4);
                                        document.add(table5);
                                        document.add(table6);
                                        document.add(table7);
                                        document.add(table8);
                                        document.add(table9);
                                        document.add(table10);
                                        document.add(table11);
                                       
                                       document.newPage(); 
                                       
                                       document.add(table13);
                                        document.add(table2);
                                        document.add(table3);
                                        document.add(table4);
                                        document.add(table5);
                                        document.add(table6);
                                        document.add(table7);
                                        document.add(table8);
                                        document.add(table9);
                                        document.add(table10);
                                        document.add(table11);
					
		         document.close();

//			             file.close();
                          
        b1=b.toByteArray();
                                    

            System.out.println("Pdf created successfully..");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } 
        
        
        
        
      final String emailFromAddress = "vskstonecrusher@gmail.com"; //change accordingly  
      final String password="vsksc123";
      final String emailCc=" ";
      final String emailSubject="SVKRMI-Invoice has been generated on "+tdto.getInvoiceDate();
      List<String> grade=tdto.getProductDesc();
      String grade_final=" ";
      for(int i1=0;i1<grade.size();i1++){
          String str=grade.get(i1);
             System.out.println("llllllllllll"+grade_final);
             if(!(str.equals(" "))) {
                  grade_final=grade_final+str;
                  System.out.println("Grade isssssssssss"+grade_final);
             }
               
             System.out.println("msgggggg"+grade_final);
          
       }
      
       
                String s11=null;String message2="";
                List<String> uom=tdto.getUom();
                System.out.println("uuuuuuuuuu"+uom);
                for(int i2=0;i2<uom.size();i2++){
            s11=uom.get(i2);
             System.out.println("uuuooooooommmmmmm"+s11);
              message2 +=s11;
             System.out.println("msgggggg222222222"+message2);
                }
      
      final String emailBody="Hello Admin, \n\n Invoice has been generated on "+tdto.getInvoiceDate()+" with Grade "+grade_final+" and Quantity "+tdto.getTotalQty()+message2+"\n\n Party Name is "+tdto.getBillToName()+" with an Amount of Rs."+tdto.getTotalInv()+"0/-  to "+tdto.getShipAddress();
 //   final String emailBody="Hello Admin, \n\n Invoice has been generated on "+tdto.getInvoiceDate()+"\t with grade \t"+;
  
      String host = "smtp.gmail.com";//or IP address  
  
     //Get the session object  
      Properties props = new Properties();
        props.put("mail.smtp.user", "emailFromAddress");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "25");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.EnableSSL.enable", "true");

        props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.setProperty("mail.smtp.socketFactory.fallback", "false");
        props.setProperty("mail.smtp.port", "465");
        props.setProperty("mail.smtp.socketFactory.port", "465");

        javax.mail.Session session = javax.mail.Session.getInstance(props,
                new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(emailFromAddress, password);
            }
        });

        try 
        {
           
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(emailFromAddress));
            message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(emailToAddress));
            String a;
            StringTokenizer st = new StringTokenizer(emailCc,":");
            while(st.hasMoreTokens())
            {
                message.addRecipients(Message.RecipientType.CC, InternetAddress.parse(st.nextToken(),false));
            }
            message.setSubject(emailSubject);
            Multipart multipart = new MimeMultipart("mixed");
            
            BodyPart messageBodyPart1 = new MimeBodyPart();
            messageBodyPart1.setText(emailBody);
            multipart.addBodyPart(messageBodyPart1);
            
                 BodyPart messageBodyPart = new MimeBodyPart();
                 DataSource source = new ByteArrayDataSource(b1,"application/pdf");
                 System.out.println("FILE NAME ISS************"+source);
                 messageBodyPart.setDataHandler(new DataHandler(source));
                 messageBodyPart.setFileName("Invoice"+"00"+tdto.getInvoiceNo()+".pdf");
                 multipart.addBodyPart(messageBodyPart);
            
            message.setContent(multipart);
            System.out.println("Sending Email to " + emailToAddress + " from "+ emailFromAddress + " with Subject and body " + emailSubject + "  "+ emailBody);
            Transport.send(message);
            System.out.println("Done");

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    
    
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
         System.out.println("Invoice number is"+inv);
         Session s = HibernateUtil.getSessionFactory().openSession();
         Transaction t = s.beginTransaction();
         List l=new ArrayList();
         List<ChTaxIntra> l1=new ArrayList();
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
            System.out.println("id outside iss"+id);
          Criteria c1 = s.createCriteria(ChTaxIntra.class);
          c1.add(Restrictions.eq("prTaxIntra.ptId", id));
          l1=c1.list();
            System.out.println("list is%%%%%%%%%%%%%%"+l1);
          for(Object o:l1) {
              ChTaxIntra c2=(ChTaxIntra) o;
               tot+=c2.getChTotal();
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
        int invno=0;
        try {
             Session s = HibernateUtil.getSessionFactory().openSession();
             Transaction t = s.beginTransaction();
             System.out.println("%%%%%%%%%%%%%%%%%%%%%");
             Date d=new Date();
            
            Criteria c = s.createCriteria(PrTaxIntra.class);
            l=c.list();
            System.out.println("list sssssssssssss"+l);
            if(l.isEmpty()) {
               invno=206; 
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
    
    
    public static int count = 0;
    public static int position = 0;
    public static boolean flag = false;
    public List invList;

    public List getInvList() {
        return invList;
    }

    public void setInvList(List invList) {
        this.invList = invList;
    }
    

    public boolean checkInvc(Integer invoiceNo) {
        System.out.println("*---???.............****-*-*-*-the insert method of invoice no is-----.-------**---");
         Session s = HibernateUtil.getSessionFactory().openSession();
         Transaction t = s.beginTransaction();
         List l=new ArrayList();
           try {
          Criteria c = s.createCriteria(PrTaxIntra.class);
          c.add(Restrictions.eq("invoiceNo", invoiceNo));
         l=c.list();
         if(l.size()>0){
             System.out.println("there is a tax invoice with no-------**--------------->"+invoiceNo);
             return true;
         }else{
              Criteria c1 = s.createCriteria(PrTaxIntra.class);
              c1.setProjection((Projections.property("invoiceNo")));
              List invlist=c1.list();
              System.out.println("\n the list is in orderred form------------->"+invlist);
              Collections.sort(invlist); 
              System.out.println("after sorting the list is------------...-->"+invlist);
              Integer[] array= (Integer[]) invlist.toArray(new Integer[invlist.size()]);
              int[] a=new int[array.length];
                int i=0;
                for(Integer in:array){
                    a[i]=in;
                    i++;
                }
                System.out.println("the array list issssssssss88888***********-->"+a.length);
              // List<Integer> pp=findMissingNumbers(a, position);
               List<Integer> pp=findMissingNumbers(array);
               Integer x=array[array.length-1];
               System.out.println("the last value is****///*****--------->"+x+"****----------*-------"+array[array.length-1]);
              
               
               
               
               
               for(int j=0;j<pp.size();j++){
                 //  System.out.println("the /*************/***********/*"+pp.get(j)+".........."+invoiceNo);
                   if(Objects.equals(invoiceNo, pp.get(j))){
                       
                       System.out.println("the invoice num is equal to the missing invoice number888----8***--->"+pp.get(j));
                       return true;
                   }
                }
                  
                      // System.out.println("the invoice no doesn't match--=----:---");
                       invList=pp;
                       System.out.println(invoiceNo+"----> is the inv no----- the invlist is--------------***-------&------>"+invList);
                       return false;
                   
         }
        }
         
        catch(Exception e) {
            System.out.println("the exception in the checking invoice number in taxmanager is----->"+e);
        }
             t.commit();
           s.close();
        return false;
    }
  
     private static List<Integer> findMissingNumbers(Integer[] arra) {
            List l = new ArrayList();
          ArrayList<Integer> list = new ArrayList<>(Arrays.asList(arra));

    int head = list.get(0);
    int tail = list.get(list.size() - 1);

    int length = tail - head + 1;
    int[] array = new int[length];

    for (int i : list) {
        array[i - head] = 1;
    }

    for (int i = 0; i < array.length; i++) {
        if (array[i] == 0) {
            System.out.println("Missing, position "+( i + head)+"---------"+ (i + 1));
            l.add(i + head);
        }
    }
       
        return l;
    }
    
 
  
     public List invlist1(int inv) {
         Session s = HibernateUtil.getSessionFactory().openSession();
         Transaction t = s.beginTransaction();
         List l=new ArrayList();
         int inv1=0;
        try {
          Criteria c = s.createCriteria(PrTaxIntra.class);
          List l1=c.list();
          for(Object o:l1) {
              PrTaxIntra pr=(PrTaxIntra) o;
                inv1=pr.getInvoiceNo();
                if(inv1!=inv)
                {
                      l.add("'00"+inv1+"'");
                }
              
               
          }
            System.out.println("tot iss"+"'00"+inv+"'");
           // l.remove("00"+inv);
          
        }
        catch(Exception e) {
            
        }
            System.out.println("FINAL LIST IS"+l);
        return l;
    }
    
}
