
package nosi.webapps.igrp.pages.dominio;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class DominioView extends View {
	
	
	public Field sectionheader_1_text;
	public Field dominio;
	public Field description;
	public Field valor;
	public Field estado;
	public Field ordem;
	public Field p_id;
	public IGRPForm sectionheader_1;
	public IGRPTable table_1;

	public IGRPToolsBar toolsbar_2;
	public IGRPButton btn_novo;
	public IGRPButton btn_editar;
	public IGRPButton btn_desativar;
	public DominioView(){

		this.setPageTitle("Gestão de Dominio");
			
		sectionheader_1 = new IGRPForm("sectionheader_1","");
		table_1 = new IGRPTable("table_1","Lista de Domínios");
		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("Getão de Domínio"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		dominio = new TextField(model,"dominio");
		dominio.setLabel(gt("Domínio"));
		dominio.propertie().add("name","p_dominio").add("type","text").add("maxlength","30");
		
		description = new TextField(model,"description");
		description.setLabel(gt("Significado"));
		description.propertie().add("name","p_description").add("type","text").add("maxlength","30");
		
		valor = new TextField(model,"valor");
		valor.setLabel(gt("Valor"));
		valor.propertie().add("name","p_valor").add("type","text").add("maxlength","30");
		
		estado = new TextField(model,"estado");
		estado.setLabel(gt("Estado"));
		estado.propertie().add("name","p_estado").add("type","text").add("maxlength","30");
		
		ordem = new NumberField(model,"ordem");
		ordem.setLabel(gt("Ordem"));
		ordem.propertie().add("name","p_ordem").add("type","number").add("min","").add("max","").add("maxlength","30").add("total_footer","false");
		
		p_id = new HiddenField(model,"p_id");
		p_id.setLabel(gt(""));
		p_id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("tag","id");
		

		toolsbar_2 = new IGRPToolsBar("toolsbar_2");

		btn_novo = new IGRPButton("Novo","igrp","Dominio","novo","_self","success|fa-plus-circle","","");
		btn_novo.propertie.add("type","specific").add("rel","novo");

		btn_editar = new IGRPButton("Editar","igrp","Dominio","editar","mpsubmit|refresh","warning|fa-pencil","","");
		btn_editar.propertie.add("type","specific").add("rel","editar");

		btn_desativar = new IGRPButton("Desativar","igrp","Dominio","desativar","confirm","primary|fa-lock","","");
		btn_desativar.propertie.add("type","specific").add("rel","desativar");
		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);


		table_1.addField(dominio);
		table_1.addField(description);
		table_1.addField(valor);
		table_1.addField(estado);
		table_1.addField(ordem);
		table_1.addField(p_id);

		toolsbar_2.addButton(btn_novo);
		table_1.addButton(btn_editar);
		table_1.addButton(btn_desativar);
		this.addToPage(sectionheader_1);
		this.addToPage(table_1);
		this.addToPage(toolsbar_2);
	}
		
	public void setModel(Dominio model) {
		
		dominio.setValue(model);

		description.setValue(model);

		valor.setValue(model);

		estado.setValue(model);

		ordem.setValue(model);

		p_id.setValue(model);
	
		table_1.loadModel(model.getTable_1());

	}
}
