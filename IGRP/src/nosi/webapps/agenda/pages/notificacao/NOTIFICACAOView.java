/*-------------------------*/

/*Create View*/

package nosi.webapps.agenda.pages.notificacao;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class NOTIFICACAOView extends View {
	
	
	public Field assunto;
	public Field mensagem;
	public IGRPForm form_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_notificar;
	public NOTIFICACAOView(NOTIFICACAO model){
		this.setPageTitle("Notificações");
			
		form_1 = new IGRPForm("form_1");
		assunto = new TextField(model,"assunto");
		assunto.setLabel("Assunto");
		assunto.propertie().add("name","p_assunto").add("type","text").add("maxlength","30").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		mensagem = new TextAreaField(model,"mensagem");
		mensagem.setLabel("Mensagem");
		mensagem.propertie().add("name","p_mensagem").add("type","textarea").add("maxlength","30").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_notificar = new IGRPButton("Notificar","agenda","NOTIFICACAO","notificar","confirm","success|fa-envelope","","");
		btn_notificar.propertie.add("type","specific").add("code","").add("rel","notificar");
		
	
	}
		
	@Override
	public void render(){
		

		form_1.addField(assunto);
		form_1.addField(mensagem);

		toolsbar_1.addButton(btn_notificar);
		this.addToPage(form_1);
		this.addToPage(toolsbar_1);
	}
}
/*-------------------------*/