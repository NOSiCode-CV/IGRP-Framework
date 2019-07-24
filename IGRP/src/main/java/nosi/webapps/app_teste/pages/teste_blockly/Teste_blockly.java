package nosi.webapps.app_teste.pages.teste_blockly;

import java.math.BigInteger;
import java.math.BigDecimal;
import nosi.core.config.Config;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;

public class Teste_blockly extends Model{		
	@RParam(rParamName = "p_nataniel")
	private String nataniel;
	@RParam(rParamName = "p_morada")
	private String morada;
	@RParam(rParamName = "p_data_registo")
	private String data_registo;
	
	public void setNataniel(String nataniel){
		this.nataniel = nataniel;
	}
	public String getNataniel(){
		return this.nataniel;
	}
	
	public void setMorada(String morada){
		this.morada = morada;
	}
	public String getMorada(){
		return this.morada;
	}
	
	public void setData_registo(String data_registo){
		this.data_registo = data_registo;
	}
	public String getData_registo(){
		return this.data_registo;
	}



}
