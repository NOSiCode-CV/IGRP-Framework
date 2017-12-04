
package nosi.webapps.igrp.pages.listaenv;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class ListaEnvView extends View {
	
	
	public Field dad;
	public Field nome;
	public Field name;
	public Field status;
	public Field status_check;
	public Field p_id;
	public IGRPForm form_1;
	public IGRPTable table_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_novo;
	public IGRPButton btn_pesquisar;
	public IGRPButton btn_editar;
	public IGRPButton btn_eliminar;
	public IGRPButton btn_configurar_base_dados;
	public IGRPButton btn_exportar;
	public ListaEnvView(ListaEnv model){
		this.setPageTitle("Lista de Aplicacao");
			
		form_1 = new IGRPForm("form_1","");
		table_1 = new IGRPTable("table_1","");
		dad = new TextField(model,"dad");
		dad.setLabel(gt("Schema"));
		
		dad.propertie().add("name","p_dad").add("type","text").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		nome = new TextField(model,"nome");
		nome.setLabel(gt("Nome"));
		
		nome.propertie().add("name","p_nome").add("type","text").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		name = new TextField(model,"name");
		name.setLabel(gt("Nome"));
		
		name.propertie().add("name","p_name").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		status = new CheckBoxField(model,"status");
		status.setLabel(gt("Ativo?"));
		
		status.propertie().add("name","p_status").add("type","checkbox").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false").add("check","true").add("desc","true");
		status_check = new CheckBoxField(model,"status_check");
		status_check.propertie().add("name","p_status").add("type","checkbox").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false").add("check","true").add("desc","true");
		p_id = new HiddenField(model,"p_id");
		p_id.setLabel(gt(""));
		
		p_id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("iskey","false").add("tag","id");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_novo = new IGRPButton("Novo","igrp","ListaEnv","novo","modal","success|fa-plus","","");
		btn_novo.propertie.add("type","specific").add("code","").add("rel","novo");
		btn_pesquisar = new IGRPButton("Pesquisar","igrp","ListaEnv","pesquisar","submit_form","default|fa-search","","");
		btn_pesquisar.propertie.add("type","form").add("code","").add("class","default").add("rel","pesquisar");
		btn_editar = new IGRPButton("Editar","igrp","ListaEnv","editar","modal","warning|fa-edit","","");
		btn_editar.propertie.add("type","specific").add("code","").add("class","warning").add("rel","editar");
		btn_eliminar = new IGRPButton("Eliminar","igrp","ListaEnv","eliminar","confirm","danger|fa-trash-o","","");
		btn_eliminar.propertie.add("type","specific").add("code","").add("class","danger").add("rel","eliminar");
		btn_configurar_base_dados = new IGRPButton("Configurar Base Dados","igrp","ListaEnv","configurar_base_dados","modal","grey|fa-database","","");
		btn_configurar_base_dados.propertie.add("type","specific").add("code","").add("class","grey").add("rel","configurar_base_dados");
		btn_exportar = new IGRPButton("Export","igrp","ListaEnv","exportar","confirm","grey|fa-download","","");
		btn_exportar.propertie.add("type","specific").add("code","").add("class","grey").add("rel","exportar");
		
	}
		
	@Override
	public void render(){
		
		form_1.addField(dad);
		form_1.addField(nome);


		table_1.addField(dad);
		table_1.addField(name);
		table_1.addField(status);
		table_1.addField(status_check);
		table_1.addField(p_id);

		toolsbar_1.addButton(btn_novo);
		form_1.addButton(btn_pesquisar);
		table_1.addButton(btn_editar);
		table_1.addButton(btn_eliminar);
		table_1.addButton(btn_configurar_base_dados);
		table_1.addButton(btn_exportar);
		this.addToPage(form_1);
		this.addToPage(table_1);
		this.addToPage(toolsbar_1);
	}
}
