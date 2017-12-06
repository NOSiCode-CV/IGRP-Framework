package nosi.core.listener;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;
/**
 * Marcel Iekiny
 * Nov 23, 2017
 */
@WebListener
public class UserSessionStorage implements HttpSessionBindingListener {

	public UserSessionStorage() {}

	 public void valueBound(HttpSessionBindingEvent arg0)  { 
        
    }

	 public void valueUnbound(HttpSessionBindingEvent arg0)  { 
         
    }
	
}
