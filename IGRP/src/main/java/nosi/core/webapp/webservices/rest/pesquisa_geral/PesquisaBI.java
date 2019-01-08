package nosi.core.webapp.webservices.rest.pesquisa_geral;
/**
 * Isaias.Nunes
 * Jan 3, 2019
 */

import java.io.Serializable;

import com.google.common.reflect.TypeToken;
import nosi.core.webapp.Core;

public class PesquisaBI implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String NOME;
	private int BI;
	private String SEXO;
	private String DT_NASC;
	private String NOME_MAE;
	private String NOME_PAI;
	private String Error;
	public String getNOME() {
		return NOME;
	}
	public void setNOME(String nome) {
		NOME = nome;
	}
	public int getBI() {
		return BI;
	}
	public void setBI(int bi) {
		BI = bi;
	}
	public String getSEXO() {
		return SEXO;
	}
	public void setSEXO(String sexo) {
		SEXO = sexo;
	}
	public String getDT_NASC() {
		return DT_NASC;
	}
	public void setDT_NASC(String dt_nasc) {
		DT_NASC = dt_nasc;
	}
	public String getNOME_MAE() {
		return NOME_MAE;
	}
	public void setNOME_MAE(String nome_mae) {
		NOME_MAE = nome_mae;
	}
	public String getNOME_PAI() {
		return NOME_PAI;
	}
	public void setNOME_PAI(String nome_pai) {
		NOME_PAI = nome_pai;
	}
	
	public String getError() {
		return Error;
	}
	public void setError(String error) {
		Error = error;
	}
	
	@Override
	public String toString() {
		return "PesquisaBI [NOME=" + NOME + ", BI=" + BI + ", SEXO=" + SEXO + ", DT_NASC=" + DT_NASC + ", NOME_MAE="
				+ NOME_MAE + ", NOME_PAI=" + NOME_PAI + ", Error=" + Error + "]";
	}
	public PesquisaBI getListBI(String json){
		return (PesquisaBI) Core.fromJsonWithJsonBuilder(json, new TypeToken<PesquisaBI>() {
			private static final long serialVersionUID = 1L;}.getType());
	}

}