package nosi.webapps.app_teste.pages.teste_blockly;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;
import nosi.core.config.Config;

public class Teste_blocklyView extends View {

	public Field nataniel;
	public Field morada;
	public Field data_registo;
	public IGRPForm form_1;
	public IGRPForm form_2;

	public IGRPButton btn_salvar;
	public IGRPButton btn_eliminar;

	public Teste_blocklyView(){

		this.setPageTitle("teste_blockly");
			
		form_1 = new IGRPForm("form_1","");

		form_2 = new IGRPForm("form_2","");

		nataniel = new TextField(model,"nataniel");
		nataniel.setLabel(gt("Nataniel"));
		nataniel.propertie().add("name","p_nataniel").add("type","text").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false").add("desclabel","false");
		
		morada = new TextField(model,"morada");
		morada.setLabel(gt("Morada"));
		morada.propertie().add("name","p_morada").add("type","text").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false").add("desclabel","false");
		
		data_registo = new DateField(model,"data_registo");
		data_registo.setLabel(gt("Data registo"));
		data_registo.propertie().add("name","p_data_registo").add("type","date").add("range","false").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false").add("desclabel","false");
		


		btn_salvar = new IGRPButton("Salvar","app_teste","Teste_blockly","salvar","_blank","primary|fa-angle-right","","");
		btn_salvar.propertie.add("type","form").add("rel","salvar");

		btn_eliminar = new IGRPButton("Eliminar","app_teste","Teste_blockly","eliminar","_blank","primary|fa-angle-right","","");
		btn_eliminar.propertie.add("type","form").add("rel","eliminar");

		
	}
		
	@Override
	public void render(){
		
		form_1.addField(nataniel);
		form_1.addField(morada);
		form_1.addField(data_registo);


		form_1.addButton(btn_salvar);
		form_1.addButton(btn_eliminar);
		this.addToPage(form_1);
		this.addToPage(form_2);
	}
		
	@Override
	public void setModel(Model model) {
		
		nataniel.setValue(model);
		morada.setValue(model);
		data_registo.setValue(model);	

		}
}
