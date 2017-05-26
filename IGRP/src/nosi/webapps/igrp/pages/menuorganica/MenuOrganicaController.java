package nosi.webapps.igrp.pages.menuorganica;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import nosi.webapps.igrp.dao.Menu;
import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.igrp.dao.Profile;
import nosi.webapps.igrp.dao.ProfileType;

import java.io.IOException;
import java.util.ArrayList;


public class MenuOrganicaController extends Controller {		

	public void actionIndex() throws IOException{
		String type = Igrp.getInstance().getRequest().getParameter("type");
		String id = Igrp.getInstance().getRequest().getParameter("id");
		if(id!=null && type!=null){
			MenuOrganica model = new MenuOrganica();
			model.setId(id);
			model.setType(type);
			MenuOrganicaView view = new MenuOrganicaView(model);			
			ArrayList<MenuOrganica.Table_1> data = new ArrayList<>();
			Object[] menus = null;
			if(type.equals("org")){
				menus = new Organization().getOrgMenu();
			}else if(type.equals("perfil")){
				ProfileType pt = new ProfileType();
				pt.setId(Integer.parseInt(id));
				ProfileType p = (ProfileType) pt.getOne();
				menus = new Organization().getPerfilMenu(p.getOrg_fk());
			}/*else if(type.equals("user")){
				Profile p = new Profile();
				p.setUser_fk(Integer.parseInt(id));
				p = (Profile) p.getOne();
				menus = new Organization().getUserMenu(p.getOrg_fk());
			}*/
			for(Object obj:menus){
				Menu m = (Menu) obj;
				MenuOrganica.Table_1 table = new MenuOrganica().new Table_1();
				table.setMenu(m.getId());
				Profile prof = new Profile();
				prof.setOrg_fk(Integer.parseInt(id));
				prof.setProf_type_fk(0);
				prof.setUser_fk(0);
				prof.setType_fk(m.getId());
				if(type.equals("perfil")){
					ProfileType pt = new ProfileType();
					pt.setId(Integer.parseInt(id));
					ProfileType p = (ProfileType) pt.getOne();
					prof.setOrg_fk(p.getOrg_fk());
					prof.setProf_type_fk(pt.getId());
				}
				if((type.equals("org") && prof.isInsertedOrgMen()) || (type.equals("perfil") && prof.isInsertedPerfMen())){
					table.setMenu_check(m.getId());
				}else{
					table.setMenu_check(-1);
				}
				table.setDescricao(m.getDescr());
				data.add(table);
			}			
			view.table_1.addData(data);
			this.renderView(view);
		}
	}

	public void actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException, InterruptedException{
		String id = Igrp.getInstance().getRequest().getParameter("id");
		String type = Igrp.getInstance().getRequest().getParameter("type");
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST") && type!=null && id!=null){
			MenuOrganica model = new MenuOrganica();
			model.load();
			Profile profD = new Profile();
			if(type.equals("org")){
				profD.setOrg_fk(Integer.parseInt(id));
				profD.setType("MEN");
				profD.setProf_type_fk(0);
				profD.setUser_fk(0);
				profD.deleteAllOrgProfile();
			}else if(type.equals("perfil")){
				ProfileType pt = new ProfileType();
				pt.setId(Integer.parseInt(id));
				ProfileType p = (ProfileType) pt.getOne();
				profD.setOrg_fk(p.getOrg_fk());
				profD.setType("MEN");
				profD.setUser_fk(0);
				profD.setProf_type_fk(Integer.parseInt(id));
				profD.deleteAllPerfilProfile();
			}
			
			String[] mens = Igrp.getInstance().getRequest().getParameterValues("p_menu");
			if(mens!=null && mens.length>0){
				for(String x:mens){
					Profile prof = new Profile();
					prof.setUser_fk(0);
					if(type.equals("org")){
						prof.setOrg_fk(Integer.parseInt(id));
						prof.setType("MEN");
						prof.setType_fk(Integer.parseInt(x.toString()));
						prof.setProf_type_fk(0);
					}else if(type.equals("perfil")){
						ProfileType pt = new ProfileType();
						pt.setId(Integer.parseInt(id));
						ProfileType p = (ProfileType) pt.getOne();
						prof.setOrg_fk(p.getOrg_fk());
						prof.setType("MEN");
						prof.setType_fk(Integer.parseInt(x.toString()));
						prof.setProf_type_fk(Integer.parseInt(id));
					}
					prof.insert();
				}
			}
			Igrp.getInstance().getFlashMessage().addMessage("success", "Operação realizada com sucesso");
		}
		this.redirect("igrp", "MenuOrganica", "index","id="+id+"&type="+type);
	}
	
	public void actionVoltar() throws IOException{
		this.redirect("igrp","MenuOrganica","index");
	}
	
}