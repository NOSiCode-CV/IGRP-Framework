package nosi.webapps.tutorial.pages.parametrizacao_tipo;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class Parametrizacao_tipoView extends View {

	public Field tipo;
	public Field descricao;
	public Field id_tipo_form;
	public Field nome_tipo;
	public Field descricao_do_tipo;
	public Field id_tipo;
	public IGRPForm form_1;
	public IGRPTable table_1;

	public IGRPButton btn_salvar;
	public IGRPButton btn_editar;
	public IGRPButton btn_eliminar;

	public Parametrizacao_tipoView(){

		this.setPageTitle("Parametrização Tipo");
			
		form_1 = new IGRPForm("form_1","");

		table_1 = new IGRPTable("table_1","");

		tipo = new TextField(model,"tipo");
		tipo.setLabel(gt("Tipo"));
		tipo.propertie().add("name","p_tipo").add("type","text").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false").add("placeholder",gt("")).add("desclabel","false");
		
		descricao = new TextField(model,"descricao");
		descricao.setLabel(gt("Descrição"));
		descricao.propertie().add("name","p_descricao").add("type","text").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false").add("placeholder",gt("")).add("desclabel","false");
		
		id_tipo_form = new HiddenField(model,"id_tipo_form");
		id_tipo_form.setLabel(gt(""));
		id_tipo_form.propertie().add("name","p_id_tipo_form").add("type","hidden").add("maxlength","250").add("java-type","int").add("tag","id_tipo_form");
		
		nome_tipo = new TextField(model,"nome_tipo");
		nome_tipo.setLabel(gt("Nome tipo"));
		nome_tipo.propertie().add("name","p_nome_tipo").add("type","text").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		descricao_do_tipo = new TextField(model,"descricao_do_tipo");
		descricao_do_tipo.setLabel(gt("Descrição do tipo"));
		descricao_do_tipo.propertie().add("name","p_descricao_do_tipo").add("type","text").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		id_tipo = new HiddenField(model,"id_tipo");
		id_tipo.setLabel(gt(""));
		id_tipo.propertie().add("name","p_id_tipo").add("type","hidden").add("maxlength","30").add("showLabel","true").add("group_in","").add("java-type","int").add("tag","id_tipo");
		


		btn_salvar = new IGRPButton("Salvar","tutorial","Parametrizacao_tipo","salvar","submit_form","primary|fa-angle-right","","");
		btn_salvar.propertie.add("type","form").add("class","primary").add("rel","salvar").add("refresh_components","");

		btn_editar = new IGRPButton("Editar","tutorial","Parametrizacao_tipo","editar","mpsubmit|refresh","warning|fa-edit","","");
		btn_editar.propertie.add("type","specific").add("class","warning").add("rel","editar").add("refresh_components","");

		btn_eliminar = new IGRPButton("Eliminar","tutorial","Parametrizacao_tipo","eliminar","confirm","danger|fa-times-circle-o","","");
		btn_eliminar.propertie.add("type","specific").add("class","danger").add("rel","eliminar").add("refresh_components","");

		
	}
		
	@Override
	public void render(){
		
		form_1.addField(tipo);
		form_1.addField(descricao);
		form_1.addField(id_tipo_form);

		table_1.addField(nome_tipo);
		table_1.addField(descricao_do_tipo);
		table_1.addField(id_tipo);

		form_1.addButton(btn_salvar);
		table_1.addButton(btn_editar);
		table_1.addButton(btn_eliminar);
		this.addToPage(form_1);
		this.addToPage(table_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		tipo.setValue(model);
		descricao.setValue(model);
		id_tipo_form.setValue(model);
		nome_tipo.setValue(model);
		descricao_do_tipo.setValue(model);
		id_tipo.setValue(model);	

		table_1.loadModel(((Parametrizacao_tipo) model).getTable_1());
		}
}
