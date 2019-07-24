package nosi.webapps.app_teste.pages.examform;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;
import nosi.core.config.Config;

public class ExamformView extends View {

	public Field nome_exame;
	public Field data_exame;
	public Field imagem_raios_x;
	public IGRPForm form_1;

	public IGRPButton btn_salvar;

	public ExamformView(){

		this.setPageTitle("Registar Exames");
			
		form_1 = new IGRPForm("form_1","");

		nome_exame = new TextField(model,"nome_exame");
		nome_exame.setLabel(gt("Nome do exame"));
		nome_exame.propertie().add("name","p_nome_exame").add("type","text").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false").add("desclabel","false");
		
		data_exame = new DateField(model,"data_exame");
		data_exame.setLabel(gt("Data do exame"));
		data_exame.propertie().add("name","p_data_exame").add("type","date").add("range","false").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false").add("desclabel","false");
		
		imagem_raios_x = new FileField(model,"imagem_raios_x");
		imagem_raios_x.setLabel(gt("Inserir Imagem Raios-X"));
		imagem_raios_x.propertie().add("name","p_imagem_raios_x").add("type","file").add("accept","").add("targetrend","").add("multiple","false").add("rendvalue","false").add("maxlength","250").add("required","false").add("disabled","false");
		


		btn_salvar = new IGRPButton("Salvar","app_teste","Examform","salvar","submit","primary|fa-angle-right","","");
		btn_salvar.propertie.add("type","form").add("rel","salvar");

		
	}
		
	@Override
	public void render(){
		
		form_1.addField(nome_exame);
		form_1.addField(data_exame);
		form_1.addField(imagem_raios_x);

		form_1.addButton(btn_salvar);
		this.addToPage(form_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		nome_exame.setValue(model);
		data_exame.setValue(model);
		imagem_raios_x.setValue(model);	

		}
}
