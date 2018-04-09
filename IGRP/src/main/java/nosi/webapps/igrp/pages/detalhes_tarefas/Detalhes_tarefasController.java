
package nosi.webapps.igrp.pages.detalhes_tarefas;

/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import static nosi.core.i18n.Translator.gt;
import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;
import com.google.gson.Gson;
import nosi.core.gui.components.IGRPSeparatorList;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.Response;
import nosi.core.webapp.activit.rest.CustomVariableIGRP;
import nosi.core.webapp.activit.rest.HistoricTaskService;
import nosi.core.webapp.activit.rest.Rows;
import nosi.core.webapp.activit.rest.TaskService;
import nosi.core.webapp.activit.rest.TaskServiceQuery;
import nosi.core.webapp.activit.rest.TaskVariables;
import nosi.core.webapp.webservices.helpers.FileRest;
import nosi.core.xml.XMLExtractComponent;
import nosi.core.xml.XMLWritter;
import nosi.webapps.igrp.dao.Action;
/*----#END-PRESERVED-AREA----*/

public class Detalhes_tarefasController extends Controller {

	public Response actionIndex() throws IOException{
		/*----#START-PRESERVED-AREA(INDEX)----*/
		String taskId = Igrp.getInstance().getRequest().getParameter("taskId");
		TaskServiceQuery taskS = new TaskServiceQuery();
		taskS.addFilter("taskId", taskId);
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
		Gson gson = new Gson();
		HistoricTaskService history = new HistoricTaskService();
		history.setFilter("processFinished=true");
		boolean processFinished = history.getHistory(task.getId()).size() > 0;
		XMLExtractComponent comp = new XMLExtractComponent();
		Action action = new Action().find().andWhere("page", "=",task.getFormKey()).andWhere("application", "=",Core.toInt(task.getTenantId())).one();
		String app = action.getApplication().getDad();
		String page = action.getPage();
		String json = "";
		if(task.getVariables()!=null) {
			List<TaskVariables> var = task.getVariables().stream().filter(v->v.getName().equalsIgnoreCase("customVariableIGRP_"+task.getId())).collect(Collectors.toList());
			json = (var!=null && var.size() >0)?var.get(0).getValue().toString():"";
		}
		if(Core.isNotNull(json)) {
			CustomVariableIGRP custom = gson.fromJson(json, CustomVariableIGRP.class);
			if(custom!=null){
				for(Rows rows:custom.getRows()) {
					if(rows.getName().equalsIgnoreCase("page_igrp_ativiti")) {
						page = rows.getValue()[0].toString();
					}if(rows.getName().equalsIgnoreCase("app_igrp_ativiti")) {
						app = rows.getValue()[0].toString();
					}else {
						for(Object obj:rows.getValue()) {
							this.addQueryString(rows.getName(), obj.toString());
						}
					}
				}
			}
		}
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
		sep.addRowsXMl(this.generateDocumentsTask(task,history,processFinished));
		xml.addXml(sep.toString());
		xml.addXml(content);
		xml.endElement();
		return xml.toString();	
	}

	
	public Response actionGetFile() throws IOException {
		String url = Igrp.getInstance().getRequest().getParameter("url");
		String fileName = Igrp.getInstance().getRequest().getParameter("fileName");
		FileRest content = new TaskService().getFile(url);
		content.setFileName(fileName);
		return this.xSend(content,fileName, content.getContentType(), true);
	}
	
	
	private String generateDocumentsTask(TaskServiceQuery task, HistoricTaskService history,boolean processFinished) {
		XMLWritter xml = new XMLWritter();
		try {
			history.setFilter("");
			List<TaskVariables> variables = history.getHistory(task.getId()).get(0).getVariables(); 
			if(variables !=null) {
				variables.stream()
				 		 .filter(v->v.getType().equalsIgnoreCase("binary"))
				 		 .forEach(v->{				
							 String[] file_desc = v.getName().split("___");
							 xml.startElement("row");
								 if(processFinished) {
									 xml.writeAttribute("nodelete", "");
									 xml.writeAttribute("noupdate", "");		
								 }
								 xml.setElement("prm_file_name",file_desc[0]);
								 xml.setElement("prm_file_name_desc",file_desc[0]);
								 xml.setElement("prm_file_description",file_desc[1]);
								 xml.setElement("prm_file_description_desc",file_desc[1]);
								 xml.startElement("prm_file_name_fk");
							 		xml.writeAttribute("name", "p_prm_file_name_fk");
							 		xml.writeAttribute("type", "link");
							 		xml.writeAttribute("target", "_newtab");
							 		xml.text(this.getConfig().getResolveUrl("igrp", "Detalhes_tarefas", "get-file&url="+v.getValueUrl()+"&fileName="+file_desc[2]));
							 	xml.endElement();		 	
			
							 	xml.startElement("prm_file_name_fk_desc");
							 		xml.writeAttribute("name", "p_prm_file_name_fk_desc");
							 		xml.writeAttribute("type", "link");
							 		xml.text(file_desc[2]);
							 	xml.endElement();			 	
							 xml.endElement();
			 	 });
			}
		}catch(NullPointerException e) {}
		return xml.toString();
	}

	/*----#END-PRESERVED-AREA----*/
}
