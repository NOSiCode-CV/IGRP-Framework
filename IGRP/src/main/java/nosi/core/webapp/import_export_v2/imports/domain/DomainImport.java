package nosi.core.webapp.import_export_v2.imports.domain;

import java.util.List;
import com.google.gson.reflect.TypeToken;
import nosi.core.webapp.Core;
import nosi.core.webapp.import_export_v2.common.serializable.domain.DomainSerializable;
import nosi.core.webapp.import_export_v2.imports.IImport;
import nosi.webapps.igrp.dao.Domain;

/**
 * Emanuel
 * 2 Nov 2018
 */
public class DomainImport  implements IImport{

	private String error;
	private List<DomainSerializable> domains;
	
	@SuppressWarnings("unchecked")
	@Override
	public void deserialization(String jsonContent) {
		if(Core.isNotNull(jsonContent)) {
			this.domains = (List<DomainSerializable>) Core.fromJsonWithJsonBuilder(jsonContent, new TypeToken<List<DomainSerializable>>() {}.getType());
		}
	}

	@Override
	public void execute() {
		if(this.domains!=null) {
			this.domains.stream().forEach(d->{
				Domain dm = new Domain().find().andWhere("dominio", "=",d.getDominio()).one();
				if(dm==null) {
					dm = new Domain(d.getDominio(), d.getValor(), d.getDescription(), d.getStatus(), d.getOrdem());
					dm = dm.insert();
					this.error = dm.hasError()?dm.getError().get(0):null;
				}
			});
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
