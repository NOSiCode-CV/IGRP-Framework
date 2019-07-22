/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp_studio.pages.bpmndesigner;

/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import nosi.core.webapp.FlashMessage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.Part;
import javax.xml.transform.TransformerConfigurationException;
import org.apache.commons.text.StringEscapeUtils;
import nosi.core.webapp.Response;
import nosi.core.webapp.activit.rest.entities.DeploymentService;
import nosi.core.webapp.activit.rest.entities.ProcessDefinitionService;
import nosi.core.webapp.activit.rest.entities.TaskService;
import nosi.core.webapp.activit.rest.services.DeploymentServiceRest;
import nosi.core.webapp.activit.rest.services.ProcessDefinitionServiceRest;
import nosi.core.webapp.activit.rest.services.ResourceServiceRest;
import nosi.core.webapp.activit.rest.services.TaskServiceRest;
import nosi.core.webapp.bpmn.BPMNConstants;
import nosi.core.webapp.bpmn.BPMNHelper;
import nosi.core.webapp.bpmn.GenerateInterfacePermission;
import nosi.core.webapp.compiler.helpers.Compiler;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.helpers.StringHelper;
import nosi.core.xml.XMLTransform;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
/*----#END-PRESERVED-AREA----*/

public class BPMNDesignerController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(INDEX)----*/
		BPMNDesigner model = new BPMNDesigner();
		model.load();
		BPMNDesignerView view = new BPMNDesignerView(model);
		view.env_fk.setValue(new Application().getListApps());
		Application app = Core.findApplicationById(Core.toInt(model.getEnv_fk()));		
		if(app!=null) {
			List<BPMNDesigner.Gen_table> data = new ArrayList<>();
			for(ProcessDefinitionService process: new ProcessDefinitionServiceRest().getProcessDefinitionsAtivos(app.getDad())){
				BPMNDesigner.Gen_table processo = new BPMNDesigner.Gen_table();
				processo.setId(process.getId());
				processo.setTitle(process.getName());
				processo.setLink("igrp_studio", "BPMNDesigner", "get-bpmn-design&p_id="+process.getId());
				processo.setId(process.getId());
				data.add(processo);
			}
			view.gen_table.addData(data);
		}
		view.formkey.setLookup("igrp","LookupListPage","index");
		view.formkey.addParam("p_prm_target","_blank");
		view.formkey.addParam("target","_blank");
		view.formkey.addParam("formKey", "nome_pagina");
		view.formkey.addParam("p_formkey", "nome_pagina");
		view.linkfile.setLabel("Open File");
		view.id.setParam(true);
		return this.renderView(view);
		
		/*----#END-PRESERVED-AREA----*/
	}


	@SuppressWarnings("resource")
	public Response actionGravar() throws IOException, ServletException, IllegalArgumentException, IllegalAccessException, TransformerConfigurationException{
		/*----#START-PRESERVED-AREA(GRAVAR)----*/
		String erros = "";
		BPMNDesigner model = new BPMNDesigner();
		model.load();
		Part data = Core.getFile("p_data");
		InputStream inputStream = data.getInputStream();
		DeploymentServiceRest deploy = new DeploymentServiceRest();
		if(Core.isNotNull(model.getEnv_fk())) {
			Application app = new Application().findOne(Core.toInt(model.getEnv_fk()));
			String content = FileHelper.convertToString(data);
			List<TaskService> tasks = new TaskServiceRest().extractTasks(content,true);
			this.compiler = new Compiler();
			for(TaskService task:tasks) {
				this.saveTaskController(task,app);
			}	
			this.saveBPMNTaskPermission(tasks,app);
			this.compiler.compile();
			erros = this.compiler.getError();
			int index = content.indexOf("<process id=\"");
			String fileName = data.getName();
			if(index != -1) {
			  fileName = content.substring(index+"<process id=\"".length(), content.indexOf("\" name",content.indexOf("<process id=\"")))+"_"+app.getDad()+".bpmn20.xml";
			}
			DeploymentService d = deploy.create(inputStream ,app.getDad(), fileName,data.getContentType());
			if(d!=null && Core.isNotNull(d.getId()) && Core.isNull(erros)){
				return this.renderView("<messages><message type=\"success\">" + StringEscapeUtils.escapeXml10(FlashMessage.MESSAGE_SUCCESS) + "</message></messages>");
			}
		}else {
			return this.renderView("<messages><message type=\"error\">Selecione a aplicação</message></messages>");
		}
		return this.renderView("<messages><message type=\"error\">" + StringEscapeUtils.escapeXml10(deploy.getError()!=null?deploy.getError().getException():"Ocorreu um erro ao tentar salvar o processo "+erros) + "</message></messages>");
		/*----#END-PRESERVED-AREA----*/
	}



	public Response actionPublicar() throws IOException{
		/*----#START-PRESERVED-AREA(PUBLICAR)----*/
		return this.redirect("igrp_studio","BPMNDesigner","index");
		/*----#END-PRESERVED-AREA----*/
	}
	

	public Response actionExporar_imagem() throws IOException{
		/*----#START-PRESERVED-AREA(EXPORTAR_IMAGEM)----*/
		return this.redirect("igrp_studio","BPMNDesigner","index");
		/*----#END-PRESERVED-AREA----*/
	}
	
	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
	
	public Response actionGetBpmnDesign() {
		String id = Core.getParam("p_id");
		ProcessDefinitionService process = new ProcessDefinitionServiceRest().getProcessDefinition(id);
		String link = process.getResource().replace("/resources/", "/resourcedata/");
		String resource = new ResourceServiceRest().getResourceData(link);
		resource = resource.replace("<?xml version=\"1.0\" encoding=\"UTF-8\"?>", "<?xml version='1.0' encoding='UTF-8'?>");
		return this.renderView(resource);
	}
	
	private void saveTaskController(TaskService task,Application app) throws TransformerConfigurationException, UnsupportedEncodingException {
		String taskName = StringHelper.camelCaseFirst(BPMNConstants.PREFIX_TASK+task.getId());
		Action ac = new Action().find()
				.andWhere("application", "=",app.getId())
				.andWhere("page", "=",taskName)
				.andWhere("processKey", "=",task.getProcessDefinitionId().toLowerCase())
				.one();
		
		if(ac==null) {
			ac = new Action();
			ac.setApplication(app);
			ac.setAction_descr("");
			ac.setPage_descr("Task Page "+task.getId());
			ac.setStatus(1);
			ac.setPage(taskName);
			ac.setPackage_name("nosi.webapps."+app.getDad().toLowerCase()+".process."+task.getProcessDefinitionId().toLowerCase());
			ac.setVersion("2.3");
			ac.setAction("index");
			ac.setProcessKey(task.getProcessDefinitionId().toLowerCase());
			ac.setIsComponent((short) 2);
			ac.insert();
		}else {
			ac.setPackage_name("nosi.webapps."+app.getDad().toLowerCase()+".process."+task.getProcessDefinitionId().toLowerCase());
			ac.setProcessKey(task.getProcessDefinitionId().toLowerCase());
			ac.update();
		}
		this.saveTaskFileController(task,app,ac);		
	}
	
	private void saveTaskFileController(TaskService task, Application app, Action ac) throws TransformerConfigurationException, UnsupportedEncodingException {
		String classPathWorkspace = this.getClassPathWorkspace(task, app);
		if(Core.isNotNull(classPathWorkspace)) {
			if(!FileHelper.dirExists(classPathWorkspace)) {
				FileHelper.createDiretory(classPathWorkspace);
			}
			String xml = BPMNHelper.getGenerateXML(app.getDad(), task.getProcessDefinitionId().toLowerCase(), ac.getPage(), task.getFormKey(), classPathWorkspace);
			String content = this.transformXMLToController(xml);
			FileHelper.saveFilesJavaControllerAndReplace(classPathWorkspace, ac.getPage(), content);
		}else {
			String classPathServer = this.getClassPathServer(task, app);
			String xml = BPMNHelper.getGenerateXML(app.getDad(), task.getProcessDefinitionId().toLowerCase(), ac.getPage(), task.getFormKey(), classPathServer);
			String content = this.transformXMLToController(xml);
			FileHelper.saveFilesJavaControllerAndReplace(classPathServer, ac.getPage(), content);
			this.compiler.addFileName(classPathServer+File.separator+ ac.getPage()+"Controller.java");
		}
	}


	private String transformXMLToController(String xml) throws TransformerConfigurationException, UnsupportedEncodingException {
		return XMLTransform.xmlTransformWithXSL(FileHelper.convertStringToInputStream(xml), this.config.getLinkXSLBpmnControllerGenerator());
	}
	
	private String getClassPathServer(TaskService task,Application app) {
		return (this.getConfig().getPathServerClass(app.getDad())+"process"+File.separator+task.getProcessDefinitionId().toLowerCase());
	}
	
	private String getClassPathWorkspace(TaskService task,Application app) {
		String workSpace =  this.getConfig().getBasePahtClassWorkspace(app.getDad());
		if(Core.isNotNull(workSpace))
			return workSpace+File.separator+"process"+File.separator+task.getProcessDefinitionId().toLowerCase();
		return null;
	}
	
	private void saveBPMNTaskPermission(List<TaskService> tasks,Application app) {
		if(tasks!=null && !tasks.isEmpty()) {
			String proccessKey = tasks.get(0).getProcessDefinitionId().toLowerCase();
			String className = GenerateInterfacePermission.getGenerateClassName(proccessKey);
			if(Core.isNotNull(className)) {
				String classPathWorkspace = this.getClassPathWorkspace(tasks.get(0), app);
				String content = GenerateInterfacePermission.getGenerateClassContent(app.getDad(), proccessKey);
				if(Core.isNotNull(classPathWorkspace) && FileHelper.dirExists(classPathWorkspace)) {
					FileHelper.saveFilesJavaAndNotReplace(classPathWorkspace,className, content);
				}else {
					String classPathServer = this.getClassPathServer(tasks.get(0), app);
					FileHelper.saveFilesJavaAndNotReplace(classPathServer, className, content);
					this.compiler.addFileName(classPathServer+File.separator+ className+".java");
				}
			}
		}
	}
	
	private Compiler compiler;
	/*----#END-PRESERVED-AREA----*/
}
