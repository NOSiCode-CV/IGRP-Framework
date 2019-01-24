package nosi.core.webapp.import_export_v2.imports.menu;

import java.util.HashMap;
import java.util.List;
import com.google.gson.reflect.TypeToken;
import nosi.core.webapp.Core;
import nosi.core.webapp.import_export_v2.common.serializable.menu.MenuSerializable;
import nosi.core.webapp.import_export_v2.imports.IImport;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Menu;
import nosi.core.webapp.import_export_v2.imports.AbstractImport;

/**
 * Emanuel
 * 2 Nov 2018
 */
public class MenuImport extends AbstractImport implements IImport{

	private List<MenuSerializable> menu;
	private Application application;
	
	public MenuImport(Application application) {
		this.application = application;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public void deserialization(String jsonContent) {
		
		if(Core.isNotNull(jsonContent)) {
			this.menu = (List<MenuSerializable>) Core.fromJsonWithJsonBuilder(jsonContent, new TypeToken<List<MenuSerializable>>(){}.getType());
		}
	}

	@Override
	public void execute() {
		if(this.menu!=null) {
			this.menu.stream().forEach(m->{
				Application app = Core.findApplicationByDad(m.getDad_menu());
				if(app!=null) {
					HashMap<Integer, String> actions = new Action().getListActions(app.getId());
					if(m.getMenu()!=null) {
						final Action action = new Action().findByPage(m.getPage_name(), m.getDad_page());
						if(actions.containsKey(action.getId())) {
	//					The action/page is really shared with the app in the import environment
							if(Core.isNull(m.getMenu().getDad_page())) 
	//							Son, insert the parent if not already
								this.insertMenu(m.getMenu(),null);
							this.insertMenu(m,action);
							
						}									
					}else {
						//Is Parent					
						this.insertMenu(m,null);
					}
				}
			});
		}
	}

	private void insertMenu(MenuSerializable m,Action action) {
		Menu new_menu = new Menu();
		Core.mapper(m, new_menu);
		if(this.application!=null) {
			new_menu.setApplication(this.application);
		}else {
			new_menu.setApplication(Core.findApplicationByDad(m.getDad_menu()));
		}
		new_menu.setAction(action);
		if (Core.isNotNull(action)) {
//			Menu is son or orphan
			if (Core.isNull(new Menu().find().andWhere("application.id", "=", new_menu.getApplication().getId())
					.andWhere("action", "=", new_menu.getAction().getId())
					.andWhere("descr", "=", new_menu.getDescr()).one())){
//				The item is realy new, so insert it
				if(Core.isNotNull(m.getMenu().getPage_name())){
//					Orphan has itself parent
					new_menu.setMenu(new_menu);
				}else {
//					Son with parent
					new_menu.setMenu(new Menu().find().andWhere("application.dad", "=", m.getMenu().getDad_menu())						
						.andWhere("descr", "=", m.getMenu().getDescr()).one()); //find and set the parent menu to the son
				}				
				new_menu = new_menu.insert();
				this.addError(new_menu.hasError()?new_menu.getError().get(0):null);
			}
		} else {
			//Menu is Parent
			if (Core.isNull(new Menu().find().andWhere("application.id", "=", new_menu.getApplication().getId())
					.andWhere("descr", "=", new_menu.getDescr()).one())) {
//				The item parent is realy new, so insert it
				new_menu = new_menu.insert();
				this.addError(new_menu.hasError()?new_menu.getError().get(0):null);
			}
		}			
	}

}
