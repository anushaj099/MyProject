/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mail.manager;

/**
 *
 * @author NSG
 */
import java.awt.event.ActionEvent;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;




public class Sms1 
{
    public static void main(String[] args) 
    {
        String user = "saranya12345";
        int randomPIN = (int)(Math.random()*900000)+100000;
            // Replace with your API KEY (We have sent API KEY on activation email, also available on panel)
            String apikey = "ymLFTbhK20cxD019L5SJ";

            // Replace with the destination mobile Number to which you want to send sms
            String mobile = "9553939951";

            // Replace if you have your own Sender ID, else donot change
            String senderid = "SVKRMC";

            // Replace with your Message content
            String message = "hloooooooooooo";

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
            sbPostData.append("&message="+ message);
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
        }  

    
}
