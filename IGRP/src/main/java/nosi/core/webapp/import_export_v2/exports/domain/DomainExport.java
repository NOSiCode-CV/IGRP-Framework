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
	Integer idApp;
	public DomainExport(Integer idApp) {
		this.domains = new ArrayList<>();
		this.idApp=idApp;
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
	public void add(String domainid) {
		DomainSerializable domainS = new DomainSerializable();
		Domain domain = new Domain();
		domain.setReadOnly(true);
		List<Domain> listDomain= domain.find().andWhere("dominio", "=", domainid)
											.andWhere("status", "=", "ATIVE")
											.andWhere("application.id", "=", idApp).orderBy("ordem").all();
		for(Domain dom:listDomain) {
			Core.mapper(dom, domainS);
			this.domains.add(domainS);
		}		
		
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


}
