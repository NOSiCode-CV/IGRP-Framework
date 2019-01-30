package nosi.webapps.igrp.pages.dominio;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class DominioView extends View {

	public Field sectionheader_1_text;
	public Field lst_dominio;
	public Field description;
	public Field description_desc;
	public Field key;
	public Field key_desc;
	public Field estado;
	public Field estado_desc;
	public Field ordem_desc;
	public Field ordem;
	public Field novo_dominio;
	public IGRPForm sectionheader_1;
	public IGRPForm form_1;
	public IGRPFormList formlist_1;
	public IGRPForm form_2;

	public IGRPButton btn_guardar;
	public IGRPButton btn_novo;

	public DominioView(){

		this.setPageTitle("Gestão de Domínios");
			
		sectionheader_1 = new IGRPForm("sectionheader_1","");

		form_1 = new IGRPForm("form_1","");

		formlist_1 = new IGRPFormList("formlist_1","");

		form_2 = new IGRPForm("form_2","");

		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("Gestão de Domínio"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		lst_dominio = new ListField(model,"lst_dominio");
		lst_dominio.setLabel(gt("Domínio"));
		lst_dominio.propertie().add("name","p_lst_dominio").add("type","select").add("multiple","false").add("tags","false").add("domain","").add("maxlength","250").add("required","false").add("disabled","false").add("java-type","");
		
		description = new TextField(model,"description");
		description.setLabel(gt("Nome"));
		description_desc = new TextField(model,"description_desc");
		description_desc.setLabel(gt("Nome"));
		description.propertie().add("name","p_description").add("type","text").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false").add("desc","true");
		
		key = new TextField(model,"key");
		key.setLabel(gt("Valor"));
		key_desc = new TextField(model,"key_desc");
		key_desc.setLabel(gt("Valor"));
		key.propertie().add("name","p_key").add("type","text").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false").add("desc","true");
		
		estado = new ListField(model,"estado");
		estado.setLabel(gt("Estado"));
		estado_desc = new ListField(model,"estado_desc");
		estado_desc.setLabel(gt("Estado"));
		estado.propertie().add("name","p_estado").add("type","select").add("multiple","false").add("tags","false").add("domain","").add("maxlength","250").add("required","false").add("disabled","false").add("java-type","").add("delimiter",";").add("desc","true");
		
		ordem = new HiddenField(model,"ordem");
		ordem.setLabel(gt(""));
		ordem_desc = new HiddenField(model,"ordem_desc");
		ordem_desc.setLabel(gt(""));
		ordem.propertie().add("name","p_ordem").add("type","hidden").add("maxlength","250").add("java-type","").add("tag","ordem").add("desc","true");
		
		novo_dominio = new TextField(model,"novo_dominio");
		novo_dominio.setLabel(gt("Novo domínio"));
		novo_dominio.propertie().add("name","p_novo_dominio").add("type","text").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false");
		


		btn_guardar = new IGRPButton("Guardar","igrp","Dominio","guardar","submit","warning|fa-pencil","","");
		btn_guardar.propertie.add("type","form").add("rel","guardar");

		btn_novo = new IGRPButton("Novo","igrp","Dominio","novo","submit_form|refresh","success|fa-plus","","");
		btn_novo.propertie.add("type","form").add("rel","novo");

		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		form_1.addField(lst_dominio);

		formlist_1.addField(description);
		formlist_1.addField(description_desc);
		formlist_1.addField(key);
		formlist_1.addField(key_desc);
		formlist_1.addField(estado);
		formlist_1.addField(estado_desc);
		formlist_1.addField(ordem);

		form_2.addField(novo_dominio);

		form_1.addButton(btn_guardar);
		form_2.addButton(btn_novo);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(formlist_1);
		this.addToPage(form_2);
	}
		
	@Override
	public void setModel(Model model) {
		
		lst_dominio.setValue(model);
		description.setValue(model);
		description_desc.setValue(model);
		key.setValue(model);
		key_desc.setValue(model);
		estado.setValue(model);
		estado_desc.setValue(model);
		ordem.setValue(model);
		ordem_desc.setValue(model);
		novo_dominio.setValue(model);	

		formlist_1.loadModel(((Dominio) model).getFormlist_1());
		}
}
