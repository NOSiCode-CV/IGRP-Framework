package nosi.core.webapp.helpers;
/**
 * Emanuel
 * 19 Oct 2018
 */
public class ApplicationPermition {

	private Integer appId = 1;
	private String dad = "igrp";
	private Integer profId = -1;
	private Integer ogrId = -1;
	private String code_profile;
	private String code_organization;
	
	public ApplicationPermition() {
		
	}
	
	public ApplicationPermition(Integer appId, String dad, Integer ogrId, Integer profId,
			String code_organization, String code_profile) {
		super();
		this.appId = appId;
		this.dad = dad;
		this.profId = profId;
		this.ogrId = ogrId;
		this.code_profile = code_profile;
		this.code_organization = code_organization;
	}

	public Integer getAppId() {
		return appId;
	}

	public void setAppId(Integer appId) {
		this.appId = appId;
	}

	public String getDad() {
		return dad;
	}
	public void setDad(String dad) {
		this.dad = dad;
	}
	public Integer getProfId() {
		return profId;
	}
	public void setProfId(Integer profId) {
		this.profId = profId;
	}
	public Integer getOgrId() {
		return ogrId;
	}
	public void setOgrId(Integer ogrId) {
		this.ogrId = ogrId;
	}
	
	public String getCode_profile() {
		return code_profile;
	}

	public void setCode_profile(String code_profile) {
		this.code_profile = code_profile;
	}

	public String getCode_organization() {
		return code_organization;
	}

	public void setCode_organization(String code_organization) {
		this.code_organization = code_organization;
	}

	@Override
	public String toString() {
		return "ApplicationPermition [appId=" + appId + ", dad=" + dad + ", profId=" + profId + ", ogrId=" + ogrId
				+ ", code_profile=" + code_profile + ", code_organization=" + code_organization + "]";
	}

	
	
	
}
