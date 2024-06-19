package nosi.core.webapp.bpmn;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import jakarta.servlet.http.Part;

import nosi.core.webapp.Core;
import nosi.webapps.igrp.dao.TipoDocumentoEtapa;

/**
 * Emanuel
 * 29 Jun 2018
 */
public class ValidateInputDocument {

	/**
	 * Validate if uploaded file for required document type
	 * @param bpm
	 * 			 this parameter is a current controller
	 * @param partFiles
	 * 		     files uploaded
	 * @param runtimeTask 
	 * @return
	 * 			return true if file' s uploaded for required document type
     */
	public static boolean validateRequiredDocument(InterfaceBPMNTask bpm,List<Part> partFiles, RuntimeTask runtimeTask, List<String> errors) {
		List<TipoDocumentoEtapa> list = BPMNHelper.getInputDocumentType(runtimeTask.getTask().getTenantId(),runtimeTask.getTask().getProcessDefinitionKey(),runtimeTask.getTask().getTaskDefinitionKey());
		Map<Integer,TipoDocumentoEtapa> listMap = list.stream().collect(Collectors.toMap(TipoDocumentoEtapa::getId,tp->tp));
		Object[] p_ids = Core.getParamArray("p_formlist_documento_id_tp_doc_fk");	
		if(p_ids != null) {
			p_ids = Arrays.stream(p_ids).filter(Core::isNotNull).toArray();
			if(partFiles != null) {
				List<Part> parts = partFiles.stream().filter(p->p.getName().equalsIgnoreCase("p_formlist_documento_task_documento_fk")).toList();
				for(int i=0;i<p_ids.length;i++) {		
					TipoDocumentoEtapa tp = listMap.get(Core.toInt(p_ids[i].toString())); 	
					if(tp!=null && tp.getRequired()==1 && !validateRequired(parts,i))
						errors.add("Deve fazer upload do ficheiro: "+tp.getTipoDocumento().getNome()); 
				}
			}
		}
		return errors.isEmpty();
	}

	private static boolean validateRequired(List<Part> parts, int index) {
		try {
			if(parts.get(index).getSize()==0)
				return false;
		}catch(NullPointerException | IndexOutOfBoundsException e) {
			return false;
		}
		return true;
	}
}
