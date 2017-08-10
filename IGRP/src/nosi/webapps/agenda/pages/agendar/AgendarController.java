/*-------------------------*/

/*Create Controller*/

package nosi.webapps.agenda.pages.agendar;
import nosi.core.gui.fields.HiddenField;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import nosi.core.webapp.Response;
/*---- Import your packages here... ----*/
import nosi.webapps.agenda.dao.Entidade;
import nosi.webapps.agenda.dao.Requisitos;
import nosi.webapps.agenda.dao.Balcao;
import nosi.webapps.agenda.dao.Servicos;
import nosi.webapps.agenda.pages.agendar.Agendar.Separatorlist_2;
import nosi.webapps.agenda.pages.agendar.Agendar.Table_1;
/*---- End ----*/

public class AgendarController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*---- Insert your code here... ----*/		
		Agendar model = new Agendar();
		
		List<Separatorlist_2> lista = new ArrayList<Separatorlist_2>();
		
		List<HiddenField> hiddenFields = new ArrayList<HiddenField>();
		
		if(Igrp.getInstance().getRequest().getMethod().equalsIgnoreCase("POST")) {
			
			model.load();
			
			if(model.getP_entidade_fk_desc() != null) {
				for(int i = 0; i < model.getP_entidade_fk_desc().length; i++) {
					
					Agendar.Separatorlist_2 aux = new Separatorlist_2();
					
					aux.setEntidade(new Separatorlist_2.Pair("" + model.getP_entidade_fk()[i],"" + model.getP_entidade_fk_desc()[i]));
					aux.setData(new Separatorlist_2.Pair("" + model.getP_data_fk()[i],"" + model.getP_data_fk_desc()[i]));
					aux.setServico(new Separatorlist_2.Pair("" + model.getP_servico_fk()[i],"" + model.getP_servico_fk_desc()[i]));
					aux.setBalcao(new Separatorlist_2.Pair("" + model.getP_balcao_fk()[i],"" + model.getP_balcao_fk_desc()[i]));
					aux.setHora(new Separatorlist_2.Pair("" + model.getP_hora_fk()[i],"" + model.getP_hora_fk_desc()[i]));
					aux.setNome(new Separatorlist_2.Pair("" + model.getP_nome_fk()[i],"" + model.getP_nome_fk_desc()[i]));
					
					lista.add(aux);
					
				}
			}
		}
		
		AgendarView view = new AgendarView(model);
		
		view.separatorlist_2.addData(lista);
		
		//view.table_1.addData(tableRows);
		
		/*for(HiddenField obj : hiddenFields)
			view.form_1.addField(obj);
		*/
		Map<String, String> comboBox = new HashMap<String,String>();
		comboBox.put(null, "--- Escolher Entidade ---");
		for(Entidade entidade : Entidade.getAllEntidade()) {
			comboBox.put(entidade.getId() + "", entidade.getNome_entidade());
		}
		view.entidade.setValue(comboBox);
		
		//
		Map<String, String> comboBox2 = new HashMap<String,String>();
		comboBox2.put(null, "--- Escolher Serviço ---");
		for(Servicos obj : Servicos.getAllServico()) {
			comboBox2.put("" + obj.getId(), obj.getNome_servico());
		}
		view.servico.setValue(comboBox2);
		
		Map<String, String> comboBox3 = new HashMap<String,String>();
		comboBox3.put(null, "--- Escolher Balcão ---");
		for(Balcao obj : Balcao.getAllBalcao()) {
			comboBox3.put("" + obj.getId(), obj.getLocalizacao());
		}
		view.balcao.setValue(comboBox3);
		
		Map<String, String> comboBox4 = new HashMap<String,String>();
		for(String value : Arrays.asList(new String[]{"08:00","08:30","09:00","09:30","10:00","10:30","11:00","11:30","12:00","13:00","13:30","14:00","14:30","15:00","15:30","16:00","16:30","17:00"}))
			comboBox4.put(value, value);
		view.hora.setValue(comboBox4);
		
		Map<String, String> comboBox5 = new HashMap<String,String>();
		comboBox5.put(null, "--- Escolher Tipo Doc. ---");
		for(String value : Arrays.asList(new String[] {"BI", "Passaporte"}))
			comboBox5.put(value, value);
		view.tipo_documento_de_identificacao.setValue(comboBox5);
		
		return this.renderView(view);
			/*---- End ----*/
	}

	public Response actionAgendar() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("agenda","AddServicos","index");
		/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*//*---- End ----*/
}
