/*-------------------------*/

/*Create View*/

package nosi.webapps.human_resources.pages.orientacaoform;
import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;





public class ORIENTACAOFormView extends View {

	public Field id;
	public Field codigo;
	public Field nome;
	public IGRPForm form_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_list;
	public IGRPButton btn_save;

	public ORIENTACAOFormView(){

		this.setPageTitle("");
			
		form_1 = new IGRPForm("form_1","Registar ORIENTACAO");

		id = new NumberField(model,"id");
		id.setLabel(gt("id"));
		id.propertie().add("name","p_id").add("maxlength","39").add("required","true").add("type","number").add("java-type","String").add("tag","id");
		
		codigo = new TextField(model,"codigo");
		codigo.setLabel(gt("codigo"));
		codigo.propertie().add("name","p_codigo").add("maxlength","20").add("required","false").add("type","text").add("java-type","String");
		
		nome = new TextField(model,"nome");
		nome.setLabel(gt("nome"));
		nome.propertie().add("name","p_nome").add("maxlength","100").add("required","false").add("type","text").add("java-type","String");
		

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");

		btn_list = new IGRPButton("List","human_resources","ORIENTACAOForm","list","_self","default|fa-list","","");
		btn_list.propertie.add("rel","list").add("action-id","71").add("crud_op","list").add("type","specific");

		btn_save = new IGRPButton("Save","human_resources","ORIENTACAOForm","save","submit","primary|fa-save","","");
		btn_save.propertie.add("rel","save").add("action-id","70").add("crud_op","save").add("type","specific");

		
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
/*-------------------------*/
