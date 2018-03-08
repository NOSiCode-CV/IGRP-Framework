
package nosi.webapps.igrp.pages.pesquisarperfil;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class PesquisarPerfilView extends View {
	
	
	public Field sectionheader_1_text;
	public Field organica;
	public Field estado;
	public Field estado_check;
	public Field descricao;
	public Field codigo;
	public Field p_id;
	public IGRPForm sectionheader_1;
	public IGRPTable table_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_novo;
	public IGRPButton btn_editar;
	public IGRPButton btn_eliminar;
	public IGRPButton btn_menu;
	public IGRPButton btn_transacao;
	public IGRPButton btn_convidar;
	public IGRPButton btn_task;
	
	public PesquisarPerfilView(PesquisarPerfil model){
		this.setPageTitle("Lista de Perfil");
			
		sectionheader_1 = new IGRPForm("sectionheader_1","");
		table_1 = new IGRPTable("table_1","");
		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("Gestão de Perfil"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("persist","true").add("maxlength","4000");
		
		organica = new TextField(model,"organica");
		organica.setLabel(gt("Organização"));
		organica.propertie().add("name","p_organica").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		
		estado = new CheckBoxField(model,"estado");
		estado.setLabel(gt("Estado"));
		estado.propertie().add("name","p_estado").add("type","checkbox").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false").add("switch","true").add("check","true").add("desc","true");
		
		estado_check = new CheckBoxField
		(model,"estado_check");
		estado_check.propertie().add("name","p_estado").add("type","checkbox").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false").add("switch","true").add("check","true").add("desc","true");
		descricao = new TextField(model,"descricao");
		descricao.setLabel(gt("Nome"));
		descricao.propertie().add("name","p_descricao").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		
		codigo = new TextField(model,"codigo");
		codigo.setLabel(gt("Código"));
		codigo.propertie().add("name","p_codigo").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		
		p_id = new HiddenField(model,"p_id");
		p_id.setLabel(gt(""));
		p_id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("iskey","false").add("tag","id");
		

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_novo = new IGRPButton("Novo","igrp","PesquisarPerfil","novo","_self","success|fa-plus-square","","");
		btn_novo.propertie.add("type","specific").add("code","").add("rel","novo");
		btn_editar = new IGRPButton("Editar","igrp","PesquisarPerfil","editar","mpsubmit","warning|fa-pencil","","");
		btn_editar.propertie.add("type","specific").add("code","").add("class","warning").add("rel","editar");
		btn_eliminar = new IGRPButton("Eliminar","igrp","PesquisarPerfil","eliminar","confirm","danger|fa-trash","","");
		btn_eliminar.propertie.add("type","specific").add("code","").add("class","danger").add("rel","eliminar");
		btn_menu = new IGRPButton("Menu","igrp","PesquisarPerfil","menu","right_panel","info|fa-bars","","");
		btn_menu.propertie.add("type","specific").add("code","").add("class","info").add("rel","menu");
		btn_transacao = new IGRPButton("Transacao","igrp","PesquisarPerfil","transacao","right_panel","black|fa-exchange","","");
		btn_transacao.propertie.add("type","specific").add("code","").add("class","black").add("rel","transacao");
		btn_convidar = new IGRPButton("Convidar","igrp","PesquisarPerfil","convidar","mpsubmit","warning|fa-send","","");
		btn_convidar.propertie.add("type","specific").add("code","").add("class","warning").add("rel","convidar");
		
		btn_task = new IGRPButton("Etapas","igrp","PesquisarPerfil","etapas","mpsubmit","primary|fa-tasks","","");
		btn_task.propertie.add("type","specific").add("rel","etapas");
		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);


		table_1.addField(organica);
		table_1.addField(estado);
		table_1.addField(estado_check);
		table_1.addField(descricao);
		table_1.addField(codigo);
		table_1.addField(p_id);

		toolsbar_1.addButton(btn_novo);
		table_1.addButton(btn_editar);
		table_1.addButton(btn_menu);
		table_1.addButton(btn_transacao);
		table_1.addButton(btn_convidar);
		table_1.addButton(btn_task);
		table_1.addButton(btn_eliminar);
		this.addToPage(sectionheader_1);
		this.addToPage(table_1);
		this.addToPage(toolsbar_1);
	}
}
