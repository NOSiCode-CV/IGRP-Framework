package nosi.webapps.igrp.pages.oauthclientlist;
import nosi.core.config.Config;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.webapp.SeparatorList;
import java.util.ArrayList;
import java.util.List;

public class OAuthClientList extends Model{		
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	@RParam(rParamName = "p_uris_")
	private String uris_;
	@RParam(rParamName = "p_clientid_pesquisa")
	private String clientid_pesquisa;
	
	private List<Table_1> table_1 = new ArrayList<>();	
	public void setTable_1(List<Table_1> table_1){
		this.table_1 = table_1;
	}
	public List<Table_1> getTable_1(){
		return this.table_1;
	}
	
	public void setSectionheader_1_text(String sectionheader_1_text){
		this.sectionheader_1_text = sectionheader_1_text;
	}
	public String getSectionheader_1_text(){
		return this.sectionheader_1_text;
	}
	
	public void setUris_(String uris_){
		this.uris_ = uris_;
	}
	public String getUris_(){
		return this.uris_;
	}
	
	public void setClientid_pesquisa(String clientid_pesquisa){
		this.clientid_pesquisa = clientid_pesquisa;
	}
	public String getClientid_pesquisa(){
		return this.clientid_pesquisa;
	}


	public static class Table_1{
		private String client_id;
		private String client_secret;
		private String uris;
		private String grant_types;
		private String scope;
		private String p_id;
		public void setClient_id(String client_id){
			this.client_id = client_id;
		}
		public String getClient_id(){
			return this.client_id;
		}

		public void setClient_secret(String client_secret){
			this.client_secret = client_secret;
		}
		public String getClient_secret(){
			return this.client_secret;
		}

		public void setUris(String uris){
			this.uris = uris;
		}
		public String getUris(){
			return this.uris;
		}

		public void setGrant_types(String grant_types){
			this.grant_types = grant_types;
		}
		public String getGrant_types(){
			return this.grant_types;
		}

		public void setScope(String scope){
			this.scope = scope;
		}
		public String getScope(){
			return this.scope;
		}

		public void setP_id(String p_id){
			this.p_id = p_id;
		}
		public String getP_id(){
			return this.p_id;
		}

	}
}
