
package nosi.webapps.igrp.pages.detalhes_tarefas;

/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import static nosi.core.i18n.Translator.gt;
import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;
import org.apache.commons.text.StringEscapeUtils;
import com.google.gson.Gson;
import nosi.core.config.Config;
import nosi.core.gui.components.IGRPSeparatorList;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
import nosi.core.webapp.activit.rest.CustomVariableIGRP;
import nosi.core.webapp.activit.rest.HistoricTaskService;
import nosi.core.webapp.activit.rest.Rows;
import nosi.core.webapp.activit.rest.TaskServiceQuery;
import nosi.core.webapp.activit.rest.TaskVariables;
import nosi.core.xml.XMLExtractComponent;
import nosi.core.xml.XMLWritter;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.TipoDocumentoEtapa;
/*----#END-PRESERVED-AREA----*/

public class Detalhes_tarefasController extends Controller {

	public Response actionIndex() throws IOException{
		/*----#START-PRESERVED-AREA(INDEX)----*/
		String taskId = Core.getParam("taskId");
		String processDefinitionKey = Core.getParam("processDefinitionKey");
		String taskDefinitionKey = Core.getParam("taskDefinitionKey");
		TaskServiceQuery taskS = new TaskServiceQuery();
		if(Core.isNotNull(taskId)) {
			taskS.addFilter("taskId", taskId);
		}
		if(Core.isNotNull(processDefinitionKey)) {
			taskS.addFilter("processDefinitionKey", processDefinitionKey);
		}
		if(Core.isNotNull(taskDefinitionKey)) {
			taskS.addFilter("taskDefinitionKey", taskDefinitionKey);
		}
		taskS.addFilter("includeProcessVariables", "true");
		String content = "";
		for(TaskServiceQuery task:taskS.queryHistoryTask()) {
			content = generateCustomFormTask(task);
			break;//because for unique task
		}
		return this.renderView(content);
		/*----#END-PRESERVED-AREA----*/
	}

	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/

