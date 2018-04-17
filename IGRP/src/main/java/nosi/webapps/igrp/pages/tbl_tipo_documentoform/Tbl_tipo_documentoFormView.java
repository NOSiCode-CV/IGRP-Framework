
package nosi.webapps.igrp.pages.tbl_tipo_documentoform;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;
import nosi.core.webapp.Model;
import java.sql.Date;
import nosi.core.config.Config;
import java.util.Map;
import java.util.HashMap;

public class Tbl_tipo_documentoFormView extends View {
	
	
	public Field env_fk;
	public Field codigo;
	public Field descricao;
	public Field nome;
	public Field status;
	public Field id;
	public IGRPForm form_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_list;
	public IGRPButton btn_save;
	public Tbl_tipo_documentoFormView(){

		this.setPageTitle("Registar tbl_tipo_documento");
			
		form_1 = new IGRPForm("form_1","Registar Tipo de Documento");
		env_fk = new ListField(model,"env_fk");
		env_fk.setLabel(gt("Aplicação"));
		env_fk.propertie().add("name","p_env_fk").add("type","select").add("maxlength","11").add("required","true").add("java-type","int").add("multiple","false").add("domain","");
		
		codigo = new TextField(model,"codigo");
		codigo.setLabel(gt("Codigo"));
		codigo.propertie().add("name","p_codigo").add("type","text").add("maxlength","50").add("required","false");
		
		descricao = new TextField(model,"descricao");
		descricao.setLabel(gt("Descricao"));
		descricao.propertie().add("name","p_descricao").add("type","text").add("maxlength","500").add("required","false");
		
		nome = new TextField(model,"nome");
		nome.setLabel(gt("Nome"));
		nome.propertie().add("name","p_nome").add("type","text").add("maxlength","100").add("required","true");
		
		status = new NumberField(model,"status");
		status.setLabel(gt("Status"));
		status.propertie().add("name","p_status").add("type","number").add("maxlength","11").add("required","true").add("java-type","int").add("min","").add("max","");
		
		id = new HiddenField(model,"id");
		id.setLabel(gt(""));
		id.propertie().add("name","p_id").add("type","hidden").add("java-type","int").add("maxlength","30").add("tag","id");
		

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");

		btn_list = new IGRPButton("List","igrp","Tbl_tipo_documentoForm","list","_self","default|fa-list","","");
		btn_list.propertie.add("type","specific").add("rel","list");

		btn_save = new IGRPButton("Save","igrp","Tbl_tipo_documentoForm","save","submit","primary|fa-save","","");
		btn_save.propertie.add("type","specific").add("rel","save");
		
	}
		
	@Override
	public void render(){
		

		form_1.addField(env_fk);
		form_1.addField(codigo);
		form_1.addField(descricao);
		form_1.addField(nome);
		form_1.addField(status);
		form_1.addField(id);

		toolsbar_1.addButton(btn_list);
		toolsbar_1.addButton(btn_save);
		this.addToPage(form_1);
		this.addToPage(toolsbar_1);
	}
		
	public void setModel(Tbl_tipo_documentoForm model) {
		
		env_fk.setValue(model);
		codigo.setValue(model);
		descricao.setValue(model);
		nome.setValue(model);
		status.setValue(model);
		id.setValue(model);	

		
	}
}
