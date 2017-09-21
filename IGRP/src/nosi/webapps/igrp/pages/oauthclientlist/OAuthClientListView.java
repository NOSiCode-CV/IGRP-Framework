/*-------------------------*/

/*Create View*/

package nosi.webapps.igrp.pages.oauthclientlist;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class OAuthClientListView extends View {
	
	
	public Field sectionheader_1_text;
	public Field uris_;
	public Field client_id;
	public Field client_secret;
	public Field uris;
	public Field scope;
	public IGRPSectionHeader sectionheader_1;
	public IGRPForm form_1;
	public IGRPTable table_1;

	public IGRPButton btn_pesquisar;
	public OAuthClientListView(OAuthClientList model){
		this.setPageTitle("Lista dos dados do cliente");
			
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1","");
		form_1 = new IGRPForm("form_1","");
		table_1 = new IGRPTable("table_1","");
		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel("");
		
		sectionheader_1_text.setValue("Dados dos Clientes");
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("persist","true").add("maxlength","4000");
		uris_ = new TextField(model,"uris_");
		uris_.setLabel("URIs ");
		
		uris_.propertie().add("name","p_uris_").add("type","text").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		client_id = new TextField(model,"client_id");
		client_id.setLabel("Client ID");
		
		client_id.propertie().add("name","p_client_id").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		client_secret = new TextField(model,"client_secret");
		client_secret.setLabel("Client Secret");
		
		client_secret.propertie().add("name","p_client_secret").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		uris = new TextField(model,"uris");
		uris.setLabel("URIs");
		
		uris.propertie().add("name","p_uris").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		scope = new TextField(model,"scope");
		scope.setLabel("Scope");
		
		scope.propertie().add("name","p_scope").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");

		btn_pesquisar = new IGRPButton("Pesquisar","igrp","OAuthClientList","pesquisar","submit","default|fa-search","","");
		btn_pesquisar.propertie.add("type","form").add("code","").add("class","default").add("rel","pesquisar");
		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		form_1.addField(uris_);

		table_1.addField(client_id);
		table_1.addField(client_secret);
		table_1.addField(uris);
		table_1.addField(scope);

		form_1.addButton(btn_pesquisar);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(table_1);
	}
}
/*-------------------------*/