	private String generateCustomFormTask(TaskServiceQuery task) {
		Core.setAttribute("report_p_prm_definitionid", task.getProcessInstanceId());
		Gson gson = new Gson();
		HistoricTaskService history = new HistoricTaskService();
		List<HistoricTaskService> histories = history.getHistory(task.getId());
		history.setFilter("processFinished=true");
		boolean processFinished = history.getHistory(task.getId()).size() > 0;
		XMLExtractComponent comp = new XMLExtractComponent();
		Action action = new Action().find().andWhere("page", "=",task.getFormKey()).andWhere("application", "=",Core.toInt(task.getTenantId())).one();
		String app = action.getApplication().getDad();
		String page = action.getPage();
		String json = "";
		if(task.getVariables()!=null) {
			List<TaskVariables> var = task.getVariables().stream().filter(v->v.getName().equalsIgnoreCase(Core.isNotNull(task.getFormKey())?task.getFormKey():"customVariableIGRP_"+task.getId())).collect(Collectors.toList());
			json = (var!=null && var.size() >0)?var.get(0).getValue().toString():"";
		}
		if(Core.isNotNull(json)) {
			CustomVariableIGRP custom = gson.fromJson(json, CustomVariableIGRP.class);
			if(custom!=null){
				for(Rows rows:custom.getRows()) {
					if(rows.getName().equalsIgnoreCase("page_igrp_ativiti")) {
						page = rows.getValue().toString();
					}if(rows.getName().equalsIgnoreCase("app_igrp_ativiti")) {
						app = rows.getValue().toString();
					}else {
						if(rows.getValue() instanceof String[]) {
							for(String obj:(String[])rows.getValue()) {
								this.addQueryString(rows.getName(), obj);
							}
						}else
							this.addQueryString(rows.getName(), rows.getValue().toString());
					}
				}
			}
		}
		this.setLinkDocumentsTask(task, histories);
		Response resp = this.call(app, page, "index",this.queryString());
		String content = comp.removeXMLButton(resp.getContent());
		XMLWritter xml = new XMLWritter("rows", this.getConfig().getResolveUrl("igrp","mapa-processo","get-xsl").replaceAll("&", "&amp;")+"&amp;page="+task.getFormKey()+"&amp;app="+task.getTenantId(), "utf-8");
		xml.addXml(this.getConfig().getHeader(null));
		xml.startElement("content");
		xml.writeAttribute("type", "");
		xml.setElement("title", gt("Processo Nº "+task.getProcessInstanceId()+" - Tarefa "+task.getId()));
		if(!processFinished) {
			xml.addXml(comp.generateButtonEditTask(task.getId()).toString());
		}
		IGRPSeparatorList sep = comp.addFormlistFile();
		xml.addXml(sep.toString());
		xml.addXml(content);
		xml.addXml(comp.extractXML(this.call("igrp", "Addfiletask", "index", this.queryString()).getContent()));
		xml.endElement();
		return xml.toString();	
	}
	
	
	private void setLinkDocumentsTask(TaskServiceQuery task, List<HistoricTaskService> history) {		
		try {
			if(history!=null && !history.isEmpty()) {
				List<TaskVariables> variables = history.get(0).getVariables(); 
				if(variables !=null) {
					this.removeOldQueryString();
					List<TipoDocumentoEtapa> tipoDocs = new TipoDocumentoEtapa()
							.find()
							.andWhere("processId", "=",Core.isNotNull(task.getProcessDefinitionKey())?task.getProcessDefinitionKey():"-1")
							.andWhere("taskId", "=",Core.isNotNull(task.getTaskDefinitionKey())?task.getTaskDefinitionKey():"-1")
							.andWhere("tipoDocumento.application", "=",Core.toInt(task.getTenantId()))
							.andWhere("status", "=",1)
							.andWhere("tipo", "=","IN")
							.all();
					tipoDocs.stream().forEach(doc->{			 			 	
						variables.stream()
						 		 .filter(v->v.getType().equalsIgnoreCase("binary") && v.getName().startsWith(StringEscapeUtils.escapeJava(doc.getTipoDocumento().getNome()).replaceAll("\\\\", "__SCAPE__")))
						 		 .forEach(v->{
										this.addQueryString("p_formlist_documento_task_nome_fk",doc.getTipoDocumento().getNome());
										this.addQueryString("p_formlist_documento_task_nome_fk_desc",doc.getTipoDocumento().getNome());
										this.addQueryString("p_formlist_documento_task_descricao_fk",doc.getTipoDocumento().getDescricao());
										this.addQueryString("p_formlist_documento_task_descricao_fk_desc",doc.getTipoDocumento().getDescricao());
										this.addQueryString("p_formlist_documento_task_obrigatoriedade_fk",this.getObrigatoriedade(doc.getRequired()));
										this.addQueryString("p_formlist_documento_task_obrigatoriedade_fk_desc",this.getObrigatoriedade(doc.getRequired()));
										this.addQueryString("p_formlist_documento_task_documento_fk_desc", v.getName());
										this.addQueryString("p_formlist_documento_task_documento_fk", v.getName());
							 			this.addQueryString("formlist_documento_task_documento_fk",v.getName());
						 			 	this.addQueryString("formlist_documento_task_documento_fk_desc",v.getName());
										this.addQueryString("p_formlist_documento_task_mostrar_fk",new Config().getResolveUrl("igrp","Addfiletask","index").replaceAll("&", "&amp;")+"&amp;taskid="+history.get(0).getId()+"&amp;filename="+v.getName());
										this.addQueryString("p_formlist_documento_task_mostrar_fk_desc","Mostrar");
						 		 });
					});					
				}
			}
		}catch(NullPointerException e) {}
	}
	
	private void removeOldQueryString() {
		this.removeQueryString("p_formlist_documento_task_mostrar_fk");
		this.removeQueryString("p_formlist_documento_task_mostrar_fk_desc");
		this.removeQueryString("p_formlist_documento_task_nome_fk");
		this.removeQueryString("p_formlist_documento_task_nome_fk_desc");
		this.removeQueryString("p_formlist_documento_task_descricao_fk");
		this.removeQueryString("p_formlist_documento_task_descricao_fk_desc");
		this.removeQueryString("p_formlist_documento_task_obrigatoriedade_fk");
		this.removeQueryString("p_formlist_documento_task_obrigatoriedade_fk_desc");
	}
	private String getObrigatoriedade(int required) {
		return required==1?"Sim":"Nao";
	}
	/*----#END-PRESERVED-AREA----*/

}
