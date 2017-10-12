/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.listaenv;
/*---- Import your packages here... ----*/

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.Response;
import nosi.webapps.igrp.dao.Application;

/*---- End ----*/

public class ListaEnvController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		ListaEnv model = new ListaEnv();
		ArrayList<ListaEnv.Table_1> lista = new ArrayList<>();
		Application app = new Application();
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			model.load();		
			app.setDad(model.getDad());
			app.setName(model.getName());
		}
		List<Application> apps = app.find()
								.andWhere("dad", "like", app.getDad())
								.andWhere("name", "like", app.getName())
								.all();
		for(Application a:apps){
			if(!a.getDad().toLowerCase().equals("igrp")){
				ListaEnv.Table_1 table = new ListaEnv().new Table_1();
				table.setDad(a.getDad());
				table.setName(""+a.getName());
				table.setStatus(a.getStatus());
				table.setId(a.getId());
				lista.add(table);
			}
		}
		model.setTable_1(lista);
		
		ListaEnvView view = new ListaEnvView(model);
		view.table_1.addData(model.gettable_1());
		view.title = "Lista Aplica��o";
		view.id.setParam(true);
		return this.renderView(view);
	}


	public Response actionNovo() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("igrp","ListaPage","index");
		/*---- End ----*/
	}
	

	public Response actionPesquisar() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("igrp","listaenv","index");
		/*---- End ----*/
	}
	

	public Response actionEditar() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("igrp","ListaPage","index");
		/*---- End ----*/
	}
	

	public Response actionEliminar() throws IOException{
		String id = Igrp.getInstance().getRequest().getParameter("id");
		Application app = new Application();
		if(app.delete(Integer.parseInt(id)))
			Igrp.getInstance().getFlashMessage().addMessage("success","Opera��o efetuada com sucesso");
		else
			Igrp.getInstance().getFlashMessage().addMessage("error","Falha ao tentar efetuar esta opera��o");
		return this.redirect("igrp","lista-env","index");
	}
	

	public Response actionExport() throws IOException{
		/*---- Insert your code here... ----*/
		
		return this.redirect("igrp","ListaEnv","index");
		/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*//*---- End ----*/
}