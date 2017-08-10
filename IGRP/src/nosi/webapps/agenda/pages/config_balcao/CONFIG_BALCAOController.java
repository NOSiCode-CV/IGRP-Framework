/*-------------------------*/

/*Create Controller*/

package nosi.webapps.agenda.pages.config_balcao;
import java.io.IOException;
/*---- Import your packages here... ----*/
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.RParam;
import nosi.core.webapp.Response;
import nosi.webapps.agenda.dao.Balcao;
import nosi.webapps.agenda.dao.Entidade;
/*---- End ----*/

public class CONFIG_BALCAOController extends Controller {		


	public Response actionIndex() throws IOException{
		/*---- Insert your code here... ----*/
		for(String value : Arrays.asList(new String[]{"08:00","08:30","09:00","09:30","10:00","10:30","11:00","11:30","12:00","13:00","13:30","14:00","14:30","15:00","15:30","16:00","16:30","17:00"}))
			horas.put(value, value);
		List<Entidade> entidades = Entidade.getAllEntidade();
		for(Entidade e:entidades){
			entidade.put(e.getId(),e.getNome_entidade());
		}
		confirm.put(1, "Automatico");
		confirm.put(2, "Manual");
		organica.put(1, "Organica 1");
		organica.put(2, "Organica 2");
		nr_servicos.put(4, 4);
		nr_servicos.put(8, 8);
		nr_servicos.put(10, 10);
		
		CONFIG_BALCAO model = new CONFIG_BALCAO();
		CONFIG_BALCAOView view = new CONFIG_BALCAOView(model);
		view.hr_inicio.setValue(horas);
		view.hr_fim.setValue(horas);
		view.confirmacao.setValue(confirm);
		view.entidade.setValue(entidade);
		view.organica.setValue(organica);
		view.nr_servicos.setValue(nr_servicos);
		view.fuso_horario.setValue("CV");
		view.localizacao.setValue("190;180");
		return this.renderView(view);
		/*---- End ----*/
	}

	public Response actionEditar(@RParam(rParamName = "id_b")String p_id) throws IOException{
		int id = Integer.parseInt(p_id);
		/*---- Insert your code here... ----*/
		for(String value : Arrays.asList(new String[]{"08:00","08:30","09:00","09:30","10:00","10:30","11:00","11:30","12:00","13:00","13:30","14:00","14:30","15:00","15:30","16:00","16:30","17:00"}))
			horas.put(value, value);
		List<Entidade> entidades = Entidade.getAllEntidade();
		for(Entidade e:entidades){
			entidade.put(e.getId(),e.getNome_entidade());
		}
		confirm.put(1, "Automatico");
		confirm.put(2, "Manual");
		organica.put(1, "Organica 1");
		organica.put(2, "Organica 2");
		nr_servicos.put(4, 4);
		nr_servicos.put(8, 8);
		nr_servicos.put(10, 10);
		
		CONFIG_BALCAO model = new CONFIG_BALCAO();
		Balcao b = Balcao.getBalcao(id);
		if(b!=null){
			model.setConfirmacao(b.getConfirmacao());
			model.setEntidade(b.getId_entidade());
			model.setFuso_horario(b.getFusohorario());
			//model.setHorario_de_atendimento(b.get);
			model.setHr_fim(b.getHr_fim());
			model.setHr_inicio(b.getHr_inicio());
			model.setLocalizacao(b.getLocalizacao());
			model.setNr_servicos(b.getNr_servicos());
			model.setOrganica(b.getId_organica());
			model.setP_estado(b.getEstado());
			model.setP_id(id);
		}
		CONFIG_BALCAOView view = new CONFIG_BALCAOView(model);
		view.hr_inicio.setValue(horas);
		view.hr_fim.setValue(horas);
		view.confirmacao.setValue(confirm);
		view.entidade.setValue(entidade);
		view.organica.setValue(organica);
		view.nr_servicos.setValue(nr_servicos);
		view.fuso_horario.setValue("CV");
		view.localizacao.setValue("190;180");
		view.p_id.setValue(id);
		view.btn_gravar.setLink("gravar&p_id="+id+"&estado="+b.getEstado());
		return this.renderView(view);
		/*---- End ----*/
	}
	
	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*---- Insert your code here... ----*/								
		CONFIG_BALCAO model = new CONFIG_BALCAO();	
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			model.load();
			Balcao b = new Balcao();
		    b.setConfirmacao(model.getConfirmacao());
		    b.setEstado("ATIVO");
		    b.setFusohorario(model.getFuso_horario());
		    b.setHr_fim(model.getHr_fim());
		    b.setHr_inicio(model.getHr_inicio());
		    b.setId_entidade(model.getEntidade());
		    b.setId_organica(model.getOrganica());
		    b.setLocalizacao(model.getLocalizacao());
		    b.setNr_servicos(model.getNr_servicos());	
		    b.setId(Integer.parseInt(Igrp.getInstance().getRequest().getParameter("p_id")));
		    int status = 0;
		    if(b.getId()!=0){
		    	b.setEstado(Igrp.getInstance().getRequest().getParameter("estado"));
		    	status = Balcao.update(b);
		    }
		    else if(b.getId()==0)
		    	status = Balcao.insert(b);
		    if(status == 200 || status == 202) {
	        	Igrp.getInstance().getFlashMessage().addMessage("success", "Operacao efetuada com sucesso");
	        }
	        else {
	        	Igrp.getInstance().getFlashMessage().addMessage("error", "Operacao falhada");
	        }
		}
		return this.redirect("agenda","CONFIG_BALCAO","index");
		/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*/
		Map<String, String> horas = new HashMap<String,String>();
		Map<Integer,String> confirm = new HashMap<Integer,String>();
		Map<Integer,String> entidade = new HashMap<Integer,String>();
		Map<Integer,String> organica = new HashMap<Integer,String>();
		Map<Integer,Integer> nr_servicos = new HashMap<Integer,Integer>();
	/*---- End ----*/
}
