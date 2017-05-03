/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.listaenv;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;

import java.io.IOException;
import java.util.ArrayList;

import nosi.webapps.igrp.dao.Application;


public class ListaEnvController extends Controller {		

	public void actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		ListaEnv model = new ListaEnv();
		ArrayList<ListaEnv.Table_1> lista = new ArrayList<>();
		Application apps = new Application();
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			model.load();		
			apps.setDad(model.getDad());
		}
		for(Object app:apps.getAll()){
			Application a = (Application) app;
			ListaEnv.Table_1 table = new ListaEnv().new Table_1();
			table.setDad(a.getDad());
			table.setName(""+a.getName());
			table.setStatus(a.getStatus());
			table.setHost(""+a.getHost());
			table.setId(a.getId());
			lista.add(table);
		}
		model.setTable_1(lista);
		
		ListaEnvView view = new ListaEnvView(model);
		view.table_1.addData(model.gettable_1());
		view.title = "Lista Aplicação";
		view.id.setParam(true);
		this.renderView(view);
	}
	
}
