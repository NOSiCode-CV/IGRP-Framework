package nosi.webapps.app_teste.pages.userform;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;
import nosi.core.config.Config;

public class UserFormView extends View {

	public Field nome;
	public Field morada;
	public Field data_nascimento;
	public Field genero;
	public Field estado_civil;
	public Field tipo_de_beneficiario;
	public Field email;
	public Field contacto;
	public Field data_do_registo;
	public Field id_user;
	public IGRPForm form_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_list;
	public IGRPButton btn_save;

	public UserFormView(){

		this.setPageTitle("Registo de Utentes");
			
		form_1 = new IGRPForm("form_1","Registar Utente");

		nome = new TextField(model,"nome");
		nome.setLabel(gt("Nome"));
		nome.propertie().add("name","p_nome").add("type","text").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false");
		
		morada = new TextField(model,"morada");
		morada.setLabel(gt("Morada"));
		morada.propertie().add("name","p_morada").add("type","text").add("maxlength","2147483647").add("required","false").add("readonly","false").add("disabled","false");
		
		data_nascimento = new DateField(model,"data_nascimento");
		data_nascimento.setLabel(gt("Data Nascimento"));
		data_nascimento.propertie().add("name","p_data_nascimento").add("type","date").add("range","false").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false");
		
		genero = new ListField(model,"genero");
		genero.setLabel(gt("Género"));
		genero.propertie().add("name","p_genero").add("type","select").add("multiple","false").add("tags","false").add("domain","").add("maxlength","250").add("required","false").add("disabled","false").add("java-type","");
		
		estado_civil = new ListField(model,"estado_civil");
		estado_civil.setLabel(gt("Estado Civil"));
		estado_civil.propertie().add("name","p_estado_civil").add("type","select").add("multiple","false").add("tags","false").add("domain","").add("maxlength","250").add("required","false").add("disabled","false").add("java-type","");
		
		tipo_de_beneficiario = new ListField(model,"tipo_de_beneficiario");
		tipo_de_beneficiario.setLabel(gt("Tipo de Beneficiário"));
		tipo_de_beneficiario.propertie().add("name","p_tipo_de_beneficiario").add("type","select").add("multiple","false").add("tags","false").add("domain","").add("maxlength","250").add("required","false").add("disabled","false").add("java-type","");
		
		email = new EmailField(model,"email");
		email.setLabel(gt("Email"));
		email.propertie().add("name","p_email").add("type","email").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false");
		
		contacto = new NumberField(model,"contacto");
		contacto.setLabel(gt("Contacto"));
		contacto.propertie().add("name","p_contacto").add("type","number").add("min","").add("max","").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false").add("java-type","");
		
		data_do_registo = new DateField(model,"data_do_registo");
		data_do_registo.setLabel(gt("Data do Registo"));
		data_do_registo.propertie().add("name","p_data_do_registo").add("type","date").add("range","false").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false");
		
		id_user = new HiddenField(model,"id_user");
		id_user.setLabel(gt(""));
		id_user.propertie().add("name","p_id_user").add("type","hidden").add("java-type","int").add("maxlength","250").add("tag","id_user");
		

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");

		btn_list = new IGRPButton("List","app_teste","UserForm","list","_self","default|fa-list-ul","","");
		btn_list.propertie.add("type","specific").add("rel","list");

		btn_save = new IGRPButton("Save","app_teste","UserForm","save","submit","primary|fa-save","","");
		btn_save.propertie.add("type","specific").add("rel","save");

		
	}
		
	@Override
	public void render(){
		

		form_1.addField(nome);
		form_1.addField(morada);
		form_1.addField(data_nascimento);
		form_1.addField(genero);
		form_1.addField(estado_civil);
		form_1.addField(tipo_de_beneficiario);
		form_1.addField(email);
		form_1.addField(contacto);
		form_1.addField(data_do_registo);
		form_1.addField(id_user);

		toolsbar_1.addButton(btn_list);
		toolsbar_1.addButton(btn_save);
		this.addToPage(form_1);
		this.addToPage(toolsbar_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		nome.setValue(model);
		morada.setValue(model);
		data_nascimento.setValue(model);
		genero.setValue(model);
		estado_civil.setValue(model);
		tipo_de_beneficiario.setValue(model);
		email.setValue(model);
		contacto.setValue(model);
		data_do_registo.setValue(model);
		id_user.setValue(model);	

		}
}
