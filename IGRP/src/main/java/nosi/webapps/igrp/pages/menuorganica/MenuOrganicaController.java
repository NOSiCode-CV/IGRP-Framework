package nosi.webapps.igrp.pages.menuorganica;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import nosi.core.webapp.Igrp;
import nosi.webapps.igrp.dao.Menu;
import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.igrp.dao.Profile;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.webapps.igrp.dao.User;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.Comparator;
import nosi.core.webapp.helpers.CheckBoxHelper;
/*----#end-code----*/
		
public class MenuOrganicaController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		MenuOrganica model = new MenuOrganica();
		model.load();
		MenuOrganicaView view = new MenuOrganicaView();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_1(Core.query(null,"SELECT '1' as menu,'Unde magna dolor totam dolor' as descricao,'1' as app "));
		  ----#gen-example */
		/*----#start-code(index)----*/
    
			ArrayList<MenuOrganica.Table_1> data = new ArrayList<>();
			List<Menu> menus = new ArrayList<>();
			int env_fk = Core.getParamInt("env_fk");
			User user = null;
			Profile profile = null;
			if (model.getType().equals("org")) {		
				menus = new Organization().getOrgMenu(env_fk,model.getId());
			} else if (model.getType().equals("perfil")) {
				ProfileType p = Core.findProfileById((model.getId()));
				// ALL PROFILE org has org_fk = null so the org is 1
				if(p.getOrganization()!=null)
				  menus = new Organization().getPerfilMenu(p.getOrganization().getId(),p.getId()); 
				else
				  menus = new Organization().getPerfilMenu(1,p.getId()); 
				//new menu button invisible
                view.btn_novo.setVisible(false);              
			}else if(model.getType().equalsIgnoreCase("user")) {
				profile = new Profile().findOne(model.getId());
		      	user = Core.findUserByEmail(Core.getParam("userEmail"));
		      	if(user!=null && profile!=null)
		      		menus = new Organization().getOrgMenuByUser(profile.getOrganization().getId(),user.getId());
              view.btn_novo.setVisible(false);    
			}
			menus.sort(Comparator.comparing(Menu::getDescr));
			for (Menu m : menus) {
				if (m != null) {
					MenuOrganica.Table_1 table = new MenuOrganica.Table_1();
					table.setMenu(m.getId());
					if (m.isInserted()) {
						table.setMenu_check(m.getId());
					} else {
						table.setMenu_check(-1);
					}
		
					Menu aux = m.find().andWhere("id", "=", m.getId()).one();
					if(aux.getApplication() != null && aux.getApplication().getId() != env_fk) {
						table.setDescricao(m.getDescr() + " [" + aux.getApplication().getDad() + "]");
						table.setApp("public");
						}
					else {
						table.setDescricao(m.getDescr());
						table.setApp("env");
					}
					
					data.add(table);
					data.sort(Comparator.comparing(MenuOrganica.Table_1::getApp));
					
				}
				
			}

			view.table_1.addData(data);

		if (model.getType().equals("org")) {
			view.btn_novo.setLink("igrp","MenuOrganica","novo&env_fk=" + Core.getParam("env_fk"));		
			view.btn_novo.setVisible(true);
		}
		view.btn_gravar.addParameter("env_fk", Core.getParam("env_fk"));
		if(model.getType().equals("user") && user!=null && profile!=null) {
			view.btn_gravar.addParameter("user_id",  user.getId())
							.addParameter("userEmail",  user.getEmail())
							.addParameter("org_id", profile.getOrganization().getId())
							.addParameter("prof_id", profile.getProfileType().getId());
	
		}
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		MenuOrganica model = new MenuOrganica();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","MenuOrganica","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(gravar)----*/

		if (Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST") ) {
			this.saveMenu(model);
		}
		this.addQueryString("env_fk", Core.getParam("env_fk"));		
		if(model.getType().equals("user"))	
			this.addQueryString("userEmail",Core.getParam("userEmail"));			
			return this.forward("igrp", "MenuOrganica", "index", this.queryString());			
			
		
		/*----#end-code----*/
			
	}
	
	public Response actionNovo() throws IOException, IllegalArgumentException, IllegalAccessException{
		MenuOrganica model = new MenuOrganica();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","NovoMenu","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(novo)----*/
		int env_fk = Core.getParamInt("env_fk");
		this.addQueryString("app",env_fk); //to send a query string in the URL
		return this.forward("igrp","NovoMenu","index", this.queryString());		
		/*----#end-code----*/
			
	}
	
