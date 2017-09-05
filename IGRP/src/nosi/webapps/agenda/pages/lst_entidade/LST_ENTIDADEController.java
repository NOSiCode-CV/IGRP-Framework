/*-------------------------*/

/*Create Controller*/

package nosi.webapps.agenda.pages.lst_entidade;
/*---- Import your packages here... ----*/

import nosi.core.config.Config;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import nosi.core.webapp.Response;
import nosi.webapps.agenda.dao.Entidade;

/*---- End ----*/

public class LST_ENTIDADEController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*---- Insert your code here... ----*/					
		LST_ENTIDADE model = new LST_ENTIDADE();
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			model.load();
		}
		List<Entidade> entidades = Entidade.getAllEntidade(model.getEntidade());
		List<LST_ENTIDADE.Table_1> data = new ArrayList<>();
		for(Entidade e:entidades){
			LST_ENTIDADE.Table_1 t = new LST_ENTIDADE.Table_1();
			t.setP_id(""+e.getId());
			t.setEntidade(e.getNome_entidade());	
			t.setEstado(e.getEstado());
			data.add(t);
		}
		LST_ENTIDADEView view = new LST_ENTIDADEView(model);
		view.table_1.addData(data);
		view.p_id.setParam(true);
		view.btn_pesquisar.setLink("index");
		return this.renderView(view);
				/*---- End ----*/
	}


	public Response actionNova_entidade() throws IOException{
		/*---- Insert your code here... ----*/					
		Config.target = "_blank";
		return this.redirect("agenda","ENTIDADE","index");
				/*---- End ----*/
	}
	

	public Response actionPesquisar() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("agenda","LST_ENTIDADE","index");
		/*---- End ----*/
	}
	

	public Response actionEditar() throws IOException{
		/*---- Insert your code here... ----*/						
		Config.target = "_blank";	
		String id = Igrp.getInstance().getRequest().getParameter("p_id");
		return this.redirect("agenda","ENTIDADE","index&p_id="+id);
				/*---- End ----*/
	}
	

	public Response actionServicos() throws IOException{
		/*---- Insert your code here... ----*/					
		Config.target = "_blank";	
		String id = Igrp.getInstance().getRequest().getParameter("p_id");						
		return this.redirect("agenda","AddServicos","index&p_id_entidade="+id);
				/*---- End ----*/
	}
	

	public Response actionAgenda() throws IOException{
		/*---- Insert your code here... ----*/						
		Config.target = "_blank";			
		String id = Igrp.getInstance().getRequest().getParameter("p_id");			
		return this.redirect("agenda","Agendar","index&p_id_entidade="+id);
				/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*//*---- End ----*/
}
