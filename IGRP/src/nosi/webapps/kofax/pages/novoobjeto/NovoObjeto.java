/*---------------------- Create Model ----------------------*/
package nosi.webapps.kofax.pages.novoobjeto;
import nosi.core.config.Config;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.webapp.SeparatorList;
import java.util.ArrayList;
import java.util.List;

public class NovoObjeto extends Model{		
	@RParam(rParamName = "p_organica")
	private String organica;
	@RParam(rParamName = "p_objeto")
	private String objeto;
	@RParam(rParamName = "p_default_page")
	private int default_page;
	@RParam(rParamName = "p_preencher_automatico")
	private int preencher_automatico;
	@RParam(rParamName = "p_pagina")
	private int pagina;
	@RParam(rParamName = "p_formato_output")
	private String formato_output;
	@RParam(rParamName = "p_id")
	private String p_id;
	@RParam(rParamName = "p_estado")
	private String p_estado;

	@SeparatorList(name = Separatorlist_1.class)
	private List<Separatorlist_1> separatorlist_1 = new ArrayList<>();
	public void setSeparatorlist_1(List<Separatorlist_1> separatorlist_1){
		this.separatorlist_1 = separatorlist_1;
	}
	public List<Separatorlist_1> getseparatorlist_1(){
		return this.separatorlist_1;
	}
	
	public void setOrganica(String organica){
		this.organica = organica;
	}
	public String getOrganica(){
		return this.organica;
	}
	
	public void setObjeto(String objeto){
		this.objeto = objeto;
	}
	public String getObjeto(){
		return this.objeto;
	}
	
	public void setDefault_page(int default_page){
		this.default_page = default_page;
	}
	public int getDefault_page(){
		return this.default_page;
	}
	
	public void setPreencher_automatico(int preencher_automatico){
		this.preencher_automatico = preencher_automatico;
	}
	public int getPreencher_automatico(){
		return this.preencher_automatico;
	}
	
	public void setPagina(int pagina){
		this.pagina = pagina;
	}
	public int getPagina(){
		return this.pagina;
	}
	
	public void setFormato_output(String formato_output){
		this.formato_output = formato_output;
	}
	public String getFormato_output(){
		return this.formato_output;
	}
	
	public void setP_id(String p_id){
		this.p_id = p_id;
	}
	public String getP_id(){
		return this.p_id;
	}
	
	public void setP_estado(String p_estado){
		this.p_estado = p_estado;
	}
	public String getP_estado(){
		return this.p_estado;
	}


	public static class Separatorlist_1{
		private Pair campo;
		private Pair estado;
		public void setCampo(Pair campo){
			this.campo = campo;
		}
		public Pair getCampo(){
			return this.campo;
		}

		public void setP_estado(Pair estado){
			this.estado = estado;
		}
		public Pair getP_estado(){
			return this.estado;
		}

	}
}
/*-------------------------*/