
package nosi.webapps.human_resources.pages.colaboradorlist;
import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;





public class COLABORADORListView extends View {

	public Field id;
	public Field codigo;
	public Field nome;
	public Field dt_nasc;
	public Field dt_ini_act;
	public Field id_depart;
	public Field id_equipe;
	public Field id_atrib;
	public IGRPTable table_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_new;
	public IGRPButton btn_update;
	public IGRPButton btn_delete;

	public COLABORADORListView(){

		this.setPageTitle("Listar Colaborador");
			
		table_1 = new IGRPTable("table_1","Listar COLABORADOR");

		id = new NumberField(model,"id");
		id.setLabel(gt("Id"));
		id.propertie().add("name","p_id").add("type","number").add("maxlength","39").add("total_footer","false").add("min","").add("max","");
		
		codigo = new TextField(model,"codigo");
		codigo.setLabel(gt("Codigo"));
		codigo.propertie().add("name","p_codigo").add("type","text").add("maxlength","20");
		
		nome = new TextField(model,"nome");
		nome.setLabel(gt("Nome"));
		nome.propertie().add("name","p_nome").add("type","text").add("maxlength","100");
		
		dt_nasc = new DateField(model,"dt_nasc");
		dt_nasc.setLabel(gt("Data Nascimento"));
		dt_nasc.propertie().add("name","p_dt_nasc").add("type","date").add("range","false").add("maxlength","7");
		
		dt_ini_act = new DateField(model,"dt_ini_act");
		dt_ini_act.setLabel(gt("Data Inicio Empresa"));
		dt_ini_act.propertie().add("name","p_dt_ini_act").add("type","date").add("range","false").add("maxlength","7");
		
		id_depart = new TextField(model,"id_depart");
		id_depart.setLabel(gt("Departamento"));
		id_depart.propertie().add("name","p_id_depart").add("type","text").add("maxlength","50");
		
		id_equipe = new TextField(model,"id_equipe");
		id_equipe.setLabel(gt("Equipe"));
		id_equipe.propertie().add("name","p_id_equipe").add("type","text").add("maxlength","50");
		
		id_atrib = new TextField(model,"id_atrib");
		id_atrib.setLabel(gt("Atribuicao"));
		id_atrib.propertie().add("name","p_id_atrib").add("type","text").add("maxlength","50");
		

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");

		btn_new = new IGRPButton("New","human_resources","COLABORADORList","new","modal|refresh","success|fa-plus","","");
		btn_new.propertie.add("type","specific").add("rel","new");

		btn_update = new IGRPButton("Update","human_resources","COLABORADORList","update","mpsubmit|refresh","warning|fa-pencil","","");
		btn_update.propertie.add("type","specific").add("rel","update");

		btn_delete = new IGRPButton("Delete","human_resources","COLABORADORList","delete","confirm","danger|fa-trash","","");
		btn_delete.propertie.add("type","specific").add("rel","delete");

		
	}
		
	@Override
	public void render(){
		

		table_1.addField(id);
		table_1.addField(codigo);
		table_1.addField(nome);
		table_1.addField(dt_nasc);
		table_1.addField(dt_ini_act);
		table_1.addField(id_depart);
		table_1.addField(id_equipe);
		table_1.addField(id_atrib);

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
		dt_nasc.setValue(model);
		dt_ini_act.setValue(model);
		id_depart.setValue(model);
		id_equipe.setValue(model);
		id_atrib.setValue(model);	

		table_1.loadModel(((COLABORADORList) model).getTable_1());
		
	}
}
