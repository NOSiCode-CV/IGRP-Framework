package nosi.core.webapp.webservices.rest.pesquisa_geral;

import java.io.Serializable;

import com.google.common.reflect.TypeToken;

import nosi.core.webapp.Core;

/**
 * Isaias.Nunes
 * Jan 16, 2019
 */
public class Entry implements Serializable{

	private static final long serialVersionUID = 1L;
	private int NU_NIF;
	private String NM_CONTRIBUINTE;
	private String DT_NASC;
	private String NM_PAI;
	private String NM_MAE;
	private int NU_BI;
	public int getNU_NIF() {
		return NU_NIF;
	}
	public void setNU_NIF(int nU_NIF) {
		NU_NIF = nU_NIF;
	}
	public String getNM_CONTRIBUINTE() {
		return NM_CONTRIBUINTE;
	}
	public void setNM_CONTRIBUINTE(String nM_CONTRIBUINTE) {
		NM_CONTRIBUINTE = nM_CONTRIBUINTE;
	}
	public String getDT_NASC() {
		return DT_NASC;
	}
	public void setDT_NASC(String dT_NASC) {
		DT_NASC = dT_NASC;
	}
	public String getNM_PAI() {
		return NM_PAI;
	}
	public void setNM_PAI(String nM_PAI) {
		NM_PAI = nM_PAI;
	}
	public String getNM_MAE() {
		return NM_MAE;
	}
	public void setNM_MAE(String nM_MAE) {
		NM_MAE = nM_MAE;
	}
	public int getNU_BI() {
		return NU_BI;
	}
	public void setNU_BI(int nU_BI) {
		NU_BI = nU_BI;
	}
	@Override
	public String toString() {
		return "Entry [NU_NIF=" + NU_NIF + ", NM_CONTRIBUINTE=" + NM_CONTRIBUINTE + ", DT_NASC=" + DT_NASC
				+ ", NM_PAI=" + NM_PAI + ", NM_MAE=" + NM_MAE + ", NU_BI=" + NU_BI + "]";
	}
	
}