package nosi.core.webapp.bpmn;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import javax.servlet.http.Part;
import nosi.core.webapp.Core;
import nosi.core.webapp.Igrp;
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
	 * @return
	 * 			return true if file' s uploaded for required document type
	 * @throws IOException
	 * @throws ServletException
	 */
	public static boolean validateRequiredDocument(InterfaceBPMNTask bpm) throws IOException, ServletException {
		List<TipoDocumentoEtapa> list = BPMNHelper.getInputDocumentType(Core.getParam("processDefinition",false), Core.getParam("taskDefinition",false), Core.getParamInt("appId"));
		Map<Integer,TipoDocumentoEtapa> listMap = list.stream().collect(Collectors.toMap(TipoDocumentoEtapa::getId,tp->tp));
		boolean result = true;
		if(listMap!=null) {
			String[] p_ids = Core.getParamArray("p_formlist_documento_id_tp_doc_fk");
			List<Part> parts = (List<Part>) Igrp.getInstance().getRequest().getParts();
			if(parts!=null) {
				parts = parts.stream().filter(p->p.getName().equalsIgnoreCase("p_formlist_documento_task_documento_fk")).collect(Collectors.toList());
			}
			for(int i=0;i<p_ids.length;i++) {				
				TipoDocumentoEtapa tp = listMap.get(Core.toInt(p_ids[i]));
				if(tp.getRequired()==1 && !validateRequired(tp,parts,i)){
					result  = false;
					Core.setMessageError("Deve fazer upload do ficheiro: "+tp.getTipoDocumento().getNome());
				}
			}
			if(parts!=null) {
				parts.stream().forEach(p->{
					try {
						p.delete();
					} catch (IOException e) {
						e.printStackTrace();
					}
				});
			}
		}
		return result;
	}

	private static boolean validateRequired(TipoDocumentoEtapa tp, List<Part> parts, int index) {
		try {
			if(parts.get(index).getSize()==0)
				return false;
		}catch(NullPointerException | IndexOutOfBoundsException e) {
			return false;
		}
		return true;
	}
}
