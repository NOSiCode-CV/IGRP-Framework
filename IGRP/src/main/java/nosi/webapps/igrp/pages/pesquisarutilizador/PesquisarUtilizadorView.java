package nosi.webapps.igrp.pages.pesquisarutilizador;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;
import nosi.core.webapp.Core;

public class PesquisarUtilizadorView extends View {

	public Field sectionheader_1_text;
	public Field documento;
	public Field resumo_utilizadores;
	public Field resumo_inativos;
	public Field resumo_perfis_ativos;
	public Field resumo_problemas;
	public Field nome_filt;
	public Field username;
	public Field email;
	public Field nada;
	public Field aplicacao;
	public Field organica;
	public Field perfil;
	public Field sep_extra;
	public Field maximo_linhas;
	public Field auditar_acessos;
	public Field auditar_acessos_check;
	public Field problemas_apenas;
	public Field problemas_apenas_check;
	public Field ativo;
	public Field ativo_check;
	public Field nominho;
	public Field range_1;
	public Field nome;
	public Field tb_email;
	public Field perfile;
	public Field id;
	public Field check_email_hidden;
	public Field estado_utilizador;
	public Field nome_utilizador;
	public Field email_utilizador;
	public Field total_aplicacoes;
	public Field total_organicas;
	public Field perfis_ativos;
	public Field perfis_inativos;
	public Field acessos;
	public Field menus_fora_perfil;
	public Field transacoes_fora_perfil;
	public IGRPSectionHeader sectionheader_1;
	public IGRPView view_1;
	public IGRPForm access_summary;
	public IGRPForm form_1;
	public IGRPTable table_1;
	public IGRPTable utilizadores_resumo;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_convidar;
	public IGRPButton btn_adicionar_utilizador;
	public IGRPButton btn_pesquisar;
	public IGRPButton btn_editar;
	public IGRPButton btn_assiocar_menu;
	public IGRPButton btn_assiocar_transacao;
	public IGRPButton btn_assiocar_etapa;
	public IGRPButton btn_convidar_user;
	public IGRPButton btn_eliminar;

