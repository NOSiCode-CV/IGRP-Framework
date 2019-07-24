package nosi.webapps.app_teste.pages.examform;

import java.math.BigInteger;
import java.math.BigDecimal;
import nosi.core.config.Config;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;

public class Examform extends Model{		
	@RParam(rParamName = "p_nome_exame")
	private String nome_exame;
	@RParam(rParamName = "p_data_exame")
	private String data_exame;
	@RParam(rParamName = "p_imagem_raios_x")
	private String imagem_raios_x;
	
	public void setNome_exame(String nome_exame){
		this.nome_exame = nome_exame;
	}
	public String getNome_exame(){
		return this.nome_exame;
	}
	
	public void setData_exame(String data_exame){
		this.data_exame = data_exame;
	}
	public String getData_exame(){
		return this.data_exame;
	}
	
	public void setImagem_raios_x(String imagem_raios_x){
		this.imagem_raios_x = imagem_raios_x;
	}
	public String getImagem_raios_x(){
		return this.imagem_raios_x;
	}



}
