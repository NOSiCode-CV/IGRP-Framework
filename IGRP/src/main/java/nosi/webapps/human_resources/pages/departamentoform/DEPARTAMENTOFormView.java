
package nosi.webapps.human_resources.pages.departamentoform;
import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;





public class DEPARTAMENTOFormView extends View {

	public Field id;
	public Field codigo;
	public Field nome;
	public IGRPForm form_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_list;
	public IGRPButton btn_save;

	public DEPARTAMENTOFormView(){

		this.setPageTitle("Registar DEPARTAMENTO");
			
		form_1 = new IGRPForm("form_1","Registar DEPARTAMENTO");

		id = new NumberField(model,"id");
		id.setLabel(gt("Id"));
		id.propertie().add("name","p_id").add("type","number").add("maxlength","39").add("required","true").add("java-type","String").add("min","").add("max","");
		
		codigo = new TextField(model,"codigo");
		codigo.setLabel(gt("Codigo"));
		codigo.propertie().add("name","p_codigo").add("type","text").add("maxlength","20").add("required","false");
		
		nome = new TextField(model,"nome");
		nome.setLabel(gt("Nome"));
		nome.propertie().add("name","p_nome").add("type","text").add("maxlength","100").add("required","false");
		

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");

		btn_list = new IGRPButton("List","human_resources","DEPARTAMENTOForm","list","_self","default|fa-list","","");
		btn_list.propertie.add("type","specific").add("rel","list");

		btn_save = new IGRPButton("Save","human_resources","DEPARTAMENTOForm","save","submit","primary|fa-save","","");
		btn_save.propertie.add("type","specific").add("rel","save");

		
	}
		
	@Override
	public void render(){
		

		form_1.addField(id);
		form_1.addField(codigo);
		form_1.addField(nome);

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

		
	}
}
