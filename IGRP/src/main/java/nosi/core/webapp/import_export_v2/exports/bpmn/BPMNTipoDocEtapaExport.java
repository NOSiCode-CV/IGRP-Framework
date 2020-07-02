package nosi.core.webapp.import_export_v2.exports.bpmn;

import java.util.ArrayList;
import java.util.List;

import nosi.core.webapp.Core;
import nosi.core.webapp.import_export_v2.common.OptionsImportExport;
import nosi.core.webapp.import_export_v2.common.serializable.bpmn.BPMNTipoDocEtapaSerializable;
import nosi.core.webapp.import_export_v2.exports.Export;
import nosi.core.webapp.import_export_v2.exports.IExport;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.TipoDocumentoEtapa;

/**
 * Iekiny Marcel
 * Jun 20, 2020
 */
public class BPMNTipoDocEtapaExport implements IExport{
	
	private List<BPMNTipoDocEtapaSerializable> docEtapa; 
	private Application application; 

	public BPMNTipoDocEtapaExport(Application application) { 
		this.docEtapa = new ArrayList<BPMNTipoDocEtapaSerializable>(); 
		this.application = application; 
	}
	
	@Override
	public String getFileName() { 
		return OptionsImportExport.BPMN_DOCUMENT_TYPE.getFileName(); 
	}

	@Override
	public String serialization() {
		return Core.toJsonWithJsonBuilder(docEtapa);
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
		String []aux = id.split(":"); 
		id = aux[0]; 
		List<TipoDocumentoEtapa> tipoDocumentoEtapas = new TipoDocumentoEtapa().find().andWhere("status", "=", 1).andWhere("processId", "=", id).all(); 
		if(tipoDocumentoEtapas != null) {
			for(TipoDocumentoEtapa tipoDocumentoEtapa : tipoDocumentoEtapas) {
				BPMNTipoDocEtapaSerializable bpmnTipoDocEtapaSerializable = new BPMNTipoDocEtapaSerializable(); 
				bpmnTipoDocEtapaSerializable.setProcessId(tipoDocumentoEtapa.getProcessId()); 
				bpmnTipoDocEtapaSerializable.setRequired(tipoDocumentoEtapa.getRequired()); 
				bpmnTipoDocEtapaSerializable.setStatus(tipoDocumentoEtapa.getStatus()); 
				bpmnTipoDocEtapaSerializable.setTaskId(tipoDocumentoEtapa.getTaskId()); 
				bpmnTipoDocEtapaSerializable.setTipo(tipoDocumentoEtapa.getTipo()); 
				if(tipoDocumentoEtapa.getRepTemplate() != null)
					bpmnTipoDocEtapaSerializable.setReportCode(tipoDocumentoEtapa.getRepTemplate().getCode()); 
				if(tipoDocumentoEtapa.getTipoDocumento() != null)
					bpmnTipoDocEtapaSerializable.setTipoDocCode(tipoDocumentoEtapa.getTipoDocumento().getCodigo()); 
				if(application != null) 
					bpmnTipoDocEtapaSerializable.setAppCode(application.getDad()); 
				this.docEtapa.add(bpmnTipoDocEtapaSerializable);
			}
		}
	}

}
