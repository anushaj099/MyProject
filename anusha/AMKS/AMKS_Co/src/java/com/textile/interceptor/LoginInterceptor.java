
package com.textile.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.StrutsStatics;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

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
                System.out.println("WWWWWWWWWWWWW"+user);
                if (user == null) {
                        // The user has not logged in yet.
                        /* The user is attempting to log in. */
                        System.out.println("****.....0000000000000"+user+"........"+invocation.getAction().getClass());
                       String sg=invocation.getAction().getClass().toString();
                       System.out.println("****---------??????????????-----------."+invocation.getAction().getClass());
                        System.out.println("class iss"+sg);
                        if (sg.equals("class com.readymix.action.LoginForm"))
                        {
                              System.out.println("****.....00000000000001111111111111111"+user);
                              return invocation.invoke();
                        }
                        return "login";
                } 
                else {
                     System.out.println("****.....000000000000011111111122222222221111111"+user);
                        return invocation.invoke();
                }
    }
} 