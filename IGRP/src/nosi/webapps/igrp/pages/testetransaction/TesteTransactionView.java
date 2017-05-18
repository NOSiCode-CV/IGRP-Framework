/*-------------------------*/

/*Create View*/

package nosi.webapps.igrp.pages.testetransaction;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import nosi.core.config.Config; 

public class TesteTransactionView extends View {
	public String title = "Pagina para Teste de Transaction";		
	
	public Field number_1;
	public Field email_1;
	public Field text_1;
	public IGRPForm form_1;
	public IGRPTable table_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_confirmar;
	public IGRPButton btn_enviar;
	public IGRPButton btn_pesquisar;
	public IGRPButton btn_save;
	public IGRPButton btn_editar;
	public IGRPButton btn_eliminar;
	public TesteTransactionView(TesteTransaction model){			
		form_1 = new IGRPForm("form_1");
		table_1 = new IGRPTable("table_1");
		number_1 = new NumberField(model,"number_1");
		number_1.setLabel("Number");
		number_1.propertie().add("name","p_number_1").add("type","number").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		email_1 = new EmailField(model,"email_1");
		email_1.setLabel("Email");
		email_1.propertie().add("name","p_email_1").add("type","email").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		text_1 = new TextField(model,"text_1");
		text_1.setLabel("Text");
		text_1.propertie().add("name","p_text_1").add("type","text").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_confirmar = new IGRPButton("Confirmar","igrp","TesteTransaction","confirmar","_self","default|fa-angle-right","","");
		btn_confirmar.propertie.add("type","specific").add("code","").add("rel","confirmar").add("flg_transaction","true");
		btn_enviar = new IGRPButton("Enviar","igrp","TesteTransaction","enviar","_self","default|fa-angle-right","","");
		btn_enviar.propertie.add("type","specific").add("code","").add("rel","enviar").add("flg_transaction","true");
		btn_pesquisar = new IGRPButton("Pesquisar","igrp","TesteTransaction","pesquisar","submit","default|fa-search","","");
		btn_pesquisar.propertie.add("type","form").add("code","").add("class","default").add("rel","pesquisar");
		btn_save = new IGRPButton("Save","igrp","TesteTransaction","save","submit","default|fa-save","","");
		btn_save.propertie.add("type","form").add("code","").add("flg_transaction","true").add("class","default").add("rel","save");
		btn_editar = new IGRPButton("Editar","igrp","TesteTransaction","editar","submit","default|fa-pencil","","");
		btn_editar.propertie.add("type","specific").add("code","").add("class","default").add("rel","editar");
		btn_eliminar = new IGRPButton("Eliminar","igrp","TesteTransaction","eliminar","submit","default|fa-trash","","");
		btn_eliminar.propertie.add("type","specific").add("code","").add("flg_transaction","true").add("class","default").add("rel","eliminar");
		
	}
		
	@Override
	public void render(){
		Config.TITLE = this.title;


		form_1.addField(number_1);
		form_1.addField(email_1);
		form_1.addField(text_1);

		table_1.addField(number_1);
		table_1.addField(text_1);
		table_1.addField(email_1);

		toolsbar_1.addButton(btn_confirmar);
		toolsbar_1.addButton(btn_enviar);
		form_1.addButton(btn_pesquisar);
		form_1.addButton(btn_save);
		table_1.addButton(btn_editar);
		table_1.addButton(btn_eliminar);
		this.addToPage(form_1);
		this.addToPage(table_1);
		this.addToPage(toolsbar_1);
	}
}
/*-------------------------*/