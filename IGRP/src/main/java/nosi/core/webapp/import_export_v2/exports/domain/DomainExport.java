package nosi.core.webapp.import_export_v2.exports.domain;

import java.util.ArrayList;
import java.util.List;
import nosi.core.webapp.Core;
import nosi.core.webapp.import_export_v2.common.OptionsImportExport;
import nosi.core.webapp.import_export_v2.common.serializable.domain.DomainSerializable;
import nosi.core.webapp.import_export_v2.exports.Export;
import nosi.core.webapp.import_export_v2.exports.IExport;
import nosi.webapps.igrp.dao.Domain;

/**
 * Emanuel
 * 30 Oct 2018
 */
public class DomainExport implements IExport{

	private List<DomainSerializable> domains;
	
	public DomainExport() {
		this.domains = new ArrayList<>();
	}

	@Override
	public String getFileName() {
		return OptionsImportExport.DOMAIN.getFileName();
	}
	
	@Override
	public String serialization() {
		return Core.toJsonWithJsonBuilder(this.domains);
	}

	@Override
	public void add(String id) {
		DomainSerializable domainS = new DomainSerializable();
		Domain dom = new Domain().findOne(Core.toInt(id));
		Core.mapper(dom, domainS);
		this.domains.add(domainS);
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