	public PesquisarUtilizadorView(){

		this.setPageTitle("Gestão de Utilizador");
			
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1","");

		view_1 = new IGRPView("view_1","");

		access_summary = new IGRPForm("access_summary","");

		form_1 = new IGRPForm("form_1","Filtro");

		table_1 = new IGRPTable("table_1","Utilizadores");

		utilizadores_resumo = new IGRPTable("utilizadores_resumo","Auditoria dos utilizadores");

		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("Gestão de utilizador"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		documento = new LinkField(model,"documento");
		documento.setLabel(gt("Help"));
		documento.setValue(gt("https://docs.igrp.cv/IGRP/app/webapps?r=tutorial/Listar_documentos/index&dad=tutorial&target=_blank&isPublic=1&lang=pt_PT&p_type=utilizador"));
		documento.propertie().add("name","p_documento").add("type","link").add("target","_newtab").add("request_fields","").add("refresh_components","").add("refresh_submit","false").add("class","[object Object]").add("img","fa-question-circle").add("maxlength","250").add("showlabel","true").add("adbcli","");
		
		resumo_utilizadores = new PlainTextField(model,"resumo_utilizadores");
		resumo_utilizadores.setLabel(gt("Utilizadores"));
		resumo_utilizadores.propertie().add("name","p_resumo_utilizadores").add("type","plaintext").add("maxlength","30").add("disable_output_escaping","false").add("html_class","").add("clear","false").add("tooltip","false").add("disable_copy_paste","false");
		
		resumo_inativos = new PlainTextField(model,"resumo_inativos");
		resumo_inativos.setLabel(gt("Utilizadores inativos"));
		resumo_inativos.propertie().add("name","p_resumo_inativos").add("type","plaintext").add("maxlength","30").add("disable_output_escaping","false").add("html_class","").add("clear","false").add("tooltip","false").add("disable_copy_paste","false");
		
		resumo_perfis_ativos = new PlainTextField(model,"resumo_perfis_ativos");
		resumo_perfis_ativos.setLabel(gt("Perfis ativos"));
		resumo_perfis_ativos.propertie().add("name","p_resumo_perfis_ativos").add("type","plaintext").add("maxlength","30").add("disable_output_escaping","false").add("html_class","").add("clear","false").add("tooltip","false").add("disable_copy_paste","false");
		
		resumo_problemas = new PlainTextField(model,"resumo_problemas");
		resumo_problemas.setLabel(gt("Utilizadores com problemas"));
		resumo_problemas.propertie().add("name","p_resumo_problemas").add("type","plaintext").add("maxlength","60").add("disable_output_escaping","false").add("html_class","").add("clear","false").add("tooltip","false").add("disable_copy_paste","false");
		
		nome_filt = new TextField(model,"nome_filt");
		nome_filt.setLabel(gt("Nome"));
		nome_filt.propertie().add("name","p_nome_filt").add("type","text").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false").add("disablehtml","true").add("placeholder",gt("")).add("desclabel","false").add("inputmask","").add("tooltip","false").add("disable_copy_paste","false");
		
		username = new TextField(model,"username");
		username.setLabel(gt("Username"));
		username.propertie().add("name","p_username").add("type","text").add("maxlength","50").add("required","false").add("readonly","false").add("disabled","false").add("placeholder",gt("")).add("desclabel","false").add("disablehtml","true").add("inputmask","").add("tooltip","false").add("disable_copy_paste","false");
		
		email = new EmailField(model,"email");
		email.setLabel(gt("Email"));
		email.propertie().add("name","p_email").add("type","email").add("maxlength","100").add("required","false").add("readonly","false").add("disabled","false").add("placeholder",gt("")).add("desclabel","false").add("tooltip","false").add("disable_copy_paste","false");
		
		nada = new SeparatorField(model,"nada");
		nada.setLabel(gt(" "));
		nada.propertie().add("name","p_nada").add("type","separator").add("maxlength","30").add("placeholder",gt("")).add("desclabel","false").add("tooltip","false").add("disable_copy_paste","false");
		
		aplicacao = new ListField(model,"aplicacao");
		aplicacao.setLabel(gt("Aplicação"));
		aplicacao.propertie().add("remote-organica",Core.getIGRPLink("igrp","PesquisarUtilizador","organica")).add("name","p_aplicacao").add("type","select").add("multiple","false").add("maxlength","50").add("required","false").add("disabled","false").add("domain","").add("java-type","").add("tags","false").add("load_service_data","false").add("tooltip","false").add("disable_copy_paste","false");
		
		organica = new ListField(model,"organica");
		organica.setLabel(gt("Orgânica"));
		organica.propertie().add("remote-perfil",Core.getIGRPLink("igrp","PesquisarUtilizador","perfil")).add("name","p_organica").add("type","select").add("multiple","false").add("maxlength","100").add("required","false").add("disabled","false").add("domain","").add("java-type","").add("tags","false").add("load_service_data","false").add("tooltip","false").add("disable_copy_paste","false");
		
		perfil = new ListField(model,"perfil");
		perfil.setLabel(gt("Perfil"));
		perfil.propertie().add("remote-index",Core.getIGRPLink("igrp","PesquisarUtilizador","index")).add("name","p_perfil").add("type","select").add("multiple","false").add("maxlength","50").add("required","false").add("disabled","false").add("domain","").add("java-type","").add("tags","false").add("load_service_data","false").add("tooltip","false").add("disable_copy_paste","false");
		
		sep_extra = new SeparatorField(model,"sep_extra");
		sep_extra.setLabel(gt("Extra"));
		sep_extra.propertie().add("name","p_sep_extra").add("type","separator").add("maxlength","250").add("placeholder",gt("")).add("desclabel","false").add("tooltip","false").add("disable_copy_paste","false");
		
		maximo_linhas = new NumberField(model,"maximo_linhas");
		maximo_linhas.setLabel(gt("Máximo de linhas"));
		maximo_linhas.propertie().add("name","p_maximo_linhas").add("type","number").add("min","1").add("max","").add("calculation","false").add("mathcal","").add("numberformat","").add("maxlength","5").add("required","false").add("readonly","false").add("disabled","false").add("placeholder",gt("100")).add("desclabel","false").add("java-type","Integer").add("tooltip","false").add("disable_copy_paste","false");
		
		auditar_acessos = new CheckBoxField(model,"auditar_acessos");
		auditar_acessos.setLabel(gt("Auditar menus e transações"));
		auditar_acessos.propertie().add("name","p_auditar_acessos").add("type","checkbox").add("maxlength","1").add("required","false").add("readonly","false").add("disabled","false").add("java-type","int").add("switch","true").add("tooltip","false").add("disable_copy_paste","false").add("check","true");
		
		problemas_apenas = new CheckBoxField(model,"problemas_apenas");
		problemas_apenas.setLabel(gt("Mostrar apenas problemas"));
		problemas_apenas.propertie().add("name","p_problemas_apenas").add("type","checkbox").add("maxlength","1").add("required","false").add("readonly","false").add("disabled","false").add("java-type","int").add("switch","true").add("tooltip","false").add("disable_copy_paste","false").add("check","true");
		
		ativo = new CheckBoxField(model,"ativo");
		ativo.setLabel(gt("Utilizador Ativo?"));
		ativo.propertie().add("remote-changeStatus",Core.getIGRPLink("igrp","PesquisarUtilizador","changeStatus")).add("name","p_ativo").add("type","checkbox").add("maxlength","300").add("switch","true").add("java-type","int").add("showLabel","true").add("group_in","").add("check","true").add("desc","true");
		
		ativo_check = new CheckBoxField(model,"ativo_check");
		ativo_check.propertie().add("name","p_ativo").add("type","checkbox").add("maxlength","300").add("switch","true").add("java-type","int").add("showLabel","true").add("group_in","").add("check","true").add("desc","true");
		
		nominho = new PlainTextField(model,"nominho");
		nominho.setLabel(gt("Nome"));
		nominho.propertie().add("name","p_nominho").add("type","plaintext").add("maxlength","100").add("showLabel","true").add("disable_output_escaping","false").add("html_class","").add("group_in","");
		
		range_1 = new TextField(model,"range_1");
		range_1.setLabel(gt("Range"));
		range_1.propertie().add("name","p_range_1").add("type","range").add("rangeMin","0").add("rangeMax","100").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		nome = new PlainTextField(model,"nome");
		nome.setLabel(gt("Username"));
		nome.propertie().add("name","p_nome").add("type","plaintext").add("maxlength","100").add("showLabel","true").add("disable_output_escaping","false").add("html_class","").add("group_in","");
		
		tb_email = new PlainTextField(model,"tb_email");
		tb_email.setLabel(gt("Email"));
		tb_email.propertie().add("name","p_tb_email").add("type","plaintext").add("maxlength","100").add("showLabel","true").add("disable_output_escaping","false").add("html_class","").add("group_in","");
		
		perfile = new PlainTextField(model,"perfile");
		perfile.setLabel(gt("App/Org/Perfil"));
		perfile.propertie().add("name","p_perfile").add("type","plaintext").add("maxlength","50").add("showLabel","true").add("disable_output_escaping","false").add("html_class","").add("group_in","");
		
		id = new HiddenField(model,"id");
		id.setLabel(gt(""));
		id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("java-type","").add("showLabel","true").add("group_in","").add("tag","id");
		
		check_email_hidden = new HiddenField(model,"check_email_hidden");
		check_email_hidden.setLabel(gt(""));
		check_email_hidden.propertie().add("name","p_check_email_hidden").add("type","hidden").add("maxlength","30").add("showLabel","true").add("group_in","").add("java-type","").add("tag","check_email_hidden");
		
		estado_utilizador = new PlainTextField(model,"estado_utilizador");
		estado_utilizador.setLabel(gt("Estado"));
		estado_utilizador.propertie().add("name","p_estado_utilizador").add("type","plaintext").add("maxlength","100").add("showLabel","true").add("disable_output_escaping","true").add("html_class","").add("group_in","");
		
		nome_utilizador = new PlainTextField(model,"nome_utilizador");
		nome_utilizador.setLabel(gt("Nome"));
		nome_utilizador.propertie().add("name","p_nome_utilizador").add("type","plaintext").add("maxlength","250").add("showLabel","true").add("disable_output_escaping","false").add("html_class","").add("group_in","");
		
		email_utilizador = new PlainTextField(model,"email_utilizador");
		email_utilizador.setLabel(gt("Email"));
		email_utilizador.propertie().add("name","p_email_utilizador").add("type","plaintext").add("maxlength","100").add("showLabel","true").add("disable_output_escaping","false").add("html_class","").add("group_in","");
		
		total_aplicacoes = new PlainTextField(model,"total_aplicacoes");
		total_aplicacoes.setLabel(gt("Apps"));
		total_aplicacoes.propertie().add("name","p_total_aplicacoes").add("type","plaintext").add("maxlength","30").add("showLabel","true").add("disable_output_escaping","false").add("html_class","").add("group_in","");
		
		total_organicas = new PlainTextField(model,"total_organicas");
		total_organicas.setLabel(gt("Orgânicas"));
		total_organicas.propertie().add("name","p_total_organicas").add("type","plaintext").add("maxlength","30").add("showLabel","true").add("disable_output_escaping","false").add("html_class","").add("group_in","");
		
		perfis_ativos = new PlainTextField(model,"perfis_ativos");
		perfis_ativos.setLabel(gt("Ativos"));
		perfis_ativos.propertie().add("name","p_perfis_ativos").add("type","plaintext").add("maxlength","30").add("showLabel","true").add("disable_output_escaping","false").add("html_class","").add("group_in","");
		
		perfis_inativos = new PlainTextField(model,"perfis_inativos");
		perfis_inativos.setLabel(gt("Desativados"));
		perfis_inativos.propertie().add("name","p_perfis_inativos").add("type","plaintext").add("maxlength","30").add("showLabel","true").add("disable_output_escaping","false").add("html_class","").add("group_in","");
		
		acessos = new PlainTextField(model,"acessos");
		acessos.setLabel(gt("Acessos"));
		acessos.propertie().add("name","p_acessos").add("type","plaintext").add("maxlength","4000").add("showLabel","true").add("disable_output_escaping","true").add("html_class","").add("group_in","");
		
		menus_fora_perfil = new PlainTextField(model,"menus_fora_perfil");
		menus_fora_perfil.setLabel(gt("Menu utilizador adicionais"));
		menus_fora_perfil.propertie().add("name","p_menus_fora_perfil").add("type","plaintext").add("maxlength","4000").add("showLabel","true").add("disable_output_escaping","true").add("html_class","").add("group_in","");
		
		transacoes_fora_perfil = new PlainTextField(model,"transacoes_fora_perfil");
		transacoes_fora_perfil.setLabel(gt("Transações utilizador adicionais"));
		transacoes_fora_perfil.propertie().add("name","p_transacoes_fora_perfil").add("type","plaintext").add("maxlength","4000").add("showLabel","true").add("disable_output_escaping","true").add("html_class","").add("group_in","");
		

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");

		btn_convidar = new IGRPButton("Convidar","igrp","PesquisarUtilizador","convidar","right_panel_submit|refresh","warning|fa-send","","");
		btn_convidar.propertie.add("type","specific").add("rel","convidar").add("refresh_components","");

		btn_adicionar_utilizador = new IGRPButton("Adicionar Utilizador","igrp","PesquisarUtilizador","adicionar_utilizador","right_panel_submit","success|fa-plus-square","","");
		btn_adicionar_utilizador.propertie.add("type","specific").add("rel","adicionar_utilizador").add("refresh_components","");

		btn_pesquisar = new IGRPButton("Pesquisar","igrp","PesquisarUtilizador","pesquisar","submit_ajax","primary|fa-search","","");
		btn_pesquisar.propertie.add("id","button_5e31_2699").add("type","form").add("class","primary").add("rel","pesquisar").add("refresh_components","access_summary,utilizadores_resumo,table_1");

		btn_editar = new IGRPButton("Editar","igrp","PesquisarUtilizador","editar","mpsubmit|refresh","warning|fa-pencil","","");
		btn_editar.propertie.add("id","button_8625_a0d4").add("type","specific").add("class","warning").add("rel","editar").add("refresh_components","");

		btn_assiocar_menu = new IGRPButton("Associar Menu","igrp","PesquisarUtilizador","assiocar_menu","right_panel_submit","info|fa-bars","","");
		btn_assiocar_menu.propertie.add("id","button_f39b_61a7").add("type","specific").add("class","info").add("rel","assiocar_menu").add("refresh_components","");

		btn_assiocar_transacao = new IGRPButton("Associar Transacao","igrp","PesquisarUtilizador","assiocar_transacao","right_panel","black|fa-exchange","","");
		btn_assiocar_transacao.propertie.add("id","button_ead4_9d21").add("type","specific").add("class","black").add("rel","assiocar_transacao").add("refresh_components","");

		btn_assiocar_etapa = new IGRPButton("Associar Etapa","igrp","PesquisarUtilizador","assiocar_etapa","right_panel","primary|fa-sitemap","","");
		btn_assiocar_etapa.propertie.add("id","button_ac82_afbd").add("type","specific").add("class","primary").add("rel","assiocar_etapa").add("refresh_components","");

		btn_convidar_user = new IGRPButton("Convidar","igrp","PesquisarUtilizador","convidar_user","right_panel|refresh","warning|fa-send","","");
		btn_convidar_user.propertie.add("id","button_0c9f_e52a").add("type","specific").add("class","warning").add("rel","convidar_user").add("refresh_components","");

		btn_eliminar = new IGRPButton("Eliminar","igrp","PesquisarUtilizador","eliminar","alert_submit","danger|fa-trash","","");
		btn_eliminar.propertie.add("id","button_2f8d_ba41").add("type","specific").add("class","danger").add("rel","eliminar").add("refresh_components","").add("labelConfirm","Deseja realmente realizar esta operação?");

		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		view_1.addField(documento);

		access_summary.addField(resumo_utilizadores);
		access_summary.addField(resumo_inativos);
		access_summary.addField(resumo_perfis_ativos);
		access_summary.addField(resumo_problemas);

		form_1.addField(nome_filt);
		form_1.addField(username);
		form_1.addField(email);
		form_1.addField(nada);
		form_1.addField(aplicacao);
		form_1.addField(organica);
		form_1.addField(perfil);
		form_1.addField(sep_extra);
		form_1.addField(maximo_linhas);
		form_1.addField(auditar_acessos);
		form_1.addField(problemas_apenas);


		table_1.addField(ativo);
		table_1.addField(ativo_check);
		table_1.addField(nominho);
		table_1.addField(range_1);
		table_1.addField(nome);
		table_1.addField(tb_email);
		table_1.addField(perfile);
		table_1.addField(id);
		table_1.addField(check_email_hidden);

		utilizadores_resumo.addField(estado_utilizador);
		utilizadores_resumo.addField(nome_utilizador);
		utilizadores_resumo.addField(email_utilizador);
		utilizadores_resumo.addField(total_aplicacoes);
		utilizadores_resumo.addField(total_organicas);
		utilizadores_resumo.addField(perfis_ativos);
		utilizadores_resumo.addField(perfis_inativos);
		utilizadores_resumo.addField(acessos);
		utilizadores_resumo.addField(menus_fora_perfil);
		utilizadores_resumo.addField(transacoes_fora_perfil);

		toolsbar_1.addButton(btn_convidar);
		toolsbar_1.addButton(btn_adicionar_utilizador);
		form_1.addButton(btn_pesquisar);
		table_1.addButton(btn_editar);
		table_1.addButton(btn_assiocar_menu);
		table_1.addButton(btn_assiocar_transacao);
		table_1.addButton(btn_assiocar_etapa);
		table_1.addButton(btn_convidar_user);
		table_1.addButton(btn_eliminar);
		this.addToPage(sectionheader_1);
		this.addToPage(view_1);
		this.addToPage(access_summary);
		this.addToPage(form_1);
		this.addToPage(table_1);
		this.addToPage(utilizadores_resumo);
		this.addToPage(toolsbar_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		resumo_utilizadores.setValue(model);
		resumo_inativos.setValue(model);
		resumo_perfis_ativos.setValue(model);
		resumo_problemas.setValue(model);
		nome_filt.setValue(model);
		username.setValue(model);
		email.setValue(model);
		nada.setValue(model);
		aplicacao.setValue(model);
		organica.setValue(model);
		perfil.setValue(model);
		sep_extra.setValue(model);
		maximo_linhas.setValue(model);
		auditar_acessos.setValue(model);
		problemas_apenas.setValue(model);
		ativo.setValue(model);
		nominho.setValue(model);
		range_1.setValue(model);
		nome.setValue(model);
		tb_email.setValue(model);
		perfile.setValue(model);
		id.setValue(model);
		check_email_hidden.setValue(model);
		estado_utilizador.setValue(model);
		nome_utilizador.setValue(model);
		email_utilizador.setValue(model);
		total_aplicacoes.setValue(model);
		total_organicas.setValue(model);
		perfis_ativos.setValue(model);
		perfis_inativos.setValue(model);
		acessos.setValue(model);
		menus_fora_perfil.setValue(model);
		transacoes_fora_perfil.setValue(model);	

		table_1.loadModel(((PesquisarUtilizador) model).getTable_1());
		utilizadores_resumo.loadModel(((PesquisarUtilizador) model).getUtilizadores_resumo());
		}
}