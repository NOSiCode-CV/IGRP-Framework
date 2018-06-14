
package nosi.webapps.human_resources.pages.indicadorform;
import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;





public class INDICADORFormView extends View {

	public Field id;
	public Field id_tp_indicador;
	public Field id_atrib;
	public Field codigo;
	public Field nome;
	public Field descricao;
	public Field id_area;
	public IGRPForm form_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_list;
	public IGRPButton btn_save;

	public INDICADORFormView(){

		this.setPageTitle("Registar Indicador");
			
		form_1 = new IGRPForm("form_1","Registar INDICADOR");

		id = new NumberField(model,"id");
		id.setLabel(gt("Id"));
		id.propertie().add("name","p_id").add("type","number").add("maxlength","39").add("required","true").add("java-type","String").add("min","").add("max","");
		
		id_tp_indicador = new ListField(model,"id_tp_indicador");
		id_tp_indicador.setLabel(gt("Tipo Indicador"));
		id_tp_indicador.propertie().add("name","p_id_tp_indicador").add("type","select").add("maxlength","50").add("java-type","String").add("multiple","false").add("tags","false").add("domain","").add("required","false");
		
		id_atrib = new ListField(model,"id_atrib");
		id_atrib.setLabel(gt("Atribuicao"));
		id_atrib.propertie().add("name","p_id_atrib").add("type","select").add("maxlength","50").add("java-type","String").add("multiple","false").add("tags","false").add("domain","").add("required","false");
		
		codigo = new TextField(model,"codigo");
		codigo.setLabel(gt("Codigo"));
		codigo.propertie().add("name","p_codigo").add("type","text").add("maxlength","20").add("required","false");
		
		nome = new TextField(model,"nome");
		nome.setLabel(gt("Nome"));
		nome.propertie().add("name","p_nome").add("type","text").add("maxlength","100").add("required","false");
		
		descricao = new TextField(model,"descricao");
		descricao.setLabel(gt("Descricao"));
		descricao.propertie().add("name","p_descricao").add("type","text").add("maxlength","300").add("required","false");
		
		id_area = new ListField(model,"id_area");
		id_area.setLabel(gt("Area"));
		id_area.propertie().add("name","p_id_area").add("type","select").add("maxlength","39").add("java-type","String").add("multiple","false").add("tags","false").add("domain","").add("required","false");
		

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");

		btn_list = new IGRPButton("List","human_resources","INDICADORForm","list","_self","default|fa-list","","");
		btn_list.propertie.add("type","specific").add("rel","list");

		btn_save = new IGRPButton("Save","human_resources","INDICADORForm","save","submit","primary|fa-save","","");
		btn_save.propertie.add("type","specific").add("rel","save");

		
	}
		
	@Override
	public void render(){
		

		form_1.addField(id);
		form_1.addField(id_tp_indicador);
		form_1.addField(id_atrib);
		form_1.addField(codigo);
		form_1.addField(nome);
		form_1.addField(descricao);
		form_1.addField(id_area);

		toolsbar_1.addButton(btn_list);
		toolsbar_1.addButton(btn_save);
		this.addToPage(form_1);
		this.addToPage(toolsbar_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		id.setValue(model);
		id_tp_indicador.setValue(model);
		id_atrib.setValue(model);
		codigo.setValue(model);
		nome.setValue(model);
		descricao.setValue(model);
		id_area.setValue(model);	

		
	}
}
