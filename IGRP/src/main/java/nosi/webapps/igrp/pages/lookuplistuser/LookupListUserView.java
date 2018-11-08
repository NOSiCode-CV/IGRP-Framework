package nosi.webapps.igrp.pages.lookuplistuser;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class LookupListUserView extends View {

	public Field email;
	public Field login;
	public Field nome;
	public Field email_1;
	public Field login_1;
	public Field nome_1;
	public Field id;
	public IGRPForm form_1;
	public IGRPTable table_1;

	public IGRPButton btn_pesquisar;

	public LookupListUserView(){

		this.setPageTitle("Lookup Lista Utilizador");
			
		form_1 = new IGRPForm("form_1","");

		table_1 = new IGRPTable("table_1","");

		email = new EmailField(model,"email");
		email.setLabel(gt("Email"));
		email.propertie().add("name","p_email").add("type","email").add("maxlength","30").add("required","false").add("readonly","false").add("disabled","false");
		
		login = new TextField(model,"login");
		login.setLabel(gt("Login"));
		login.propertie().add("name","p_login").add("type","text").add("maxlength","30").add("required","false").add("readonly","false").add("disabled","false");
		
		nome = new TextField(model,"nome");
		nome.setLabel(gt("Nome"));
		nome.propertie().add("name","p_nome").add("type","text").add("maxlength","30").add("required","false").add("readonly","false").add("disabled","false");
		
		email_1 = new EmailField(model,"email_1");
		email_1.setLabel(gt("Email"));
		email_1.propertie().add("name","p_email_1").add("type","email").add("maxlength","30");
		
		login_1 = new TextField(model,"login_1");
		login_1.setLabel(gt("Login"));
		login_1.propertie().add("name","p_login_1").add("type","text").add("maxlength","30");
		
		nome_1 = new TextField(model,"nome_1");
		nome_1.setLabel(gt("Nome"));
		nome_1.propertie().add("name","p_nome_1").add("type","text").add("maxlength","30");
		
		id = new HiddenField(model,"id");
		id.setLabel(gt(""));
		id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("tag","id");
		


		btn_pesquisar = new IGRPButton("Pesquisar","igrp","LookupListUser","pesquisar","submit","primary|fa-search","","");
		btn_pesquisar.propertie.add("type","form").add("rel","pesquisar");

		
	}
		
	@Override
	public void render(){
		
		form_1.addField(email);
		form_1.addField(login);
		form_1.addField(nome);

		table_1.addField(email_1);
		table_1.addField(login_1);
		table_1.addField(nome_1);
		table_1.addField(id);

		form_1.addButton(btn_pesquisar);
		this.addToPage(form_1);
		this.addToPage(table_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		email.setValue(model);
		login.setValue(model);
		nome.setValue(model);
		email_1.setValue(model);
		login_1.setValue(model);
		nome_1.setValue(model);
		id.setValue(model);	

		table_1.loadModel(((LookupListUser) model).getTable_1());
		}
}
