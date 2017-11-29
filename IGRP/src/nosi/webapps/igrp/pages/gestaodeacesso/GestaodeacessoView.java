
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
	public Field adicionar_perfil;
	public Field mostrar_perfis;
	public Field p_id;
	public IGRPSectionHeader sectionheader_1;
	public IGRPForm form_1;
	public IGRPTable org_table;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_adicionar_organica;
	public IGRPButton btn_editar;
	public IGRPButton btn_menu;
	public IGRPButton btn_transaction;
	public IGRPButton btn_eliminar;
	public GestaodeacessoView(Gestaodeacesso model){
		this.setPageTitle("Gestao de Acesso");
			
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
		adicionar_perfil = new LinkField(model,"adicionar_perfil");
		adicionar_perfil.setLabel(gt("Adicionar Perfil"));
		
		adicionar_perfil.propertie().add("name","p_adicionar_perfil").add("type","link").add("target","modal").add("target_fields","").add("closerefresh","false").add("action","index").add("page","ListaPage").add("app","igrp").add("class","success").add("btnSize","btn-xs").add("iconColor","#333").add("iconClass","").add("img","fa-plus-square").add("maxlength","30").add("align","right").add("lookup_parser","false").add("iskey","false").add("desc","true");
		mostrar_perfis = new LinkField(model,"mostrar_perfis");
		mostrar_perfis.setLabel(gt("Mostrar perfis"));
		
		mostrar_perfis.propertie().add("name","p_mostrar_perfis").add("type","link").add("target","modal").add("target_fields","").add("closerefresh","false").add("action","index").add("page","ListaPage").add("app","igrp").add("class","link").add("btnSize","btn-xs").add("iconColor","#333").add("iconClass","").add("img","fa-address-card").add("maxlength","30").add("align","right").add("lookup_parser","false").add("iskey","false").add("desc","true");
		p_id = new HiddenField(model,"p_id");
		p_id.setLabel(gt(""));
		
		p_id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("iskey","false").add("tag","id");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_adicionar_organica = new IGRPButton("Adicionar Orgânica","igrp","Gestaodeacesso","adicionar_organica","modal","link|fa-plus-square","","");
		btn_adicionar_organica.propertie.add("type","specific").add("code","").add("rel","adicionar_organica");
		btn_editar = new IGRPButton("Editar","igrp","Gestaodeacesso","editar","mpsubmit","warning|fa-pencil","","");
		btn_editar.propertie.add("type","specific").add("code","").add("class","warning").add("rel","editar");
		btn_menu = new IGRPButton("Menu","igrp","Gestaodeacesso","menu","mpsubmit","default|fa-bars","","");
		btn_menu.propertie.add("type","specific").add("code","").add("class","default").add("rel","menu");
		btn_transaction = new IGRPButton("Transaction","igrp","Gestaodeacesso","transaction","mpsubmit","default|fa-exchange","","");
		btn_transaction.propertie.add("type","specific").add("code","").add("class","default").add("rel","transaction");
		btn_eliminar = new IGRPButton("Eliminar","igrp","Gestaodeacesso","eliminar","confirm","danger|fa-trash","","");
		btn_eliminar.propertie.add("type","specific").add("code","").add("class","danger").add("rel","eliminar");
		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		form_1.addField(aplicacao);


		org_table.addField(estado);
		org_table.addField(org_nome);
		org_table.addField(adicionar_perfil);
		org_table.addField(mostrar_perfis);
		org_table.addField(p_id);

		toolsbar_1.addButton(btn_adicionar_organica);
		org_table.addButton(btn_editar);
		org_table.addButton(btn_menu);
		org_table.addButton(btn_transaction);
		org_table.addButton(btn_eliminar);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(org_table);
		this.addToPage(toolsbar_1);
	}
}
