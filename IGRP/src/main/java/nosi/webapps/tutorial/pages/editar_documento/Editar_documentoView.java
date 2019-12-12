package nosi.webapps.tutorial.pages.editar_documento;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class Editar_documentoView extends View {

	public Field titulo;
	public Field tipo;
	public Field relacionados;
	public Field data;
	public Field id_doc;
	public IGRPTable table_1;

	public IGRPButton btn_editar;
	public IGRPButton btn_eliminar;

	public Editar_documentoView(){

		this.setPageTitle("Editar Documento");
			
		table_1 = new IGRPTable("table_1","");

		titulo = new TextField(model,"titulo");
		titulo.setLabel(gt("Titulo"));
		titulo.propertie().add("name","p_titulo").add("type","text").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		tipo = new TextField(model,"tipo");
		tipo.setLabel(gt("Tipo"));
		tipo.propertie().add("name","p_tipo").add("type","text").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		relacionados = new TextField(model,"relacionados");
		relacionados.setLabel(gt("Relacionados"));
		relacionados.propertie().add("name","p_relacionados").add("type","text").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		data = new TextField(model,"data");
		data.setLabel(gt("Data"));
		data.propertie().add("name","p_data").add("type","text").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		id_doc = new HiddenField(model,"id_doc");
		id_doc.setLabel(gt(""));
		id_doc.propertie().add("name","p_id_doc").add("type","hidden").add("maxlength","30").add("showLabel","true").add("group_in","").add("java-type","").add("tag","id_doc");
		


		btn_editar = new IGRPButton("Editar","tutorial","Editar_documento","editar","mpsubmit","warning|fa-pencil","","");
		btn_editar.propertie.add("type","specific").add("class","warning").add("rel","editar").add("refresh_components","");

		btn_eliminar = new IGRPButton("Eliminar","tutorial","Editar_documento","eliminar","confirm","danger|fa-times-circle-o","","");
		btn_eliminar.propertie.add("type","specific").add("class","danger").add("rel","eliminar").add("refresh_components","");

		
	}
		
	@Override
	public void render(){
		
		table_1.addField(titulo);
		table_1.addField(tipo);
		table_1.addField(relacionados);
		table_1.addField(data);
		table_1.addField(id_doc);

		table_1.addButton(btn_editar);
		table_1.addButton(btn_eliminar);
		this.addToPage(table_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		titulo.setValue(model);
		tipo.setValue(model);
		relacionados.setValue(model);
		data.setValue(model);
		id_doc.setValue(model);	

		table_1.loadModel(((Editar_documento) model).getTable_1());
		}
}
