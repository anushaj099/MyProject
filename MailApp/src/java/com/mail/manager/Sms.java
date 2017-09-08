/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mail.manager;

/*import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;

import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.CookieStore;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.protocol.ClientContext;
import org.apache.http.cookie.Cookie;
import org.apache.http.impl.client.BasicCookieStore;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.protocol.BasicHttpContext;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.EntityUtils;


public class Sms {
    HttpClient httpclient = new DefaultHttpClient();
    CookieStore cookieStore = new BasicCookieStore();
    HttpContext localContext = new BasicHttpContext();
    HttpGet httpget;
    HttpResponse response;
    HttpEntity entity;
    List<Cookie> cookies;
    Cookie cookie = null;
    private String action1;
    final String sendSMSPage = "http://160by2.com/SendSMS?";
    final String sendSMSActionPage ="http://160by2.com/SendSMSAction?hid_exists=yes";
    final String loginPage ="http://160by2.com/re-login?";

    public Sms() {
    }

    public boolean getLoggedIn(String uname, String pwd) throws IOException,
                                                                ClientProtocolException {
        localContext.setAttribute(ClientContext.COOKIE_STORE, cookieStore);
        URI uri = null;
        uri = URI.create(loginPage + "username=" + uname + "&password=" + pwd);
        HttpGet httpget = new HttpGet(uri);
        response = httpclient.execute(httpget, localContext);
        entity = response.getEntity();
        cookies = cookieStore.getCookies();
        Cookie cookie = cookies.get(0);
        String cookieSet = cookie.getName() + "=" + cookie.getValue();
        EntityUtils.consume(entity);
        System.out.println("\n ffffffffffff"+cookieSet);
        fetchAction(cookieSet);

        if (isLoggedIn())
            return true;
        else
            return false;
    }

    private void fetchAction(String cookieSet) throws IOException {

        URLConnection conn = new URL(sendSMSPage).openConnection();
        conn.setRequestProperty("Cookie", cookieSet);
        InputStreamReader isr = new InputStreamReader(conn.getInputStream());
        BufferedReader br = new BufferedReader(isr);
        String content;
        StringBuilder sBuilder = new StringBuilder();
        while (true) {
            content = br.readLine();
            if (content == null)
                break;
            else if (content.contains("id=\"action1\"")) {
                sBuilder.append(content);
                break;
            }
        }
       // String action[] = content.split("value=\"");
        //String action1[] = action[1].split("\"");
        //setAction1(action1[0]);
    }

    public void sendSms(String to, String msg) throws URISyntaxException,
                                                      UnsupportedEncodingException,
                                                      IOException,
                                                      ClientProtocolException {

        URI uri = null;
        msg = URLEncoder.encode(msg, "utf-8");
        String params =
            "&action1=" + getAction1() + "&mobile1=" + to + "&msg1=" + msg;
        uri = new URI(sendSMSActionPage + params);
        httpget = new HttpGet(uri);
        httpclient.execute(httpget, localContext);
    }

    public boolean isLoggedIn() {
        try {
            if (cookies.size() == 2)
                return true;
            else
                return false;

        } catch (NullPointerException e) {
            return false;
        }
    }

    public void setAction1(String action1) {
        this.action1 = action1;
    }

    public String getAction1() {
        return action1;
    }


    public static void main(String[] args) throws IOException,ClientProtocolException {
        Sms proxy = new Sms();
        String username = "8801724894";
        String password = "triveni09";
        String to = "9542434003";
        String msg = "your message as string";
        try {
            proxy.getLoggedIn(username, password);
            proxy.sendSms(to, msg);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }
}*/


import java.net.*;
import java.io.*;
import com.way2sms.SMS;

public class Sms
{
//Replace your way2sms username and password below
static final String _userName = "8886271801";
static final String _password = "anushaj099";
static final String _url = "http://www.way2sms.com/entry.jsp";//"http://smsapi.cikly.in/index.php";
static final String charset = "UTF-8";

//to build the query string that will send a message
private static String buildRequestString(String targetPhoneNo, String message) throws UnsupportedEncodingException
{
String[] params = new String [5];
params[0] = _userName;
params[1] = _password;
params[2] = message;
params[3] = targetPhoneNo;
params[4] = "way2sms";

String query = String.format("uid=%s&pwd=%s&msg=%s&phone=%s&provider=%s",
URLEncoder.encode(params[0],charset),
URLEncoder.encode(params[1],charset),
URLEncoder.encode(params[2],charset),
URLEncoder.encode(params[3],charset),
URLEncoder.encode(params[4],charset));
return query;
}

public static void sendMessage(String reciever, String message) throws Exception
{
//To establish the connection and perform the post request
URLConnection connection = new URL(_url + "?" + buildRequestString(reciever,message)).openConnection();
System.out.println("\n ddddddddddd"+connection);
connection.setRequestProperty("Accept-Charset", charset);

//This automatically fires the request and we can use it to determine the response status
InputStream response = connection.getInputStream();
System.out.println("\n ssssssssssaaaaaaaaaaaa"+response);
BufferedReader br = new BufferedReader(new InputStreamReader(response));
System.out.println("\n zzzzzzzzzzzzzzz"+br);
System.out.println(connection+"sssssssss" +br+" ggggggggg"+response);
}

public static void main(String[] args) throws Exception
{
String testPhoneNo = "9553939951";
System.out.println("noooooooooooooooooo"+testPhoneNo);

String testMessage = "Sending";
System.out.println("noooooooooooooooooo"+testMessage);
  // SMS smsClient=new SMS();
//   smsClient.send( "8801724894", "triveni09", "9542434003", "haiiii","");
sendMessage(testPhoneNo,testMessage);
System.out.println("9999999999999999");
}
}