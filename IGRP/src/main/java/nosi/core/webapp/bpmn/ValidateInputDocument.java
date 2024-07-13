package nosi.core.webapp.bpmn;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import javax.servlet.http.Part;

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
	 * @param parts_
	 * 		     files uploaded
	 * @return
	 * 			return true if file' s uploaded for required document type
	 * @throws IOException
	 * @throws ServletException
	 */
	public static boolean validateRequiredDocument(InterfaceBPMNTask bpm,List<Part> parts_, RuntimeTask runtimeTask, List<String> errors) throws IOException, ServletException {
		List<TipoDocumentoEtapa> list = BPMNHelper.getInputDocumentType(runtimeTask.getTask().getTenantId(),runtimeTask.getTask().getProcessDefinitionKey(),runtimeTask.getTask().getTaskDefinitionKey());
		Map<Integer,TipoDocumentoEtapa> listMap = list.stream().collect(Collectors.toMap(TipoDocumentoEtapa::getId,tp->tp));
		Object[] p_ids = Core.getParamArray("p_formlist_documento_id_tp_doc_fk");
		if(p_ids != null) {
			p_ids = Arrays.stream(p_ids).filter(Core::isNotNull).toArray();
			if(parts_ != null) {
				String[] p_mostrar = Core.getParamArray("p_formlist_documento_task_mostrar_fk_desc");
				List<Part> parts = parts_.stream().filter(p->p.getName().equalsIgnoreCase("p_formlist_documento_task_documento_fk")).collect(Collectors.toList());
				for(int i=0;i<p_ids.length;i++) {
					TipoDocumentoEtapa tp = listMap.get(Core.toInt(p_ids[i].toString()));
					if(tp!=null && tp.getRequired()==1 && !validateRequired(tp,parts,i,p_mostrar))
						errors.add("Deve fazer upload do ficheiro: "+tp.getTipoDocumento().getNome());
				}
			}
		}
		return errors.isEmpty();
	}

	private static boolean validateRequired(TipoDocumentoEtapa tp, List<Part> parts, int index, String[] p_mostrar) {
		try {
			if(parts.get(index).getSize()==0 && p_mostrar[index].isEmpty())
				return false;
		}catch(NullPointerException | IndexOutOfBoundsException e) {
			return false;
		}
		return true;
	}
}
