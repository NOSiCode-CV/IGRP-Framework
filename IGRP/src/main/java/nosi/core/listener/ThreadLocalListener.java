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
public class ThreadLocalListener implements ServletRequestListener {

    public ThreadLocalListener() {}

    public void requestDestroyed(ServletRequestEvent arg0)  { 
    	 ((ThreadLocalIgrpFactory<?>) Igrp.getInstance().currentThreadLocal()).cleanUp();
    }

    public void requestInitialized(ServletRequestEvent arg0)  {}    
}
