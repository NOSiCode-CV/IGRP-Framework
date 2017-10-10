/*-------------------------*/

/*Create View*/

package nosi.webapps.igrp.pages.listaenv;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import nosi.core.config.Config; 

public class ListaEnvView extends View {
	public String title = "Detalhe App";		
	
	public Field sectionheader_1_text;
	public IGRPSectionHeader sectionheader_1;
	public Field id;
	public Field dad;
	public Field name;
	public Field nome;
	public Field host;
	public Field status;
	public IGRPTable table_1;
	public IGRPForm form_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_novo;
	public IGRPButton btn_pesquisar;
	public IGRPButton btn_editar;
	public IGRPButton btn_eliminar;
	public IGRPButton btn_export;
	
	public ListaEnvView(ListaEnv model){			
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1");
		table_1 = new IGRPTable("table_1");
		form_1 = new IGRPForm("form_1");
		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel("");
		sectionheader_1_text.setValue("Gestao de Aplicação");
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("persist","true").add("maxlength","4000");
		dad = new TextField(model,"dad");
		dad.setLabel("Schema");
		dad.propertie().add("name","p_dad").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false");
		nome = new TextField(model,"nome");
		nome.setLabel("Nome");
		nome.propertie().add("name","p_nome").add("type","text").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		name = new TextField(model,"name");
		name.setLabel("Nome");
		name.propertie().add("name","p_name").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false");
		host = new TextField(model,"host");
		host.setLabel("Host");
		host.propertie().add("name","p_host").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false");
		status = new CheckBoxField(model,"status");
		status.setLabel("Ativo?");
		status.propertie().add("name","p_status").add("type","checkbox").add("maxlength","30").add("align","left").add("lookup_parser","false").add("check","true").add("desc","true");
		id = new HiddenField(model, "id");
		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_novo = new IGRPButton("Novo","igrp","env","index","_self","success|fa-plus","","");
		btn_novo.propertie.add("type","specific").add("code","").add("rel","novo");
		
		btn_pesquisar = new IGRPButton("Pesquisar","igrp","lista-env","index","submit","default|fa-search","","");
		btn_pesquisar.propertie.add("type","form").add("code","").add("class","default").add("rel","pesquisar");
		
		btn_editar = new IGRPButton("Editar","igrp","env","editar","_self","warning|fa-pencil","","");
		btn_editar.propertie.add("type","specific").add("code","").add("class","default").add("rel","editar");
		
		btn_eliminar = new IGRPButton("Eliminar","igrp","lista-env","eliminar","confirm","danger|fa-trash","","");
		btn_eliminar.propertie.add("type","specific").add("code","").add("class","default").add("rel","eliminar");
		
		btn_export = new IGRPButton("Export","igrp","ListaEnv","export","_blank","grey|fa-upload","","");
		btn_export.propertie.add("type","specific").add("code","").add("class","grey").add("rel","export");
	}
		
	@Override
	public void render(){
		sectionheader_1.addField(sectionheader_1_text);
		Config.TITLE = this.title;

		table_1.addField(dad);
		table_1.addField(name);
		table_1.addField(host);
		table_1.addField(status);
		table_1.addField(id);

		form_1.addField(dad);
		form_1.addField(nome);
		

		toolsbar_1.addButton(btn_novo);
		form_1.addButton(btn_pesquisar);
		table_1.addButton(btn_editar);
		table_1.addButton(btn_eliminar);
		table_1.addButton(btn_export);
		
		this.addToPage(table_1);
		this.addToPage(form_1);
		this.addToPage(toolsbar_1);
	}
}
/*-------------------------*/