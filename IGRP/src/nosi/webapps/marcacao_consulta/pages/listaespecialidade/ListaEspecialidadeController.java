/*-------------------------*/

/*Create Controller*/

package nosi.webapps.marcacao_consulta.pages.listaespecialidade;
/*---- Import your packages here... ----*/

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Response;
import nosi.webapps.marcacao_consulta.dao.Especialidade;
import nosi.core.webapp.Igrp;
import java.util.ArrayList;
import java.util.List;

/*---- End ----*/

public class ListaEspecialidadeController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*---- Insert your code here... ----*/				
		ListaEspecialidade model = new ListaEspecialidade();
		ListaEspecialidadeView view = new ListaEspecialidadeView(model);
		List<ListaEspecialidade.Table_1> table = new ArrayList<>();
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			model.load();
		}
		for(Especialidade esp:new Especialidade().find().andWhere("descricao", "=", model.getDescricao()).all()){
			ListaEspecialidade.Table_1 t = new ListaEspecialidade.Table_1();
			t.setCodigo(esp.getCodigo());
			t.setDescricao(esp.getDescricao());
			t.setP_id(""+esp.getId());
			table.add(t);
		}
		view.table_1.addData(table);
		view.btn_button_1.setLink("index");
		view.p_id.setParam(true);
		return this.renderView(view);
				/*---- End ----*/
	}


	public Response actionButton_1() throws IOException{
		/*---- Insert your code here... ----*/				
		return this.redirect("marcacao_consulta","Especialidade","index");
				/*---- End ----*/
	}
	

	public Response actionPesquisar() throws IOException{
		/*---- Insert your code here... ----*/		
		return this.redirect("marcacao_consulta","ListaEntidade","index");
			/*---- End ----*/
	}
	

	public Response actionEditar() throws IOException{
		/*---- Insert your code here... ----*/				
		return this.redirect("marcacao_consulta","ListaEntidade","index");
				/*---- End ----*/
	}
	

	public Response actionEliminar() throws IOException{
		/*---- Insert your code here... ----*/				
		return this.redirect("marcacao_consulta","ListaEntidade","index");
				/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*//*---- End ----*/
}
