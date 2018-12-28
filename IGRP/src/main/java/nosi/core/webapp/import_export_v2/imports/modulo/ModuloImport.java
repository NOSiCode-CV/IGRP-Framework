package nosi.core.webapp.import_export_v2.imports.modulo;

import java.util.List;
import com.google.gson.reflect.TypeToken;
import nosi.core.webapp.Core;
import nosi.core.webapp.import_export_v2.common.serializable.modulo.ModuloSerializable;
import nosi.core.webapp.import_export_v2.imports.IImport;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Modulo;
import nosi.core.webapp.import_export_v2.imports.AbstractImport;

/**
 * Emanuel
 * 5 Nov 2018
 */
public class ModuloImport extends AbstractImport implements IImport {
	protected Application application;
	private List<ModuloSerializable> modulos;
	
	public ModuloImport(Application application) {
		this.application = application;
	}

	@SuppressWarnings("unchecked")
	@Override
	public void deserialization(String jsonContent) {
		if(Core.isNotNull(jsonContent)){
			this.modulos = (List<ModuloSerializable>) Core.fromJsonWithJsonBuilder(jsonContent, new TypeToken<List<ModuloSerializable>>() {}.getType());
		}
	}

	@Override
	public void execute() {
		if(this.modulos!=null) {
			this.modulos.stream().forEach(modulo->{
				Modulo m = new Modulo().find().andWhere("name","=",modulo.getName()).andWhere("application.dad", "=",modulo.getDad_app()).one();
				if(m==null) {
					if(this.application==null) {
						this.application = new Application().findByDad(modulo.getDad_app());
					}
					m = new Modulo();
					m.setApplication(this.application);
					m.setDescricao(modulo.getDescricao());
					m.setName(modulo.getName());
					m = m.insert();
					this.addError(m.hasError()?m.getError().get(0):null);
				}
			});			
		}
	}	

}
