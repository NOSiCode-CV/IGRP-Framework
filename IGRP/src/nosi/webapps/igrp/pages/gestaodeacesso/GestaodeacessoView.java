
package nosi.webapps.igrp.pages.gestaodeacesso;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class GestaodeacessoView extends View {
	
	
	public Field sectionheader_1_text;
	public Field aplicacao;
	public Field estado;
	public Field org_nome;
	public Field aidicionar_perfil;
	public Field mostrar_perfis;
	public IGRPSectionHeader sectionheader_1;
	public IGRPForm form_1;
	public IGRPTable org_table;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_adicionar_organica;
	public IGRPButton btn_editar;
	public IGRPButton btn_menu;
	public IGRPButton btn_transaction;
	public IGRPButton btn_eliminar;
	public IGRPButton btn_button_1;
	public GestaodeacessoView(Gestaodeacesso model){
		this.setPageTitle("null");
			
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1","");
		form_1 = new IGRPForm("form_1","");
		org_table = new IGRPTable("org_table","Orgânicas");
		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		
		sectionheader_1_text.setValue(gt("Gestão de Acesso"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("persist","true").add("maxlength","4000");
		aplicacao = new ListField(model,"aplicacao");
		aplicacao.setLabel(gt("Aplicação"));
		
		aplicacao.propertie().add("name","p_aplicacao").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","false").add("change","true").add("disabled","false").add("right","false");
		estado = new ColorField(model,"estado");
		estado.setLabel(gt("Estado"));
		
		estado.propertie().add("name","p_estado").add("type","color").add("format","rgba").add("maxlength","10").add("align","center").add("lookup_parser","true").add("iskey","true");
		org_nome = new TextField(model,"org_nome");
		org_nome.setLabel(gt("Nome"));
		
		org_nome.propertie().add("name","p_org_nome").add("type","text").add("maxlength","30").add("align","center").add("lookup_parser","false").add("iskey","false");
		aidicionar_perfil = new LinkField(model,"aidicionar_perfil");
		aidicionar_perfil.setLabel(gt("Aidicionar Perfil"));
		
		aidicionar_perfil.propertie().add("name","p_aidicionar_perfil").add("type","link").add("target","modal").add("target_fields","").add("closerefresh","false").add("action","index").add("page","ListaPage").add("app","igrp").add("class","success").add("btnSize","btn-xs").add("iconColor","#333").add("iconClass","").add("img","fa-plus-square").add("maxlength","30").add("align","right").add("lookup_parser","false").add("iskey","false").add("desc","true");
		mostrar_perfis = new LinkField(model,"mostrar_perfis");
		mostrar_perfis.setLabel(gt("Mostrar perfis"));
		
		mostrar_perfis.propertie().add("name","p_mostrar_perfis").add("type","link").add("target","modal").add("target_fields","").add("closerefresh","false").add("action","index").add("page","ListaPage").add("app","igrp").add("class","link").add("btnSize","btn-xs").add("iconColor","#333").add("iconClass","").add("img","fa-address-card").add("maxlength","30").add("align","right").add("lookup_parser","false").add("iskey","false").add("desc","true");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_adicionar_organica = new IGRPButton("Adicionar Orgânica","igrp","Gestaodeacesso","adicionar_organica","modal","link|fa-plus-square","","");
		btn_adicionar_organica.propertie.add("type","specific").add("code","").add("rel","adicionar_organica");
		btn_editar = new IGRPButton("Editar","igrp","Gestaodeacesso","editar","_blank","warning|fa-pencil","","");
		btn_editar.propertie.add("type","specific").add("code","").add("class","warning").add("rel","editar");
		btn_menu = new IGRPButton("Menu","igrp","Gestaodeacesso","menu","_blank","default|fa-bars","","");
		btn_menu.propertie.add("type","specific").add("code","").add("class","default").add("rel","menu");
		btn_transaction = new IGRPButton("Transaction","igrp","Gestaodeacesso","transaction","_blank","default|fa-exchange","","");
		btn_transaction.propertie.add("type","specific").add("code","").add("class","default").add("rel","transaction");
		btn_eliminar = new IGRPButton("Eliminar","igrp","Gestaodeacesso","eliminar","_blank","danger|fa-trash","","");
		btn_eliminar.propertie.add("type","specific").add("code","").add("class","danger").add("rel","eliminar");
		btn_button_1 = new IGRPButton("Button","igrp","Gestaodeacesso","button_1","_blank","default|fa-angle-right","","");
		btn_button_1.propertie.add("type","specific").add("code","").add("class","default").add("rel","button_1");
		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		form_1.addField(aplicacao);


		org_table.addField(estado);
		org_table.addField(org_nome);
		org_table.addField(aidicionar_perfil);
		org_table.addField(mostrar_perfis);

		toolsbar_1.addButton(btn_adicionar_organica);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(org_table);
		this.addToPage(toolsbar_1);
	}
}
