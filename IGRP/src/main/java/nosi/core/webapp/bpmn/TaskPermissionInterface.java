package nosi.core.webapp.bpmn;

import nosi.webapps.igrp.dao.ActivityExecute;

/**
 * Emanuel
 * 28 Mar 2019
 */
public interface TaskPermissionInterface {
	
	boolean allowTask(ActivityExecute task);
	
}
