package nosi.webapps.igrp.pages.gestaodeacesso;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;
import nosi.core.config.Config;
import nosi.core.gui.components.IGRPLink;
import nosi.core.webapp.Report;

public class GestaodeacessoView extends View {

	public Field sectionheader_1_text;
	public Field aplicacao;
	public Field adicionar_organica;
	public Field gestao_de_utilizadores;
	public Field gestao_de_menu;
	public Field estado;
	public Field estado_check;
	public Field org_nome;
	public Field mostrar_perfis;
	public Field mostrar_perfis_desc;
	public Field id;
	public IGRPForm sectionheader_1;
	public IGRPForm form_1;
	public IGRPTable org_table;

	public IGRPButton btn_editar;
	public IGRPButton btn_menu;
	public IGRPButton btn_transacti_org;
	public IGRPButton btn_eliminar;
	public IGRPButton btn_associar_etapa;

	public GestaodeacessoView(){

		this.setPageTitle("Gestao de Acesso");
			
		sectionheader_1 = new IGRPForm("sectionheader_1","");

		form_1 = new IGRPForm("form_1","");

		org_table = new IGRPTable("org_table","Organizações");

		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("Gestão de Acesso"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		aplicacao = new ListField(model,"aplicacao");
		aplicacao.setLabel(gt("Aplicação"));
		aplicacao.propertie().add("remote",new Config().getResolveUrl("igrp","Gestaodeacesso","index")).add("name","p_aplicacao").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","false").add("disabled","false").add("java-type","").add("tags","false");
		
		adicionar_organica = new LinkField(model,"adicionar_organica");
		adicionar_organica.setLabel(gt("Adicionar Organização"));
		adicionar_organica.setValue(new Config().getResolveUrl("igrp","NovaOrganica","index"));

									adicionar_organica.propertie().add("name","p_adicionar_organica").add("type","link").add("target","right_panel").add("maxlength","30").add("request_fields","");
		
		gestao_de_utilizadores = new LinkField(model,"gestao_de_utilizadores");
		gestao_de_utilizadores.setLabel(gt("Gestão de utilizadores"));
		gestao_de_utilizadores.setValue(new Config().getResolveUrl("igrp","PesquisarUtilizador","index"));

									gestao_de_utilizadores.propertie().add("name","p_gestao_de_utilizadores").add("type","link").add("target","modal").add("maxlength","30").add("request_fields","");
		
		gestao_de_menu = new LinkField(model,"gestao_de_menu");
		gestao_de_menu.setLabel(gt("Gestão de menu"));
		gestao_de_menu.setValue(new Config().getResolveUrl("igrp","PesquisarMenu","index"));

									gestao_de_menu.propertie().add("name","p_gestao_de_menu").add("type","link").add("target","modal").add("maxlength","30").add("request_fields","");
		
		estado = new CheckBoxField(model,"estado");
		estado.setLabel(gt("Estado"));
		estado.propertie().add("name","p_estado").add("type","checkbox").add("maxlength","10").add("switch","true").add("java-type","").add("check","true").add("desc","true");
		
		estado_check = new CheckBoxField(model,"estado_check");
		estado_check.propertie().add("name","p_estado").add("type","checkbox").add("maxlength","10").add("switch","true").add("java-type","").add("check","true").add("desc","true");
		
		org_nome = new TextField(model,"org_nome");
		org_nome.setLabel(gt("Nome"));
		org_nome.propertie().add("name","p_org_nome").add("type","text").add("maxlength","30");
		
		mostrar_perfis = new LinkField(model,"mostrar_perfis");
		mostrar_perfis.setLabel(gt("Mostrar perfis"));
		mostrar_perfis.setValue(new Config().getResolveUrl("igrp","Dominio","index"));

									mostrar_perfis_desc = new LinkField(model,"mostrar_perfis_desc");
		mostrar_perfis_desc.setLabel(gt("Mostrar perfis"));
		mostrar_perfis.propertie().add("name","p_mostrar_perfis").add("type","link").add("target","mpsubmit").add("maxlength","30").add("request_fields","").add("show_header","true").add("desc","true");
		
		id = new HiddenField(model,"id");
		id.setLabel(gt(""));
		id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("java-type","").add("tag","id");
		


		btn_editar = new IGRPButton("Editar","igrp","Gestaodeacesso","editar","right_panel|refresh","warning|fa-pencil","","");
		btn_editar.propertie.add("type","specific").add("rel","editar");

		btn_menu = new IGRPButton("Menu","igrp","Gestaodeacesso","menu","right_panel|refresh","info|fa-bars","","");
		btn_menu.propertie.add("type","specific").add("rel","menu");

		btn_transacti_org = new IGRPButton("Transaction","igrp","Gestaodeacesso","transacti_org","right_panel","black|fa-exchange","","");
		btn_transacti_org.propertie.add("type","specific").add("rel","transacti_org");

		btn_eliminar = new IGRPButton("Eliminar","igrp","Gestaodeacesso","eliminar","confirm","danger|fa-trash","","");
		btn_eliminar.propertie.add("type","specific").add("rel","eliminar");

		btn_associar_etapa = new IGRPButton("Associar Etapa","igrp","Gestaodeacesso","associar_etapa","right_panel","primary|fa-sitemap","","");
		btn_associar_etapa.propertie.add("type","specific").add("rel","associar_etapa");

		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		form_1.addField(aplicacao);
		form_1.addField(adicionar_organica);
		form_1.addField(gestao_de_utilizadores);
		form_1.addField(gestao_de_menu);

		org_table.addField(estado);
		org_table.addField(estado_check);
		org_table.addField(org_nome);
		org_table.addField(mostrar_perfis);
		org_table.addField(mostrar_perfis_desc);
		org_table.addField(id);

		org_table.addButton(btn_editar);
		org_table.addButton(btn_menu);
		org_table.addButton(btn_transacti_org);
		org_table.addButton(btn_eliminar);
		org_table.addButton(btn_associar_etapa);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(org_table);
	}
		
	@Override
	public void setModel(Model model) {
		
		aplicacao.setValue(model);
		adicionar_organica.setValue(model);
		gestao_de_utilizadores.setValue(model);
		gestao_de_menu.setValue(model);
		estado.setValue(model);
		org_nome.setValue(model);
		mostrar_perfis.setValue(model);
		mostrar_perfis_desc.setValue(model);
		id.setValue(model);	

		org_table.loadModel(((Gestaodeacesso) model).getOrg_table());
		}
}
