package nosi.webapps.igrp.pages.listautilizadores;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import nosi.webapps.igrp.dao.User;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.json.JSONObject;
/*----#end-code----*/
		
public class ListautilizadoresController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Listautilizadores model = new Listautilizadores();
		model.load();
		ListautilizadoresView view = new ListautilizadoresView();
		view.username.setParam(true);
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_1(Core.query(null,"SELECT 'username' as username,'nome' as nome,'email' as email,'ativo' as ativo "));
		  ----#gen-example */
		/*----#start-code(index)----*/
		
		List<Listautilizadores.Table_1> lista = new ArrayList<Listautilizadores.Table_1>();
		List<User> users = new User().find().all();
		
		users = users.stream().filter(obj->{
			return !obj.getUser_name().equals("igrpweb@nosi.cv") && !obj.getUser_name().equals("root")  && !obj.getUser_name().equals("demo@nosi.cv");
		}).collect(Collectors.toList());;
		
		if(model.getUsernameemail() != null && !model.getUsernameemail().isEmpty())
			users = users.stream().filter(p -> {
				
				try {
					return p.getUser_name().equals(model.getUsernameemail()) || p.getEmail().equals(model.getUsernameemail());
				}catch(Exception e) {
					
				}
				return false;
				
			}).collect(Collectors.toList());
		
		users.forEach((obj)->{
			Listautilizadores.Table_1 aux = new Listautilizadores.Table_1();
			aux.setNome(obj.getName());
			aux.setEmail(obj.getEmail());
			aux.setUsername(obj.getUser_name());
			if(obj.getStatus() == 0) {
				aux.setAtivo(0);
				aux.setAtivo_check(1);
			}else {
				aux.setAtivo(obj.getStatus());
				aux.setAtivo_check(obj.getStatus());
			}
			
			lista.add(aux);
		});
		
		model.setTable_1(lista);
		
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionPesquisar() throws IOException, IllegalArgumentException, IllegalAccessException{
		Listautilizadores model = new Listautilizadores();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","Listautilizadores","index", this.queryString()); //if submit, loads the values
		  ----#gen-example */
		/*----#start-code(pesquisar)----*/
		
		
		/*----#end-code----*/
		return this.forward("igrp","Listautilizadores","index", this.queryString());	
	}
	
/*----#start-code(custom_actions)----*/

	public Response actionChangeStatus(){
		this.format = Response.FORMAT_JSON;
		String id = Core.getParam("p_id");
		String status = Core.getParam("p_status_page");
		boolean response = false;
		
		try {
			if(id != null) {
				User u = new User().find().andWhere("user_name", "=", id).one();
				if(u != null) {
					u.setStatus(Core.toInt(status));
					u = u.update();
					if(u != null)
						response = true;
				}
			}
		}catch(Exception e) {
			
		}
		
		JSONObject json = new JSONObject();
		json.put("status", response);     
			
		return this.renderView(json.toString());
	}	

/*----#end-code----*/
}
