/*-------------------------*/

/*Create View*/

package nosi.webapps.igrp.pages.testetabela;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class TestetabelaView extends View {		
	
	public Field n_bi;
	public Field nome;
	public Field data_nascimento;
	public IGRPForm form_1;
	public IGRPTable table_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_save;
	public IGRPButton btn_pesquisar;
	public TestetabelaView(Testetabela model){			
		form_1 = new IGRPForm("form_1");
		table_1 = new IGRPTable("table_1");
		n_bi = new NumberField(model,"n_bi");
		n_bi.setLabel("Nº BI");
		n_bi.propertie().add("name","p_n_bi").add("type","number").add("maxlength","30").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		nome = new TextField(model,"nome");
		nome.setLabel("Nome");
		nome.propertie().add("name","p_nome").add("type","text").add("maxlength","30").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		data_nascimento = new DateField(model,"data_nascimento");
		data_nascimento.setLabel("Data Nascimento");
		data_nascimento.propertie().add("name","p_data_nascimento").add("type","date").add("format","IGRP_datePicker").add("maxlength","30").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false").add("class","default");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_save = new IGRPButton("Save","RED","Teste","Action","_blank","default|fa-save","default||fa-save|www","http://igrp.teste.gov.cv/images/IGRP/Teste.xml");
		btn_save.propertie.add("type","specific").add("code","").add("rel","save");
		btn_pesquisar = new IGRPButton("Pesquisar","RED","Teste","Action","_blank","default|fa-search","","");
		btn_pesquisar.propertie.add("type","form").add("code","").add("class","default").add("rel","pesquisar");
	}
		
	@Override
	public void render(){
		form_1.addField(n_bi);
		form_1.addField(nome);
		form_1.addField(data_nascimento);

		table_1.addField(n_bi);
		table_1.addField(nome);
		table_1.addField(data_nascimento);

		toolsbar_1.addButton(btn_save);
		form_1.addButton(btn_pesquisar);
		this.addToPage(form_1);
		this.addToPage(toolsbar_1);
		this.addToPage(table_1);
	}
}
/*-------------------------*/