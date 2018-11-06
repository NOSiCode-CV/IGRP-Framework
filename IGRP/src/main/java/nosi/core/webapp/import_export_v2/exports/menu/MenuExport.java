package nosi.core.webapp.import_export_v2.exports.menu;

import java.util.ArrayList;
import java.util.List;
import nosi.core.webapp.Core;
import nosi.core.webapp.import_export_v2.common.OptionsImportExport;
import nosi.core.webapp.import_export_v2.common.serializable.menu.MenuSerializable;
import nosi.core.webapp.import_export_v2.exports.Export;
import nosi.core.webapp.import_export_v2.exports.IExport;
import nosi.webapps.igrp.dao.Menu;

/**
 * Emanuel
 * 31 Oct 2018
 */
public class MenuExport implements IExport{

	private List<MenuSerializable> menus;
	
	public MenuExport() {
		this.menus = new ArrayList<>();
	}
	
	@Override
	public String getFileName() {
		return OptionsImportExport.MENU.getFileName();
	}

	@Override
	public String serialization() {
		return Core.toJsonWithJsonBuilder(this.menus);
	}

	@Override
	public void add(String id) {
		Menu menu = new Menu().findOne(Core.toInt(id));
		MenuSerializable m = new MenuSerializable();
		m.setDad_menu(menu.getApplication().getDad());
		m.setDescr(menu.getDescr());
		m.setFlg_base(menu.getFlg_base());
		m.setOrderby(menu.getOrderby());
		m.setStatus(menu.getStatus());
		m.setTarget(menu.getTarget());
		
		if(menu.getAction()!=null) {
			m.setPage_name(menu.getAction().getPage());
			m.setDad_page(menu.getAction().getApplication().getDad());
		}
		if(menu.getMenu()!=null) {
			MenuSerializable submenu = new MenuSerializable();
			submenu.setDad_menu(menu.getMenu().getApplication().getDad());
			submenu.setDescr(menu.getMenu().getDescr());
			submenu.setFlg_base(menu.getMenu().getFlg_base());
			submenu.setOrderby(menu.getMenu().getOrderby());
			submenu.setStatus(menu.getMenu().getStatus());
			submenu.setTarget(menu.getMenu().getTarget());
			if(menu.getMenu().getAction()!=null) {
				submenu.setPage_name(menu.getMenu().getAction().getPage());
				submenu.setDad_page(menu.getMenu().getAction().getApplication().getDad());
			}
			m.setMenu(submenu);
		}
		this.menus.add(m);		
	}

	@Override
	public void export(Export export, String[] ids) {
		if(ids!=null) {
			for(String id:ids) {
				this.add(id);
			}
			export.add(this);
		}
	}

}
