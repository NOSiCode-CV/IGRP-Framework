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
import nosi.webapps.agenda.dao.Balcao;
import nosi.webapps.agenda.dao.Servicos;
import nosi.webapps.agenda.pages.agendar.Agendar.Separatorlist_2;
/*---- End ----*/

public class AgendarController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*---- Insert your code here... ----*/		
		Agendar model = new Agendar();
		
		List<Separatorlist_2> lista = new ArrayList<Separatorlist_2>();
		
		List<HiddenField> hiddenFields = new ArrayList<HiddenField>();
		
		if(Igrp.getInstance().getRequest().getMethod().equalsIgnoreCase("POST")) {
			model.load();
			
			if(model.getP_entidade_fk_desc() != null)
				for(int i = 0; i < model.getP_entidade_fk_desc().length; i++) {
					Agendar.Separatorlist_2 aux = new Separatorlist_2();
					aux.setEntidade("" + model.getP_entidade_fk()[i]);
					aux.setData(model.getP_data_fk_desc()[i]);
					aux.setServico("" + model.getP_servico_fk()[i]);
					aux.setBalcao("" + model.getP_balcao_fk()[i]);
					aux.setHora(model.getP_hora_fk_desc()[i]);
					aux.setNome(model.getP_nome_fk_desc()[i]);
					lista.add(aux);
					
					HiddenField hiddenFieldEntidade1 = new HiddenField(null, "chave");
					hiddenFieldEntidade1.setValue("valor");
					HiddenField hiddenFieldEntidade2 = new HiddenField(null, "chave");
					hiddenFieldEntidade2.setValue("valor");
					
					HiddenField hiddenFieldServico1 = new HiddenField(null, "chave");
					hiddenFieldServico1.setValue("valor");
					HiddenField hiddenFieldServico2 = new HiddenField(null, "chave");
					hiddenFieldServico2.setValue("valor");
					
					HiddenField hiddenFieldBalcao1 = new HiddenField(null, "chave");
					hiddenFieldBalcao1.setValue("valor");
					HiddenField hiddenFieldBalcao2 = new HiddenField(null, "chave");
					hiddenFieldBalcao2.setValue("valor");
					hiddenFields.add(hiddenFieldBalcao1);
					hiddenFields.add(hiddenFieldBalcao1);
					
					HiddenField hiddenFieldData1 = new HiddenField(null, "chave");
					hiddenFieldData1.setValue("valor");
					HiddenField hiddenFieldData2 = new HiddenField(null, "chave");
					hiddenFieldData2.setValue("valor");
					hiddenFields.add(hiddenFieldData1);
					hiddenFields.add(hiddenFieldData1);
					
					HiddenField hiddenFieldHora1 = new HiddenField(null, "chave");
					hiddenFieldHora1.setValue("valor");
					HiddenField hiddenFieldHora2 = new HiddenField(null, "chave");
					hiddenFieldHora2.setValue("valor");
					hiddenFields.add(hiddenFieldHora1);
					hiddenFields.add(hiddenFieldHora2);
					
					HiddenField hiddenFieldNome1 = new HiddenField(null, "chave");
					hiddenFieldNome1.setValue("valor");
					HiddenField hiddenFieldNome2 = new HiddenField(null, "chave");
					hiddenFieldNome2.setValue("valor");
					hiddenFields.add(hiddenFieldNome1);
					hiddenFields.add(hiddenFieldNome2);
				}
		}
		
		AgendarView view = new AgendarView(model);
		
		view.separatorlist_2.addData(lista);
		
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
