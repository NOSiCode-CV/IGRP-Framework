<<<<<<< HEAD

package nosi.core.xml;

import javax.xml.bind.annotation.XmlRootElement;

/**
 * @author Isaias.Nunes
 *
 */
@XmlRootElement(name="page")
public class XMLPageReader {
	private String action;
	private String action_desc;
	private String package_name;
	private String page;
	private String page_desc;
	private int status;
	private String version;
	private String xsl_src;
	private int env_fk;
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public String getAction_desc() {
		return action_desc;
	}
	public void setAction_desc(String action_desc) {
		this.action_desc = action_desc;
	}
	public String getPackage_name() {
		return package_name;
	}
	public void setPackage_name(String package_name) {
		this.package_name = package_name;
	}
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public String getPage_desc() {
		return page_desc;
	}
	public void setPage_desc(String page_desc) {
		this.page_desc = page_desc;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	public String getXsl_src() {
		return xsl_src;
	}
	public void setXsl_src(String xsl_src) {
		this.xsl_src = xsl_src;
	}
	public int getEnv_fk() {
		return env_fk;
	}
	public void setEnv_fk(int env_fk) {
		this.env_fk = env_fk;
	}
	
	
	
	@Override
	public String toString() {
		return "XMLReader action=" + action + ", action_desc=" + action_desc + ", package_name="
				+ package_name + ", page=" + page + ", page_desc=" + page_desc + ", status=" + status + ", version="
				+ version + ", xsl_src=" + xsl_src + ", env_fk=" + env_fk + "]";
	}
	
	
	
}
=======

package nosi.core.xml;

import javax.xml.bind.annotation.XmlRootElement;

/**
 * @author Isaias.Nunes
 *
 */
@XmlRootElement(name="page")
public class XMLPageReader {
	private String action;
	private String action_desc;
	private String package_name;
	private String page;
	private String page_desc;
	private int status;
	private String version;
	private String xsl_src;
	private String dad;
	
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public String getAction_desc() {
		return action_desc;
	}
	public void setAction_desc(String action_desc) {
		this.action_desc = action_desc;
	}
	public String getPackage_name() {
		return package_name;
	}
	public void setPackage_name(String package_name) {
		this.package_name = package_name;
	}
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public String getPage_desc() {
		return page_desc;
	}
	public void setPage_desc(String page_desc) {
		this.page_desc = page_desc;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	public String getXsl_src() {
		return xsl_src;
	}
	public void setXsl_src(String xsl_src) {
		this.xsl_src = xsl_src;
	}
	public String getDad() {
		return dad;
	}
	public void setDad(String dad) {
		this.dad = dad;
	}
	
	
	
	@Override
	public String toString() {
		return "XMLReader action=" + action + ", action_desc=" + action_desc + ", package_name="
				+ package_name + ", page=" + page + ", page_desc=" + page_desc + ", status=" + status + ", version="
				+ version + ", xsl_src=" + xsl_src + ", dad=" + dad + "]";
	}
	
	
	
}
>>>>>>> branch 'master' of https://github.com/NOSiCode-CV/IGRP-Framework.git
