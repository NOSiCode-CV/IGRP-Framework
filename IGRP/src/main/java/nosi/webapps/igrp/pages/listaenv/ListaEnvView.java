
package nosi.webapps.igrp.pages.listaenv;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class ListaEnvView extends View {
	
	
	public Field sectionheader_1_text;
	public Field status;
	public Field status_check;
	public Field name;
	public Field dad;
	public Field t_page_builder;
	public Field p_id;
	public IGRPSectionHeader sectionheader_1;
	public IGRPTable table_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_importar;
	public IGRPButton btn_novo;
	public IGRPButton btn_editar;
	public IGRPButton btn_eliminar;
	public IGRPButton btn_configurar_base_dados;
	public IGRPButton btn_exportar;
	public ListaEnvView(ListaEnv model){
		this.setPageTitle("Lista de Aplicacao");
			
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1","");
		table_1 = new IGRPTable("table_1","");
		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		
		sectionheader_1_text.setValue(gt("App builder"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("persist","true").add("maxlength","4000");
		status = new CheckBoxField(model,"status");
		status.setLabel(gt("Ativo?"));
		
		status.propertie().add("name","p_status").add("type","checkbox").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false").add("check","true").add("desc","true");
		status_check = new CheckBoxField(model,"status_check");
		status_check.propertie().add("name","p_status").add("type","checkbox").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false").add("check","true").add("desc","true");
		name = new TextField(model,"name");
		name.setLabel(gt("Nome"));
		
		name.propertie().add("name","p_name").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		dad = new TextField(model,"dad");
		dad.setLabel(gt("Código"));
		
		dad.propertie().add("name","p_dad").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		t_page_builder = new LinkField(model,"t_page_builder");
		t_page_builder.setLabel(gt("Page builder"));
		
		t_page_builder.propertie().add("name","p_t_page_builder").add("type","link").add("target","_self").add("target_fields","").add("closerefresh","false").add("action","index").add("page","ListaEnv").add("app","igrp").add("class","warning").add("btnSize","").add("iconColor","#333").add("iconClass","").add("img","fa-file-code-o").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false").add("desc","true");
		p_id = new HiddenField(model,"p_id");
		p_id.setLabel(gt(""));
		
		p_id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("iskey","false").add("tag","id");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_importar = new IGRPButton("Importar","igrp","ListaEnv","importar","modal|refresh","default|fa-upload","","");
		btn_importar.propertie.add("type","specific").add("code","").add("rel","importar");
		btn_novo = new IGRPButton("Nova aplicação","igrp","ListaEnv","novo","modal|refresh","success|fa-plus","","");
		btn_novo.propertie.add("type","specific").add("code","").add("rel","novo");
		btn_editar = new IGRPButton("Editar","igrp","ListaEnv","editar","mpsubmit|refresh","warning|fa-pencil","","");
		btn_editar.propertie.add("type","specific").add("code","").add("class","warning").add("rel","editar");
		btn_eliminar = new IGRPButton("Eliminar","igrp","ListaEnv","eliminar","confirm","danger|fa-trash-o","","");
		btn_eliminar.propertie.add("type","specific").add("code","").add("class","danger").add("rel","eliminar");
		btn_configurar_base_dados = new IGRPButton("Configurar Base Dados","igrp","ListaEnv","configurar_base_dados","mpsubmit","grey|fa-database","","");
		btn_configurar_base_dados.propertie.add("type","specific").add("code","").add("class","grey").add("rel","configurar_base_dados");
		btn_exportar = new IGRPButton("Export","igrp","ListaEnv","exportar","confirm","default|fa-download","","");
		btn_exportar.propertie.add("type","specific").add("code","").add("class","default").add("rel","exportar");
		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);


		table_1.addField(status);
		table_1.addField(status_check);
		table_1.addField(name);
		table_1.addField(dad);
		table_1.addField(t_page_builder);
		table_1.addField(p_id);

		toolsbar_1.addButton(btn_importar);
		toolsbar_1.addButton(btn_novo);
		table_1.addButton(btn_editar);
		table_1.addButton(btn_eliminar);
		table_1.addButton(btn_configurar_base_dados);
		table_1.addButton(btn_exportar);
		this.addToPage(sectionheader_1);
		this.addToPage(table_1);
		this.addToPage(toolsbar_1);
	}
}
