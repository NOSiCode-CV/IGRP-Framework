/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.listapage;
import nosi.core.webapp.Controller;
import nosi.webapps.igrp.dao.Action;

import java.io.IOException;
import java.util.ArrayList;
//import nosi.webapps.red.teste.Teste;


public class ListaPageController extends Controller {		

	public void actionIndex() throws IOException{
		ListaPage model = new ListaPage();
		ListaPageView view = new ListaPageView(model);
		ArrayList<ListaPage.Table_1> lista = new ArrayList<>();
		for(Object obj:new Action().getAll()){
			Action ac = (Action) obj;
			ListaPage.Table_1 table1 = new ListaPage().new Table_1();
			table1.setP_Id(ac.getId());
			table1.setAction_descr(ac.getAction_descr());
			table1.setPage(ac.getPage());
			table1.setPage_descr(ac.getPage_descr());
			table1.setVersion(""+ac.getVersion());
			table1.setStatus(ac.getStatus());
			lista.add(table1);
		}
		view.p_id.setParam(true);
		view.table_1.addData(lista);
		this.renderView(view);
	}

	public void actionNovo() throws IOException{
			this.redirect("red","teste","action");
	}
	
	public void actionPesquisar() throws IOException{
		/*Teste model = new Teste();
		TesteView view = new TesteView(model);
		this.renderView(view);*/
	}
	
}
