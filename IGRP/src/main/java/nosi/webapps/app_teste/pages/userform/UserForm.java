package nosi.webapps.app_teste.pages.userform;

import java.math.BigInteger;
import java.math.BigDecimal;
import nosi.core.config.Config;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;

public class UserForm extends Model{		
	@RParam(rParamName = "p_nome")
	private String nome;
	@RParam(rParamName = "p_morada")
	private String morada;
	@RParam(rParamName = "p_data_nascimento")
	private String data_nascimento;
	@RParam(rParamName = "p_genero")
	private String genero;
	@RParam(rParamName = "p_estado_civil")
	private String estado_civil;
	@RParam(rParamName = "p_tipo_de_beneficiario")
	private String tipo_de_beneficiario;
	@RParam(rParamName = "p_email")
	private String email;
	@RParam(rParamName = "p_contacto")
	private int contacto;
	@RParam(rParamName = "p_data_do_registo")
	private String data_do_registo;
	@RParam(rParamName = "p_id_user")
	private int id_user;
	
	public void setNome(String nome){
		this.nome = nome;
	}
	public String getNome(){
		return this.nome;
	}
	
	public void setMorada(String morada){
		this.morada = morada;
	}
	public String getMorada(){
		return this.morada;
	}
	
	public void setData_nascimento(String data_nascimento){
		this.data_nascimento = data_nascimento;
	}
	public String getData_nascimento(){
		return this.data_nascimento;
	}
	
	public void setGenero(String genero){
		this.genero = genero;
	}
	public String getGenero(){
		return this.genero;
	}
	
	public void setEstado_civil(String estado_civil){
		this.estado_civil = estado_civil;
	}
	public String getEstado_civil(){
		return this.estado_civil;
	}
	
	public void setTipo_de_beneficiario(String tipo_de_beneficiario){
		this.tipo_de_beneficiario = tipo_de_beneficiario;
	}
	public String getTipo_de_beneficiario(){
		return this.tipo_de_beneficiario;
	}
	
	public void setEmail(String email){
		this.email = email;
	}
	public String getEmail(){
		return this.email;
	}
	
	public void setContacto(int contacto){
		this.contacto = contacto;
	}
	public int getContacto(){
		return this.contacto;
	}
	
	public void setData_do_registo(String data_do_registo){
		this.data_do_registo = data_do_registo;
	}
	public String getData_do_registo(){
		return this.data_do_registo;
	}
	
	public void setId_user(int id_user){
		this.id_user = id_user;
	}
	public int getId_user(){
		return this.id_user;
	}



}
