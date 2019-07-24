package nosi.webapps.app_teste.pages.userlist;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
//import nosi.webapps.app_teste.dao.Exemplo;
import nosi.webapps.igrp.dao.CLob;
//this is the component table on the page. The tag is person_table
//import nosi.webapps.app_teste.pages.user_list.Person_list.Person_table;
//dao class maped from db_table person
import nosi.webapps.app_teste.dao.User;
import java.util.ArrayList;
import java.util.List;

/*----#end-code----*/
		
public class UserListController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		UserList model = new UserList();
		model.load();
		UserListView view = new UserListView();
		view.id_user.setParam(true);
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_1(Core.query(null,"SELECT 'Stract doloremque officia doloremque ut' as nome,'Dolor natus rem consectetur aperiam' as morada,'12' as contacto,'hidden-870f_b26c' as id_user,'hidden-ab6d_b354' as file_num "));
		  ----#gen-example */
		/*----#start-code(index)----*/
//		QueryInterface query = Core.query("app_teste_postgresql_1","SELECT id_user as id_user,nome as nome,morada as morada,file as file_num FROM public.utilizador ");
//		
//		model.loadTable_1(query);
//		if(model.getTable_1() != null) {
//			model.getTable_1().forEach(obj->{
//				obj.setFile("app_teste","UserList", "download&file_id="+ obj.getFile_num());
//	 
//			});
//		}

		List<User> userList = new User().findAll();

		if (userList != null) {
			// creating a list of the type person (this is the table on the page)
			List<UserList.Table_1> userTable = new ArrayList<UserList.Table_1>();

			// copying data from personList to personTable
			for (User u : userList) {
				// creating a row for the table
				UserList.Table_1 row = new UserList.Table_1();
				// filling the row
				row.setNome(u.getNome());
				row.setMorada(u.getMorada());
				if(u.getContacto() != null)
				{
				row.setContacto((u.getContacto()));
				}
				row.setId_user(u.getIdUser());

				//row.setFile("app_teste", "UserList", "download&file_id=" + u.getFile());
				// adding row to the table
				userTable.add(row);
			}

			// inserting the table in model
			model.setTable_1(userTable);

		}

		view.id_user.setParam(true);

		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionNew() throws IOException, IllegalArgumentException, IllegalAccessException{
		UserList model = new UserList();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 this.addQueryString("p_id_user",Core.getParam("p_id_user"));
		 return this.forward("app_teste","UserForm","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(new)----*/

		/*----#end-code----*/
		return this.redirect("app_teste","UserForm","index", this.queryString());	
	}
	
	public Response actionUpdate() throws IOException, IllegalArgumentException, IllegalAccessException{
		UserList model = new UserList();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 this.addQueryString("p_id_user",Core.getParam("p_id_user"));
		 return this.forward("app_teste","UserForm","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(update)----*/
		this.addQueryString("target", "_blank");
		this.addQueryString("isEdit", "true");
		this.addQueryString("p_id_user", Core.getParam("p_id_user"));
		/*----#end-code----*/
		return this.redirect("app_teste","UserForm","index", this.queryString());	
	}
	
	public Response actionDelete() throws IOException, IllegalArgumentException, IllegalAccessException{
		UserList model = new UserList();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 this.addQueryString("p_id_user",Core.getParam("p_id_user"));
		 return this.forward("app_teste","UserList","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(delete)----*/
//		ResultSet r = Core.delete("app_teste_postgresql_1","public","user").where("id_user=:id_user")
//				.addInt("id_user",Core.getParamInt("p_id_user"))
//				.execute();
//		if(!r.hasError())
//			Core.setMessageSuccess();
//		else
//			Core.setMessageError();
//		
		User u = new User().findOne(Core.getParamInt("p_id_user"));
		if (u != null && !u.hasError()) {
			boolean del = u.delete(u.getIdUser()); // deleting row from db
			if (del == true)
				Core.setMessageSuccess("User deleted from DB successfully!");
			else
				Core.setMessageError("Error deleting person from DB!");
		} else {
			Core.setMessageError(u.getError().toString());// error getting person from DB
		}

		/*----#end-code----*/
		return this.redirect("app_teste","UserList","index", this.queryString());	
	}
	
	public Response actionVer_perfil() throws IOException, IllegalArgumentException, IllegalAccessException{
		UserList model = new UserList();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 this.addQueryString("p_id_user",Core.getParam("p_id_user"));
		 return this.forward("app_teste","Page_utente","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(ver_perfil)----*/
		
		this.addQueryString("p_id_user",Core.getParam("p_id_user"));
		/*----#end-code----*/
		return this.redirect("app_teste","Page_utente","index", this.queryString());	
	}
	
/*----#start-code(custom_actions)----*/

	public Response actionDownload() throws IOException, IllegalArgumentException, IllegalAccessException {
		int fileId = Core.getParamInt("file_id");
		//System.out.println(fileId + " print!!!");
		CLob c = Core.getFile(fileId);
		byte[] content = c.getC_lob_content();
		String name = c.getName();
		String contentType = c.getMime_type();
		boolean download = false;
		return this.xSend(content, name, contentType, download);
	}

	/*----#end-code----*/
}
