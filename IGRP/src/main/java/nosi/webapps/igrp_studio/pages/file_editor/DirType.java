package nosi.webapps.igrp_studio.pages.file_editor;
/**
 * Emanuel
 * 12 Nov 2018
 */
public enum DirType {

	ALL(1),BPMN(0);
	
	private int type;
	
	private DirType(int type) {
		this.type = type;
	}
	
	public int getType() {
		return this.type;
	}
}
