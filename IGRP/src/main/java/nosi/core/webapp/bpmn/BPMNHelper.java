package nosi.core.webapp.bpmn;

import java.util.ArrayList;
import java.util.List;
import nosi.core.gui.components.IGRPLink;
import nosi.core.webapp.Core;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.activit.rest.HistoricTaskService;
import nosi.core.webapp.helpers.DateHelper;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.xml.XMLWritter;
import nosi.webapps.igrp.dao.TipoDocumentoEtapa;
import nosi.webapps.igrp_studio.pages.bpmndesigner.ReserveCodeControllerTask;

/**
 * Emanuel
 * 7 May 2018
 */
public class BPMNHelper {

	public static String getGenerateXML(String app,String process_key,String task_key,String form_key,String path) {
		XMLWritter xml = new XMLWritter();
		ReserveCodeControllerTask resevreCode = new ReserveCodeControllerTask();	
		resevreCode.extract(FileHelper.readFile(path, task_key+"Controller.java"));
		xml.startElement("rows");
			xml.setElement("process_key", process_key);
			xml.setElement("task_key", task_key);
			xml.setElement("app", app);
			xml.setElement("page", form_key!=null?form_key.toLowerCase():"");
			xml.setElement("form_key", form_key);
			xml.setElement("user_name", Core.getCurrentUser().getEmail());
			xml.setElement("data_created", Core.getCurrentDate());
			xml.setElement("reserve_import",resevreCode.getReserveCodeImports());
			xml.setElement("reserve_index", resevreCode.getReserveCodeActionIndex());
			xml.setElement("reserve_save", resevreCode.getReserveCodeActionSave());
			xml.setElement("reserve_update", resevreCode.getReserveCodeActionUpdate());
			xml.setElement("reserve_customs", resevreCode.getReserveCodeCustomActions());
		xml.endElement();
		return xml.toString();
	}
	
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
	public static String addFileSeparator(String taskDad,String processDefinition,String taskDefinition,List<HistoricTaskService> history) {
		DisplayDocmentType display = new DisplayDocmentType();
		List<TipoDocumentoEtapa> listInOutDoc = getInputOutputDocumentType(taskDad,processDefinition, taskDefinition, history);
		display.setListDocmentType(listInOutDoc);
		return display.display();
	}
	
	
	public static List<TipoDocumentoEtapa> getInputOutputDocumentType(String taskDad,String processDefinition,String taskDefinition,List<HistoricTaskService> history) {
		DisplayDocmentType display = new DisplayDocmentType();
		if(history!=null && !history.isEmpty()) {			
			display.addListDocumentType(getOutputDocumentType(taskDad,history.get(0).getProcessDefinitionId(),taskDefinition,null,null));
		}else {
			display.addListDocumentType(getOutputDocumentType(taskDad,processDefinition,taskDefinition,null,null));
		}
		display.setListDocmentType(getInputDocumentTypeHistory(taskDad,processDefinition, taskDefinition));
		return display.getListDocmentType();
	}
		
	public static List<TipoDocumentoEtapa> getInputDocumentTypeHistory(String taskDad,String processDefinition, String taskDefinition) {
		List<TipoDocumentoEtapa> tipoDocsIN = getInputDocumentType(taskDad,processDefinition, taskDefinition);
		if(tipoDocsIN!=null) {
				tipoDocsIN.stream().forEach(t->{
					 t.setFileId(-1);
		 			 IGRPLink link = new IGRPLink();
		 			 if(t.getTipoDocumento()!=null) {
						 nosi.webapps.igrp.dao.TaskFile taskFile = new nosi.webapps.igrp.dao.TaskFile().find()
				 										.where("taskId","=",getCurrentTaskId())
				 										.andWhere("tipo_doc_task.tipoDocumento.id","=",t.getTipoDocumento().getId())
				 										.one();
						 if(taskFile!=null) {
							 link.setLink(Core.getLinkFile(taskFile.getClob().getId()));
							 t.setFileId(taskFile.getClob().getId());
						 }
		 			 }
		 			 if(t.getRepTemplate()!=null) {
		 				link = new IGRPLink(Core.getLinkReport(t.getRepTemplate().getCode()).addParam("taskId", getCurrentTaskId()));
		 			 }
		 			 link.setLink_desc("Mostrar");
					 t.setLink(link);
				});		
		}
		return tipoDocsIN;
	}
	

