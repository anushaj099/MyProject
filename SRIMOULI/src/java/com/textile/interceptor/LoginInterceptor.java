
package com.textile.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.StrutsStatics;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.textile.model.Login;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import static java.util.concurrent.TimeUnit.MILLISECONDS;
import java.util.logging.Level;
import java.util.logging.Logger;

public class LoginInterceptor extends AbstractInterceptor implements
                StrutsStatics {

       // private static final Log log = LogFactory.getLog(LoginInterceptor.class);
        private static final String USER_HANDLE = "loggedInUser";

        @Override
        public void init() {
                //log.info("Intializing LoginInterceptor");
        }

        @Override
        public void destroy() {
        }

        @Override
        public String intercept(ActionInvocation invocation) throws Exception {

                final ActionContext context = invocation.getInvocationContext();
                HttpServletRequest request = (HttpServletRequest) context
                                .get(HTTP_REQUEST);
                HttpSession session = request.getSession(true);
                // Is there a "user" object stored in the user's HttpSession?
                Object user = session.getAttribute(USER_HANDLE);
                if (user == null) {
                        // The user has not logged in yet.
                        /* The user is attempting to log in. */
                        System.out.println("****.....0000000000000"+user+"........"+invocation.getAction().getClass());
                       String sg=invocation.getAction().getClass().toString();
                       System.out.println("****---------??????????????-----------."+invocation.getAction().getClass());
                        
                        if (sg.equals("class com.textile.struts.LoginForm"))
                        {
                              System.out.println("****.....00000000000001111111111111111"+user);
                              return invocation.invoke();
                        }
                        return "login";
                } 
                else {
                     System.out.println("****.....000000000000011111111122222222221111111"+user);
                     
        // Create a calendar instance
        Calendar calendar = Calendar.getInstance();
      
        int hour=calendar.get(Calendar.HOUR_OF_DAY);
        System.out.println("the hour of day iss------------>"+hour);
 
        // Set time of execution. Here, we have to run every day 4:20 PM; so,
        // setting all parameters.
        calendar.set(Calendar.HOUR, 11);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.AM_PM, Calendar.AM);
 
        Long currentTime = new Date().getTime();
 
        // Check if current time is greater than our calendar's time. If So,
        // then change date to one day plus. As the time already pass for
        // execution.
        if (calendar.getTime().getTime() < currentTime) {
            calendar.add(Calendar.DATE, 1);
        }
 
        // Calendar is scheduled for future; so, it's time is higher than
        // current time.
        long startScheduler = calendar.getTime().getTime() - currentTime;
 
        // Setting stop scheduler at 4:21 PM. Over here, we are using current
        // calendar's object; so, date and AM_PM is not needed to set
        calendar.set(Calendar.HOUR, 5);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.AM_PM, Calendar.PM);
 
        // Calculation stop scheduler
        long stopScheduler = calendar.getTime().getTime() - currentTime;
 
        // Executor is Runnable. The code which you want to run periodically.
        Runnable task = new Runnable() {
 
            @Override
            public void run() {
                
                System.out.println("test printed-------<<<<<****>>>>---...in listener..1101010.......");
                
                Date date = new Date();
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
             String name=dateFormat.format(date);
            
             String fil="srimouli2_"+name;
             System.out.println("the name of dbbbbbbbb issssss------------------------------->"+name);
             try{
                 
                  File f = new File("C:\\ProgramData\\MySQL\\"+fil+".sql");

                if(f.exists()){
                        System.out.println("File existed");
                }
                else
                {
                        System.out.println("File not found!");
                        final File batchFile = new File("D:\\Batch\\562652.bat");

                      //  final File outputFile = new File(String.format("C:\\Users\\Masrat\\Desktop\\output_%tY%<tm%<td_%<tH%<tM%<tS.txt",
                      //  System.currentTimeMillis()));
           
                        final ProcessBuilder processBuilder = new ProcessBuilder(batchFile.getAbsolutePath(), name);
    
                        processBuilder.redirectErrorStream(true);
                      //  processBuilder.redirectOutput(outputFile);
            
                        final Process process = processBuilder.start();
                        int exitStatus = process.waitFor();
                        System.out.println("Processed finished with status: " + exitStatus);
                        
                       Date dat=dateFormat.parse(name);
                       Date oneDayBefore = new Date(dat.getTime() - 2);
                       String fmt=dateFormat.format(oneDayBefore);
                       System.out.println("the previous date of current date is---.......----------->"+oneDayBefore+"--...--->"+fmt);
                       String sg="srimouli2_"+fmt;
                        File fl = new File("C:\\ProgramData\\MySQL\\"+sg+".sql");
                        if(fl.exists()){
                            System.out.println("File existed");
                            boolean bool = fl.delete();
                            System.out.println("File deleted:*********************-------- "+bool);
                        }
                        else{
                            System.out.println("file not existed");
                        }
                      
                }

             }
             catch(Exception e){
                 System.out.println("the exception in creating daily data backup.............--------->"+e);
             }
                                    
            }
        };
 
        // Get an instance of scheduler
        final ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);
        // execute scheduler at fixed time.
        scheduler.scheduleAtFixedRate(task, startScheduler, stopScheduler, MILLISECONDS);
               
              return invocation.invoke();      
        }
    }
} 