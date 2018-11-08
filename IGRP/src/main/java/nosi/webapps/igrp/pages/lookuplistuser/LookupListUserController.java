package nosi.webapps.igrp.pages.lookuplistuser;

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import java.util.List;
import java.util.ArrayList;
import nosi.webapps.igrp.dao.Profile;
import nosi.webapps.igrp.dao.User;
import nosi.webapps.igrp.pages.lookuplistuser.LookupListUser.Table_1;
/*----#end-code----*/
		
public class LookupListUserController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		LookupListUser model = new LookupListUser();
		model.load();
		LookupListUserView view = new LookupListUserView();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_1(Core.query(null,"SELECT 'epape@example.com' as email_1,'Accusantium dolor voluptatem r' as login_1,'Accusantium amet deserunt ut s' as nome_1,'1' as id "));
		  ----#gen-example */
		/*----#start-code(index)----*/		
		String type = Core.getParam("type");
		
		
		List<LookupListUser.Table_1> data = null;
		if(type!=null && type.equalsIgnoreCase("my_user")) {
			data = this.getMyUser(model);
		}else {
			data = this.getAllUser(model);
		}
		view.table_1.addData(data);
		view.target = "_blank";
		view.btn_pesquisar.setLink("index");
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	


	public Response actionPesquisar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#start-code(pesquisar)----*/		
		
		/*----#end-code----*/
		
		return this.redirect("igrp","lookuplistuser","index");	
	}
	
	/*----#start-code(custom_actions)----*/

	private List<Table_1> getAllUser(LookupListUser model) {
		List<User> users = new User().find()
				.andWhere("user_name","=",model.getLogin())
				.andWhere("email", "=", model.getEmail())
				.andWhere("name", "like", model.getNome())
				.all();
		List<Table_1> data = new ArrayList<>();
		for(User user:users){
			LookupListUser.Table_1 t = new LookupListUser.Table_1();
			t.setEmail_1(user.getEmail());
			t.setLogin_1(user.getUser_name());
			t.setNome_1(user.getName());
			t.setId(""+user.getId());
			data.add(t);
		}
		return data;
	}

	private List<Table_1> getMyUser(LookupListUser model) {
		List<Profile> profiles = new Profile().find()
					.andWhere("profileType.profiletype", "=",Core.getCurrentProfile())
					.andWhere("organization", "=",Core.getCurrentOrganization())
					.andWhere("type", "=","PROF")
					.all();
		List<Table_1> data = new ArrayList<>();
		for(Profile p:profiles){
			LookupListUser.Table_1 t = new LookupListUser.Table_1();
			t.setEmail_1(p.getUser().getEmail());
			t.setLogin_1(p.getUser().getUser_name());
			t.setNome_1(p.getUser().getName());
			t.setId(""+p.getUser().getId());
			data.add(t);
		}
		return data;
	}
	/*----#end-code----*/
}