/*----#start-code(custom_actions)----*/
	
	private User userAdmin = new User().getUserAdmin();
	private ProfileType profAdmin = new ProfileType().getProfileAdmin();
	
	class SortbyStatus implements Comparator<MenuOrganica.Table_1> {
		public int compare(MenuOrganica.Table_1 a, MenuOrganica.Table_1 b) {
			return b.getMenu() - a.getMenu();
		}

	}

	
	private void saveMenu(MenuOrganica model) {
		String[] p_menu = Core.getParamArray("p_menu");
		String[] p_menu_check = Core.getParamArray("p_menu_check");
		CheckBoxHelper cb = Core.extractCheckBox(p_menu, p_menu_check);
		this.removeMenu(model,cb.getUncheckedIds());		
		this.insetMenu(model,this.filterIds(model,cb.getChekedIds()));
	}

	private void removeMenu(MenuOrganica model, List<String> uncheckedIds) {
			if (model.getType().equals("org")) {
				this.deleteMenu(uncheckedIds, "MEN",model.getId(),this.profAdmin.getId(),this.userAdmin.getId());
				List<ProfileType> profilesOfOrg = new ProfileType().find().andWhere("organization.id", "=", model.getId()).all();
				for(ProfileType p:profilesOfOrg) {
					this.deleteMenu(uncheckedIds, "MEN",p.getOrganization().getId(),p.getId(),this.userAdmin.getId());
				}
			}else if (model.getType().equals("perfil")) {				
				ProfileType pt = new ProfileType().findOne(model.getId());
				this.deleteMenu(uncheckedIds, "MEN",pt.getOrganization().getId(),pt.getId(),this.userAdmin.getId());
			} else if (model.getType().equals("user")) {
				this.deleteMenu(uncheckedIds, "MEN_USER", Core.getParamInt("org_id"), Core.getParamInt("prof_id"), Core.getParamInt("user_id"));
			}	
	}

	private void deleteMenu(List<String> uncheckedIds,String type,int org_id,int prof_id,int user_id) {
		for(String m:uncheckedIds) {
			ResultSet r = Core.delete("tbl_profile")
					.where()
					.andWhere("type", "=", type)
					.andWhere("type_fk", "=", Core.toInt(m))
					.andWhere("prof_type_fk", "=",prof_id)
					.andWhere("user_fk", "=",user_id)
					.andWhere("org_fk", "=", org_id)
					.execute();	
			if(r!=null && r.hasError()) {
				Core.setMessageError(r.getError());
				break;
			}
		}
	}
	
	private void insetMenu(MenuOrganica model, List<String> chekedIds) {
		boolean success=false;
		if (model.getType().equals("org")) {
			 success =this.insertMenu(chekedIds, "MEN", model.getId(),this.profAdmin.getId(),this.userAdmin.getId());
			List<ProfileType> profilesOfOrg = new ProfileType().find().andWhere("organization.id", "=", model.getId()).all();
			for(ProfileType p:profilesOfOrg) {
				success = this.insertMenu(chekedIds, "MEN",p.getOrganization().getId(),p.getId(),this.userAdmin.getId());
			}
			
		}else if (model.getType().equals("perfil")) {				
			ProfileType pt = new ProfileType().findOne(model.getId());
			success = this.insertMenu(chekedIds, "MEN",pt.getOrganization().getId(),pt.getId(),this.userAdmin.getId());
				
		} else if (model.getType().equals("user")) {
			success = this.insertMenu(chekedIds, "MEN_USER", Core.getParamInt("org_id"), Core.getParamInt("prof_id"), Core.getParamInt("user_id"));
		}	
		if(success)
			Core.setMessageSuccess();
		else
			Core.setMessageError();
	}
	
	private List<String> filterIds(MenuOrganica model,List<String> chekedIds){
		List<Profile> profiles = null;
		if (model.getType().equals("org")) {
			profiles = new Profile().find()
				  .andWhere("organization", "=",model.getId())
				  .andWhere("profileType","=",this.profAdmin.getId())
				  .andWhere("type","=","MEN")
				  .andWhere("user","=",this.userAdmin.getId())
				  .all();
		}else if (model.getType().equals("perfil")) {	
			ProfileType pt = new ProfileType().findOne(model.getId());	
			profiles = new Profile().find()
					  .andWhere("organization", "=",pt.getOrganization().getId())
					  .andWhere("profileType","=",pt.getId())
					  .andWhere("type","=","MEN")
					  .andWhere("user","=",this.userAdmin.getId())
					  .all();
		} else if (model.getType().equals("user")) {
			profiles = new Profile().find()
					  .andWhere("organization", "=",Core.getParamInt("org_id"))
					  .andWhere("profileType","=",Core.getParamInt("prof_id"))
					  .andWhere("type","=","MEN_USER")
					  .andWhere("user","=",Core.getParamInt("user_id"))
					  .all();
		}
		List<Integer> ids = profiles!=null?profiles.stream().map(Profile::getType_fk).collect(Collectors.toList()):null;
		return chekedIds.stream().filter(m->ids!=null && !ids.contains(Core.toInt(m))).collect(Collectors.toList());
	}
	
	private boolean insertMenu(List<String> chekedIds,String type,int org_id,int prof_id,int user_id) {
		boolean success = true;
		for(String m:chekedIds) {
			ResultSet r = Core.insert("tbl_profile")
					.addString("type", type)
					.addInt("type_fk", Core.toInt(m))
					.addInt("prof_type_fk", prof_id)
					.addInt("user_fk", user_id)
					.addInt("org_fk", org_id)
					.execute();	
			if(r!=null && r.hasError()) {
				Core.setMessageError(r.getError());
				success = false;
				break;
			}
		}
		return success;
	}
	
	/*----#end-code----*/
}
