
package nosi.webapps.igrp.pages.novodominio;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;
import nosi.core.webapp.Model;import java.sql.Date;
import nosi.core.config.Config;
import java.util.Map;
import java.util.HashMap;

public class NovoDominioView extends View {
	
	
	public Field sectionheader_1_text;
	public Field dominio;
	public Field valor;
	public Field description;
	public Field estado;
	public Field ordem;
	public Field p_id;
	public IGRPForm sectionheader_1;
	public IGRPForm form_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_gravar;
	public IGRPButton btn_lista_dominios;
	public NovoDominioView(){

		this.setPageTitle("Registar Dominio");
			
		sectionheader_1 = new IGRPForm("sectionheader_1","");
		form_1 = new IGRPForm("form_1","");
		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("Gestão de Dominio - Novo"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		dominio = new TextField(model,"dominio");
		dominio.setLabel(gt("Domínio"));
		dominio.propertie().add("name","p_dominio").add("type","text").add("maxlength","30").add("required","true");
		
		valor = new TextField(model,"valor");
		valor.setLabel(gt("Valor"));
		valor.propertie().add("name","p_valor").add("type","text").add("maxlength","30").add("required","true");
		
		description = new TextField(model,"description");
		description.setLabel(gt("Significado"));
		description.propertie().add("name","p_description").add("type","text").add("maxlength","30").add("required","true");
		
		estado = new ListField(model,"estado");
		estado.setLabel(gt("Estado"));
		estado.propertie().add("name","p_estado").add("type","select").add("multiple","false").add("maxlength","30").add("required","false").add("domain","SIN_NAO").add("java-type","");
		
		ordem = new NumberField(model,"ordem");
		ordem.setLabel(gt("Ordem"));
		ordem.propertie().add("name","p_ordem").add("type","number").add("min","0").add("max","20").add("maxlength","30").add("required","false").add("java-type","int");
		
		p_id = new HiddenField(model,"p_id");
		p_id.setLabel(gt(""));
		p_id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("java-type","int").add("tag","id");
		

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");

		btn_gravar = new IGRPButton("Gravar","igrp","NovoDominio","gravar","submit_form","primary|fa-save","","");
		btn_gravar.propertie.add("type","specific").add("rel","gravar");

		btn_lista_dominios = new IGRPButton("Lista Domínios","igrp","NovoDominio","lista_dominios","_self","default|fa-list","","");
		btn_lista_dominios.propertie.add("type","specific").add("rel","lista_dominios");
		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);


		form_1.addField(dominio);
		form_1.addField(valor);
		form_1.addField(description);
		form_1.addField(estado);
		form_1.addField(ordem);
		form_1.addField(p_id);

		toolsbar_1.addButton(btn_gravar);
		toolsbar_1.addButton(btn_lista_dominios);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(toolsbar_1);
	}
		
	public void setModel(NovoDominio model) {
		
		dominio.setValue(model);

		valor.setValue(model);

		description.setValue(model);

		estado.setValue(model);

		ordem.setValue(model);

		p_id.setValue(model);
	
	}
}
