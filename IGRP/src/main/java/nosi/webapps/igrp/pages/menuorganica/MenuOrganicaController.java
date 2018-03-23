
package nosi.webapps.igrp.pages.menuorganica;

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import static nosi.core.i18n.Translator.gt;
import nosi.core.webapp.Response;
import nosi.core.webapp.databse.helpers.QueryHelper;

/*----#start-code(packages_import)----*/
import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.Response;
import nosi.webapps.igrp.dao.Menu;
import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.igrp.dao.Profile;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.webapps.igrp.dao.User;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
/*----#end-code----*/



public class MenuOrganicaController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		MenuOrganica model = new MenuOrganica();
		MenuOrganicaView view = new MenuOrganicaView();
		model.load();
		
		/*----#gen-example
		This is an example of how you can implement your code:
		
		model.loadTable_1( Core.query( "SELECT 'menu' as menu,'descricao' as descricao " ) );
		
		----#gen-example */
		
		/*----#start-code(index)----*/
      String type = Igrp.getInstance().getRequest().getParameter("type");
		String id = Igrp.getInstance().getRequest().getParameter("id");
      
		if(Core.isNotNull(id) && Core.isNotNull(type) && !id.equals("null")) {
			model.setP_id(Integer.parseInt(id));
			model.setP_type(type);
		ArrayList<MenuOrganica.Table_1> data = new ArrayList<>();
			List<Menu> menus = new ArrayList<>();
			if (type.equals("org")) {
				String env_fk = Igrp.getInstance().getRequest().getParameter("env_fk");
				menus = new Organization().getOrgMenu(Integer.parseInt(env_fk));
			} else if (type.equals("perfil")) {
				ProfileType p = new ProfileType().findOne(Integer.parseInt(id));
				menus = new Organization().getPerfilMenu(p.getOrganization() != null ? p.getOrganization().getId() : 1);
			}
			for (Menu m : menus) {
				if (m != null) {
					MenuOrganica.Table_1 table = new MenuOrganica.Table_1();
					table.setMenu(m.getId());
					Profile prof = new Profile();
					prof.setOrganization(new Organization().findOne(Integer.parseInt(id)));
					prof.setProfileType(new ProfileType().findOne(0));
					prof.setUser(new User().findOne(0));
					prof.setType_fk(m.getId());
					if (type.equals("perfil")) {
						ProfileType p = new ProfileType().findOne(Integer.parseInt(id));
						prof.setOrganization(p.getOrganization());
						prof.setProfileType(new ProfileType().findOne(p.getId()));
					}
					if ((type.equals("org") && prof.isInsertedOrgMen())
							|| (type.equals("perfil") && prof.isInsertedPerfMen())) {
						table.setMenu_check(m.getId());
					} else {
						table.setMenu_check(-1);
					}
					table.setDescricao(m.getDescr());
					data.add(table);
				}
			}

			view.table_1.addData(data);

		}
		view.btn_gravar.setLink("gravar&id=" + model.getP_id() + "&type=" + model.getP_type());			
		view.btn_novo.setVisible(type.equals("org"));
 
		/*----#end-code----*/
		
		
		view.setModel(model);
		
		return this.renderView(view);
		
	}

	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		MenuOrganica model = new MenuOrganica();
		model.load();
		
		/*----#gen-example
		This is an example of how you can implement your code:
		
		if(model.save(model)){
			Core.setMessageSuccess();
		 }else{
			Core.setMessageError();
		 return this.forward("igrp","MenuOrganica","index");
		}
		
		----#gen-example */
		
		/*----#start-code(gravar)----*/
		String id = Igrp.getInstance().getRequest().getParameter("id");
		String type = Igrp.getInstance().getRequest().getParameter("type");
		List<ProfileType> list = null;

		Organization organization1 = new Organization();
		Organization organization2 = new Organization();
		if (Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST") && Core.isNotNull(id) && Core.isNotNull(type)) {
			Profile profD = new Profile();
			if (type.equals("org")) {
				organization1 = new Organization().findOne(Integer.parseInt(id));
				organization2 = organization1.find().andWhere("application.id", "=", Integer.parseInt(id));
				profD.setOrganization(organization1);
				profD.setType("MEN");
				profD.setProfileType(new ProfileType().findOne(0));
				profD.setUser(new User().findOne(0));
				profD.deleteAllProfile();
			
				list = new ProfileType().find().andWhere("organization.id", "=", organization1.getId()).all();
				if (list != null && list.size() > 0) {
					list.sort((o1, o2) -> {
						if (o1.getId() > o2.getId())
							return 1;
						else if (o1.getId() < o2.getId())
							return -1;
						return 0;
					});
					ProfileType pAux = list.get(0);
					Profile pAux2 = new Profile();
					pAux2.setOrganization(organization1);
					pAux2.setType("MEN");
					pAux2.setUser(new User().findOne(0));
					pAux2.setProfileType(pAux);
					pAux2.deleteAllProfile();
				}
				
			} else if (type.equals("perfil")) {
				ProfileType pt = new ProfileType().findOne(Integer.parseInt(id));
				profD.setOrganization(pt.getOrganization());
				profD.setType("MEN");
				profD.setUser(new User().findOne(0));
				profD.setProfileType(pt);
				profD.deleteAllProfile();
			}

			String[] mens = Igrp.getInstance().getRequest().getParameterValues("p_menu");
			if (mens != null && mens.length > 0) {
				for (String x : mens) {
					Profile prof = new Profile();
					prof.setUser(new User().findOne(0));
					prof.setType("MEN");
					prof.setType_fk(Integer.parseInt(x.toString()));
					if (type.equals("org")) {
						Organization aux = new Organization().findOne(Integer.parseInt(id));
						prof.setOrganization(aux);
						prof.setProfileType(new ProfileType().findOne(0));

						/**  **/
						list = new ProfileType().find().andWhere("organization.id", "=", aux.getId()).all();
						if (list != null && list.size() > 0) {
							list.sort((o1, o2) -> {
								if (o1.getId() > o2.getId())
									return 1;
								else if (o1.getId() < o2.getId())
									return -1;
								return 0;
							});
							ProfileType pAux = list.get(0);
							Profile pAux2 = new Profile();
							pAux2.setUser(new User().findOne(0));
							pAux2.setType("MEN");
							pAux2.setType_fk(Integer.parseInt(x.toString()));
							pAux2.setOrganization(aux);
							pAux2.setProfileType(pAux);
							pAux2.insert();
						}
						/**  **/

					} else if (type.equals("perfil")) {
						ProfileType p = new ProfileType().findOne(Integer.parseInt(id));
						prof.setOrganization(p.getOrganization());
						prof.setProfileType(new ProfileType().findOne(Integer.parseInt(id)));
					}
					prof = prof.insert();
				}
			}
			Core.setMessageSuccess();
		}
		if (type.equals("org"))
			return this.redirect("igrp", "MenuOrganica", "index",
					"id=" + id + "&type=" + type + "&env_fk=" + organization2.getApplication().getId());
		else if (type.equals("perfil"))          
			return this.redirect("igrp", "MenuOrganica", "index", "id=" + id + "&type=" + type);
		/*----#end-code----*/
		
		return this.redirect("igrp","MenuOrganica","index");
		
	}
	public Response actionNovo() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		MenuOrganica model = new MenuOrganica();
		model.load();
		
		/*----#gen-example
		This is an example of how you can implement your code:
		
		if(model.save(model)){
			Core.setMessageSuccess();
		 }else{
			Core.setMessageError();
		 return this.forward("igrp","NovoMenu","index");
		}
		
		----#gen-example */
		
		/*----#start-code(novo)----*/
		if(model.save(model)){
			Core.setMessageSuccess();
		 }else{
			Core.setMessageError();
			 return this.forward("igrp","NovoMenu","index");
		}
		/*----#end-code----*/
		
		return this.redirect("igrp","NovoMenu","index");
		
	}
	
	/*----#start-code(custom_actions)----*/

	/*----#end-code----*/
	
	
	
	
}
