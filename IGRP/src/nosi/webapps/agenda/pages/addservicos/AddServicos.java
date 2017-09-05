/*---------------------- Create Model ----------------------*/
package nosi.webapps.agenda.pages.addservicos;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;

public class AddServicos extends Model{		
	@RParam(rParamName = "p_page_title_text")
	private String page_title_text;
	@RParam(rParamName = "p_entidade")
	private int entidade;
	@RParam(rParamName = "p_nome_do_servico")
	private String nome_do_servico;
	@RParam(rParamName = "p_codigo_do_servico")
	private String codigo_do_servico;
	@RParam(rParamName = "p_estado")
	private String estado;
	@RParam(rParamName = "p_assunto")
	private String assunto;
	
	public void setPage_title_text(String page_title_text){
		this.page_title_text = page_title_text;
	}
	public String getPage_title_text(){
		return this.page_title_text;
	}
	
	public void setEntidade(int entidade){
		this.entidade = entidade;
	}
	public int getEntidade(){
		return this.entidade;
	}
	
	public void setNome_do_servico(String nome_do_servico){
		this.nome_do_servico = nome_do_servico;
	}
	public String getNome_do_servico(){
		return this.nome_do_servico;
	}
	
	public void setCodigo_do_servico(String codigo_do_servico){
		this.codigo_do_servico = codigo_do_servico;
	}
	public String getCodigo_do_servico(){
		return this.codigo_do_servico;
	}
	
	public void setEstado(String estado){
		this.estado = estado;
	}
	public String getEstado(){
		return this.estado;
	}
	
	public void setAssunto(String assunto){
		this.assunto = assunto;
	}
	public String getAssunto(){
		return this.assunto;
	}


}
/*-------------------------*/