
package nosi.webapps.igrp.pages.gestaodeacesso;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class GestaodeacessoView extends View {
	
	
	public Field sectionheader_1_text;
	public Field aplicacao;
	public Field adicionar_organica1;
	public Field gestao_de_utilizadores1;
	public Field estado;
	public Field estado_check;
	public Field org_nome;
	public Field mostrar_perfis;
	public Field p_id;
	public IGRPForm sectionheader_1;
	public IGRPForm form_1;
	public IGRPTable org_table;

	public IGRPButton btn_editar;
	public IGRPButton btn_menu;
	public IGRPButton btn_transaction;
	public IGRPButton btn_eliminar;
	public GestaodeacessoView(Gestaodeacesso model){
		this.setPageTitle("Gestao de Acesso");
			
		sectionheader_1 = new IGRPForm("sectionheader_1","");
		form_1 = new IGRPForm("form_1","");
		org_table = new IGRPTable("org_table","Organizações");
		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("Gestão de Acesso"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("persist","true").add("maxlength","4000");
		
		aplicacao = new ListField(model,"aplicacao");
		aplicacao.setLabel(gt("Aplicação"));
		aplicacao.propertie().add("name","p_aplicacao").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","false").add("change","true").add("disabled","false").add("right","false").add("java-type","");
		
		adicionar_organica1 = new LinkField(model,"adicionar_organica1");
		adicionar_organica1.setLabel(gt("Adicionar Orgânica"));
		adicionar_organica1.propertie().add("name","p_adicionar_organica1").add("type","link").add("target","modal").add("target_fields","").add("closerefresh","true").add("action","index").add("page","NovaOrganica").add("app","igrp").add("class","primary").add("btnSize","").add("iconColor","#333").add("iconClass","").add("img","fa-plus-square").add("maxlength","30").add("placeholder","").add("right","true");
		
		gestao_de_utilizadores1 = new LinkField(model,"gestao_de_utilizadores1");
		gestao_de_utilizadores1.setLabel(gt("Gestão de utilizadores"));
		gestao_de_utilizadores1.propertie().add("name","p_gestao_de_utilizadores1").add("type","link").add("target","_self").add("target_fields","").add("closerefresh","false").add("action","index").add("page","PesquisarUtilizador").add("app","igrp").add("class","success").add("btnSize","").add("iconColor","#333").add("iconClass","").add("img","fa-users").add("maxlength","30").add("placeholder","").add("right","true");
		
		estado = new CheckBoxField(model,"estado");
		estado.setLabel(gt("Estado"));
		estado.propertie().add("name","p_estado").add("type","checkbox").add("maxlength","10").add("align","center").add("lookup_parser","true").add("iskey","true").add("switch","true").add("check","true").add("desc","true");
		
		estado_check = new CheckBoxField
		(model,"estado_check");
		estado_check.propertie().add("name","p_estado").add("type","checkbox").add("maxlength","10").add("align","center").add("lookup_parser","true").add("iskey","true").add("switch","true").add("check","true").add("desc","true");
		org_nome = new TextField(model,"org_nome");
		org_nome.setLabel(gt("Nome"));
		org_nome.propertie().add("name","p_org_nome").add("type","text").add("maxlength","30").add("align","center").add("lookup_parser","false").add("iskey","false");
		
		mostrar_perfis = new LinkField(model,"mostrar_perfis");
		mostrar_perfis.setLabel(gt("Mostrar perfis"));
		mostrar_perfis.propertie().add("name","p_mostrar_perfis").add("type","link").add("target","modal").add("target_fields","").add("closerefresh","false").add("action","index").add("page","PesquisarMenu").add("app","igrp").add("class","primary").add("btnSize","btn-xs").add("iconColor","#333").add("iconClass","").add("img","fa-address-card").add("maxlength","30").add("align","right").add("lookup_parser","false").add("iskey","false").add("desc","true");
		
		p_id = new HiddenField(model,"p_id");
		p_id.setLabel(gt(""));
		p_id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("iskey","true").add("tag","id");
		

		btn_editar = new IGRPButton("Editar","igrp","Gestaodeacesso","editar","mpsubmit|refresh","warning|fa-pencil","","");
		btn_editar.propertie.add("type","specific").add("code","").add("class","warning").add("rel","editar");
		btn_menu = new IGRPButton("Menu","igrp","Gestaodeacesso","menu","right_panel|refresh","info|fa-bars","","");
		btn_menu.propertie.add("type","specific").add("code","").add("class","info").add("rel","menu");
		btn_transaction = new IGRPButton("Transaction","igrp","Gestaodeacesso","transaction","right_panel|refresh","black|fa-exchange","","");
		btn_transaction.propertie.add("type","specific").add("code","").add("class","black").add("rel","transaction");
		btn_eliminar = new IGRPButton("Eliminar","igrp","Gestaodeacesso","eliminar","confirm","danger|fa-trash","","");
		btn_eliminar.propertie.add("type","specific").add("code","").add("class","danger").add("rel","eliminar");
		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		form_1.addField(aplicacao);
		form_1.addField(adicionar_organica1);
		form_1.addField(gestao_de_utilizadores1);

		org_table.addField(estado);
		org_table.addField(estado_check);
		org_table.addField(org_nome);
		org_table.addField(mostrar_perfis);
		org_table.addField(p_id);

		org_table.addButton(btn_editar);
		org_table.addButton(btn_menu);
		org_table.addButton(btn_transaction);
		org_table.addButton(btn_eliminar);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(org_table);
	}
}
