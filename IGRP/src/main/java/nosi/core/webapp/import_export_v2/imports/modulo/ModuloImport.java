package nosi.core.webapp.import_export_v2.imports.modulo;

import java.util.List;
import com.google.gson.reflect.TypeToken;
import nosi.core.webapp.Core;
import nosi.core.webapp.import_export_v2.common.serializable.modulo.ModuloSerializable;
import nosi.core.webapp.import_export_v2.imports.IImport;
import nosi.core.webapp.import_export_v2.imports.page.PageImport;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Modulo;

/**
 * Emanuel
 * 5 Nov 2018
 */
public class ModuloImport extends PageImport implements IImport {

	private List<ModuloSerializable> modulos;
	
	public ModuloImport(Application application) {
		super(application);
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
					this.addError(m.getError());
				}
				if(modulo.getPages()!=null) {
					modulo.getPages().stream().forEach(page->{
						this.insertPgae(page);
					});
				}
			});
			this.compiler.compile();
			this.addError(this.compiler.getError());			
		}
	}

	@Override
	public void addError(String error) {
		super.addError(error);
	}

	@Override
	public String getError() {
		return super.getError();
	}

	

}
