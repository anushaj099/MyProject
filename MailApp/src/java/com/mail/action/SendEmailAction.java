/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mail.action;

/**
 *
 * @author nsg
 */
import com.mail.manager.SendEmail;
import java.io.File;

import javax.servlet.ServletContext;

import org.apache.struts2.util.ServletContextAware;

import com.opensymphony.xwork2.ActionSupport;

public class SendEmailAction extends ActionSupport implements
        ServletContextAware {

    private static final long serialVersionUID = 1L;

    private String emailSubject;
    private String emailBody;
    private String emailToAddress;
    private String emailFromAddress, password,emailCc;

    public String getEmailCc() {
        return emailCc;
    }

    public void setEmailCc(String emailCc) {
        this.emailCc = emailCc;
    }
    

    public String getEmailFromAddress() {
        return emailFromAddress;
    }

    public void setEmailFromAddress(String emailFromAddress) {
        this.emailFromAddress = emailFromAddress;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    private File file;
    private String fileFileName;
    private ServletContext servletContext;

    public String getEmailSubject() {
        return emailSubject;
    }

    public void setEmailSubject(String emailSubject) {
        this.emailSubject = emailSubject;
    }

    public String getEmailBody() {
        return emailBody;
    }

    public void setEmailBody(String emailBody) {
        this.emailBody = emailBody;
    }

    

    public String getEmailToAddress() {
        return emailToAddress;
    }

    public void setEmailToAddress(String emailToAddress) {
        this.emailToAddress = emailToAddress;
    }

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public String getFileFileName() {
        return fileFileName;
    }

    public void setFileFileName(String fileFileName) {
        this.fileFileName = fileFileName;
    }

    public ServletContext getServletContext() {
        return servletContext;
    }
    @Override
    public void setServletContext(ServletContext servletContext) {
        this.servletContext = servletContext;
    }

    @Override
    public String execute() throws Exception {
        SendEmail.sendEmail(emailFromAddress, password, emailToAddress, emailCc, emailSubject, emailBody, file, fileFileName);
        addActionMessage("Email with attachment successfully sent!");
        return SUCCESS;
    }

    @Override
    public void validate() {
        if (emailToAddress == null) {
            String errorMsg = "You must provide To Email Address!";
            addActionError(errorMsg);
        }
        if (emailSubject == null) {
            String errorMsg = "You must provide Email Subject!";
            addActionError(errorMsg);
        }
        if (emailBody == null) {
            String errorMsg = "You must provide Email Message!";
            addActionError(errorMsg);
        }
        if (file == null) {
            String errorMsg = "You must select a file!";
            addActionError(errorMsg);
        }
    }

}
