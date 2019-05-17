package nosi.webapps.igrp.pages.consulta_auditoria_detalhes;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import java.io.IOException;

import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/

import nosi.webapps.igrp.dao.Auditoria; 

import java.util.ArrayList;

import org.json.JSONObject;
import org.json.XML;

/*----#end-code----*/
		
public class Consulta_auditoria_detalhesController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Consulta_auditoria_detalhes model = new Consulta_auditoria_detalhes();
		model.load();
		Consulta_auditoria_detalhesView view = new Consulta_auditoria_detalhesView();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_1(Core.query(null,"SELECT 'Rem labore iste deserunt sed accusantium totam ist' as coluna,'Sit lorem doloremque sit mollit magna sit aperiam omnis mollit accusantium iste anim deserunt accusantium deserunt omnis natus ut aliqua unde rem sit lorem totam' as antigo,'Natus anim ut dolor rem aliqua aperiam perspiciatis totam elit aperiam dolor deserunt ipsum voluptatem dolor mollit iste voluptatem sed ut voluptatem aperiam magna unde' as novo "));
		  ----#gen-example */
		/*----#start-code(index)----*/
		
		String p_id = Core.getParam("p_id"); 
		
		Auditoria auditoria = new Auditoria().findOne(Core.toInt(p_id)); 
		
		model.setTable_1(new ArrayList<>()); 
		
		if(auditoria != null) {
			model.setAccao(auditoria.getAction()); 
			model.setContexto(auditoria.getUserContext());
			
			try {
				model.setUtilizador(Core.findUserById(Core.toInt(auditoria.getUserId())).getUser_name());
			} catch (Exception e) {
				model.setUtilizador("");
			}
			
			model.setTabela(auditoria.getTableId());
			model.setIp(auditoria.getUserIp());
			model.setData(auditoria.getDateAction() + "");
			
			try {
				
				JSONObject old = XML.toJSONObject(auditoria.getXmlOld());
				JSONObject novo = XML.toJSONObject(auditoria.getXmlNew()); 
				
				old = old.getJSONObject("row"); 
				novo = novo.getJSONObject("row");
				
				for(String k : old.keySet()) {
					Consulta_auditoria_detalhes.Table_1 row = new Consulta_auditoria_detalhes.Table_1(); 
					row.setAntigo("" + old.get(k));
					row.setColuna("" + k);
					row.setNovo("" + novo.get(k));
					
					model.getTable_1().add(row);
				}
				
			} catch (Exception e) {
			}
			
			
		}
		
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
/*----#start-code(custom_actions)----*/


/*----#end-code----*/
}
