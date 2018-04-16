
package nosi.webapps.igrp.pages.tbl_tipo_documentolist;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;
import nosi.core.webapp.Model;
import java.sql.Date;
import nosi.core.config.Config;
import java.util.Map;
import java.util.HashMap;

public class Tbl_tipo_documentoListView extends View {
	
	
	public Field id;
	public Field codigo;
	public Field descricao;
	public Field nome;
	public Field status;
	public Field tipo;
	public Field env_fk;
	public IGRPTable table_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_new;
	public IGRPButton btn_update;
	public IGRPButton btn_delete;
	public Tbl_tipo_documentoListView(){

		this.setPageTitle("Listar tbl_tipo_documento");
			
		table_1 = new IGRPTable("table_1","Listar Tipo Documento");
		id = new HiddenField(model,"id");
		id.setLabel(gt(""));
		id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("tag","id");
		
		codigo = new TextField(model,"codigo");
		codigo.setLabel(gt("Codigo"));
		codigo.propertie().add("name","p_codigo").add("type","text").add("maxlength","50");
		
		descricao = new TextField(model,"descricao");
		descricao.setLabel(gt("Descricao"));
		descricao.propertie().add("name","p_descricao").add("type","text").add("maxlength","500");
		
		nome = new TextField(model,"nome");
		nome.setLabel(gt("Nome"));
		nome.propertie().add("name","p_nome").add("type","text").add("maxlength","100");
		
		status = new NumberField(model,"status");
		status.setLabel(gt("Status"));
		status.propertie().add("name","p_status").add("type","number").add("maxlength","11").add("total_footer","false");
		
		tipo = new TextField(model,"tipo");
		tipo.setLabel(gt("Tipo"));
		tipo.propertie().add("name","p_tipo").add("type","text").add("maxlength","20");
		
		env_fk = new TextField(model,"env_fk");
		env_fk.setLabel(gt("Aplicação"));
		env_fk.propertie().add("name","p_env_fk").add("type","text").add("maxlength","11");
		

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");

		btn_new = new IGRPButton("New","igrp","Tbl_tipo_documentoList","new","modal|refresh","success|fa-plus","","");
		btn_new.propertie.add("type","specific").add("rel","new");

		btn_update = new IGRPButton("Update","igrp","Tbl_tipo_documentoList","update","mpsubmit|refresh","warning|fa-pencil","","");
		btn_update.propertie.add("type","specific").add("rel","update");

		btn_delete = new IGRPButton("Delete","igrp","Tbl_tipo_documentoList","delete","confirm","danger|fa-trash","","");
		btn_delete.propertie.add("type","specific").add("rel","delete");
		
	}
		
	@Override
	public void render(){
		

		table_1.addField(id);
		table_1.addField(codigo);
		table_1.addField(descricao);
		table_1.addField(nome);
		table_1.addField(status);
		table_1.addField(tipo);
		table_1.addField(env_fk);

		toolsbar_1.addButton(btn_new);
		table_1.addButton(btn_update);
		table_1.addButton(btn_delete);
		this.addToPage(table_1);
		this.addToPage(toolsbar_1);
	}
		
	public void setModel(Tbl_tipo_documentoList model) {
		
		id.setValue(model);
		codigo.setValue(model);
		descricao.setValue(model);
		nome.setValue(model);
		status.setValue(model);
		tipo.setValue(model);
		env_fk.setValue(model);	

		table_1.loadModel(model.getTable_1());
		
	}
}
