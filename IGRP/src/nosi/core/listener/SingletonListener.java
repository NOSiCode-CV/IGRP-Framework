package nosi.core.listener;

import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.annotation.WebListener;

import nosi.core.webapp.Igrp;
import nosi.core.webapp.ThreadLocalIgrpFactory;
/**
 * Marcel Iekiny
 * Nov 23, 2017
 */
@WebListener 
public class SingletonListener implements ServletRequestListener {

    public SingletonListener() {}

    public void requestDestroyed(ServletRequestEvent arg0)  { 
         // TODO Auto-generated method stub
    	 ThreadLocalIgrpFactory app = (ThreadLocalIgrpFactory) Igrp.getInstance().getAppInstance();
    	 app.cleanUp();
    	 //System.out.println("Listener entrado ...");
    }

    public void requestInitialized(ServletRequestEvent arg0)  {}    
}
