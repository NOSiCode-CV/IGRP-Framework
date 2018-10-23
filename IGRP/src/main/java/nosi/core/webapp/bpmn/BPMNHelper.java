package nosi.core.webapp.bpmn;

import java.util.List;
import org.apache.commons.lang.StringEscapeUtils;
import nosi.core.config.Config;
import nosi.core.gui.components.IGRPLink;
import nosi.core.webapp.Core;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.activit.rest.HistoricTaskService;
import nosi.core.webapp.activit.rest.TaskVariables;
import nosi.core.webapp.helpers.DateHelper;
import nosi.webapps.igrp.dao.TipoDocumentoEtapa;

/**
 * Emanuel
 * 7 May 2018
 */
public class BPMNHelper {

	public static Object getValue(String type,String name){
		Object value = Igrp.getInstance().getRequest().getParameter("p_"+name.toLowerCase());
		try {
			switch (type.toLowerCase()) {
				case "date":
					return DateHelper.convertDate(value.toString(), "dd-MM-yyyy", "dd-MM-yyyy h:mm");
				case "long":
					if(Core.isNotNull(value))
						return Long.parseLong(value.toString());
					return 0;
				case "double":
					if(Core.isNotNull(value))
						return Double.parseDouble(value.toString());
					return 0;
				case "float":
					if(Core.isNotNull(value))
						return Float.parseFloat(value.toString());
					return 0;
				case "boolean":
					return value.toString().equals("1");
				case "enum":
				case "string":
					return value.toString();
			}
		}catch(NullPointerException e) {}
		return "";
	}
	
	//Add file separator, allow to upload your file
	public static String addFileSeparator(String processDefinition,String taskDefinition,Integer idApp,List<HistoricTaskService> history) {
		DisplayDocmentType display = new DisplayDocmentType();
		List<TipoDocumentoEtapa> listInOutDoc = getInputOutputDocumentType(processDefinition, taskDefinition, idApp, history);
		display.setListDocmentType(listInOutDoc);
		return display.display();
	}
	
	
	public static List<TipoDocumentoEtapa> getInputOutputDocumentType(String processDefinition,String taskDefinition,Integer idApp,List<HistoricTaskService> history) {
		DisplayDocmentType display = new DisplayDocmentType();
		if(history!=null && !history.isEmpty()) {
			
			display.setListDocmentType(getInputDocumentTypeHistory(processDefinition,taskDefinition,history,idApp));
			display.addListDocumentType(getOutputDocumentType(history.get(0).getProcessDefinitionId(),taskDefinition,idApp));
		}else {
			display.setListDocmentType(getInputDocumentType(processDefinition, taskDefinition,idApp));
			display.addListDocumentType(getOutputDocumentType(processDefinition,idApp));
		}
		return display.getListDocmentType();
	}
		
	public static List<TipoDocumentoEtapa> getInputDocumentTypeHistory(String processDefinition, String taskDefinition,List<HistoricTaskService> history,Integer idApp) {
		List<TipoDocumentoEtapa> tipoDocsIN = getInputDocumentType(processDefinition, taskDefinition,idApp);
		if(history!=null && history.size() > 0) {
			List<TaskVariables> variables = history.get(0).getVariables(); 
			if(variables !=null) {
				tipoDocsIN.stream().forEach(doc->{			 			 	
					variables.stream()
					 		 .filter(v->v.getType().equalsIgnoreCase("binary") && v.getName().startsWith(StringEscapeUtils.escapeJava(doc.getTipoDocumento().getNome()).replaceAll("\\\\", "__SCAPE__")))
					 		 .forEach(v->{					 			 
					 			 IGRPLink link = new IGRPLink();
					 			 link.setLink(new Config().getResolveUrl("igrp","Addfiletask","index"));
					 			 link.addParam("taskid",history.get(0).getId());
					 			 link.addParam("filename",v.getName());
					 			 link.setLink_desc("Mostrar");
								 doc.setLink(link);
					 		 });
				});			
			}
		}
		return tipoDocsIN;
	}
	

	public static List<TipoDocumentoEtapa> getInputDocumentType(String processDefinition,String taskDefinition,Integer idApp){
		List<TipoDocumentoEtapa> tipoDocsIN = new TipoDocumentoEtapa()
				.find()
				.andWhere("processId", "=",Core.isNotNull(processDefinition)?processDefinition:"-1")
				.andWhere("taskId", "=",Core.isNotNull(taskDefinition)?taskDefinition:"-1")
				.andWhere("status", "=",1)
				.andWhere("tipo", "=","IN")
				.andWhere("tipoDocumento.application", "=",idApp)
				.all();
		return tipoDocsIN;
	}
	
	public static List<TipoDocumentoEtapa> getOutputDocumentType(String processDefinition,Integer idApp) {
		String previewTask = Core.getParam("previewTask");
		if(Core.isNotNull(previewTask)) {
			return getOutputDocumentType(processDefinition,previewTask,idApp);
		}
		return null;
	}

	public static List<TipoDocumentoEtapa> getOutputDocumentType(String processDefinition,String taskDefinition,Integer idApp) {
		if(processDefinition.contains(":")) {
			processDefinition = processDefinition.substring(0,processDefinition.indexOf(":"));
		}
		List<TipoDocumentoEtapa> tipoDocs = null;
		tipoDocs = new TipoDocumentoEtapa()
				.find()
				.andWhere("processId", "=",Core.isNotNull(processDefinition)?processDefinition:"-1")
				.andWhere("taskId", "=",Core.isNotNull(taskDefinition)?taskDefinition:"-1")
				.andWhere("status", "=",1)
				.andWhere("tipo", "=","OUT")
				.andWhere("repTemplate", "notnull")
				.andWhere("repTemplate.application", "=",idApp)
				.all();		
		tipoDocs.stream().forEach(t->{
			 IGRPLink link = new IGRPLink(Core.getLinkReport(t.getRepTemplate().getCode()).addParam("taskId", getCurrentTaskId()));
 			 link.setLink_desc("Mostrar");
			 t.setLink(link);
		});
		return tipoDocs;
	}

	private static String getCurrentTaskId() {
		String taskId = Core.getParam("previewTaskId");
		if(Core.isNull(taskId)) {
			taskId = Core.getParam("taskId");
		}
		return taskId;
	}
}
