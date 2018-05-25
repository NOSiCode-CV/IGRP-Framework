
package nosi.webapps.igrp_studio.pages.sql_tools;
import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;





public class Sql_toolsView extends View {

	public Field application;
	public Field data_source;
	public Field separator_1;
	public Field sql;
	public IGRPForm form_1;
	public IGRPTable table_1;

	public IGRPButton btn_run;

	public Sql_toolsView(){

		this.setPageTitle("Sql Tools");
			
		form_1 = new IGRPForm("form_1","");

		table_1 = new IGRPTable("table_1","");

		application = new ListField(model,"application");
		application.setLabel(gt("Aplicação"));
		application.propertie().add("name","p_application").add("type","select").add("multiple","false").add("domain","").add("maxlength","250").add("required","true").add("java-type","");
		
		data_source = new ListField(model,"data_source");
		data_source.setLabel(gt("Data Source"));
		data_source.propertie().add("name","p_data_source").add("type","select").add("multiple","false").add("domain","").add("maxlength","250").add("required","true").add("java-type","");
		
		separator_1 = new SeparatorField(model,"separator_1");
		separator_1.setLabel(gt("   "));
		separator_1.propertie().add("name","p_separator_1").add("type","separator").add("maxlength","250");
		
		sql = new TextAreaField(model,"sql");
		sql.setLabel(gt("SQL"));
		sql.propertie().add("name","p_sql").add("type","textarea").add("maxlength","1000000").add("required","true");
		


		btn_run = new IGRPButton("Run","igrp_studio","Sql_tools","run","submit","success|fa-play-circle","","");
		btn_run.propertie.add("type","form").add("rel","run");

		
	}
		
	@Override
	public void render(){
		
		form_1.addField(application);
		form_1.addField(data_source);
		form_1.addField(separator_1);
		form_1.addField(sql);


		form_1.addButton(btn_run);
		this.addToPage(form_1);
		this.addToPage(table_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		application.setValue(model);
		data_source.setValue(model);
		separator_1.setValue(model);
		sql.setValue(model);	

		table_1.loadModel(((Sql_tools) model).getTable_1());
		
	}
}
