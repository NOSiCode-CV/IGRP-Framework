
package nosi.webapps.igrp.pages.pesquisarperfil;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class PesquisarPerfilView extends View {
	
	
	public Field sectionheader_1_text;
	public Field descricao;
	public Field codigo;
	public Field organica;
	public Field estado;
	public Field p_id;
	public IGRPSectionHeader sectionheader_1;
	public IGRPTable table_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_novo;
	public IGRPButton btn_editar;
	public IGRPButton btn_eliminar;
	public IGRPButton btn_menu;
	public IGRPButton btn_transacao;
	public IGRPButton btn_convidar;
	public PesquisarPerfilView(PesquisarPerfil model){
		this.setPageTitle("Lista de Perfil");
			
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1","");
		table_1 = new IGRPTable("table_1","");
		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		
		sectionheader_1_text.setValue(gt("Gestão de Perfil"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("persist","true").add("maxlength","4000");
		descricao = new TextField(model,"descricao");
		descricao.setLabel(gt("Descrição"));
		
		descricao.propertie().add("name","p_descricao").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		codigo = new TextField(model,"codigo");
		codigo.setLabel(gt("Código"));
		
		codigo.propertie().add("name","p_codigo").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		organica = new TextField(model,"organica");
		organica.setLabel(gt("Orgânica"));
		
		organica.propertie().add("name","p_organica").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		estado = new TextField(model,"estado");
		estado.setLabel(gt("Estado"));
		
		estado.propertie().add("name","p_estado").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		p_id = new HiddenField(model,"p_id");
		p_id.setLabel(gt(""));
		
		p_id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("iskey","false").add("tag","id");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_novo = new IGRPButton("Novo","igrp","PesquisarPerfil","novo","_self","success|fa-plus-square","","");
		btn_novo.propertie.add("type","specific").add("code","").add("rel","novo");
		btn_editar = new IGRPButton("Editar","igrp","PesquisarPerfil","editar","_self","warning|fa-pencil","","");
		btn_editar.propertie.add("type","specific").add("code","").add("class","warning").add("rel","editar");
		btn_eliminar = new IGRPButton("Eliminar","igrp","PesquisarPerfil","eliminar","confirm","danger|fa-trash","","");
		btn_eliminar.propertie.add("type","specific").add("code","").add("class","danger").add("rel","eliminar");
		btn_menu = new IGRPButton("Menu","igrp","PesquisarPerfil","menu","_self","primary|fa-align-justify","","");
		btn_menu.propertie.add("type","specific").add("code","").add("class","primary").add("rel","menu");
		btn_transacao = new IGRPButton("Transacao","igrp","PesquisarPerfil","transacao","_self","black|fa-exchange","","");
		btn_transacao.propertie.add("type","specific").add("code","").add("class","black").add("rel","transacao");
		btn_convidar = new IGRPButton("Convidar","igrp","PesquisarPerfil","convidar","_self","warning|fa-send","","");
		btn_convidar.propertie.add("type","specific").add("code","").add("class","warning").add("rel","convidar");
		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);


		table_1.addField(descricao);
		table_1.addField(codigo);
		table_1.addField(organica);
		table_1.addField(estado);
		table_1.addField(p_id);

		toolsbar_1.addButton(btn_novo);
		table_1.addButton(btn_editar);
		table_1.addButton(btn_eliminar);
		table_1.addButton(btn_menu);
		table_1.addButton(btn_transacao);
		table_1.addButton(btn_convidar);
		this.addToPage(sectionheader_1);
		this.addToPage(table_1);
		this.addToPage(toolsbar_1);
	}
}
