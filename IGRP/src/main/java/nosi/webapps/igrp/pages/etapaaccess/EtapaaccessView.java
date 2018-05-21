
package nosi.webapps.igrp.pages.etapaaccess;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;




public class EtapaaccessView extends View {

	public Field sectionheader_1_text;
	public Field id;
	public Field id_check;
	public Field descricao;
	public Field processid;
	public IGRPForm sectionheader_1;
	public IGRPTable table_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_gravar;

	public EtapaaccessView(){

		this.setPageTitle("EtapaAccess");
			
		sectionheader_1 = new IGRPForm("sectionheader_1","");

		table_1 = new IGRPTable("table_1","");

		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("Associar Etapa a Organica/Perfil"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		id = new CheckBoxField(model,"id");
		id.setLabel(gt(""));
		id.propertie().add("name","p_id").add("type","checkbox").add("maxlength","30").add("switch","false").add("check","true").add("desc","true");
		
		id_check = new CheckBoxField(model,"id_check");
		id_check.propertie().add("name","p_id").add("type","checkbox").add("maxlength","30").add("switch","false").add("check","true").add("desc","true");
		
		descricao = new TextField(model,"descricao");
		descricao.setLabel(gt("Descricao"));
		descricao.propertie().add("name","p_descricao").add("type","text").add("maxlength","30");
		
		processid = new HiddenField(model,"processid");
		processid.setLabel(gt(""));
		processid.propertie().add("name","p_processId").add("type","hidden").add("maxlength","30").add("tag","processid");
		

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");

		btn_gravar = new IGRPButton("Gravar","igrp","Etapaaccess","gravar","submit","primary|fa-save","","");
		btn_gravar.propertie.add("type","specific").add("rel","gravar");

		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);


		table_1.addField(id);
		table_1.addField(id_check);
		table_1.addField(descricao);
		table_1.addField(processid);

		toolsbar_1.addButton(btn_gravar);
		this.addToPage(sectionheader_1);
		this.addToPage(table_1);
		this.addToPage(toolsbar_1);
	}
		
	public void setModel(Etapaaccess model) {
		
		id.setValue(model);
		descricao.setValue(model);
		processid.setValue(model);	

		table_1.loadModel(model.getTable_1());
		
	}
}
