package nosi.webapps.igrp.pages.dominio;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class DominioView extends View {

	public Field sectionheader_1_text;
	public Field aplicacao;
	public Field lst_dominio;
	public Field description;
	public Field key;
	public Field estado;
	public Field ordem_desc;
	public Field ordem;
	public Field novo_dominio;
	public Field publico;
	public Field publico_check;
	public IGRPForm sectionheader_1;
	public IGRPForm form_1;
	public IGRPFormList formlist_1;
	public IGRPForm form_2;

	public IGRPButton btn_guardar_item_domain;
	public IGRPButton btn_gravar_domain;

	public DominioView(){

		this.setPageTitle("Gestão de Domínios");
			
		sectionheader_1 = new IGRPForm("sectionheader_1","");

		form_1 = new IGRPForm("form_1","");

		formlist_1 = new IGRPFormList("formlist_1","");

		form_2 = new IGRPForm("form_2","Criar novo domínio");

		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("Gestão de Domínio"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		aplicacao = new ListField(model,"aplicacao");
		aplicacao.setLabel(gt("Aplicação"));
		aplicacao.propertie().add("name","p_aplicacao").add("type","select").add("multiple","false").add("tags","false").add("domain","").add("maxlength","250").add("required","true").add("disabled","false").add("java-type","Integer");
		
		lst_dominio = new ListField(model,"lst_dominio");
		lst_dominio.setLabel(gt("Domínio"));
		lst_dominio.propertie().add("name","p_lst_dominio").add("type","select").add("multiple","false").add("tags","false").add("domain","").add("maxlength","250").add("required","false").add("disabled","false").add("java-type","");
		
		description = new TextField(model,"description");
		description.setLabel(gt("Nome"));
		description.propertie().add("name","p_description").add("type","text").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false").add("desc","true");
		
		key = new TextField(model,"key");
		key.setLabel(gt("Valor"));
		key.propertie().add("name","p_key").add("type","text").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false").add("desc","true");
		
		estado = new ListField(model,"estado");
		estado.setLabel(gt("Estado"));
		estado.propertie().add("name","p_estado").add("type","select").add("multiple","false").add("tags","false").add("domain","").add("maxlength","250").add("required","false").add("disabled","false").add("java-type","").add("delimiter",";").add("desc","true");
		
		ordem = new HiddenField(model,"ordem");
		ordem.setLabel(gt(""));
		ordem.propertie().add("name","p_ordem").add("type","hidden").add("maxlength","250").add("java-type","").add("tag","ordem").add("desc","true");
		
		novo_dominio = new TextField(model,"novo_dominio");
		novo_dominio.setLabel(gt("Novo domínio"));
		novo_dominio.propertie().add("name","p_novo_dominio").add("type","text").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false");
		
		publico = new CheckBoxField(model,"publico");
		publico.setLabel(gt("Publico?"));
		publico.propertie().add("name","p_publico").add("type","checkbox").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false").add("java-type","int").add("switch","false").add("check","true");
		


		btn_guardar_item_domain = new IGRPButton("Guardar","igrp","Dominio","guardar_item_domain","submit_ajax","primary|fa-save","","");
		btn_guardar_item_domain.propertie.add("type","form").add("rel","guardar_item_domain");

		btn_gravar_domain = new IGRPButton("Save","igrp","Dominio","gravar_domain","submit_form|refresh","primary|fa-save","","");
		btn_gravar_domain.propertie.add("type","form").add("rel","gravar_domain");

		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		form_1.addField(aplicacao);
		form_1.addField(lst_dominio);

		formlist_1.addField(description);
		formlist_1.addField(key);
		formlist_1.addField(estado);
		formlist_1.addField(ordem);

		form_2.addField(novo_dominio);
		form_2.addField(publico);

		form_1.addButton(btn_guardar_item_domain);
		form_2.addButton(btn_gravar_domain);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(formlist_1);
		this.addToPage(form_2);
	}
		
	@Override
	public void setModel(Model model) {
		
		aplicacao.setValue(model);
		lst_dominio.setValue(model);
		description.setValue(model);
		key.setValue(model);
		estado.setValue(model);
		ordem.setValue(model);
		novo_dominio.setValue(model);
		publico.setValue(model);	

		formlist_1.loadModel(((Dominio) model).getFormlist_1());
		}
}
