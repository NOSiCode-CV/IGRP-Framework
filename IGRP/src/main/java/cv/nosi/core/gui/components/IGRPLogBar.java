package cv.nosi.core.gui.components;

import java.util.Iterator;
import java.util.List;

import cv.nosi.core.webapp.Igrp;
import cv.nosi.core.webapp.util.FlashMessage;
/**
 * Iekiny Marcel
 * Jan 11, 2018
 */
public class IGRPLogBar {
	
	private List<String> logs;
	
	public IGRPLogBar() {
		logs = Igrp.getInstance().getLog().getMsgLog();
	}
	
	public void displayLogs() {
		Iterator<String> i = logs.iterator();
		FlashMessage flashMessage = Igrp.getInstance().getFlashMessage();
		while(i.hasNext()) 
			flashMessage.addMessage("debug", i.next());
	}
}
