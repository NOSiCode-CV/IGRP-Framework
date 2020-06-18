package nosi.core.webapp.bpmn;

import java.util.ArrayList;
import java.util.List;
import nosi.core.gui.components.IGRPLink;
import nosi.core.webapp.Core;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.activit.rest.business.ProcessDefinitionIGRP;
import nosi.core.webapp.activit.rest.entities.HistoricTaskService;
import nosi.core.webapp.activit.rest.entities.ProcessDefinitionService;
import nosi.core.webapp.activit.rest.entities.TaskService;
import nosi.core.webapp.activit.rest.services.ResourceServiceRest;
import nosi.core.webapp.activit.rest.services.TaskServiceRest;
//import nosi.core.webapp.activit.rest.HistoricTaskService;
import nosi.core.webapp.helpers.DateHelper;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.xml.XMLWritter;
import nosi.webapps.igrp.dao.ActivityExecute;
import nosi.webapps.igrp.dao.TipoDocumentoEtapa;
import nosi.webapps.igrp_studio.pages.bpmndesigner.ReserveCodeControllerTask;
import static nosi.core.i18n.Translator.gt;
/**
 * Emanuel
 * 7 May 2018
 */
public final class BPMNHelper {
	
	private BPMNHelper() {}

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
						return ""+ Long.parseLong(value.toString());
				case "double":
					if(Core.isNotNull(value))
						return ""+Double.parseDouble(value.toString());
				case "float":
					if(Core.isNotNull(value))
						return ""+Float.parseFloat(value.toString());
				case "boolean":
					return ""+value.toString().equals("1");
				case "enum":
				case "string":
					return value.toString();
				default:
					return "0";
			}
		}catch(NullPointerException e) {}
		return "";
	}
	
	//Add file separator, allow to upload your file 
	public static String addFileSeparator(String taskDad,String processDefinition,String taskDefinition,List<HistoricTaskService> history) {
		DisplayDocmentType displayDocsInput = new DisplayDocmentType();
		List<TipoDocumentoEtapa> listInOutDoc = getInputOutputDocumentType(taskDad, processDefinition, taskDefinition, history);
		displayDocsInput.setListDocmentType(listInOutDoc);
		String xml = displayDocsInput.displayAllDocsInSameFormList(); 
		return xml;
	}
	
	
	public static List<TipoDocumentoEtapa> getInputOutputDocumentType(String taskDad,String processDefinition,String taskDefinition,List<HistoricTaskService> history) {
		DisplayDocmentType display = new DisplayDocmentType();
		if(history!=null && !history.isEmpty()) {			
			display.addListDocumentType(getOutputDocumentType(taskDad,history.get(0).getProcessDefinitionId(),taskDefinition));
		}else {
			display.addListDocumentType(getOutputDocumentType(taskDad,processDefinition,taskDefinition));
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
							 if(taskFile.getClob().getUuid()!=null)
								 link.setLink(Core.getLinkFileByUuid(taskFile.getClob().getUuid()));
							 else
								 link.setLink(Core.getLinkFile(taskFile.getClob().getId().intValue()));
							 t.setFileId(taskFile.getClob().getId());
						 }
		 			 }
		 			 if(t.getRepTemplate()!=null) {
		 				link = new IGRPLink(Core.getLinkReport(t.getRepTemplate().getCode()).addParam(BPMNConstants.PRM_TASK_ID, getCurrentTaskId()));
		 			 }
		 			 link.setLink_desc(gt("Mostrar"));
					 t.setLink(link);
				});		
		}
		return tipoDocsIN;
	}
	

	public static List<TipoDocumentoEtapa> getInputDocumentType(String taskDad, String processDefinition, String taskDefinition){
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
		String taskId = RuntimeTask.getRuntimeTask().getPreviewTaskId();
		if(Core.isNull(taskId)) {
			taskId = RuntimeTask.getRuntimeTask().getTask().getId();
		}
		return taskId;
	}

	public static List<TipoDocumentoEtapa> getOutputDocumentType(String currentTaskApp, String currentProcessDefinition_,
			String currentTaskDefinition) {
		String currentProcessDefinition = resolveProcessDenifition(currentProcessDefinition_);
		List<TipoDocumentoEtapa> docsReport = getDocumentOutputReport(currentTaskApp,currentProcessDefinition, currentTaskDefinition);
		List<TipoDocumentoEtapa> docsOthers = getDocumentOutputOthers(currentTaskApp,currentProcessDefinition, currentTaskDefinition);
		List<TipoDocumentoEtapa> tipoDocs = new ArrayList<>(); 
		
		if(docsReport!=null)
			tipoDocs.addAll(docsReport);
		if(docsOthers!=null)
			tipoDocs.addAll(docsOthers);
		return tipoDocs;
	}
	
	private static List<TipoDocumentoEtapa> getDocumentOutputOthers(String taskDad, String processDefinition,
			String taskDefinition) { 
		
		RuntimeTask runtimeTask = RuntimeTask.getRuntimeTask(); 
		List<ActivityExecute> allBeforeTasks = new ActivityExecute().find()
				.andWhere("processName", "=", runtimeTask.getTask().getProcessDefinitionId())
				.andWhere("processid", "=", runtimeTask.getTask().getProcessInstanceId())
				.orderByDesc("id")
				.all(); 
		
		List<TipoDocumentoEtapa> tipoDocs = new TipoDocumentoEtapa()
				.find()
				.andWhere("processId", "=",Core.isNotNull(processDefinition)?processDefinition:"-1")
				.andWhere("taskId", "=",Core.isNotNull(taskDefinition)?taskDefinition:"-1")
				.andWhere("status", "=", 1)
				.andWhere("tipo", "=","OUT")
				.andWhere("tipoDocumento", "notnull")
				.andWhere("tipoDocumento.application.dad", "=",taskDad)
				.all();	
		
		List<TipoDocumentoEtapa> aux = new ArrayList<TipoDocumentoEtapa>(); 
		List<String> taskIds = new ArrayList<String>();
		
		for(TipoDocumentoEtapa t : tipoDocs) {
			for(ActivityExecute task : allBeforeTasks) {
				TipoDocumentoEtapa doc = new TipoDocumentoEtapa().find()
						.andWhere("processId", "=", task.getProccessKey())
						.andWhere("taskId", "=", task.getTaskKey())
						.andWhere("tipo", "=", "IN")
						.andWhere("status", "=", 1)
						.andWhere("tipoDocumento", "=", t.getTipoDocumento())
						.one(); 
				if(doc != null) {
					aux.add(doc); 
					taskIds.add(task.getTaskid()); 
				}
			}
		}
		
		aux.removeIf(obj -> { 
			for(TipoDocumentoEtapa doc_ : aux) 
				return doc_ != obj && doc_.getTipoDocumento() != null && obj.getTipoDocumento() != null && doc_.getTipoDocumento().getCodigo().equals(obj.getTipoDocumento().getCodigo()); 
			return false; 
		});
		
		for(int i = 0; i < aux.size(); i++) { 
			TipoDocumentoEtapa t = aux.get(i); 
			t.setTipo("OUT");
			 IGRPLink link = new IGRPLink();	
			 t.setFileId(-1); 
			 nosi.webapps.igrp.dao.TaskFile taskFile = new nosi.webapps.igrp.dao.TaskFile().find()
						.where("taskId","=", taskIds.get(i))
						.andWhere("tipo_doc_task.tipoDocumento.id","=",t.getTipoDocumento().getId())
						.one();
			 
			 if(taskFile!=null) {
				 if(taskFile.getClob().getUuid()!=null)
					 link.setLink(Core.getLinkFileByUuid(taskFile.getClob().getUuid()));
				 else
					 link.setLink(Core.getLinkFile(taskFile.getClob().getId().intValue()));
				 t.setFileId(taskFile.getClob().getId());
			 }
			 link.setLink_desc(gt("Mostrar"));
			 t.setLink(link);
		}
		
		return aux;
	}

	private static List<TipoDocumentoEtapa> getDocumentOutputReport(String taskDad,String processDefinition,String taskDefinition) { 
		List<TipoDocumentoEtapa> tipoDocs =  new TipoDocumentoEtapa()
				.find()
				.andWhere("processId", "=",Core.isNotNull(processDefinition)?processDefinition:"-1")
				.andWhere("taskId", "=",Core.isNotNull(taskDefinition)?taskDefinition:"-1")
				.andWhere("status", "=",new Integer(1))
				.andWhere("tipo", "=","OUT")
				.andWhere("repTemplate", "notnull")
				.andWhere("repTemplate.application.dad", "=",taskDad)
				.all();		
		tipoDocs.stream().forEach(t->{
			 t.setFileId(new Integer(-1));
			 IGRPLink link = new IGRPLink(Core.getLinkReport(t.getRepTemplate().getCode()).addParam(BPMNConstants.PRM_TASK_ID, getCurrentTaskId()));
 			 link.setLink_desc(gt("Mostrar"));
			 t.setLink(link);
		});
		return tipoDocs;
	}
	
	public static List<TipoDocumentoEtapa> getFilesByProcessIdNTaskId(String appDad, String processId, String taskId) { 
		List<TipoDocumentoEtapa> allOutDocs = new ArrayList<TipoDocumentoEtapa>(); 
		List<TipoDocumentoEtapa> tipoDocs = null;
		TipoDocumentoEtapa tipoDocumentoEtapa = new TipoDocumentoEtapa().find().andWhere("processId", "=", Core.isNotNull(processId) ? processId: "-1");
		if(taskId != null) 
			tipoDocumentoEtapa = tipoDocumentoEtapa.andWhere("taskId", "=", taskId);
		tipoDocs = tipoDocumentoEtapa.andWhere("status", "=", 1).andWhere("tipo", "=", "OUT").all();
		if(tipoDocs != null) { 
			for(TipoDocumentoEtapa doc : tipoDocs) {
				if(doc.getTipoDocumento() != null && doc.getTipoDocumento().getApplication() != null && doc.getTipoDocumento().getApplication().getDad().equals(appDad)) {  
					 List<TaskService> etapas = getAllTaskFromMetadataXml(appDad, processId); 
					 int reverseOffset = 0;
					 for(TaskService etapa : etapas) {
						 if(etapa.getId().equals(doc.getTaskId())) {
							 reverseOffset = etapas.indexOf(etapa); 
							 break; 
						 }
					 }
					 for(int i = reverseOffset; i >= 0; i--) {
						 TipoDocumentoEtapa taskBefore = new TipoDocumentoEtapa().find().andWhere("processId", "=", Core.isNotNull(processId) ? processId: "-1")
			 						.andWhere("status", "=", 1)
			 						.andWhere("taskid", "=", etapas.get(i))
			 						.andWhere("tipo", "=", "IN")
			 						.one(); 
						 if(taskBefore != null) {
							 doc = taskBefore;
							 break;
						 }
					 }
					 
					 nosi.webapps.igrp.dao.TaskFile taskFile = new nosi.webapps.igrp.dao.TaskFile().find()
								.andWhere("tipo_doc_task", "=", doc)
								.one();
					 if(taskFile != null) {
						 IGRPLink link = new IGRPLink();
						 if(taskFile.getClob().getUuid() != null)
							 link.setLink(Core.getLinkFileByUuid(taskFile.getClob().getUuid()));
						 else
							 link.setLink(Core.getLinkFile(taskFile.getClob().getId().intValue()));
						 link.setLink_desc(gt("Mostrar"));
						 doc.setFileId(taskFile.getClob().getId());
						 doc.setLink(link);
						 allOutDocs.add(doc);
					 }
					 
				 }
				 if(doc.getRepTemplate() != null && doc.getRepTemplate().getApplication() != null && doc.getRepTemplate().getApplication().getDad().equals(appDad)) { 
					 doc.setFileId(new Integer(-1));
					 IGRPLink link = new IGRPLink(Core.getLinkReport(doc.getRepTemplate().getCode()));
		 			 link.setLink_desc(gt("Mostrar"));
					 doc.setLink(link);
					 allOutDocs.add(doc);
				 }
			}
		} 
		return allOutDocs; 
	}
	
	
	public static List<TaskService> getAllTaskFromMetadataXml(String appDad, String processId) {
		List<TaskService> list = new ArrayList<TaskService>();
		List<ProcessDefinitionService> allProcess = new ProcessDefinitionIGRP().getProcessDefinitionsForCreated(appDad); 
		if(allProcess != null) {
			TaskServiceRest taskRest = new TaskServiceRest();
			for(ProcessDefinitionService process : allProcess) { 
				if(processId == null) {
					String link = process.getResource().replace("/resources/", "/resourcedata/");
					String resource = new ResourceServiceRest().getResourceData(link); 
					list.addAll(taskRest.extractTasks(resource,true));
				}else {
					if(process.getKey().equals(processId)) { 
						String link = process.getResource().replace("/resources/", "/resourcedata/");
						String resource = new ResourceServiceRest().getResourceData(link); 
						list.addAll(taskRest.extractTasks(resource, true));
					}
				}
			}
		}
		return list; 
	}

	private static String resolveProcessDenifition(String processDefinition_) {
		String processDefinition = processDefinition_;
		if(processDefinition!=null && processDefinition.contains(":")) {
			processDefinition = processDefinition.substring(0,processDefinition.indexOf(":"));
		}
		return processDefinition;
	}

}
