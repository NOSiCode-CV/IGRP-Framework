/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.lookuplistpage;
import nosi.core.webapp.Controller;
import java.io.IOException;


/*---- Import your packages here... ----*/
import nosi.core.webapp.Igrp;
import nosi.core.webapp.Response;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.core.config.Config;
import java.util.ArrayList;
/*---- End ----*/

public class LookupListPageController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*---- Insert your code here... ----*/
		LookupListPage model = new LookupListPage();
		ArrayList<LookupListPage.Table_1> lista = new ArrayList<>();
		Action a = new Action();
		
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			model.load();		
			a.setEnv_fk(model.getEnv_fk());
			a.setPage(model.getPage());
			a.setPage_descr(model.getPage_descr());
		}
		
		for(Object obj : a.getAll_() ){
			Action ac = (Action) obj;
			LookupListPage.Table_1 table1 = new LookupListPage().new Table_1();
			table1.setP_id(ac.getId());
			table1.setNome_page("webapps?r=igrp/data-source/index&amp;id="+ac.getId());
			table1.setDescricao_page("webapps?r=igrp/data-source/index&amp;id="+ac.getId());
			table1.setDescricao_page(ac.getPage_descr());
			table1.setNome_page_desc(ac.getPage());
			lista.add(table1);
		}
		LookupListPageView view = new LookupListPageView(model);
		view.p_id.setParam(true);
		view.env_fk.setLabel("Aplicação");
		view.env_fk.setValue(new Application().getListApps());
		view.table_1.addData(lista);
		Config.target = "_blank";
		return this.renderView(view);
		/*---- End ----*/
	}


	public Response actionPesquisar() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("igrp","ListaPage","index");
		/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*//*---- End ----*/
}
