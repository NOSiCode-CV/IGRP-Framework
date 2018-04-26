
package nosi.webapps.igrp.pages.pesquisarutilizador;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

import nosi.core.config.Config;



public class PesquisarUtilizadorView extends View {

	public Field sectionheader_1_text;
	public Field username;
	public Field email;
	public Field nada;
	public Field aplicacao;
	public Field organica;
	public Field perfil;
	public Field nominho;
	public Field nome;
	public Field tb_email;
	public Field perfile;
	public Field id;
	public IGRPForm sectionheader_1;
	public IGRPForm form_1;
	public IGRPTable table_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_convidar;
	public IGRPButton btn_adicionar_utilizador;
	public IGRPButton btn_pesquisar;
	public IGRPButton btn_editar;
	public IGRPButton btn_eliminar;
	public IGRPButton btn_convidar_user;

	public PesquisarUtilizadorView(){

		this.setPageTitle("Gestão de Utilizador");
			
		sectionheader_1 = new IGRPForm("sectionheader_1","");

		form_1 = new IGRPForm("form_1","Filtro");

		table_1 = new IGRPTable("table_1","Utilizadores Convidados");

		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("Gestão de utilizador"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		username = new TextField(model,"username");
		username.setLabel(gt("Username"));
		username.propertie().add("name","p_username").add("type","text").add("maxlength","50").add("required","false");
		
		email = new EmailField(model,"email");
		email.setLabel(gt("Email"));
		email.propertie().add("name","p_email").add("type","email").add("maxlength","100").add("required","false");
		
		nada = new SeparatorField(model,"nada");
		nada.setLabel(gt(" "));
		nada.propertie().add("name","p_nada").add("type","separator").add("maxlength","30");
		
		aplicacao = new ListField(model,"aplicacao");
		aplicacao.setLabel(gt("Aplicação"));
		aplicacao.propertie().add("name","p_aplicacao").add("type","select").add("multiple","false").add("maxlength","50").add("required","false").add("domain","").add("java-type","");
		
		organica = new ListField(model,"organica");
		organica.setLabel(gt("Orgânica"));
		organica.propertie().add("name","p_organica").add("type","select").add("multiple","false").add("maxlength","100").add("required","false").add("domain","").add("java-type","");
		
		perfil = new ListField(model,"perfil");
		perfil.setLabel(gt("Perfil"));
		perfil.propertie().add("name","p_perfil").add("type","select").add("multiple","false").add("maxlength","50").add("required","false").add("domain","").add("java-type","");
		
		nominho = new PlainTextField(model,"nominho");
		nominho.setLabel(gt("Nome"));
		nominho.propertie().add("name","p_nominho").add("type","plaintext").add("maxlength","50");
		
		nome = new PlainTextField(model,"nome");
		nome.setLabel(gt("Username"));
		nome.propertie().add("name","p_nome").add("type","plaintext").add("maxlength","100");
		
		tb_email = new PlainTextField(model,"tb_email");
		tb_email.setLabel(gt("Email"));
		tb_email.propertie().add("name","p_tb_email").add("type","plaintext").add("maxlength","100");
		
		perfile = new PlainTextField(model,"perfile");
		perfile.setLabel(gt("App/Org/Perfil"));
		perfile.propertie().add("name","p_perfile").add("type","plaintext").add("maxlength","50");
		
		id = new HiddenField(model,"id");
		id.setLabel(gt(""));
		id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("tag","id");
		

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");

		btn_convidar = new IGRPButton("Convidar","igrp","PesquisarUtilizador","convidar","mpsubmit|refresh","warning|fa-send","","");
		btn_convidar.propertie.add("type","specific").add("rel","convidar");

		btn_adicionar_utilizador = new IGRPButton("Adicionar Utilizador","igrp","PesquisarUtilizador","adicionar_utilizador","mpsubmit","success|fa-plus-square","","");
		btn_adicionar_utilizador.propertie.add("type","specific").add("rel","adicionar_utilizador");

		btn_pesquisar = new IGRPButton("Pesquisar","igrp","PesquisarUtilizador","pesquisar","submit","primary|fa-search","","");
		btn_pesquisar.propertie.add("type","form").add("rel","pesquisar");

		btn_editar = new IGRPButton("Editar","igrp","PesquisarUtilizador","editar","mpsubmit|refresh","warning|fa-pencil","","");
		btn_editar.propertie.add("type","specific").add("rel","editar");

		btn_eliminar = new IGRPButton("Eliminar","igrp","PesquisarUtilizador","eliminar","confirm","danger|fa-trash","","");
		btn_eliminar.propertie.add("type","specific").add("rel","eliminar");

		btn_convidar_user = new IGRPButton("Convidar","igrp","PesquisarUtilizador","convidar_user","right_panel|refresh","warning|fa-send","","");
		btn_convidar_user.propertie.add("type","specific").add("rel","convidar_user");

		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		form_1.addField(username);
		form_1.addField(email);
		form_1.addField(nada);
		form_1.addField(aplicacao);
		form_1.addField(organica);
		form_1.addField(perfil);


		table_1.addField(nominho);
		table_1.addField(nome);
		table_1.addField(tb_email);
		table_1.addField(perfile);
		table_1.addField(id);

		toolsbar_1.addButton(btn_convidar);
		toolsbar_1.addButton(btn_adicionar_utilizador);
		form_1.addButton(btn_pesquisar);
		table_1.addButton(btn_editar);
		table_1.addButton(btn_eliminar);
		table_1.addButton(btn_convidar_user);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(table_1);
		this.addToPage(toolsbar_1);
	}
		
	public void setModel(PesquisarUtilizador model) {
		
		username.setValue(model);
		email.setValue(model);
		nada.setValue(model);
		aplicacao.setValue(model);
		organica.setValue(model);
		perfil.setValue(model);
		nominho.setValue(model);
		nome.setValue(model);
		tb_email.setValue(model);
		perfile.setValue(model);
		id.setValue(model);	

		table_1.loadModel(model.getTable_1());
		
	}
}
