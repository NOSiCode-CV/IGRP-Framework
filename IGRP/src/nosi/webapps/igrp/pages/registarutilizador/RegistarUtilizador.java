/*---------------------- Create Model ----------------------*/
package nosi.webapps.igrp.pages.registarutilizador;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import java.util.ArrayList;

public class RegistarUtilizador extends Model{		
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	@RParam(rParamName = "p_nome")
	private String nome;
	@RParam(rParamName = "p_id")
	private String id;
	@RParam(rParamName = "p_username")
	private String username;
	@RParam(rParamName = "p_email")
	private String email;
	@RParam(rParamName = "p_password")
	private String password;
	@RParam(rParamName = "p_confirmar_password")
	private String confirmar_password;
	
	public void setSectionheader_1_text(String sectionheader_1_text){
		this.sectionheader_1_text = sectionheader_1_text;
	}
	public String getSectionheader_1_text(){
		return this.sectionheader_1_text;
	}
	
	public void setNome(String nome){
		this.nome = nome;
	}
	public String getNome(){
		return this.nome;
	}
	
	public void setUsername(String username){
		this.username = username;
	}
	public String getUsername(){
		return this.username;
	}
	
	public void setEmail(String email){
		this.email = email;
	}
	public String getEmail(){
		return this.email;
	}
	
	public void setPassword(String password){
		this.password = password;
	}
	public String getPassword(){
		return this.password;
	}
	
	public void setConfirmar_password(String confirmar_password){
		this.confirmar_password = confirmar_password;
	}
	public String getConfirmar_password(){
		return this.confirmar_password;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}


}
/*-------------------------*/