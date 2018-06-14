
package nosi.webapps.human_resources.pages.colaboradorform;
import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;





public class COLABORADORFormView extends View {

	public Field id;
	public Field codigo;
	public Field nome;
	public Field dt_nasc;
	public Field dt_ini_act;
	public Field id_depart;
	public Field id_equipe;
	public Field id_atrib;
	public IGRPForm form_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_list;
	public IGRPButton btn_save;

	public COLABORADORFormView(){

		this.setPageTitle("Registar Colaborador");
			
		form_1 = new IGRPForm("form_1","Registar COLABORADOR");

		id = new NumberField(model,"id");
		id.setLabel(gt("Id"));
		id.propertie().add("name","p_id").add("type","number").add("maxlength","39").add("required","true").add("java-type","String").add("min","").add("max","");
		
		codigo = new TextField(model,"codigo");
		codigo.setLabel(gt("Codigo"));
		codigo.propertie().add("name","p_codigo").add("type","text").add("maxlength","20").add("required","false");
		
		nome = new TextField(model,"nome");
		nome.setLabel(gt("Nome"));
		nome.propertie().add("name","p_nome").add("type","text").add("maxlength","100").add("required","false");
		
		dt_nasc = new DateField(model,"dt_nasc");
		dt_nasc.setLabel(gt("Data Nascimento"));
		dt_nasc.propertie().add("name","p_dt_nasc").add("type","date").add("range","false").add("maxlength","7").add("required","false");
		
		dt_ini_act = new DateField(model,"dt_ini_act");
		dt_ini_act.setLabel(gt("Data Incio Empresa"));
		dt_ini_act.propertie().add("name","p_dt_ini_act").add("type","date").add("range","false").add("maxlength","7").add("required","false");
		
		id_depart = new ListField(model,"id_depart");
		id_depart.setLabel(gt("Departamento"));
		id_depart.propertie().add("name","p_id_depart").add("type","select").add("maxlength","39").add("java-type","String").add("multiple","false").add("tags","false").add("domain","").add("required","false");
		
		id_equipe = new ListField(model,"id_equipe");
		id_equipe.setLabel(gt("Equipe"));
		id_equipe.propertie().add("name","p_id_equipe").add("type","select").add("maxlength","39").add("java-type","String").add("multiple","false").add("tags","false").add("domain","").add("required","false");
		
		id_atrib = new ListField(model,"id_atrib");
		id_atrib.setLabel(gt("Atribuicao"));
		id_atrib.propertie().add("name","p_id_atrib").add("type","select").add("maxlength","39").add("java-type","String").add("multiple","false").add("tags","false").add("domain","").add("required","false");
		

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");

		btn_list = new IGRPButton("List","human_resources","COLABORADORForm","list","_self","default|fa-list","","");
		btn_list.propertie.add("type","specific").add("rel","list");

		btn_save = new IGRPButton("Save","human_resources","COLABORADORForm","save","submit","primary|fa-save","","");
		btn_save.propertie.add("type","specific").add("rel","save");

		
	}
		
	@Override
	public void render(){
		

		form_1.addField(id);
		form_1.addField(codigo);
		form_1.addField(nome);
		form_1.addField(dt_nasc);
		form_1.addField(dt_ini_act);
		form_1.addField(id_depart);
		form_1.addField(id_equipe);
		form_1.addField(id_atrib);

		toolsbar_1.addButton(btn_list);
		toolsbar_1.addButton(btn_save);
		this.addToPage(form_1);
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

		
	}
}
