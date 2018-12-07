package nosi.core.webapp.import_export_v2.imports.menu;

import java.util.List;
import com.google.gson.reflect.TypeToken;
import nosi.core.webapp.Core;
import nosi.core.webapp.import_export_v2.common.serializable.menu.MenuSerializable;
import nosi.core.webapp.import_export_v2.imports.IImport;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Menu;

/**
 * Emanuel
 * 2 Nov 2018
 */
public class MenuImport implements IImport{

	private List<MenuSerializable> menu;
	private Application application;
	private String error;
	
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
				Action action = new Action();
				if(m.getMenu()!=null) {
					action = action.find()
							.andWhere("application.dad", "=",m.getMenu().getDad_page())
							.andWhere("page", "=",m.getMenu().getPage_name())
							.one();
					this.insertMenu(m.getMenu(),action);
				}else {
					//Is Parent
					if(Core.isNotNull(m.getDad_page()))
						action = action.find()
							.andWhere("application.dad", "=", m.getDad_page())
							.andWhere("page", "=",m.getPage_name())
							.one();
					else
						action=null;
					this.insertMenu(m,action);
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
				new_menu.setApplication(new Application().findByDad(m.getDad_menu()));
			}
			new_menu.setAction(action);
			if (Core.isNotNull(new_menu.getAction())) {
				if (Core.isNull(new Menu().find().andWhere("application.id", "=", new_menu.getApplication().getId())
						.andWhere("action", "=", new_menu.getAction().getId()).andWhere("descr", "=", new_menu.getDescr())
						.one())) {
					new_menu = new_menu.insert();
					this.addError(new_menu.hasError()?new_menu.getError().get(0):null);
				}

			} else {
				//Menu is Parent
				if (Core.isNull(new Menu().find().andWhere("application.id", "=", new_menu.getApplication().getId())
						.andWhere("descr", "=", new_menu.getDescr()).one())) {
					new_menu = new_menu.insert();
					this.addError(new_menu.hasError()?new_menu.getError().get(0):null);
				}

			}
	
			
			
	}

	@Override
	public void addError(String error) {
		if(Core.isNotNull(error))
			this.error = error;
	}

	@Override
	public String getError() {
		return this.error;
	}

}
