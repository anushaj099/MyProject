/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mail.manager;

/**
 *
 * @author nsg
 */
import com.mail.action.SendEmailAction;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.StringTokenizer;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class SendEmail {

    public static void sendEmail(final String emailFromAddress,final String password,final String emailToAddress,
            final String emailCc, final String emailSubject,  String emailBody,  File file, final String fileName)
    {
    
        
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

        Session session = Session.getInstance(props,
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
                 DataSource source = new FileDataSource(file);
                 messageBodyPart.setDataHandler(new DataHandler(source));
                 messageBodyPart.setFileName(fileName);
                 multipart.addBodyPart(messageBodyPart);
            
            message.setContent(multipart);
            System.out.println("Sending Email to " + emailToAddress + " from "+ emailFromAddress + " with Subject and body " + emailSubject + "  "+ emailBody);
          
            Transport.send(message);
            

            System.out.println("Done");

        } catch (MessagingException e) {
            e.printStackTrace();
        }

    }
}
