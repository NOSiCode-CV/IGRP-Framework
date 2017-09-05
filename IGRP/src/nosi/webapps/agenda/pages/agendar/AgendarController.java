/*-------------------------*/

/*Create Controller*/

package nosi.webapps.agenda.pages.agendar;
/*---- Import your packages here... ----*/

import nosi.core.config.Config;
import nosi.core.webapp.Controller;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.ws.rs.core.MediaType;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import nosi.core.webapp.Response;
import nosi.webapps.agenda.dao.Marcacao;
import nosi.webapps.agenda.dao.ODFault;
import nosi.webapps.agenda.dao.Agenda;
import nosi.webapps.agenda.helper.RestRequestHelper;
import nosi.webapps.agenda.pages.agendar.Agendar.Separatorlist_2;

/*---- End ----*/

public class AgendarController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*---- Insert your code here... ----*/								
		Agendar model = new Agendar();
		
		List<Separatorlist_2> lista = new ArrayList<Separatorlist_2>();
		
		List<Marcacao> listMarcacao = new ArrayList<Marcacao>();		
		
		if(Igrp.getInstance().getRequest().getMethod().equalsIgnoreCase("POST")) {
			
			model.load();
			
			if(model.getP_agenda_fk() != null) 
				for(int i = 0; i < model.getP_agenda_fk().length; i++) {
					Agendar.Separatorlist_2 aux = new Separatorlist_2();
					
					aux.setData(new Separatorlist_2.Pair("" + model.getP_data_fk()[i],"" + model.getP_data_fk_desc()[i]));
					aux.setAgenda(new Separatorlist_2.Pair("" + model.getP_agenda_fk()[i],"" + model.getP_agenda_fk_desc()[i]));
					aux.setHora(new Separatorlist_2.Pair("" + model.getP_hora_fk()[i],"" + model.getP_hora_fk_desc()[i]));
					aux.setNome(new Separatorlist_2.Pair("" + model.getP_nome_fk()[i],"" + model.getP_nome_fk_desc()[i]));
					lista.add(aux);
					
					String current_data = new java.sql.Date(System.currentTimeMillis()).toString();
					
					Marcacao marcacao = new Marcacao();
					marcacao.setData_marcacao(Marcacao.convertDate(model.getP_data_fk()[i], "dd-MM-yyyy", "yyyy-MM-dd"));
					marcacao.setNome(model.getP_nome_fk()[i]);
					marcacao.setTipo_documento(model.getTipo_documento_de_identificacao());
					if(current_data.compareTo(marcacao.getData_marcacao()) >= 0){
						marcacao.setHr_marcacao(model.getP_hora_fk()[i]);
						if(marcacao.verificaDisponibilidade()){
							marcacao.setEmail(model.getEmail());
							marcacao.setTelefone("" + model.getTelefone());
							marcacao.setTelemovel("" + model.getTelemovel());
							marcacao.setEstado("ATIVO");
							marcacao.setNotificacao("Not Set");
							marcacao.setNr_documento(model.getDocumento_de_identificacao() + "");
							marcacao.setId_agenda(Integer.parseInt(model.getP_agenda_fk()[i]));
							marcacao.setNotificacao(model.getNotificacao() == 1 ? "ATIVO" : "DESATIVO");
							marcacao.setRequerente(model.getRequerente());
							listMarcacao.add(marcacao);
						}else{
							Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, "A data associada a marcação de "+marcacao.getTipo_documento()+" do "+marcacao.getNome()+" não está disponível");
						}
					}else{
						Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, "A data associada a marcação de "+marcacao.getTipo_documento()+" do "+marcacao.getNome()+" não é válida");
					}
				}
			
			String errorMessage = "Ooops !!! Ocorreu um Erro ... ";
			boolean success = false;
		
			for(Marcacao obj : listMarcacao) {
				ClientConfig config = new DefaultClientConfig();
				 
		        Client client = Client.create(RestRequestHelper.applySslSecurity(config));
		        
		        String url = RestRequestHelper.baseUrl + "/ag_t_marcacao";
		        
		        WebResource resource = client.resource(url);
		        
				String content = RestRequestHelper.convertDaoToJson(obj);
				
		        ClientResponse response = resource.accept(MediaType.APPLICATION_JSON).type("application/json")
		        		.post(ClientResponse.class, content);
				
		   	 	String jsonResult = response.getEntity(String.class);
		   	 	
		   	 	//	System.out.println(jsonResult);
		   	 	
		        if(response.getStatus() == 200 || response.getStatus() == 201) {
		        	success = true;
		        }
		        else {
		        	success = false;
		        	try {
		        		ODFault fault = RestRequestHelper.convertJsonToDao(jsonResult, ODFault.class);
		        		errorMessage = fault.getError().getMessage();
		        	}catch(Exception e){
		        		e.printStackTrace();
		        	}
		        }
		       client.destroy();
			}
			if(success)
	        	Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.SUCCESS, "Marcação de agenda registado com sucesso.");
			else
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, errorMessage);
			
			
		}
		
		AgendarView view = new AgendarView(model);
		String p_data = Igrp.getInstance().getRequest().getParameter("p_date");
		if(p_data!=null && !p_data.equals("")){
			Config.target = "_blank";
			view.data.setValue(p_data);
		}
		view.separatorlist_2.addData(lista);
		
		Map<String, String> comboBox1= new HashMap<String,String>();
		comboBox1.put(null, "--- Escolher Agenda ---");
		for(Agenda obj : Agenda.getAllAgenda())
			comboBox1.put(obj.getId() + "", "Serviço (" + obj.getId_serv_balcao() + ") / Balcão (" + obj.getId_serv_balcao() + ")");
		view.agenda.setValue(comboBox1);
		
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
