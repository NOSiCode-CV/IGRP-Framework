package nosi.webapps.igrp.pages.pesquisa_cae;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class Pesquisa_caeView extends View {

	public Field codigo;
	public Field descricao;
	public Field t_codigo;
	public Field t_descricao;
	public IGRPForm form_1;
	public IGRPTable table_1;

	public IGRPButton btn_pesquisar;

	public Pesquisa_caeView(){

		this.setPageTitle("Pesquisa CAE");
			
		form_1 = new IGRPForm("form_1","");

		table_1 = new IGRPTable("table_1","");

		codigo = new TextField(model,"codigo");
		codigo.setLabel(gt("Codigo"));
		codigo.propertie().add("name","p_codigo").add("type","text").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false");
		
		descricao = new TextField(model,"descricao");
		descricao.setLabel(gt("Descrição"));
		descricao.propertie().add("name","p_descricao").add("type","text").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false");
		
		t_codigo = new TextField(model,"t_codigo");
		t_codigo.setLabel(gt("Codigo"));
		t_codigo.propertie().add("name","p_t_codigo").add("type","text").add("maxlength","30");
		
		t_descricao = new TextField(model,"t_descricao");
		t_descricao.setLabel(gt("Descrição"));
		t_descricao.propertie().add("name","p_t_descricao").add("type","text").add("maxlength","30");
		


		btn_pesquisar = new IGRPButton("Pesquisar","igrp","Pesquisa_cae","pesquisar","submit_form","primary|fa-search","","");
		btn_pesquisar.propertie.add("type","form").add("rel","pesquisar");

		
	}
		
	@Override
	public void render(){
		
		form_1.addField(codigo);
		form_1.addField(descricao);

		table_1.addField(t_codigo);
		table_1.addField(t_descricao);

		form_1.addButton(btn_pesquisar);
		this.addToPage(form_1);
		this.addToPage(table_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		codigo.setValue(model);
		descricao.setValue(model);
		t_codigo.setValue(model);
		t_descricao.setValue(model);	

		table_1.loadModel(((Pesquisa_cae) model).getTable_1());
		}
}
