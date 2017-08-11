/*-------------------------*/

/*Create Controller*/

package nosi.webapps.agenda.pages.lst_entidade;
import nosi.core.config.Config;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import nosi.core.webapp.Response;
import nosi.webapps.agenda.dao.Entidade;

/*---- Import your packages here... ----*//*---- End ----*/

public class LST_ENTIDADEController extends Controller {		

	public Response actionIndex() throws IOException{
		/*---- Insert your code here... ----*/	
		LST_ENTIDADE model = new LST_ENTIDADE();
		List<Entidade> entidades = Entidade.getAllEntidade();
		List<LST_ENTIDADE.Table_1> data = new ArrayList<>();
		for(Entidade e:entidades){
			LST_ENTIDADE.Table_1 t = new LST_ENTIDADE.Table_1();
			t.setP_id(""+e.getId());
			t.setAplicacao(e.getNome());
			t.setEntidade(e.getNome_entidade());			
			data.add(t);
		}
		LST_ENTIDADEView view = new LST_ENTIDADEView(model);
		view.table_1.addData(data);
		view.aplicacao.setLabel("Aplicação");
		view.p_id.setParam(true);
		return this.renderView(view);
		/*---- End ----*/
	}


	public Response actionNova_entidade() throws IOException{
		/*---- Insert your code here... ----*/	
		Config.target = "_blank";
		return this.redirect("agenda","Entidade","index");
		/*---- End ----*/
	}
	

	public Response actionServicos() throws IOException{
		/*---- Insert your code here... ----*/	
		Config.target = "_blank";	
		String id = Igrp.getInstance().getRequest().getParameter("p_id");						
		return this.redirect("agenda","AddServicos","index&p_id="+id);
		/*---- End ----*/
	}
	

	public Response actionBalcoes() throws IOException{
		/*---- Insert your code here... ----*/		
		Config.target = "_blank";	
		String id = Igrp.getInstance().getRequest().getParameter("p_id");
		return this.redirect("agenda","CONFIG_BALCAO","index&p_id="+id);
		/*---- End ----*/
	}
	

	public Response actionAgenda() throws IOException{
		/*---- Insert your code here... ----*/		
		Config.target = "_blank";			
		String id = Igrp.getInstance().getRequest().getParameter("p_id");			
		return this.redirect("agenda","Agendar","index&p_id="+id);
		/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*//*---- End ----*/
}
