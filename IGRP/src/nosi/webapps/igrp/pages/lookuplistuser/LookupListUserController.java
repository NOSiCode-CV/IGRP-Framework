/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.lookuplistuser;
/*---- Import your packages here... ----*/
import nosi.core.webapp.Controller;
import nosi.core.config.Config;
import nosi.core.webapp.Igrp;
import java.util.List;
import java.util.ArrayList;
import java.io.IOException;
import nosi.core.webapp.Response;
import nosi.webapps.igrp.dao.User;

/*---- End ----*/

public class LookupListUserController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*---- Insert your code here... ----*/		
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
		Config.target = "_blank";
		return this.renderView(view);
			/*---- End ----*/
	}


	public Response actionPesquisar() throws IOException{
		/*---- Insert your code here... ----*/		
		return this.redirect("igrp","LookupListUser","index");
			/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*//*---- End ----*/
}