	public static List<TipoDocumentoEtapa> getInputDocumentType(String taskDad,String processDefinition,String taskDefinition){
		List<TipoDocumentoEtapa> tipoDocsIN = new TipoDocumentoEtapa()
				.find()
				.andWhere("processId", "=",Core.isNotNull(processDefinition)?processDefinition:"-1")
				.andWhere("taskId", "=",Core.isNotNull(taskDefinition)?taskDefinition:"-1")
				.andWhere("status", "=",1)
				.andWhere("tipo", "=","IN")
				.andWhere("tipoDocumento.application.dad", "=",taskDad)
				.all();
		return tipoDocsIN;
	}

	private static String getCurrentTaskId() {
		String taskId = Core.getParam("previewTaskId");
		if(Core.isNull(taskId)) {
			taskId = Core.getParam("taskId");
		}
		return taskId;
	}

	public static List<TipoDocumentoEtapa> getOutputDocumentType(String currentTaskApp, String currentProcessDefinition,
			String currentTaskDefinition, String preiviewProcessDefinition, String previewTaskDefinition) {
		currentProcessDefinition = resolveProcessDenifition(currentProcessDefinition);
		preiviewProcessDefinition = resolveProcessDenifition(preiviewProcessDefinition);		
		List<TipoDocumentoEtapa> docsReport = getDocumentOutputReport(currentTaskApp,preiviewProcessDefinition,previewTaskDefinition);
		List<TipoDocumentoEtapa> docsOthers = getDocumentOutputOthers(currentTaskApp,currentProcessDefinition,currentTaskDefinition);
		List<TipoDocumentoEtapa> tipoDocs = new ArrayList<>();
		
		if(docsReport!=null)
			tipoDocs.addAll(docsReport);
		if(docsOthers!=null)
			tipoDocs.addAll(docsOthers);
		return tipoDocs;
	}
	
	private static List<TipoDocumentoEtapa> getDocumentOutputOthers(String taskDad,String processDefinition,
			String taskDefinition) {
		List<TipoDocumentoEtapa> tipoDocs = new TipoDocumentoEtapa()
				.find()
				.andWhere("processId", "=",Core.isNotNull(processDefinition)?processDefinition:"-1")
				.andWhere("taskId", "=",Core.isNotNull(taskDefinition)?taskDefinition:"-1")
				.andWhere("status", "=",1)
				.andWhere("tipo", "=","OUT")
				.andWhere("tipoDocumento", "notnull")
				.andWhere("tipoDocumento.application.dad", "=",taskDad)
				.all();	
		tipoDocs.stream().forEach(t->{
			 IGRPLink link = new IGRPLink();	
			 t.setFileId(-1);
			 String taskId = Core.getParam("previewTaskId");	
			 nosi.webapps.igrp.dao.TaskFile taskFile = null;
			 if(Core.isNotNull(taskId)) {
				 taskFile = new nosi.webapps.igrp.dao.TaskFile().find()
							.where("taskId","=",taskId)
							.andWhere("tipo_doc_task.tipoDocumento.id","=",t.getTipoDocumento().getId())
							.one();
			 }else {
				 taskFile = new nosi.webapps.igrp.dao.TaskFile().find()
							.where("tipo_doc_task.taskId","=",taskDefinition)
							.andWhere("tipo_doc_task.processId","=",processDefinition)
							.andWhere("tipo_doc_task.tipoDocumento.id","=",t.getTipoDocumento().getId())
							.one();
			 }
			 if(taskFile!=null) {
				 link.setLink(Core.getLinkFile(taskFile.getClob().getId()));
				 t.setFileId(taskFile.getClob().getId());
			 }
 			 link.setLink_desc("Mostrar");
			 t.setLink(link);
		});
		return tipoDocs;
	}

	private static List<TipoDocumentoEtapa> getDocumentOutputReport(String taskDad,String processDefinition,String taskDefinition) {
		List<TipoDocumentoEtapa> tipoDocs =  new TipoDocumentoEtapa()
				.find()
				.andWhere("processId", "=",Core.isNotNull(processDefinition)?processDefinition:"-1")
				.andWhere("taskId", "=",Core.isNotNull(taskDefinition)?taskDefinition:"-1")
				.andWhere("status", "=",1)
				.andWhere("tipo", "=","OUT")
				.andWhere("repTemplate", "notnull")
				.andWhere("repTemplate.application.dad", "=",taskDad)
				.all();			
		tipoDocs.stream().forEach(t->{
			 t.setFileId(-1);
			 IGRPLink link = new IGRPLink(Core.getLinkReport(t.getRepTemplate().getCode()).addParam("taskId", getCurrentTaskId()));
 			 link.setLink_desc("Mostrar");
			 t.setLink(link);
		});
		return tipoDocs;
	}

	private static String resolveProcessDenifition(String processDefinition) {
		if(processDefinition.contains(":")) {
			processDefinition = processDefinition.substring(0,processDefinition.indexOf(":"));
		}
		return processDefinition;
	}

}
