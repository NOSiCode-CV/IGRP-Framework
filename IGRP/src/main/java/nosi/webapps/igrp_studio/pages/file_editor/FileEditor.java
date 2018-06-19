package nosi.webapps.igrp_studio.pages.file_editor;

import java.util.List;

/**
 * Emanuel
 * 12 Jun 2018
 */
public class FileEditor {

	private String name;
	private List<ChildFileEditor> childs;
	
	public FileEditor() {
		
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<ChildFileEditor> getChilds() {
		return childs;
	}

	public void setChilds(List<ChildFileEditor> childs) {
		this.childs = childs;
	}

	public static class DefualtFile{
		private Integer[] id;

		public Integer[] getId() {
			return id;
		}

		public void setId(Integer[] id) {
			this.id = id;
		}	
		
	}
	
	public static class ChildFileEditor{
		private String name;
		private Integer id;
		private String path;
		
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public Integer getId() {
			return id;
		}
		public void setId(Integer id) {
			this.id = id;
		}
		public String getPath() {
			return path;
		}
		public void setPath(String path) {
			this.path = path;
		}
	}
}
