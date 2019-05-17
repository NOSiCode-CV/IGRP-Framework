package nosi.webapps.igrp.pages.consulta_auditoria;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;

import java.io.IOException;

import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/

import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Auditoria;
import nosi.webapps.igrp.dao.User;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/*----#end-code----*/
		
public class Consulta_auditoriaController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Consulta_auditoria model = new Consulta_auditoria();
		model.load();
		Consulta_auditoriaView view = new Consulta_auditoriaView();
		view.id.setParam(true);
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_1(Core.query(null,"SELECT 'Consectetur rem totam ut molli' as data,'Unde magna dolor iste perspiciatis deserunt dolor iste omnis amet stract omnis mollit anim sit accus' as utilizador,'Amet accusantium amet ut stract sed stract dolorem' as tabela,'Labore dolor laudantium labore mollit labore magna' as accao,'Rem elit voluptatem doloremque omnis doloremque ut' as contexto,'hidden-99a6_f6a1' as id "));
		view.accao_form.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.aplicacao.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/*----#start-code(index)----*/
		
		view.accao_form.setQuery(Core.query(null,"SELECT 'INSERT' as ID,'INSERT' as NAME union SELECT 'UPDATE' as ID,'UPDATE' as NAME union SELECT 'DELETE' as ID,'DELETE' as NAME"), "--- Escolher Acção ---");
		
		List<Application> l = new Application().findAll();
		Map<String, String> map = new HashMap<String, String>();
		map.put(null, "--- Escolher aplicação ---");
		
		if(l != null)
			for(Application obj : l) 
				map.put("" + obj.getDad(), "(" + obj.getDad() + ") " + obj.getDescription()); 
				
		view.aplicacao.setValue(map); 
		
		Auditoria auditoria = new Auditoria().find(); 
		
		if(model.getText_1() != null && !model.getText_1().isEmpty()) {
			auditoria.andWhere("tableId", "=", model.getText_1());
		}
		
		if(model.getUtilizador_form() != null && !model.getUtilizador_form().isEmpty()) {
			User u = Core.findUserByEmail(model.getUtilizador_form()); 
			if(u != null) 
				auditoria.andWhere("userId", "=", "" + u.getId());
		}
		
		if(model.getAccao_form() != null && !model.getAccao_form().isEmpty()) {
			auditoria.andWhere("action", "=", model.getAccao_form());
		}
		
		if(model.getData_inicio() != null && !model.getData_inicio().isEmpty()) {
			
		}
		
		if(model.getData_fim() != null && !model.getData_fim().isEmpty()) {
			
		}
		
		if(model.getAplicacao() != null && !model.getAplicacao().isEmpty()) {
			auditoria.andWhere("env", "=", model.getAplicacao());
		}
		
		model.setTable_1(new ArrayList<>()); 
		
		List<Auditoria> auditorias = auditoria.all(); 
		
		if(auditorias != null) {
			for(Auditoria obj : auditorias) {
				Consulta_auditoria.Table_1 row = new Consulta_auditoria.Table_1();
				row.setContexto(obj.getUserContext());
				row.setAccao(obj.getAction());
				
				try {
					row.setUtilizador(Core.findUserById(Core.toInt(obj.getUserId())).getUser_name()); 
				} catch (Exception e) {
					row.setUtilizador("");
				}
				
				row.setData(obj.getDateAction() + ""); 
				
				row.setId("" + obj.getId());
				row.setTabela(obj.getTableId()); 
				
				model.getTable_1().add(row); 
			}
		}
		
		
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionPesquisar() throws IOException, IllegalArgumentException, IllegalAccessException{
		Consulta_auditoria model = new Consulta_auditoria();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 this.addQueryString("p_id",Core.getParam("p_id"));
		 return this.forward("igrp","Consulta_auditoria","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(pesquisar)----*/
		
		 return this.forward("igrp","Consulta_auditoria","index"); 
      
		/*----#end-code----*/
			
	}
	
	public Response actionVer_detalhes() throws IOException, IllegalArgumentException, IllegalAccessException{
		Consulta_auditoria model = new Consulta_auditoria();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 this.addQueryString("p_id",Core.getParam("p_id"));
		 return this.forward("igrp","Consulta_auditoria_detalhes","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(ver_detalhes)----*/
		
		this.addQueryString("p_id",Core.getParam("p_id"));
		
		/*----#end-code----*/
		return this.redirect("igrp","Consulta_auditoria_detalhes","index", this.queryString());	
	}
	
/*----#start-code(custom_actions)----*/


/*----#end-code----*/
}
