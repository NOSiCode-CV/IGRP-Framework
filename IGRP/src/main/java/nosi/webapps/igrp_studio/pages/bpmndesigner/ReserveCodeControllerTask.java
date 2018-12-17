package nosi.webapps.igrp_studio.pages.bpmndesigner;

import nosi.core.webapp.Core;
import nosi.core.webapp.helpers.ExtractReserveCode;
import nosi.core.webapp.helpers.ExtractReserveCode.ReserveCode;

/**
 * Emanuel
 * 17 Dec 2018
 */
public class ReserveCodeControllerTask {

	private String reserveCodeImports;
	
	private String reserveCodeCustomActions;
	
	private String reserveCodeActionIndex;
	
	private String reserveCodeActionSave;
	
	private String reserveCodeActionUpdate;

	public void extract(String code){
 		if(Core.isNotNull(code)) {
 			ReserveCode r = ExtractReserveCode.extractImports(code);
 			this.setReserveCodeImports(r!=null?r.getContent():"");
 			r = ExtractReserveCode.extractCustomsMethods(code);
 			this.setReserveCodeCustomActions(r!=null?r.getContent():"");
 			r = ExtractReserveCode.extract(code, "actionIndex", "index");
 			this.setReserveCodeActionIndex(r!=null?r.getContent():"");
 			r = ExtractReserveCode.extract(code, "actionSave", "index");
 			this.setReserveCodeActionSave(r!=null?r.getContent():"");
 			r = ExtractReserveCode.extract(code, "actionUpdate", "index");
 			this.setReserveCodeActionUpdate(r!=null?r.getContent():""); 			
 		}
	}
	
	public String getReserveCodeImports() {
		return reserveCodeImports;
	}

	public void setReserveCodeImports(String reserveCodeImports) {
		this.reserveCodeImports = reserveCodeImports;
	}

	public String getReserveCodeCustomActions() {
		return reserveCodeCustomActions;
	}

	public void setReserveCodeCustomActions(String reserveCodeCustomActions) {
		this.reserveCodeCustomActions = reserveCodeCustomActions;
	}

	public String getReserveCodeActionIndex() {
		return reserveCodeActionIndex;
	}

	public void setReserveCodeActionIndex(String reserveCodeActionIndex) {
		this.reserveCodeActionIndex = reserveCodeActionIndex;
	}

	public String getReserveCodeActionSave() {
		return reserveCodeActionSave;
	}

	public void setReserveCodeActionSave(String reserveCodeActionSave) {
		this.reserveCodeActionSave = reserveCodeActionSave;
	}

	public String getReserveCodeActionUpdate() {
		return reserveCodeActionUpdate;
	}

	public void setReserveCodeActionUpdate(String reserveCodeActionUpdate) {
		this.reserveCodeActionUpdate = reserveCodeActionUpdate;
	}
	
	
	
}
