/*-------------------------*/

/*Create Controller*/

package nosi.webapps.agenda.pages.lista_req;
/*---- Import your packages here... ----*/
import nosi.core.webapp.Controller;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import nosi.core.webapp.Response;
import nosi.webapps.agenda.dao.Requisitos;

/*---- End ----*/

public class Lista_reqController extends Controller {		


	public Response actionIndex() throws IOException{
		/*---- Insert your code here... ----*/						
		Lista_req model = new Lista_req();
		
		List<Requisitos> col_req = Requisitos.getAllRequisitos();
		List<Lista_req.Table_1> data = new ArrayList<>();
		for(Requisitos r:col_req) {
			Lista_req.Table_1 tabela = new Lista_req.Table_1();
			tabela.setServicos(""+r.getId_servico());
			tabela.setTipo_de_requisito(r.getTipo_requisito());
			tabela.setDescricao_do_requisito(r.getDescritivo());
			tabela.setEstado(r.getEstado());
			tabela.setP_p_id(r.getId());
			
			data.add(tabela);
		}
		
		Lista_reqView view = new Lista_reqView(model);
		view.table_1.addData(data);
		view.p_p_id.setParam(true);
		
		return this.renderView(view);
					/*---- End ----*/
	}


	public Response actionPesquisar() throws IOException{
		/*---- Insert your code here... ----*/		
		return this.redirect("agenda","Lista_req","index");
			/*---- End ----*/
	}
	

	public Response actionEdit() throws IOException{
		/*---- Insert your code here... ----*/		
		return this.redirect("agenda","Lista_req","index");
			/*---- End ----*/
	}
	

	public Response actionEliminar() throws IOException{
		/*---- Insert your code here... ----*/
		
		return this.redirect("agenda","Lista_req","index");
			/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*//*---- End ----*/
}
