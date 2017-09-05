/*-------------------------*/

/*Create Controller*/

package nosi.webapps.marcacao_consulta.pages.listamedico;
/*---- Import your packages here... ----*/

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Response;
import java.util.ArrayList;
import java.util.Collection;
import nosi.webapps.marcacao_consulta.dao.Especialidade;
import nosi.webapps.marcacao_consulta.dao.Medico;
import nosi.core.webapp.Igrp;

/*---- End ----*/

public class ListaMedicoController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*---- Insert your code here... ----*/		
		ListaMedico model = new ListaMedico();
		ListaMedicoView view = new ListaMedicoView(model);
		ArrayList<ListaMedico.Table_1> data = new ArrayList<>();
		Medico med = new Medico();
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			model.load();
			med.setNome(model.getNome());
		}
		for(Medico m:med.find().andWhere("nome", "like", model.getNome()).all()){		
			ListaMedico.Table_1 table_1 = new ListaMedico.Table_1();
			table_1.setN_consulta_por_dia(m.getNum_consulta());
			table_1.setP_id(""+m.getId());
			table_1.setNome(m.getNome());
			Collection<Especialidade> esp = m.getEspecialidades();
			String especialidades = "";
			if(!esp.isEmpty()){
				for(Especialidade e:esp){
					especialidades+=e.getDescricao();
				}
			}
			table_1.setEpecialidades(especialidades);
			data.add(table_1);
		}
		view.table_1.addData(data);
		view.p_id.setParam(true);
		view.btn_pesquisar.setLink("index");
		return this.renderView(view);
			/*---- End ----*/
	}


	public Response actionNovo_medico() throws IOException{
		/*---- Insert your code here... ----*/		
		return this.redirect("marcacao_consulta","RegistarMedico","index");
			/*---- End ----*/
	}
	

	public Response actionPesquisar() throws IOException{
		/*---- Insert your code here... ----*/		
		return this.redirect("marcacao_consulta","ConsultaPendente","index");
			/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*//*---- End ----*/
}
