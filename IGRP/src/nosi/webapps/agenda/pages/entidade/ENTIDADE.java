/*---------------------- Create Model ----------------------*/
package nosi.webapps.agenda.pages.entidade;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;

public class ENTIDADE extends Model{		
	@RParam(rParamName = "p_page_title_text")
	private String page_title_text;
	@RParam(rParamName = "p_nome")
	private String nome;
	@RParam(rParamName = "p_organica")
	private String organica;
	@RParam(rParamName = "p_estado")
	private String p_estado;
	
	public void setPage_title_text(String page_title_text){
		this.page_title_text = page_title_text;
	}
	public String getPage_title_text(){
		return this.page_title_text;
	}
	
	public void setNome(String nome){
		this.nome = nome;
	}
	public String getNome(){
		return this.nome;
	}
	
	public void setOrganica(String organica){
		this.organica = organica;
	}
	public String getOrganica(){
		return this.organica;
	}
	
	public void setP_estado(String p_estado){
		this.p_estado = p_estado;
	}
	public String getP_estado(){
		return this.p_estado;
	}


}
/*-------------------------*/