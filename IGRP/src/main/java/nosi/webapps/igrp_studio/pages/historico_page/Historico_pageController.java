package nosi.webapps.igrp_studio.pages.historico_page;

import nosi.core.webapp.Controller;//
import nosi.core.webapp.databse.helpers.ResultSet;//
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp_studio.pages.listapage.ListaPage;
import nosi.core.webapp.databse.helpers.QueryInterface;//
import java.io.IOException;//
import nosi.core.webapp.Core;//
import nosi.core.webapp.Response;//
/* Start-Code-Block (import) */
/* End-Code-Block */
/*----#start-code(packages_import)----*/

import java.util.ArrayList;
import java.util.List;
import nosi.webapps.igrp.dao.Historic;
/*----#end-code----*/
		
public class Historico_pageController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Historico_page model = new Historico_page();
		model.load();
		Historico_pageView view = new Historico_pageView();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_1(Core.query(null,"SELECT 'Elit mollit labore rem laudant' as nome,'03-01-2015' as data,'hidden-4a9d_a6c9' as id_page "));
		  ----#gen-example */
		/*----#start-code(index)----*/
		
		int id_page = Core.getParamInt("p_id_page");
		
		Action action_page = new Action().findOne(id_page);
		view.sectionheader_1_text.setValue("Histórico de Edições na página: " +action_page.getPage_descr());
		
		try{
			
			List<Historic> histList= new Historic().find().where("page","=",id_page).orderByDesc("data").all();
			List<Historico_page.Table_1> histTable = new ArrayList<>();
			if(histList != null){
				for(Historic historico : histList){
					Historico_page.Table_1 row = new Historico_page.Table_1();
					row.setNome(historico.getNome());
					if (historico.getData() != null) {
						String data = Core.convertLocalDateTimeToString(historico.getData(), "dd-MM-yyyy - HH:mm");
						row.setData(data);
					}
					row.setId_page(historico.getId()+"");
					row.setDescricao(historico.getDescricao());
					histTable.add(row);
				}
			}
			model.setTable_1(histTable);
			}catch(Exception e){
			e.printStackTrace();
			}

		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
		
		
/*----#start-code(custom_actions)----*/


/*----#end-code----*/
}
