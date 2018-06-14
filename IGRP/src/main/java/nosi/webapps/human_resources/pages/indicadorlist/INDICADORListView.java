
package nosi.webapps.human_resources.pages.indicadorlist;
import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;





public class INDICADORListView extends View {

	public Field id_tp_indicador;
	public Field id_atrib;
	public Field codigo;
	public Field nome;
	public Field descricao;
	public Field id_area;
	public Field id;
	public IGRPTable table_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_new;
	public IGRPButton btn_update;
	public IGRPButton btn_delete;

	public INDICADORListView(){

		this.setPageTitle("Listar Indicador");
			
		table_1 = new IGRPTable("table_1","Listar INDICADOR");

		id_tp_indicador = new TextField(model,"id_tp_indicador");
		id_tp_indicador.setLabel(gt("Tipo Indicador"));
		id_tp_indicador.propertie().add("name","p_id_tp_indicador").add("type","text").add("maxlength","60");
		
		id_atrib = new TextField(model,"id_atrib");
		id_atrib.setLabel(gt("Atribuicao"));
		id_atrib.propertie().add("name","p_id_atrib").add("type","text").add("maxlength","50");
		
		codigo = new TextField(model,"codigo");
		codigo.setLabel(gt("Codigo"));
		codigo.propertie().add("name","p_codigo").add("type","text").add("maxlength","20");
		
		nome = new TextField(model,"nome");
		nome.setLabel(gt("Nome"));
		nome.propertie().add("name","p_nome").add("type","text").add("maxlength","100");
		
		descricao = new TextField(model,"descricao");
		descricao.setLabel(gt("Descricao"));
		descricao.propertie().add("name","p_descricao").add("type","text").add("maxlength","300");
		
		id_area = new TextField(model,"id_area");
		id_area.setLabel(gt("Area"));
		id_area.propertie().add("name","p_id_area").add("type","text").add("maxlength","50");
		
		id = new HiddenField(model,"id");
		id.setLabel(gt(""));
		id.propertie().add("name","p_id").add("type","hidden").add("maxlength","39").add("tag","id");
		

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");

		btn_new = new IGRPButton("New","human_resources","INDICADORList","new","modal|refresh","success|fa-plus","","");
		btn_new.propertie.add("type","specific").add("rel","new");

		btn_update = new IGRPButton("Update","human_resources","INDICADORList","update","mpsubmit|refresh","warning|fa-pencil","","");
		btn_update.propertie.add("type","specific").add("rel","update");

		btn_delete = new IGRPButton("Delete","human_resources","INDICADORList","delete","confirm","danger|fa-trash","","");
		btn_delete.propertie.add("type","specific").add("rel","delete");

		
	}
		
	@Override
	public void render(){
		

		table_1.addField(id_tp_indicador);
		table_1.addField(id_atrib);
		table_1.addField(codigo);
		table_1.addField(nome);
		table_1.addField(descricao);
		table_1.addField(id_area);
		table_1.addField(id);

		toolsbar_1.addButton(btn_new);
		table_1.addButton(btn_update);
		table_1.addButton(btn_delete);
		this.addToPage(table_1);
		this.addToPage(toolsbar_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		id_tp_indicador.setValue(model);
		id_atrib.setValue(model);
		codigo.setValue(model);
		nome.setValue(model);
		descricao.setValue(model);
		id_area.setValue(model);
		id.setValue(model);	

		table_1.loadModel(((INDICADORList) model).getTable_1());
		
	}
}
