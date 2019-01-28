package nosi.webapps.igrp_studio.pages.file_editor;

import java.util.Comparator;

/**
 * Emanuel
 * 12 Jun 2018
 */
public class FileEditor{
	
	private Integer id;
	private String name;
	private String path;	
	private String fileName;
	private String dir_path;
	public static final Comparator<FileEditor> ORDER_BY_NAME = new OrderByName();
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getDir_path() {
		return dir_path;
	}
	public void setDir_path(String dir_path) {
		this.dir_path = dir_path;
	}
	
	private static class OrderByName implements Comparator<FileEditor> {
        public int compare(FileEditor v, FileEditor w){
           return v.name.compareTo(w.name);
        }
     }
}
