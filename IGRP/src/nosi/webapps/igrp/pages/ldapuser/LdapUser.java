package nosi.webapps.igrp.pages.ldapuser;
import nosi.core.config.Config;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.webapp.SeparatorList;

public class LdapUser extends Model{		
	@RParam(rParamName = "p_common_name")
	private String common_name;
	@RParam(rParamName = "p_surname")
	private String surname;
	@RParam(rParamName = "p_email_1")
	private String email_1;
	
	public void setCommon_name(String common_name){
		this.common_name = common_name;
	}
	public String getCommon_name(){
		return this.common_name;
	}
	
	public void setSurname(String surname){
		this.surname = surname;
	}
	public String getSurname(){
		return this.surname;
	}
	
	public void setEmail_1(String email_1){
		this.email_1 = email_1;
	}
	public String getEmail_1(){
		return this.email_1;
	}


}
