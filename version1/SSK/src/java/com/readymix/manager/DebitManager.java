/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.readymix.manager;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Swathi
 */
public class DebitManager {
    
    public List getStates() {
        List<String> states=new ArrayList();
        
        states.add("'"+"Andhra Pradesh"+"'");
        states.add("'"+"West Bengal"+"'");
        
        return states;
    }
    
     public List getStates1() {
        List<String> states=new ArrayList();
        
        states.add("Andhra Pradesh");
        states.add("West Bengal");
        
        return states;
    }
    
     public List getCodes() {
        List<String> codes=new ArrayList();
        
        codes.add("'"+"IN-AP"+"'");
        codes.add("'"+"IN-AR"+"'");
        
        return codes;
    }  
    
}
