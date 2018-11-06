package nosi.core.webapp.import_export_v2.exports.modulo;

import java.util.ArrayList;
import java.util.List;
import nosi.core.webapp.Core;
import nosi.core.webapp.import_export_v2.common.OptionsImportExport;
import nosi.core.webapp.import_export_v2.common.serializable.modulo.ModuloSerializable;
import nosi.core.webapp.import_export_v2.common.serializable.page.PageSerializable;
import nosi.core.webapp.import_export_v2.exports.Export;
import nosi.core.webapp.import_export_v2.exports.IExport;
import nosi.core.webapp.import_export_v2.exports.page.PageExport;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Modulo;

/**
 * Emanuel
 * 5 Nov 2018
 */
public class ModuloExport extends PageExport implements IExport {

	private List<ModuloSerializable> modulos;
	
	public ModuloExport() {
		this.modulos = new ArrayList<>();
	}
	
	@Override
	public String getFileName() {
		return OptionsImportExport.MODULO.getFileName();
	}

	@Override
	public String serialization() {
		return Core.toJsonWithJsonBuilder(this.modulos);
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

	@Override
	public void add(String id) {
		Modulo m = new Modulo().findOne(Core.toInt(id));
		ModuloSerializable ms = new ModuloSerializable();
		Core.mapper(m, ms);
		ms.setDad_app(m.getApplication().getDad());
		List<Action> actions = new Action().find().andWhere("nomeModulo","=",m.getName()).all();
		List<PageSerializable> pages = new ArrayList<>();
		if(actions!=null) {
			actions.stream().forEach(ac->{
				PageSerializable p = new PageSerializable();
				Core.mapper(ac, p);
				pages.add(p);
				p.setDad(ac.getApplication().getDad());
				this.addConfigFiles(p,ac);
				this.addClassFiles(p,ac);
			});
		}
		ms.setPages(pages);
		this.modulos.add(ms);
	}

}
