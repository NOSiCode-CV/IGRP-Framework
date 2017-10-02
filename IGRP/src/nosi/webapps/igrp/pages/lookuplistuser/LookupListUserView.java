/*-------------------------*/

/*Create View*/

package nosi.webapps.igrp.pages.lookuplistuser;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class LookupListUserView extends View {
	
	
	public Field email;
	public Field login;
	public Field nome;
	public Field email_1;
	public Field login_1;
	public Field nome_1;
	public Field p_id;
	public IGRPForm form_1;
	public IGRPTable table_1;

	public IGRPButton btn_pesquisar;
	public LookupListUserView(LookupListUser model){
		this.setPageTitle("Lista de Utilizadores para Lookup");
			
		form_1 = new IGRPForm("form_1","");
		table_1 = new IGRPTable("table_1","");
		email = new EmailField(model,"email");
		email.setLabel("Email");
		
		email.propertie().add("name","p_email").add("type","email").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		login = new TextField(model,"login");
		login.setLabel("Login");
		
		login.propertie().add("name","p_login").add("type","text").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		nome = new TextField(model,"nome");
		nome.setLabel("Nome");
		
		nome.propertie().add("name","p_nome").add("type","text").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		email_1 = new EmailField(model,"email_1");
		email_1.setLabel("Email");
		
		email_1.propertie().add("name","p_email_1").add("type","email").add("maxlength","30").add("align","left").add("lookup_parser","true").add("iskey","false");
		login_1 = new TextField(model,"login_1");
		login_1.setLabel("Login");
		
		login_1.propertie().add("name","p_login_1").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","true").add("iskey","false");
		nome_1 = new TextField(model,"nome_1");
		nome_1.setLabel("Nome");
		
		nome_1.propertie().add("name","p_nome_1").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","true").add("iskey","false");
		p_id = new HiddenField(model,"p_id");
		p_id.setLabel("");
		
		p_id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("iskey","false").add("tag","id");

		btn_pesquisar = new IGRPButton("Pesquisar","igrp","LookupListUser","pesquisar","submit","primary|fa-search","","");
		btn_pesquisar.propertie.add("type","form").add("code","").add("class","primary").add("rel","pesquisar");
		
	}
		
	@Override
	public void render(){
		
		form_1.addField(email);
		form_1.addField(login);
		form_1.addField(nome);

		table_1.addField(email_1);
		table_1.addField(login_1);
		table_1.addField(nome_1);
		table_1.addField(p_id);

		form_1.addButton(btn_pesquisar);
		this.addToPage(form_1);
		this.addToPage(table_1);
	}
}
/*-------------------------*/