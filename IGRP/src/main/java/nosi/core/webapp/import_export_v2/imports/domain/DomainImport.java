package nosi.core.webapp.import_export_v2.imports.domain;

import java.util.List;
import com.google.gson.reflect.TypeToken;
import nosi.core.webapp.Core;
import nosi.core.webapp.import_export_v2.common.serializable.domain.DomainSerializable;
import nosi.core.webapp.import_export_v2.imports.IImport;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Domain;
import nosi.core.webapp.import_export_v2.imports.AbstractImport;

/**
 * Emanuel
 * 2 Nov 2018
 */
public class DomainImport extends AbstractImport implements IImport{

	private List<DomainSerializable> domains;
	protected Application application;
	
	public DomainImport(Application application) {
		this.application = application;
	}
	
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
				if(this.application==null) {
					this.application = Core.findApplicationByDad(d.getDad());
				}
				Domain dm = new Domain().find().andWhere("dominio", "=",d.getDominio()).andWhere("valor", "=",d.getValor()).andWhere("application.dad", "=",d.getDad()).one();
				if(dm==null) {
					dm = new Domain(d.getDominio(), d.getValor(), d.getDescription(), d.getStatus(), d.getOrdem(),d.getDomainType(),this.application);
					dm = dm.insert();
					this.addError(dm.hasError()?dm.getError().get(0):null);
				}
			});
		}
	}

}
