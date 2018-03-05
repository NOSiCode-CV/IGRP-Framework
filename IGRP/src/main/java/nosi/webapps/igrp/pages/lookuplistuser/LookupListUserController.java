/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.lookuplistuser;

/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import java.util.List;
import java.util.ArrayList;
import java.io.IOException;
import nosi.core.webapp.Response;
import nosi.webapps.igrp.dao.User;
/*----#END-PRESERVED-AREA----*/

public class LookupListUserController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(INDEX)----*/		
		LookupListUser model = new LookupListUser();
		if(Igrp.getInstance().getRequest().getMethod().equalsIgnoreCase("post")){
			model.load();
		}
		List<User> users = new User().find()
				.andWhere("user_name","=",model.getLogin())
				.andWhere("email", "=", model.getEmail())
				.andWhere("name", "like", model.getNome())
				.all();
		List<LookupListUser.Table_1> data = new ArrayList<>();
		for(User user:users){
			LookupListUser.Table_1 t = new LookupListUser.Table_1();
			t.setEmail_1(user.getEmail());
			t.setLogin_1(user.getUser_name());
			t.setNome_1(user.getName());
			t.setP_id(""+user.getId());
			data.add(t);
		}
		LookupListUserView view = new LookupListUserView(model);
		view.table_1.addData(data);
		view.target = "_blank";
		return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/
	}


	public Response actionPesquisar() throws IOException{
		/*----#START-PRESERVED-AREA(PESQUISAR)----*/		
		return this.redirect("igrp","LookupListUser","index");
		/*----#END-PRESERVED-AREA----*/
	}
	
	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
	
	/*----#END-PRESERVED-AREA----*/
}
