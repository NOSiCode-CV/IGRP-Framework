package nosi.webapps.igrp_studio.pages.file_editor;

import java.util.List;
import nosi.webapps.igrp_studio.pages.file_editor.FileEditor.ChildFileEditor;

/**
 * Emanuel
 * 12 Jun 2018
 */
public class DirFileEditor {

	private List<FileEditor> dir;	
	private List<ChildFileEditor> default_file;
	
	public DirFileEditor() {
		
	}
	
	public List<FileEditor> getDir() {
		return dir;
	}
	
	public void setDir(List<FileEditor> dir) {
		this.dir = dir;
	}

	public List<ChildFileEditor> getDefault_file() {
		return default_file;
	}

	public void setDefault_file(List<ChildFileEditor> default_file) {
		this.default_file = default_file;
	}
	
}
