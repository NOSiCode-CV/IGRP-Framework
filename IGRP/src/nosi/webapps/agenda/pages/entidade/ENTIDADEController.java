/*-------------------------*/

/*Create Controller*/

package nosi.webapps.agenda.pages.entidade;
/*---- Import your packages here... ----*/

import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import java.io.IOException;
import nosi.core.webapp.Response;
import nosi.core.webapp.helpers.IgrpHelper;
import nosi.core.webapp.helpers.Permission;
import nosi.webapps.agenda.dao.Entidade;
import nosi.webapps.igrp.dao.Organization;

/*---- End ----*/

public class ENTIDADEController extends Controller {		


	public Response actionIndex() throws IOException{
		/*---- Insert your code here... ----*/					
		ENTIDADE model = new ENTIDADE();

		String id = Igrp.getInstance().getRequest().getParameter("p_id");
		if(id!=null && !id.equals("")){
			Entidade e = Entidade.getEntidade(Integer.parseInt(id));
			model.setNome(e.getNome_entidade());
			model.setOrganica(""+e.getId_organica());
			model.setP_estado(e.getEstado());
		}
		ENTIDADEView view = new ENTIDADEView(model);
		view.organica.setValue(IgrpHelper.toMap(new Organization().find().andWhere("application.dad", "=", Permission.getCurrentEnv()).all(), "id", "name", "--- Selecionar Organica ---"));
		if(id!=null && !id.equals("")){
			view.btn_gravar.setLink("gravar&p_id="+id);
		}
		return this.renderView(view);
				/*---- End ----*/
	}


	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*---- Insert your code here... ----*/											
		ENTIDADE model = new ENTIDADE();
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			model.load();
			Entidade e = new Entidade();
			String id = Igrp.getInstance().getRequest().getParameter("p_id");
			e.setEstado("ATIVO");
			if(id!=null && !id.equals("")){
				e.setId(Integer.parseInt(id));
			}
			e.setId_organica(Integer.parseInt(model.getOrganica()));
			e.setNome_entidade(model.getNome());
			int status = id!=null && !id.equals("")?Entidade.update(e):Entidade.insert(e);
			if(status == 201 || status == 202 || status == 204){
				Igrp.getInstance().getFlashMessage().addMessage("success", "Operacao realizada com sucesso");
			}
			else{
				Igrp.getInstance().getFlashMessage().addMessage("error", "Operacao falhada");
			}
		}
		return this.redirect("agenda","ENTIDADE","index");
				/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*//*---- End ----*/
}
