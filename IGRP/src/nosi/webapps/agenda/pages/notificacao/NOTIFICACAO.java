/*---------------------- Create Model ----------------------*/
package nosi.webapps.agenda.pages.notificacao;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;

public class NOTIFICACAO extends Model{		
	@RParam(rParamName = "p_assunto")
	private String assunto;
	@RParam(rParamName = "p_mensagem")
	private String mensagem;
	
	public void setAssunto(String assunto){
		this.assunto = assunto;
	}
	public String getAssunto(){
		return this.assunto;
	}
	
	public void setMensagem(String mensagem){
		this.mensagem = mensagem;
	}
	public String getMensagem(){
		return this.mensagem;
	}


}
/*-------------------------*/