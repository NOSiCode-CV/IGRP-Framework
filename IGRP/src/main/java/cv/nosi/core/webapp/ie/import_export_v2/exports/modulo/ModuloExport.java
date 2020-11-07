package cv.nosi.core.webapp.ie.import_export_v2.exports.modulo;

import java.util.ArrayList;
import java.util.List;

import cv.nosi.core.webapp.ie.import_export_v2.common.OptionsImportExport;
import cv.nosi.core.webapp.ie.import_export_v2.common.serializable.modulo.ModuloSerializable;
import cv.nosi.core.webapp.ie.import_export_v2.exports.Export;
import cv.nosi.core.webapp.ie.import_export_v2.exports.IExport;
import cv.nosi.core.webapp.util.Core;
import cv.nosi.webapps.igrp.dao.Modulo;

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
