/*-------------------------*/

/*Create View*/

package nosi.webapps.igrp.pages.novoutilizador;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class NovoUtilizadorView extends View {		
	
	public Field sectionheader_1_text;
	public Field email;
	public Field aplicacao;
	public Field organica;
	public Field perfil;
	public Field portal;
	public IGRPSectionHeader sectionheader_1;
	public IGRPForm form_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_gravar;
	public IGRPButton btn_voltar;
	public NovoUtilizadorView(NovoUtilizador model){			
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1");
		form_1 = new IGRPForm("form_1");
		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel("");
		sectionheader_1_text.setValue("Convite - Novo");
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("persist","true").add("maxlength","4000");
		email = new EmailField(model,"email");
		email.setLabel("Email");
		email.propertie().add("name","p_email").add("type","email").add("maxlength","100").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		aplicacao = new ListField(model,"aplicacao");
		aplicacao.setLabel("Aplicacao");
		aplicacao.propertie().add("name","p_aplicacao").add("type","select").add("multiple","false").add("maxlength","100").add("required","true").add("change","false").add("disabled","false").add("right","false");
		organica = new ListField(model,"organica");
		organica.setLabel("Organica");
		organica.propertie().add("name","p_organica").add("type","select").add("multiple","false").add("maxlength","100").add("required","true").add("change","false").add("disabled","false").add("right","false");
		perfil = new ListField(model,"perfil");
		perfil.setLabel("Perfil");
		perfil.propertie().add("name","p_perfil").add("type","select").add("multiple","false").add("maxlength","100").add("required","true").add("change","false").add("disabled","false").add("right","false");
		portal = new CheckBoxField(model,"portal");
		portal.setLabel("Portal");
		portal.propertie().add("name","p_portal").add("type","checkbox").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("right","false").add("check","true");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_gravar = new IGRPButton("Gravar","igrp","novo-utilizador","gravar","submit","default|fa-save","","");
		btn_gravar.propertie.add("type","specific").add("code","").add("rel","gravar");
		btn_voltar = new IGRPButton("Voltar","igrp","pesquisar-utilizador","index","_self","default|fa-angle-right","","");
		btn_voltar.propertie.add("type","specific").add("code","").add("rel","voltar");
		
	}
		
	@Override
	public void render(){

		sectionheader_1.addField(sectionheader_1_text);


		form_1.addField(email);
		form_1.addField(aplicacao);
		form_1.addField(organica);
		form_1.addField(perfil);
		form_1.addField(portal);

		toolsbar_1.addButton(btn_gravar);
		toolsbar_1.addButton(btn_voltar);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(toolsbar_1);
	}
}
/*-------------------------*/