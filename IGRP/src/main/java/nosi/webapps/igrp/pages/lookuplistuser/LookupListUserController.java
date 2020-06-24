package nosi.webapps.igrp.pages.lookuplistuser;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/* Start-Code-Block (import) */
/* End-Code-Block */
/*----#start-code(packages_import)----*/
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.function.Function;
import java.util.function.Predicate;
import java.util.ArrayList;
import java.util.Iterator;

import nosi.webapps.igrp.dao.Profile;
import nosi.webapps.igrp.dao.TaskAccess;
import nosi.webapps.igrp.dao.User;
import nosi.webapps.igrp.pages.lookuplistuser.LookupListUser.Table_1;
/*----#end-code----*/

public class LookupListUserController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException {
		LookupListUser model = new LookupListUser();
		model.load();
		LookupListUserView view = new LookupListUserView();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_1(Core.query(null,"SELECT 'werba@example.com' as email_1,'Amet accusantium aperiam molli' as login_1,'Magna lorem aperiam sit perspi' as nome_1,'hidden-6803_e5b9' as id "));
		  ----#gen-example */
		/*----#start-code(index)----*/
		String type = Core.getParam("type");

		List<LookupListUser.Table_1> data = null;
		if (type != null && type.equalsIgnoreCase("my_user")) {
			data = this.getMyUser(model);
			view.form_1.setVisible(false);
		} else {
			data = this.getAllUser(model);
		}
		view.table_1.addData(data);

		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);
	}

	public Response actionPesquisar() throws IOException, IllegalArgumentException, IllegalAccessException {
		LookupListUser model = new LookupListUser();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  return this.forward("igrp","LookupListUser","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(pesquisar)----*/

		/*----#end-code----*/
		return this.redirect("igrp", "LookupListUser", "index", this.queryString());
	}

	/*----#start-code(custom_actions)----*/

	private List<Table_1> getAllUser(LookupListUser model) {
		List<User> users = new User().find().andWhere("user_name", "=", model.getLogin())
				.andWhere("email", "=", model.getEmail()).andWhere("name", "like", model.getNome()).all();
		List<Table_1> data = new ArrayList<>();
		for (User user : users) {
			LookupListUser.Table_1 t = new LookupListUser.Table_1();
			t.setEmail_1(user.getEmail());
			t.setLogin_1(user.getUser_name());
			t.setNome_1(user.getName());
			t.setId("" + user.getId());
			data.add(t);
		}
		return data;
	}

	private List<Table_1> getMyUser(LookupListUser model) {
		List<Table_1> data = new ArrayList<>();
		List<Profile> profiles =new ArrayList<>();
		List<TaskAccess> listAcess = new TaskAccess().find().where("processName", "=", Core.getParam("p_process_name"))
				.andWhere("taskName", "=", Core.getParam("p_task_name")).andWhere("profileType", "notnull").all();		
		
		for (Iterator<TaskAccess> iterator = listAcess.iterator(); iterator.hasNext();) {
			TaskAccess taskAccess = (TaskAccess) iterator.next();
			List<Profile> profs = new Profile().find().andWhere("profileType.id", "=", taskAccess.getProfileType().getId())
					.andWhere("organization.id", "=", taskAccess.getOrganization().getId()).andWhere("type", "=", "PROF").all();
			for (Profile profile : profs) {
				profiles.add(profile);
			}				
		}

//		filter(distinctByKey(b -> b.getUser()))
		
		profiles.stream().filter(distinctByKey(b -> b.getUser().getEmail())).forEach(p -> {
			if(p==null)
				return;
			LookupListUser.Table_1 t = new LookupListUser.Table_1();
			t.setEmail_1(p.getUser().getEmail());
			t.setLogin_1(p.getUser().getUser_name());
			t.setNome_1(p.getUser().getName());
			t.setId("" + p.getUser().getId());
			data.add(t);
		});

//		for(Profile p:profiles){
//			if(p==null)
//				continue;
//			LookupListUser.Table_1 t = new LookupListUser.Table_1();
//			t.setEmail_1(p.getUser().getEmail());
//			t.setLogin_1(p.getUser().getUser_name());
//			t.setNome_1(p.getUser().getName());
//			t.setId(""+p.getUser().getId());
//			data.add(t);
//		}
		return data;
	}

	private static <T> Predicate<T> distinctByKey(Function<? super T, ?> keyExtractor) {
		Map<Object, Boolean> seen = new ConcurrentHashMap<>();
		return t -> seen.putIfAbsent(keyExtractor.apply(t), Boolean.TRUE) == null;
	}
	/*----#end-code----*/
}
