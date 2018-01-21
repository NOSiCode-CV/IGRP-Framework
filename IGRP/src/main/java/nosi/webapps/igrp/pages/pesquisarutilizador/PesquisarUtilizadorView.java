
package nosi.webapps.igrp.pages.pesquisarutilizador;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class PesquisarUtilizadorView extends View {
	
	
	public Field sectionheader_1_text;
	public Field username;
	public Field email;
	public Field nada;
	public Field aplicacao;
	public Field organica;
	public Field perfil;
	public Field nome;
	public Field nominho;
	public Field p_id;
	public IGRPForm sectionheader_1;
	public IGRPForm form_1;
	public IGRPTable table_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_lista_geral;
	public IGRPButton btn_adicionar_utilizador;
	public IGRPButton btn_convidar;
	public IGRPButton btn_pesquisar;
	public IGRPButton btn_editar;
	public IGRPButton btn_eliminar;
	public IGRPButton btn_convidar_user;
	public PesquisarUtilizadorView(PesquisarUtilizador model){
		this.setPageTitle("Lista de Utilizador");
			
		sectionheader_1 = new IGRPForm("sectionheader_1","");
		form_1 = new IGRPForm("form_1","");
		table_1 = new IGRPTable("table_1","Utilizadores Convidados");
		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("Gestão de utilizador"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("persist","true").add("maxlength","4000");
		
		username = new TextField(model,"username");
		username.setLabel(gt("Username"));
		username.propertie().add("name","p_username").add("type","text").add("maxlength","50").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		
		email = new TextField(model,"email");
		email.setLabel(gt("Email"));
		email.propertie().add("name","p_email").add("type","text").add("maxlength","100").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		
		nada = new SeparatorField(model,"nada");
		nada.setLabel(gt(" "));
		nada.propertie().add("name","p_nada").add("type","separator").add("maxlength","30").add("placeholder","").add("right","false");
		
		aplicacao = new ListField(model,"aplicacao");
		aplicacao.setLabel(gt("Aplicacao"));
		aplicacao.propertie().add("name","p_aplicacao").add("type","select").add("multiple","false").add("maxlength","50").add("required","false").add("change","true").add("disabled","false").add("right","false").add("domain","").add("java-type","");
		
		organica = new ListField(model,"organica");
		organica.setLabel(gt("Organica"));
		organica.propertie().add("name","p_organica").add("type","select").add("multiple","false").add("maxlength","100").add("required","false").add("change","true").add("disabled","false").add("right","false").add("domain","").add("java-type","");
		
		perfil = new ListField(model,"perfil");
		perfil.setLabel(gt("Perfil"));
		perfil.propertie().add("name","p_perfil").add("type","select").add("multiple","false").add("maxlength","50").add("required","false").add("change","false").add("disabled","false").add("right","false").add("domain","").add("java-type","");
		
		nome = new PlainTextField(model,"nome");
		nome.setLabel(gt("Username"));
		nome.propertie().add("name","p_nome").add("type","plaintext").add("maxlength","100").add("align","left").add("lookup_parser","false").add("iskey","false");
		
		nominho = new PlainTextField(model,"nominho");
		nominho.setLabel(gt("Nome"));
		nominho.propertie().add("name","p_nominho").add("type","plaintext").add("maxlength","50").add("align","left").add("lookup_parser","false").add("iskey","false");
		
		p_id = new HiddenField(model,"p_id");
		p_id.setLabel(gt(""));
		p_id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("iskey","false").add("tag","id");
		

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_lista_geral = new IGRPButton("Lista Geral","igrp","PesquisarUtilizador","lista_geral","modal","default|fa-list","","");
		btn_lista_geral.propertie.add("type","specific").add("code","").add("rel","lista_geral");
		btn_adicionar_utilizador = new IGRPButton("Adicionar Utilizador","igrp","PesquisarUtilizador","adicionar_utilizador","modal","success|fa-plus-square","","");
		btn_adicionar_utilizador.propertie.add("type","specific").add("code","").add("rel","adicionar_utilizador");
		btn_convidar = new IGRPButton("Convidar","igrp","PesquisarUtilizador","convidar","modal","warning|fa-send","","");
		btn_convidar.propertie.add("type","specific").add("code","").add("rel","convidar");
		btn_pesquisar = new IGRPButton("Pesquisar","igrp","PesquisarUtilizador","pesquisar","submit","primary|fa-search","","");
		btn_pesquisar.propertie.add("type","form").add("code","").add("class","primary").add("rel","pesquisar");
		btn_editar = new IGRPButton("Editar","igrp","PesquisarUtilizador","editar","mpsubmit","warning|fa-pencil","","");
		btn_editar.propertie.add("type","specific").add("code","").add("class","warning").add("rel","editar");
		btn_eliminar = new IGRPButton("Eliminar","igrp","PesquisarUtilizador","eliminar","confirm","danger|fa-trash","","");
		btn_eliminar.propertie.add("type","specific").add("code","").add("class","danger").add("rel","eliminar");
		btn_convidar_user = new IGRPButton("Convidar","igrp","PesquisarUtilizador","convidar_user","mpsubmit","warning|fa-send","","");
		btn_convidar_user.propertie.add("type","specific").add("code","").add("class","warning").add("rel","convidar_user");
		
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


		table_1.addField(nome);
		table_1.addField(nominho);
		table_1.addField(email);
		table_1.addField(perfil);
		table_1.addField(p_id);

		toolsbar_1.addButton(btn_lista_geral);
		toolsbar_1.addButton(btn_adicionar_utilizador);
		toolsbar_1.addButton(btn_convidar);
		form_1.addButton(btn_pesquisar);
		table_1.addButton(btn_editar);
		table_1.addButton(btn_eliminar);
		table_1.addButton(btn_convidar_user);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(table_1);
		this.addToPage(toolsbar_1);
	}
}
