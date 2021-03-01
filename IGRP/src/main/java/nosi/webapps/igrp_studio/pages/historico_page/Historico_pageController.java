package nosi.webapps.igrp_studio.pages.historico_page;

import nosi.core.webapp.Controller;//
import nosi.core.webapp.databse.helpers.ResultSet;//
import nosi.core.webapp.databse.helpers.QueryInterface;//
import java.io.IOException;//
import nosi.core.webapp.Core;//
import nosi.core.webapp.Response;//
/* Start-Code-Block (import) */
/* End-Code-Block */
/*----#start-code(packages_import)----*/

import java.util.ArrayList;
import java.util.List;

import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Historic;
/*----#end-code----*/
		
public class Historico_pageController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Historico_page model = new Historico_page();
		model.load();
		Historico_pageView view = new Historico_pageView();
		view.id_historico_tbl.setParam(true);
		view.id_page.setParam(true);
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_1(Core.query(null,"SELECT 'Anim natus mollit consectetur' as nome,'Labore omnis rem iste ipsum' as descricao,'Aliqua voluptatem consectetur ipsum unde' as comentario_tbl,'04-02-2016' as data,'hidden-ad17_64d9' as id_historico_tbl,'hidden-439d_a845' as id_page "));
		  ----#gen-example */
		/*----#start-code(index)----*/
		
		if (Core.isNotNull(Core.getParamInt("p_id_page"))) {
			int id_page = Core.getParamInt("p_id_page");
			model.setId_page_form(id_page+"");
			Action action_page = new Action().findOne(id_page);
			view.sectionheader_1_text.setValue("Histórico de Edições na página: " + action_page.getPage_descr());

			List<Historic> histList = new Historic().find().where("page", "=", id_page).orderByDesc("data").all();
			List<Historico_page.Table_1> histTable = new ArrayList<>();
			if (histList != null) {
				for (Historic historico : histList) {
					Historico_page.Table_1 row = new Historico_page.Table_1();
					row.setNome(historico.getNome());
					if (historico.getData() != null) {
						String data = Core.convertLocalDateTimeToString(historico.getData(), "dd-MM-yyyy - HH:mm");
						row.setData(data);
					}
					row.setId_historico_tbl(historico.getId() + "");
					row.setComentario_tbl(historico.getComentario());
					row.setDescricao(historico.getDescricao());
					row.setId_page("" + id_page);
					if(!Core.getCurrentUser().getId().equals(historico.getIdUtilizador())){
						row.hiddenButton(view.btn_editar_comentario);
					}
					histTable.add(row);
					
				}
			}
			model.setTable_1(histTable);
		}

		if (Core.isNotNull(Core.getParam("p_id_histo"))) {
			String histor = Core.getParam("p_id_histo");
			Historic coment = new Historic().findOne(Core.toInt(histor));
			model.setDescricao_form(coment.getDescricao());
			model.setComentario(coment.getComentario());
			model.setId_historico("" + coment.getId());
			model.setId_page_form(coment.getPage().getId()+"");
		}
			
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionSalvar() throws IOException, IllegalArgumentException, IllegalAccessException{
		Historico_page model = new Historico_page();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_id_historico_tbl",Core.getParam("p_id_historico_tbl"));
		  this.addQueryString("p_id_page",Core.getParam("p_id_page"));
		  return this.forward("igrp_studio","Historico_page","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(salvar)----*/
		
		if(Core.isNotNull(model.getId_historico())) {
			Historic coment = new Historic().findOne(Core.toInt(model.getId_historico()));
			coment.setComentario(model.getComentario());
			coment.update();	
		}else {
			Core.setMessageError("Não foi Selecionado nenhum histórico!");
			 this.addQueryString("p_id_page",model.getId_page_form());
		}
		 this.addQueryString("p_id_page",model.getId_page_form());
		return this.forward("igrp_studio","Historico_page","index",this.queryString());
		/*----#end-code----*/
			
	}
	
	public Response actionEditar_comentario() throws IOException, IllegalArgumentException, IllegalAccessException{
		Historico_page model = new Historico_page();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_id_historico_tbl",Core.getParam("p_id_historico_tbl"));
		  this.addQueryString("p_id_page",Core.getParam("p_id_page"));
		  return this.forward("igrp_studio","Historico_page","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(editar_comentario)----*/
		 this.addQueryString("p_id_page",Core.getParam("p_id_page"));
		 this.addQueryString("p_id_histo",Core.getParam("p_id_historico_tbl"));
		return this.forward("igrp_studio","Historico_page","index",this.queryString());
		/*----#end-code----*/
			
	}
	
		
		
/*----#start-code(custom_actions)----*/


/*----#end-code----*/
}
