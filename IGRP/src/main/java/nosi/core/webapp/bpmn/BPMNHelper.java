package nosi.core.webapp.bpmn;

import static nosi.core.i18n.Translator.gt;

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
import nosi.core.webapp.helpers.DateHelper;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.xml.XMLWritter;
import nosi.webapps.igrp.dao.ActivityExecute;
import nosi.webapps.igrp.dao.RepTemplateSource;
import nosi.webapps.igrp.dao.TaskFile;
import nosi.webapps.igrp.dao.TipoDocumentoEtapa;
import nosi.webapps.igrp_studio.pages.bpmndesigner.ReserveCodeControllerTask;

import java.util.*;

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
		}catch(NullPointerException ignored) {}
		return "";
	}
	
	//Add file separator, allow to upload your file 
	public static String addFileSeparator(String taskDad,String processDefinition,String taskDefinition,List<HistoricTaskService> history) {
		DisplayDocmentType displayDocsInput = new DisplayDocmentType();
		List<TipoDocumentoEtapa> listInOutDoc = getInputOutputDocumentType(taskDad, processDefinition, taskDefinition, history);
		displayDocsInput.setListDocmentType(listInOutDoc);
       return displayDocsInput.displayAllDocsInSameFormList();
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
		final var currentTaskId = getCurrentTaskId();
		if(tipoDocsIN!=null && !tipoDocsIN.isEmpty()) {
			if (RuntimeTask.getRuntimeTask().isDetails()) {
				//If details will show the inputed file for this task
				tipoDocsIN.forEach(t->{
					 t.setFileId(-1);
		 			 IGRPLink link = new IGRPLink();
					if(t.getTipoDocumento() != null) {
						TaskFile taskFile = new TaskFile().find()
								.where("taskId","=",currentTaskId)
				 										.andWhere("tipo_doc_task.tipoDocumento.id","=",t.getTipoDocumento().getId())
				 										.one();
						 if(taskFile!=null) {
							 if(taskFile.getClob().getUuid()!=null)
								 link.setLink(Core.getLinkFileByUuid(taskFile.getClob().getUuid()));
							 else
								 link.setLink(Core.getLinkFile(taskFile.getClob().getId()));
							 t.setFileId(taskFile.getClob().getId());
							t.setUser(taskFile.getClob().getUser().getEmail()+" a "+Core.dateToString(taskFile.getClob().getDt_created(),"dd-MMM-yy"));

						 }
		 			 }
		 			 if(t.getRepTemplate()!=null) {
						link = new IGRPLink(Core.getLinkReport(t.getRepTemplate().getCode()).addParam(BPMNConstants.PRM_TASK_ID, currentTaskId));
		 			 }
		 			 link.setLink_desc(gt("Mostrar"));
					 t.setLink(link);
				});		
			} else {
				//will show the last document inputed if exists
				final List<TaskFile> tasksF = getTaskFiles(tipoDocsIN);
				for (TaskFile taskFile : tasksF) {
					for (int i=0; i<=tipoDocsIN.size();i++) {
						if (Objects.equals(tipoDocsIN.get(i).getTipoDocumento().getId(), taskFile.getTipo_doc_task().getTipoDocumento().getId())) {
							IGRPLink link = new IGRPLink();
							tipoDocsIN.get(i).setFileId(-1);
							if (taskFile.getClob().getUuid() != null)
								link.setLink(Core.getLinkFileByUuid(taskFile.getClob().getUuid()));
							else
								link.setLink(Core.getLinkFile(taskFile.getClob().getId()));
							tipoDocsIN.get(i).setFileId(taskFile.getClob().getId());
							tipoDocsIN.get(i).setUser(taskFile.getClob().getUser().getEmail()+" a "+Core.dateToString(taskFile.getClob().getDt_created(),"dd-MMM-yy"));

							link.setLink_desc(gt("Mostrar"));
							tipoDocsIN.get(i).setLink(link);

							break;
						}
					}
				}

			}
		}
		return tipoDocsIN;
	}
	

	public static List<TipoDocumentoEtapa> getInputDocumentType(String taskDad, String processDefinition, String taskDefinition){
       return new TipoDocumentoEtapa()
				.find()
				.andWhere("processId", "=",Core.isNotNull(processDefinition)?processDefinition:"-1")
				.andWhere("taskId", "=",Core.isNotNull(taskDefinition)?taskDefinition:"-1")
				.andWhere("status", "=",1)
				.andWhere("tipo", "=","IN")
				.andWhere("tipoDocumento.application.dad", "=",taskDad)
				.all();
	}

	private static String getCurrentTaskId() {
		String taskId = RuntimeTask.getRuntimeTask().getPreviewTaskId();
		if (Core.isNull(taskId))
			return RuntimeTask.getRuntimeTask().getTask().getId();
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
		
			List<TipoDocumentoEtapa> tipoDocs = new TipoDocumentoEtapa()
				.find()
				.andWhere("processId", "=",Core.isNotNull(processDefinition)?processDefinition:"-1")
				.andWhere("taskId", "=",Core.isNotNull(taskDefinition)?taskDefinition:"-1")
				.andWhere("status", "=", 1)
				.andWhere("tipo", "=","OUT")
				.andWhere("tipoDocumento", "notnull")
				.andWhere("tipoDocumento.application.dad", "=",taskDad)
				.all();	
		
		if(tipoDocs!=null && !tipoDocs.isEmpty()){
			final List<TaskFile> tasksF = getTaskFiles(tipoDocs);
		
			for (TaskFile taskFile : tasksF) {
				for (int i=0; i<=tipoDocs.size();i++) {
					if (Objects.equals(tipoDocs.get(i).getTipoDocumento().getId(), taskFile.getTipo_doc_task().getTipoDocumento().getId())) {
						tipoDocs.get(i).setTipo("OUT");
			 IGRPLink link = new IGRPLink();	
						tipoDocs.get(i).setFileId(-1);
						tipoDocs.get(i).setRequired(taskFile.getTipo_doc_task().getRequired());
				 if(taskFile.getClob().getUuid()!=null)
					 link.setLink(Core.getLinkFileByUuid(taskFile.getClob().getUuid()));
				 else
					 link.setLink(Core.getLinkFile(taskFile.getClob().getId()));
						tipoDocs.get(i).setFileId(taskFile.getClob().getId());
						tipoDocs.get(i).setUser(taskFile.getClob().getUser().getEmail()+" a "+Core.dateToString(taskFile.getClob().getDt_created(),"dd-MMM-yy"));

			 link.setLink_desc(gt("Mostrar"));
						tipoDocs.get(i).setLink(link);

						break;
					}
				}
			}
		}
		return tipoDocs;
		}
		
	private static List<TaskFile> getTaskFiles(List<TipoDocumentoEtapa> tipoDocs) {
		RuntimeTask runtimeTask = RuntimeTask.getRuntimeTask();
		Integer[] tpIds = tipoDocs.stream()
				.filter(t -> t.getTipoDocumento() != null)
				.map(t -> t.getTipoDocumento().getId())
				.toArray(Integer[]::new);
		List<Map<String, Object>> allBeforeTasks = new ActivityExecute().find()
				.andWhere("processName", "=", runtimeTask.getTask().getProcessDefinitionId())
				.andWhere("processid", "=", runtimeTask.getTask().getProcessInstanceId())
				.andWhere("taskid","!=","start")
				.orderByDesc("id")
				.allColumns("taskid");
		String[] tasksIds = allBeforeTasks.stream()
				.filter(map -> map.containsKey("taskid") && map.get("taskid") != null)
				.map(map -> map.get("taskid").toString())
				.toArray(String[]::new);

		List<TaskFile> tasksF = new TaskFile().find()
				.whereIn("taskId",tasksIds)
				.andWhere("tipo_doc_task.tipoDocumento.id","IN", tpIds)
				.orderByAsc("id")
				.all();
		return tasksF;
	}

	private static List<TipoDocumentoEtapa> getDocumentOutputReport(String taskDad,String processDefinition,String taskDefinition) { 
		List<TipoDocumentoEtapa> tipoDocs =  new TipoDocumentoEtapa()
				.find()
				.andWhere("processId", "=",Core.isNotNull(processDefinition)?processDefinition:"-1")
				.andWhere("taskId", "=",Core.isNotNull(taskDefinition)?taskDefinition:"-1")
				.andWhere("status", "=", 1)
				.andWhere("tipo", "=","OUT")
				.andWhere("repTemplate", "notnull")
				.andWhere("repTemplate.application.dad", "=",taskDad)
				.all();		
		for(TipoDocumentoEtapa t : tipoDocs) { 
			RuntimeTask runtimeTask = RuntimeTask.getRuntimeTask(); 
			t.setFileId(-1);
			nosi.core.webapp.Report r = Core.getLinkReport(t.getRepTemplate().getCode()); 
			List<RepTemplateSource> allDataSources = new RepTemplateSource().find().andWhere("repTemplate", "=", t.getRepTemplate()).all(); 
			String p_task_id = "";  
			if(allDataSources != null) { 
				for(RepTemplateSource ds : allDataSources) {
					if(ds.getRepSource() != null && "Task".equalsIgnoreCase(ds.getRepSource().getType()) && ds.getRepSource().getTaskid() != null) { 
						ActivityExecute completedTask = new ActivityExecute().find()
							.andWhere("processName", "=", runtimeTask.getTask().getProcessDefinitionId())
							.andWhere("processid", "=", runtimeTask.getTask().getProcessInstanceId())
							.andWhere("taskKey", "=", ds.getRepSource().getTaskid())
							.orderByDesc("id").one(); 
							if(completedTask != null)
								p_task_id = p_task_id.isEmpty() ? completedTask.getTaskid() : String.join("-", p_task_id, completedTask.getTaskid()); 
					}
				}
			}
			r.addParam(BPMNConstants.PRM_TASK_ID, !p_task_id.isEmpty() ? p_task_id : "-1");
			IGRPLink link = new IGRPLink(r);
			link.setLink_desc(gt("Mostrar"));
			t.setLink(link);
		}
		
		return tipoDocs;
	}
	
	public static List<TipoDocumentoEtapa> getFilesByProcessIdNTaskId(String appDad, String processId, String taskId) { 
		List<TipoDocumentoEtapa> allOutDocs = new ArrayList<>(); 
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
			 						.andWhere("taskId", "=", etapas.get(i).getTaskDefinitionKey())
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
							 link.setLink(Core.getLinkFile(taskFile.getClob().getId()));
						 link.setLink_desc(gt("Mostrar"));
						 doc.setFileId(taskFile.getClob().getId());
						doc.setUser(taskFile.getClob().getUser().getEmail());
						 doc.setLink(link);
						 allOutDocs.add(doc);
					 }
					 
				 }
				 if(doc.getRepTemplate() != null && doc.getRepTemplate().getApplication() != null && doc.getRepTemplate().getApplication().getDad().equals(appDad)) { 
					 doc.setFileId(-1);
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
		List<TaskService> list = new ArrayList<>();
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
