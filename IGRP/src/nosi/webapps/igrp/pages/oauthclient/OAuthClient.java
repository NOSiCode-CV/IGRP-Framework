/*---------------------- Create Model ----------------------*/
package nosi.webapps.igrp.pages.oauthclient;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;


public class OAuthClient extends Model{		
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	@RParam(rParamName = "p_uris_de_redirecionamento")
	private String uris_de_redirecionamento;
	@RParam(rParamName = "p_scope")
	private String scope;
	@RParam(rParamName = "p_clientID")
	private String clientID;
	@RParam(rParamName = "p_clientSecret")
	private String clientSecret;
	
	public void setSectionheader_1_text(String sectionheader_1_text){
		this.sectionheader_1_text = sectionheader_1_text;
	}
	public String getSectionheader_1_text(){
		return this.sectionheader_1_text;
	}
	
	public void setUris_de_redirecionamento(String uris_de_redirecionamento){
		this.uris_de_redirecionamento = uris_de_redirecionamento;
	}
	public String getUris_de_redirecionamento(){
		return this.uris_de_redirecionamento;
	}
	
	public void setScope(String scope){
		this.scope = scope;
	}
	public String getScope(){
		return this.scope;
	}
	public String getClientID() {
		return clientID;
	}
	public void setClientID(String clientID) {
		this.clientID = clientID;
	}
	public String getClientSecret() {
		return clientSecret;
	}
	public void setClientSecret(String clientSecret) {
		this.clientSecret = clientSecret;
	}


}
/*-------------------------*/