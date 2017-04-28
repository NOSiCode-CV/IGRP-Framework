/*-------------------------*/

/*Create View*/

package nosi.webapps.igrp.pages.novoperfil;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class NovoPerfilView extends View {		
	
	public Field codigo;
	public Field descricao;
	public Field aplicacao;
	public Field organica;
	public Field perfil;
	public Field activo;
	public Field sectionheader_1_text;
	public IGRPForm form_1;
	public IGRPSectionHeader sectionheader_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_gravar;
	public IGRPButton btn_voltar;
	public NovoPerfilView(NovoPerfil model){			
		form_1 = new IGRPForm("form_1");
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1");
		codigo = new TextField(model,"codigo");
		codigo.setLabel("Código");
		codigo.propertie().add("name","p_codigo").add("type","text").add("maxlength","30").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		descricao = new TextField(model,"descricao");
		descricao.setLabel("Descrição");
		descricao.propertie().add("name","p_descricao").add("type","text").add("maxlength","30").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		aplicacao = new ListField(model,"aplicacao");
		aplicacao.setLabel("Aplicação");
		aplicacao.propertie().add("name","p_aplicacao").add("type","select").add("multiple","false").add("maxlength","30").add("required","false").add("change","true").add("disabled","false").add("right","false");
		organica = new ListField(model,"organica");
		organica.setLabel("Orgânica");
		organica.propertie().add("name","p_organica").add("type","select").add("multiple","false").add("maxlength","30").add("required","false").add("change","true").add("disabled","false").add("right","false");
		perfil = new ListField(model,"perfil");
		perfil.setLabel("Perfil");
		perfil.propertie().add("name","p_perfil").add("type","select").add("multiple","false").add("maxlength","30").add("required","false").add("change","false").add("disabled","false").add("right","false");
		activo = new CheckBoxField(model,"activo");
		activo.setLabel("Activo?");
		activo.propertie().add("name","p_activo").add("type","checkbox").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("right","false").add("check","true");
		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel("");
		sectionheader_1_text.setValue("Gestão de Perfil - Novo");
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("persist","true").add("maxlength","4000");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_gravar = new IGRPButton("Gravar","RED","Teste","Action","submit","default|fa-save","default||fa-save|www","http://igrp.teste.gov.cv/images/IGRP/Teste.xml");
		btn_gravar.propertie.add("type","specific").add("code","").add("rel","gravar");
		btn_voltar = new IGRPButton("Voltar","RED","Teste","Action","_back","default|fa-arrow-left","default||fa-arrow-left|www","http://igrp.teste.gov.cv/images/IGRP/Teste.xml");
		btn_voltar.propertie.add("type","specific").add("code","").add("rel","voltar");
		
	}
		
	@Override
	public void render(){


		form_1.addField(codigo);
		form_1.addField(descricao);
		form_1.addField(aplicacao);
		form_1.addField(organica);
		form_1.addField(perfil);
		form_1.addField(activo);

		sectionheader_1.addField(sectionheader_1_text);

		toolsbar_1.addButton(btn_gravar);
		toolsbar_1.addButton(btn_voltar);
		this.addToPage(form_1);
		this.addToPage(sectionheader_1);
		this.addToPage(toolsbar_1);
		
	}
}
/*-------------------------*/