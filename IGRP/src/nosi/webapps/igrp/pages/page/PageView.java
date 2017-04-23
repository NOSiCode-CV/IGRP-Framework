package nosi.webapps.igrp.pages.page;

import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class PageView extends View {		
	
	public Field n_bi;
	public Field nome;
	public Field morada;
	public Field data_nascimento;
	public Field sexo;
	public IGRPForm form_1;
	public IGRPTable table_1;

		
	@Override
	public void render(){
		Page model = (Page) this.getModel("model");
	
		form_1 = new IGRPForm("form_1");
		table_1 = new IGRPTable("table_1");
		n_bi = new NumberField(model,"n_bi");
		n_bi.setLabel("Nº BI");
		n_bi.propertie().add("name","p_n_bi").add("type","number").add("maxlength","8").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		nome = new TextField(model,"nome");
		nome.setLabel("Nome");
		nome.propertie().add("name","p_nome").add("type","text").add("maxlength","50").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		morada = new TextField(model,"morada");
		morada.setLabel("Morada");
		morada.propertie().add("name","p_morada").add("type","text").add("maxlength","50").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		data_nascimento = new DateField(model,"data_nascimento");
		data_nascimento.setLabel("Data Nascimento");
		data_nascimento.propertie().add("name","p_data_nascimento").add("type","date").add("format","IGRP_datePicker").add("maxlength","30").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false").add("class","default");
		sexo = new RadioListField(model,"sexo");
		sexo.setLabel("Sexo");
		sexo.propertie().add("name","p_sexo").add("type","radiolist").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("right","false");

		form_1.addField(n_bi);
		form_1.addField(nome);
		form_1.addField(morada);
		form_1.addField(data_nascimento);
		form_1.addField(sexo);

		table_1.addField(n_bi);
		table_1.addField(nome);
		table_1.addField(morada);
		table_1.addField(data_nascimento);
		table_1.addField(sexo);


		this.addToPage(form_1);
		this.addToPage(table_1);

	}
}