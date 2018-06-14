
package nosi.webapps.human_resources.pages.tipo_indicadorlist;
import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;





public class TIPO_INDICADORListView extends View {

	public Field id;
	public Field codigo;
	public Field nome;
	public IGRPTable table_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_new;
	public IGRPButton btn_update;
	public IGRPButton btn_delete;

	public TIPO_INDICADORListView(){

		this.setPageTitle("Listar TIPO_INDICADOR");
			
		table_1 = new IGRPTable("table_1","Listar TIPO_INDICADOR");

		id = new NumberField(model,"id");
		id.setLabel(gt("Id"));
		id.propertie().add("name","p_id").add("type","number").add("maxlength","39").add("min","").add("max","").add("total_footer","false");
		
		codigo = new TextField(model,"codigo");
		codigo.setLabel(gt("Codigo"));
		codigo.propertie().add("name","p_codigo").add("type","text").add("maxlength","20");
		
		nome = new TextField(model,"nome");
		nome.setLabel(gt("Nome"));
		nome.propertie().add("name","p_nome").add("type","text").add("maxlength","20");
		

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");

		btn_new = new IGRPButton("New","human_resources","TIPO_INDICADORList","new","modal|refresh","success|fa-plus","","");
		btn_new.propertie.add("type","specific").add("rel","new");

		btn_update = new IGRPButton("Update","human_resources","TIPO_INDICADORList","update","mpsubmit|refresh","warning|fa-pencil","","");
		btn_update.propertie.add("type","specific").add("rel","update");

		btn_delete = new IGRPButton("Delete","human_resources","TIPO_INDICADORList","delete","confirm","danger|fa-trash","","");
		btn_delete.propertie.add("type","specific").add("rel","delete");

		
	}
		
	@Override
	public void render(){
		

		table_1.addField(id);
		table_1.addField(codigo);
		table_1.addField(nome);

		toolsbar_1.addButton(btn_new);
		table_1.addButton(btn_update);
		table_1.addButton(btn_delete);
		this.addToPage(table_1);
		this.addToPage(toolsbar_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		id.setValue(model);
		codigo.setValue(model);
		nome.setValue(model);	

		table_1.loadModel(((TIPO_INDICADORList) model).getTable_1());
		
	}
}
