/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.listaenv;
import java.io.IOException;
import java.util.ArrayList;

import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.Response;
import nosi.webapps.igrp.dao.Application;


public class ListaEnvController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		ListaEnv model = new ListaEnv();
		ArrayList<ListaEnv.Table_1> lista = new ArrayList<>();
		Application apps = new Application();
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			model.load();		
			apps.setDad(model.getDad());
			apps.setName(model.getName());
		}
		for(Object app:apps.getAll()){
			Application a = (Application) app;
			if(!a.getDad().toLowerCase().equals("igrp")){
				ListaEnv.Table_1 table = new ListaEnv().new Table_1();
				table.setDad(a.getDad());
				table.setName(""+a.getName());
				table.setStatus(a.getStatus());
				table.setHost(""+a.getHost());
				table.setId(a.getId());
				lista.add(table);
			}
		}
		model.setTable_1(lista);
		
		ListaEnvView view = new ListaEnvView(model);
		view.table_1.addData(model.gettable_1());
		view.title = "Lista Aplicação";
		view.id.setParam(true);
		return this.renderView(view);
	}
	
	public Response actionEliminar() throws IOException{
		String id = Igrp.getInstance().getRequest().getParameter("id");
		Application app = new Application();
		app.setId(Integer.parseInt(id));
		if(app.delete())
			Igrp.getInstance().getFlashMessage().addMessage("success","Operação efetuada com sucesso");
		else
			Igrp.getInstance().getFlashMessage().addMessage("error","Falha ao tentar efetuar esta operação");
		return this.redirect("igrp","lista-env","index");
	}
}
