/*-------------------------*/

/*Create Controller*/

package nosi.webapps.agenda.pages.agenda;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import nosi.core.webapp.Response;
import nosi.webapps.agenda.dao.Balcao;
import nosi.webapps.agenda.dao.Servicos;
import nosi.webapps.agenda.pages.agenda.Agenda.Separatorlist_1;

/*---- Import your packages here... ----*//*---- End ----*/

public class AgendaController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*---- Insert your code here... ----*/		
		Agenda model = new Agenda();
		
		List<Separatorlist_1> lista = new ArrayList<Separatorlist_1>();
		
		if(Igrp.getInstance().getRequest().getMethod().equalsIgnoreCase("POST")) {
			model.load();
			System.out.println(Arrays.toString(model.getP_balcao_fk_desc()));
			if(model.getP_balcao_fk() != null) 
				for(int i = 0; i < model.getP_balcao_fk().length; i++) {
					Separatorlist_1 aux = new Separatorlist_1();
					aux.setAntecedencia_alterarcancelar_hr(new Separatorlist_1.Pair(model.getP_antecedencia_alterarcancelar_hr_fk()[i],model.getP_antecedencia_alterarcancelar_hr_fk_desc()[i]));
					aux.setAntecedencia_de_agendamento_hr(new Separatorlist_1.Pair(model.getP_antecedencia_de_agendamento_hr_fk()[i],model.getP_antecedencia_de_agendamento_hr_fk_desc()[i]));
					aux.setBalcao(new Separatorlist_1.Pair(model.getP_balcao_fk()[i],model.getP_balcao_fk_desc()[i]));
					aux.setDias_de_semana(new Separatorlist_1.Pair(model.getP_dias_de_semana_fk()[i],model.getP_dias_de_semana_fk_desc()[i]));
					aux.setHora_fim(new Separatorlist_1.Pair(model.getP_hora_fim_fk()[i],model.getP_hora_fim_fk_desc()[i]));
					aux.setHora_inicio(new Separatorlist_1.Pair(model.getP_hora_fim_fk()[i],model.getP_hora_inicio_fk_desc()[i]));
					aux.setNumero_de_atendedores(new Separatorlist_1.Pair(model.getP_numero_de_atendedores_fk()[i],model.getP_numero_de_atendedores_fk_desc()[i]));
					aux.setNumero_de_atendimentos(new Separatorlist_1.Pair(model.getP_numero_de_atendimentos_fk()[i],model.getP_numero_de_atendimentos_fk_desc()[i]));
					aux.setServico(new Separatorlist_1.Pair(model.getP_servico_fk()[i],model.getP_servico_fk_desc()[i]));
					aux.setTempo_medio_de_atendimento_mn(new Separatorlist_1.Pair(model.getP_tempo_medio_de_atendimento_mn_fk()[i],model.getP_tempo_medio_de_atendimento_mn_fk_desc()[i]));
					lista.add(aux);
				}
		}
		
		AgendaView view = new AgendaView(model);
		
		view.separatorlist_1.addData(lista);
		
		Map<String, String> comboBox3 = new HashMap<String,String>();
		comboBox3.put(null, "--- Escolher Balcão ---");
		//comboBox3.put("1", "Balcao 1");
		for(Balcao obj : Balcao.getAllBalcao()) {
			comboBox3.put("" + obj.getId(), obj.getLocalizacao());
		}
		view.balcao.setValue(comboBox3);
		
		Map<String, String> comboBox2 = new HashMap<String,String>();
		comboBox2.put(null, "--- Escolher Serviço ---");
		//comboBox2.put("2", "Servico 1");
		for(Servicos obj : Servicos.getAllServico()) {
			comboBox2.put("" + obj.getId(), obj.getNome_servico());
		}
		view.servico.setValue(comboBox2);
		
		Map<String, String> comboBox4 = new HashMap<String,String>();
		for(String value : Arrays.asList(new String[]{"Segunda","Terca","Quarta","Quinta","Sexta","Sabado","Domingo"}))
			comboBox4.put(value, value);
		view.dias_de_semana.setValue(comboBox4);
		
		Map<String, String> comboBox5 = new HashMap<String,String>();
		comboBox5.put(null, "--- Escolher ---");
		for(String value : Arrays.asList(new String[]{"12","10"}))
			comboBox5.put(value, value);
		view.antecedencia_alterarcancelar_hr.setValue(comboBox5);
		
		Map<String, String> comboBox1 = new HashMap<String,String>();
		comboBox1.put(null, "--- Escolher ---");
		for(String value : Arrays.asList(new String[]{"12","10"}))
			comboBox1.put(value, value);
		view.antecedencia_de_agendamento_hr.setValue(comboBox1);
		
		return this.renderView(view);
			/*---- End ----*/
	}

	public Response actionGravar() throws IOException{
		/*---- Insert your code here... ----*/		
		return this.redirect("agenda","AddServicos","index");
			/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*//*---- End ----*/
}
