package nosi.webapps.igrp.pages.proforgmapper;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;
import nosi.core.webapp.Core;

public class ProforgmapperView extends View {

	public Field sectionheader_1_text;
	public Field aplicacao_origem;
	public Field aplicacao_destino;
	public Field tipo;
	public Field perfilorganica_origem;
	public Field perfilorganica_destino;
	public IGRPSectionHeader sectionheader_1;
	public IGRPForm form_1;
	public IGRPFormList formlist_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_guardar;
	public IGRPButton btn_pesquisar;

	public ProforgmapperView(){

		this.setPageTitle("ProfOrgMapper");
			
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1","");

		form_1 = new IGRPForm("form_1","");

		formlist_1 = new IGRPFormList("formlist_1","");

		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("<p>Mapeamento Perfil/Org&acirc;nica</p>"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		aplicacao_origem = new ListField(model,"aplicacao_origem");
		aplicacao_origem.setLabel(gt("Aplicação origem"));
		aplicacao_origem.propertie().add("remote",Core.getIGRPLink("igrp","Proforgmapper","AppOrigemDestino")).add("name","p_aplicacao_origem").add("type","select").add("multiple","false").add("tags","false").add("domain","").add("maxlength","250").add("required","true").add("disabled","false").add("java-type","");
		
		aplicacao_destino = new ListField(model,"aplicacao_destino");
		aplicacao_destino.setLabel(gt("Aplicação destino"));
		aplicacao_destino.propertie().add("name","p_aplicacao_destino").add("type","select").add("multiple","false").add("tags","false").add("domain","").add("maxlength","250").add("required","true").add("disabled","false").add("java-type","");
		
		tipo = new ListField(model,"tipo");
		tipo.setLabel(gt("Tipo"));
		tipo.propertie().add("name","p_tipo").add("type","select").add("multiple","false").add("tags","false").add("domain","").add("maxlength","250").add("required","true").add("disabled","false").add("java-type","");
		
		perfilorganica_origem = new TextField(model,"perfilorganica_origem");
		perfilorganica_origem.setLabel(gt("Código (Origem)"));
		perfilorganica_origem.propertie().add("name","p_perfilorganica_origem").add("type","text").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false").add("placeholder",gt("")).add("desc","true");
		
		perfilorganica_destino = new TextField(model,"perfilorganica_destino");
		perfilorganica_destino.setLabel(gt("Código (Destino)"));
		perfilorganica_destino.propertie().add("name","p_perfilorganica_destino").add("type","text").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false").add("placeholder",gt("")).add("desc","true");
		

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");

		btn_guardar = new IGRPButton("Guardar","igrp","Proforgmapper","guardar","submit","success|fa-save","","");
		btn_guardar.propertie.add("type","specific").add("rel","guardar").add("refresh_components","");

		btn_pesquisar = new IGRPButton("Pesquisar","igrp","Proforgmapper","pesquisar","submit","primary|fa-search","","");
		btn_pesquisar.propertie.add("id","button_e2d6_5950").add("type","form").add("class","primary").add("rel","pesquisar").add("refresh_components","");

		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		form_1.addField(aplicacao_origem);
		form_1.addField(aplicacao_destino);
		form_1.addField(tipo);


		formlist_1.addField(perfilorganica_origem);
		formlist_1.addField(perfilorganica_destino);

		toolsbar_1.addButton(btn_guardar);
		form_1.addButton(btn_pesquisar);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(formlist_1);
		this.addToPage(toolsbar_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		aplicacao_origem.setValue(model);
		aplicacao_destino.setValue(model);
		tipo.setValue(model);
		perfilorganica_origem.setValue(model);
		perfilorganica_destino.setValue(model);	

		formlist_1.loadModel(((Proforgmapper) model).getFormlist_1());
		}
}
