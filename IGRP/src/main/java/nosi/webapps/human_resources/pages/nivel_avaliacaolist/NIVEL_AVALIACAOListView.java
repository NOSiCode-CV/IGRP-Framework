/*-------------------------*/

/*Create View*/

package nosi.webapps.human_resources.pages.nivel_avaliacaolist;
import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;





public class NIVEL_AVALIACAOListView extends View {

	public Field id;
	public Field codigo;
	public Field nivel;
	public Field descricao;
	public Field cor;
	public IGRPTable table_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_new;
	public IGRPButton btn_update;
	public IGRPButton btn_delete;

	public NIVEL_AVALIACAOListView(){

		this.setPageTitle("");
			
		table_1 = new IGRPTable("table_1","Listar NIVEL_AVALIACAO");

		id = new NumberField(model,"id");
		id.setLabel(gt("id"));
		id.propertie().add("name","p_id").add("maxlength","39").add("required","true").add("type","number").add("java-type","String").add("tag","id");
		
		codigo = new TextField(model,"codigo");
		codigo.setLabel(gt("codigo"));
		codigo.propertie().add("name","p_codigo").add("maxlength","20").add("required","false").add("type","text").add("java-type","String");
		
		nivel = new TextField(model,"nivel");
		nivel.setLabel(gt("nivel"));
		nivel.propertie().add("name","p_nivel").add("maxlength","20").add("required","false").add("type","text").add("java-type","String");
		
		descricao = new TextField(model,"descricao");
		descricao.setLabel(gt("descricao"));
		descricao.propertie().add("name","p_descricao").add("maxlength","300").add("required","false").add("type","text").add("java-type","String");
		
		cor = new TextField(model,"cor");
		cor.setLabel(gt("cor"));
		cor.propertie().add("name","p_cor").add("maxlength","20").add("required","false").add("type","text").add("java-type","String");
		

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");

		btn_new = new IGRPButton("New","human_resources","NIVEL_AVALIACAOList","new","modal|refresh","success|fa-plus","","");
		btn_new.propertie.add("rel","new").add("action-id","68").add("crud_op","addNew").add("type","specific");

		btn_update = new IGRPButton("Update","human_resources","NIVEL_AVALIACAOList","update","mpsubmit|refresh","warning|fa-pencil","","");
		btn_update.propertie.add("rel","update").add("action-id","68").add("crud_op","edit").add("type","form");

		btn_delete = new IGRPButton("Delete","human_resources","NIVEL_AVALIACAOList","delete","confirm","danger|fa-trash","","");
		btn_delete.propertie.add("rel","delete").add("action-id","69").add("crud_op","delete").add("type","form");

		
	}
		
	@Override
	public void render(){
		

		table_1.addField(id);
		table_1.addField(codigo);
		table_1.addField(nivel);
		table_1.addField(descricao);
		table_1.addField(cor);

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
		nivel.setValue(model);
		descricao.setValue(model);
		cor.setValue(model);	

		table_1.loadModel(((NIVEL_AVALIACAOList) model).getTable_1());
		
	}
}
/*-------------------------*/
