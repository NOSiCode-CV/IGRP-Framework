/*-------------------------*/

/*Create View*/

package nosi.webapps.igrp.pages.oauthclient;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class OAuthClientView extends View {
	
	
	public Field sectionheader_1_text;
	public Field uris_de_redirecionamento;
	public Field scope;
	public IGRPSectionHeader sectionheader_1;
	public IGRPForm form_1;

	public IGRPButton btn_salvar;
	public OAuthClientView(OAuthClient model){
		this.setPageTitle("OAuth para clientes");
			
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1","");
		form_1 = new IGRPForm("form_1","");
		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel("");
		
		sectionheader_1_text.setValue("OAuth Client Id");
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("persist","true").add("maxlength","4000");
		uris_de_redirecionamento = new TextField(model,"uris_de_redirecionamento");
		uris_de_redirecionamento.setLabel("URIs de redirecionamento");
		
		uris_de_redirecionamento.propertie().add("name","p_uris_de_redirecionamento").add("type","text").add("maxlength","30").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		scope = new ListField(model,"scope");
		scope.setLabel("Scope");
		
		scope.propertie().add("name","p_scope").add("type","select").add("multiple","true").add("domain","").add("maxlength","30").add("required","false").add("change","false").add("disabled","false").add("right","false");

		btn_salvar = new IGRPButton("Salvar","igrp","OAuthClient","salvar","submit","success|fa-save","","");
		btn_salvar.propertie.add("type","form").add("code","").add("class","success").add("rel","salvar");
		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		form_1.addField(uris_de_redirecionamento);
		form_1.addField(scope);

		form_1.addButton(btn_salvar);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
	}
}
/*-------------------------*/