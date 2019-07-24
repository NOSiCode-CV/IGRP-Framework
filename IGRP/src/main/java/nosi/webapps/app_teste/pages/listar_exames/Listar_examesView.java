package nosi.webapps.app_teste.pages.listar_exames;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;
import nosi.core.config.Config;
import nosi.core.gui.components.IGRPLink;
import nosi.core.webapp.Report;

public class Listar_examesView extends View {

	public Field nome_utente;
	public Field nome_exame;
	public Field date;
	public Field ver_exame;
	public Field ver_exame_desc;
	public IGRPTable table_1;


	public Listar_examesView(){

		this.setPageTitle("Listar Exames");
			
		table_1 = new IGRPTable("table_1","");

		nome_utente = new TextField(model,"nome_utente");
		nome_utente.setLabel(gt("Nome do utente"));
		nome_utente.propertie().add("name","p_nome_utente").add("type","text").add("maxlength","30");
		
		nome_exame = new TextField(model,"nome_exame");
		nome_exame.setLabel(gt("Exame"));
		nome_exame.propertie().add("name","p_nome_exame").add("type","text").add("maxlength","30");
		
		date = new DateField(model,"date");
		date.setLabel(gt("Date"));
		date.propertie().add("name","p_date").add("type","date").add("range","false").add("maxlength","30");
		
		ver_exame = new LinkField(model,"ver_exame");
		ver_exame.setLabel(gt("Ver exame"));
		ver_exame.setValue(new Config().getResolveUrl("app_teste","Processamento_de_imagem","index"));

									ver_exame_desc = new LinkField(model,"ver_exame_desc");
		ver_exame_desc.setLabel(gt("Ver exame"));
		ver_exame.propertie().add("name","p_ver_exame").add("type","link").add("target","mpsubmit").add("request_fields","").add("refresh_submit","false").add("maxlength","30").add("show_header","true").add("desc","true");
		


		
	}
		
	@Override
	public void render(){
		
		table_1.addField(nome_utente);
		table_1.addField(nome_exame);
		table_1.addField(date);
		table_1.addField(ver_exame);
		table_1.addField(ver_exame_desc);

		this.addToPage(table_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		nome_utente.setValue(model);
		nome_exame.setValue(model);
		date.setValue(model);
		ver_exame.setValue(model);
		ver_exame_desc.setValue(model);	

		table_1.loadModel(((Listar_exames) model).getTable_1());
		}
}
