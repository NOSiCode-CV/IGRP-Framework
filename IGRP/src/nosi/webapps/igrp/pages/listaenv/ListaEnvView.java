/*-------------------------*/

/*Create View*/

package nosi.webapps.igrp.pages.listaenv;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import nosi.core.config.Config; 

public class ListaEnvView extends View {
	public String title = "Detalhe App";		
	
	public Field dad;
	public Field name;
	public Field host;
	public Field status;
	public IGRPTable table_1;
	public IGRPForm form_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_novo;
	public IGRPButton btn_pesquisar;
	public IGRPButton btn_button_1;
	public ListaEnvView(ListaEnv model){			
		table_1 = new IGRPTable("table_1");
		form_1 = new IGRPForm("form_1");
		dad = new TextField(model,"dad");
		dad.setLabel("Schema");
		dad.propertie().add("name","p_dad").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false");
		name = new TextField(model,"name");
		name.setLabel("Nome");
		name.propertie().add("name","p_name").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false");
		host = new TextField(model,"host");
		host.setLabel("Host");
		host.propertie().add("name","p_host").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false");
		status = new CheckBoxField(model,"status");
		status.setLabel("Ativo?");
		status.propertie().add("name","p_status").add("type","checkbox").add("maxlength","30").add("align","left").add("lookup_parser","false").add("check","true").add("desc","true");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_novo = new IGRPButton("Novo","igrp","lista-env","novo","_self","default|fa-plus","","");
		btn_novo.propertie.add("type","specific").add("code","").add("rel","novo");
		btn_pesquisar = new IGRPButton("Pesquisar","igrp","lista-env","pesquisar","_submit","default|fa-search","","");
		btn_pesquisar.propertie.add("type","form").add("code","").add("class","default").add("rel","pesquisar");
		btn_button_1 = new IGRPButton("Editar","igrp","env","editar","_submit","default|fa-angle-right","","");
		btn_button_1.propertie.add("type","specific").add("code","").add("class","default").add("rel","button_1");
		
	}
		
	@Override
	public void render(){
		Config.TITLE = this.title;

		table_1.addField(dad);
		table_1.addField(name);
		table_1.addField(host);
		table_1.addField(status);


		form_1.addField(dad);

		toolsbar_1.addButton(btn_novo);
		form_1.addButton(btn_pesquisar);
		table_1.addButton(btn_button_1);
		this.addToPage(table_1);
		this.addToPage(form_1);
		this.addToPage(toolsbar_1);
	}
}
/*-------------------------*/