package nosi.core.webapp.import_export_v2.imports.bpmn;

import java.util.Comparator;
import java.util.List;

import com.google.gson.reflect.TypeToken;

import nosi.core.webapp.Core;
import nosi.core.webapp.import_export_v2.common.serializable.bpmn.BPMNTipoDocEtapaSerializable;
import nosi.core.webapp.import_export_v2.imports.AbstractImport;
import nosi.core.webapp.import_export_v2.imports.IImport;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.RepTemplate;
import nosi.webapps.igrp.dao.TipoDocumento;
import nosi.webapps.igrp.dao.TipoDocumentoEtapa;

/**
 * Iekiny Marcel
 * Jun 20, 2020
 */
public class BPMNTipoDocEtapaImport extends AbstractImport implements IImport {
	
	private List<BPMNTipoDocEtapaSerializable> docEtapa;
	private Application application;
	
	public BPMNTipoDocEtapaImport(Application application) { 
		super();
		this.application = application; 
	}

	@SuppressWarnings("unchecked")
	@Override
	public void deserialization(String jsonContent) {
		if(Core.isNotNull(jsonContent)) {
			this.docEtapa = (List<BPMNTipoDocEtapaSerializable>) Core.fromJson(jsonContent, new TypeToken<List<BPMNTipoDocEtapaSerializable>>() {}.getType());
		}
	}

	@Override
	public void execute() {
		try {
			if(docEtapa != null) { 
				docEtapa.sort(Comparator.comparing(BPMNTipoDocEtapaSerializable::getStatus));
				for(BPMNTipoDocEtapaSerializable _docEtapa : docEtapa) {
						if(_docEtapa.getReportCode() != null) {
							RepTemplate report = new RepTemplate().find().andWhere("code", "=", _docEtapa.getReportCode()).andWhere("application", "=", application).one(); 
							TipoDocumentoEtapa existDao = new TipoDocumentoEtapa().find().andWhere("repTemplate", "=", report)
									.andWhere("tipo", "=", _docEtapa.getTipo()).andWhere("taskId", "=", _docEtapa.getTaskId())
									.andWhere("required", "=", _docEtapa.getRequired())
									.andWhere("processId", "=", _docEtapa.getProcessId()).one(); 
							if(report != null) {
								if(existDao == null) {
									TipoDocumentoEtapa dao = new TipoDocumentoEtapa(); 
									dao.setProcessId(_docEtapa.getProcessId());
									dao.setRequired(_docEtapa.getRequired());
									dao.setStatus(_docEtapa.getStatus());
									dao.setTaskId(_docEtapa.getTaskId());
									dao.setTipo(_docEtapa.getTipo());
									dao.setRepTemplate(report);
									dao=dao.insert(); 
									this.addError(dao.hasError()?dao.getError().get(0):null);
								}else {  
									existDao.setStatus(_docEtapa.getStatus()); 
									existDao=existDao.update(); 
									this.addError(existDao.hasError()?existDao.getError().get(0):null);
								}
							}
						}
						else  
						if(_docEtapa.getTipoDocCode() != null) { 
							TipoDocumento tipoDocumento = new TipoDocumento().find().andWhere("codigo", "=", _docEtapa.getTipoDocCode()).andWhere("application.dad", "=", application).one();  
							TipoDocumentoEtapa existDao = new TipoDocumentoEtapa().find().andWhere("tipoDocumento", "=", tipoDocumento)
									.andWhere("tipo", "=", _docEtapa.getTipo()).andWhere("taskId", "=", _docEtapa.getTaskId())
									.andWhere("required", "=", _docEtapa.getRequired())
									.andWhere("processId", "=", _docEtapa.getProcessId()).one(); 
							if(tipoDocumento != null) {
								if(existDao == null) {
									TipoDocumentoEtapa dao = new TipoDocumentoEtapa(); 
									dao.setProcessId(_docEtapa.getProcessId());
									dao.setRequired(_docEtapa.getRequired());
									dao.setStatus(_docEtapa.getStatus());
									dao.setTaskId(_docEtapa.getTaskId());
									dao.setTipo(_docEtapa.getTipo());
									dao.setTipoDocumento(tipoDocumento);
									dao.insert(); 
									dao=dao.insert(); 
									this.addError(dao.hasError()?dao.getError().get(0):null);
								}else { 
										existDao.setStatus(_docEtapa.getStatus()); 
										existDao.update(); 
										existDao=existDao.update(); 
										this.addError(existDao.hasError()?existDao.getError().get(0):null);
									}
							}	
						}
				} 
			}
		} catch (Exception e) {
			this.addError(e.getMessage()); 
		}
	}

}
