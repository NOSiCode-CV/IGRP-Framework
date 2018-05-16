/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp_studio.pages.bpmndesigner;

/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import javax.servlet.http.Part;
import org.apache.commons.text.StringEscapeUtils;
import com.google.gson.Gson;
import nosi.core.webapp.Response;
import nosi.core.webapp.activit.rest.DeploymentService;
import nosi.core.webapp.activit.rest.ProcessDefinitionService;
import nosi.core.webapp.activit.rest.ResourceService;
import nosi.core.webapp.activit.rest.TaskService;
import nosi.core.webapp.compiler.helpers.Compiler;
import nosi.core.webapp.compiler.helpers.ErrorCompile;
import nosi.core.webapp.compiler.helpers.MapErrorCompile;
import nosi.core.webapp.helpers.FileHelper;
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
		Application app = new Application().findOne(Core.toInt(model.getEnv_fk()));		
		if(app!=null) {
			List<BPMNDesigner.Gen_table> data = new ArrayList<>();
			for(ProcessDefinitionService process: new ProcessDefinitionService().getProcessDefinitionsAtivos(app.getDad())){
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
		view.id.setParam(true);
		return this.renderView(view);
		
		/*----#END-PRESERVED-AREA----*/
	}


	public Response actionGravar() throws IOException, ServletException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(GRAVAR)----*/
		String erros = "";
		BPMNDesigner model = new BPMNDesigner();
		model.load();
		Part data = Igrp.getInstance().getRequest().getPart("p_data");
		DeploymentService deploy = new DeploymentService();
		if(Core.isNotNull(model.getEnv_fk())) {
			Application app = new Application().findOne(Core.toInt(model.getEnv_fk()));
			String content = FileHelper.convertToString(data);
			List<TaskService> tasks = new ProcessDefinitionService().extractTasks(content);
			for(TaskService task:tasks) {
				erros = this.saveTaskController(task,app);
			}
			int index = content.indexOf("<process id=\"");
			String fileName = data.getName();
			if(index != -1) {
			  fileName = content.substring(index+"<process id=\"".length(), content.indexOf("\" name",content.indexOf("<process id=\"")))+"_"+app.getDad()+".bpmn20.xml";
			}
			deploy = deploy.create(data.getInputStream(),app.getDad(), fileName,data.getContentType());
			if(deploy!=null && Core.isNotNull(deploy.getId()) && Core.isNull(erros)){
				return this.renderView("<messages><message type=\"success\">" + StringEscapeUtils.escapeXml10(FlashMessage.MESSAGE_SUCCESS) + "</message></messages>");
			}
		}else {
			return this.renderView("<messages><message type=\"error\">Selecione a aplicação</message></messages>");
		}
		return this.renderView("<messages><message type=\"error\">" + StringEscapeUtils.escapeXml10(deploy.hashError()?deploy.getError().getException():"Ocorreu um erro ao tentar salvar o processo "+erros) + "</message></messages>");
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
		ProcessDefinitionService process = new ProcessDefinitionService().getProcessDefinition(id);
		String link = process.getResource().replace("/resources/", "/resourcedata/");
		String resource = new ResourceService().getResourceData(link);
		resource = resource.replace("<?xml version=\"1.0\" encoding=\"UTF-8\"?>", "<?xml version='1.0' encoding='UTF-8'?>");
		return this.renderView(resource);
	}
	
	private String saveTaskController(TaskService task,Application app) {
		Compiler compiler = new Compiler();
		String content = this.getConfig().getGenTaskController(app.getDad(),task.getProcessDefinitionId(), task.getId());
		String classPathServer = (this.getConfig().getPathServerClass(app.getDad())+File.separator+"process"+File.separator+task.getProcessDefinitionId()).toLowerCase();
		String classPathWorkspace = (this.getConfig().getBasePahtClassWorkspace(app.getDad())+File.separator+"process"+File.separator+task.getProcessDefinitionId()).toLowerCase();
		if(!FileHelper.fileExists(classPathServer+File.separator+task.getId()+"Controller.java")) {
			try {
				FileHelper.save(classPathServer, task.getId()+"Controller.java", content);
				File[] files = new File[] { new File(classPathServer+File.separator +task.getId()+"Controller.java")};				
				compiler.compile(files);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		if(!FileHelper.fileExists(classPathWorkspace+File.separator+task.getId()+"Controller.java")) {
			try {
				FileHelper.save(classPathWorkspace, task.getId()+"Controller.java", content);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		Action ac = new Action().find()
								.andWhere("application", "=",app.getId())
								.andWhere("page", "=",task.getId())
								.one();
		if(ac==null) {
		 	ac = new Action();
		 	ac.setApplication(app);
			ac.setAction_descr("");
			ac.setPage_descr("Task Page "+task.getId());
			ac.setStatus(1);
			ac.setPage(task.getId());
			ac.setPackage_name("nosi.webapps."+app.getDad().toLowerCase()+".process."+task.getProcessDefinitionId().toLowerCase());
			ac.setVersion("2.3");
			ac.setAction("index");
     		ac.setIsComponent((short) 2);
     		ac.insert();
		}else {
			ac.setPackage_name("nosi.webapps."+app.getDad().toLowerCase()+".process."+task.getProcessDefinitionId().toLowerCase());
			ac.update();
		}
		if (compiler.hasError()) {
			Map<String, List<ErrorCompile>> er = compiler.getErrors().stream()
					.collect(Collectors.groupingBy(ErrorCompile::getFileName));
			 return new Gson().toJson(new MapErrorCompile("Falha na compilação", er));
		}
		return "";
	}
	
	/*----#END-PRESERVED-AREA----*/
}
