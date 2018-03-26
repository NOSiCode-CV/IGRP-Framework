
package nosi.webapps.igrp.pages.transaccao;

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import static nosi.core.i18n.Translator.gt;
import nosi.core.webapp.Response;
import nosi.core.webapp.databse.helpers.QueryHelper;

/*----#start-code(packages_import)----*/
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.Response;
import nosi.core.webapp.Core;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Transaction;
import java.io.IOException;
import java.util.ArrayList;
import org.json.JSONException;
import org.json.JSONObject;
import com.google.gson.Gson;
import java.util.List;
/*----#end-code----*/



public class TransaccaoController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		Transaccao model = new Transaccao();
		TransaccaoView view = new TransaccaoView();
		model.load();
		
		/*----#gen-example
		This is an example of how you can implement your code:
		
		model.loadTable_1( Core.query( "SELECT 'status' as status,'descricao' as descricao,'codigo' as codigo " ) );
		view.aplicacao.setSqlQuery(null,"SELECT 'id' as ID,'name' as NAME ");view.codigo.setParam(true);
		
		----#gen-example */
		
		/*----#start-code(index)----*/
		
		ArrayList<Transaccao.Table_1> table_1 = new ArrayList<>();
		Transaction trans = new Transaction();				
	
		List<Transaction> list =trans.find()
				.andWhere("application", "=", Core.isNotNull(model.getAplicacao())?Integer.parseInt(model.getAplicacao()):null)
				.andWhere("code", "=", Core.isNotNull(model.getFiltro_codigo())?model.getFiltro_codigo():null)
				.all();
		for(Transaction t:list){
			Transaccao.Table_1 table = new Transaccao.Table_1();
			table.setCodigo(t.getCode());
			table.setDescricao(t.getDescr());
			int check = t.getStatus() == 1 ? t.getStatus() : -1;
            table.setStatus(t.getStatus());
          	table.setStatus_check(check);
			table_1.add(table);
		}		
		

		view.aplicacao.setValue(new Application().getListApps());
//		view.organica.setValue(new Organization().getListMyOrganizations());
		view.table_1.addData(table_1);
		view.codigo.setParam(true);	
		/*----#end-code----*/
		
		
		view.setModel(model);
		
		return this.renderView(view);
		
	}

	public Response actionEditar() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		Transaccao model = new Transaccao();
		model.load();
		
		/*----#gen-example
		This is an example of how you can implement your code:
		
		if(model.save(model)){
			Core.setMessageSuccess();
		 }else{
			Core.setMessageError();
		 return this.forward("igrp","Transaccao","index");
		}
		
		----#gen-example */
		
		/*----#start-code(editar)----*/
    String codigo = Core.getParam("codigo");
      if(codigo!=null && !codigo.equals(""))
			return this.redirect("igrp", "EditarTransacao", "index&codigo="+codigo);
		else
			Core.setMessageError();
		/*----#end-code----*/
		
		return this.redirect("igrp","Transaccao","index");
		
	}
	public Response actionEliminar() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		Transaccao model = new Transaccao();
		model.load();
		
		/*----#gen-example
		This is an example of how you can implement your code:
		
		if(model.save(model)){
			Core.setMessageSuccess();
		 }else{
			Core.setMessageError();
		 return this.forward("igrp","Transaccao","index");
		}
		
		----#gen-example */
		
		/*----#start-code(eliminar)----*/
		String code = Core.getParam("codigo");
		Transaction t = new Transaction();
		t = t.find().andWhere("code", "=", code).one();
		if(t.delete(t.getId()))
			Core.setMessageSuccess();
		else
			Core.setMessageError();
		/*----#end-code----*/
		
		return this.redirect("igrp","Transaccao","index");
		
	}
	
	/*----#start-code(custom_actions)----*/
	public Response actionChangeStatus() throws IOException, IllegalArgumentException, IllegalAccessException, JSONException {

		this.format = Response.FORMAT_JSON;		
		String code = Igrp.getInstance().getRequest().getParameter("p_code");
		String status = Igrp.getInstance().getRequest().getParameter("p_status");
		
		boolean response = false;

		if (Core.isNotNull(code)) {
			Transaction t = new Transaction();
			t.setCode(code);
			t = t.find().andWhere("code", "=", code).one();
			if(t!=null){
				t.setStatus(Integer.parseInt(status));
				if (t.update() != null)
					response = true;
			}
		}

		JSONObject json = new JSONObject();
		json.put("status", response);
		Gson res = new Gson();
		res.toJson(json);

		return this.renderView(json.toString());
	}
	/*----#end-code----*/
	
	
	
	
}
