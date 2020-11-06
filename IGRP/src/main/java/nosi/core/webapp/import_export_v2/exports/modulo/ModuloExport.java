package nosi.core.webapp.import_export_v2.exports.modulo;

import java.util.ArrayList;
import java.util.List;
import nosi.core.webapp.Core;
import nosi.core.webapp.import_export_v2.common.OptionsImportExport;
import nosi.core.webapp.import_export_v2.common.serializable.modulo.ModuloSerializable;
import nosi.core.webapp.import_export_v2.exports.Export;
import nosi.core.webapp.import_export_v2.exports.IExport;
import nosi.webapps.igrp.dao.Modulo;

/**
 * Emanuel
 * 5 Nov 2018
 */
public class ModuloExport implements IExport {

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
				if(Core.isNotNull(id))
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
		this.modulos.add(ms);
	}

}
