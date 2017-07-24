/*-------------------------*/

/*Create Controller*/

package nosi.webapps.marcao_consulta.pages.listamedico;
import java.io.IOException;
import java.util.ArrayList;

import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.Response;
import nosi.webapps.marcao_consulta.dao.Medico;


public class ListaMedicoController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		ListaMedico model = new ListaMedico();
		ListaMedicoView view = new ListaMedicoView(model);
		ArrayList<ListaMedico.Table_1> data = new ArrayList<>();
		Medico med = new Medico();
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			model.load();
			med.setNome(model.getNome());
		}
		for(Object obj:med.getAll()){
			Medico u = (Medico) obj;			
			ListaMedico.Table_1 table_1 = new ListaMedico().new Table_1();
			table_1.setN_consulta_por_dia(u.getNum_consulta());
			table_1.setP_id(u.getId());
			table_1.setNome(u.getNome());
			data.add(table_1);
		}
		view.table_1.addData(data);
		view.p_id.setParam(true);
		view.btn_pesquisar.setLink("index");
		return this.renderView(view);
	}

	public Response actionNovo_medico() throws IOException{
		return this.redirect("marcao_consulta","RegistarMedico","index");
	}
	
	public Response actionPesquisar() throws IOException{
		ListaMedico model = new ListaMedico();
		ListaMedicoView view = new ListaMedicoView(model);
		return this.renderView(view);
	}
	
}
