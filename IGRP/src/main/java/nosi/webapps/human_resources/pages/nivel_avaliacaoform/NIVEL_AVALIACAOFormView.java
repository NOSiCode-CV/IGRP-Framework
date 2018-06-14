/*-------------------------*/

/*Create View*/

package nosi.webapps.human_resources.pages.nivel_avaliacaoform;
import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;





public class NIVEL_AVALIACAOFormView extends View {

	public Field id;
	public Field codigo;
	public Field nivel;
	public Field descricao;
	public Field cor;
	public IGRPForm form_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_list;
	public IGRPButton btn_save;

	public NIVEL_AVALIACAOFormView(){

		this.setPageTitle("");
			
		form_1 = new IGRPForm("form_1","Registar NIVEL_AVALIACAO");

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

		btn_list = new IGRPButton("List","human_resources","NIVEL_AVALIACAOForm","list","_self","default|fa-list","","");
		btn_list.propertie.add("rel","list").add("action-id","69").add("crud_op","list").add("type","specific");

		btn_save = new IGRPButton("Save","human_resources","NIVEL_AVALIACAOForm","save","submit","primary|fa-save","","");
		btn_save.propertie.add("rel","save").add("action-id","68").add("crud_op","save").add("type","specific");

		
	}
		
	@Override
	public void render(){
		

		form_1.addField(id);
		form_1.addField(codigo);
		form_1.addField(nivel);
		form_1.addField(descricao);
		form_1.addField(cor);

		toolsbar_1.addButton(btn_list);
		toolsbar_1.addButton(btn_save);
		this.addToPage(form_1);
		this.addToPage(toolsbar_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		id.setValue(model);
		codigo.setValue(model);
		nivel.setValue(model);
		descricao.setValue(model);
		cor.setValue(model);	

		
	}
}
/*-------------------------*/
