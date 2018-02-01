
package nosi.webapps.igrp.pages.detalhes_tarefas;

/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import nosi.core.webapp.Igrp;
import static nosi.core.i18n.Translator.gt;
import nosi.core.config.Config;
import nosi.core.gui.components.IGRPForm;
import nosi.core.gui.components.IGRPTable;
import nosi.core.gui.components.IGRPView;
import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.LinkField;
import nosi.core.gui.fields.TextField;
import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;
import com.google.gson.Gson;
import nosi.core.webapp.Response;
import nosi.core.webapp.activit.rest.CustomVariableIGRP;
import nosi.core.webapp.activit.rest.QueryHistoricDetail;
import nosi.core.webapp.activit.rest.Rows;
import nosi.core.webapp.activit.rest.TaskService;
import nosi.core.webapp.activit.rest.TaskServiceQuery;
import nosi.core.webapp.activit.rest.TaskVariables;
import nosi.core.webapp.helpers.StringHelper;
import nosi.core.webapp.webservices.helpers.FileRest;
import nosi.core.xml.XMLTransform;
import nosi.core.xml.XMLWritter;
/*----#END-PRESERVED-AREA----*/

public class Detalhes_tarefasController extends Controller {

	public Response actionIndex() throws IOException{
		/*----#START-PRESERVED-AREA(INDEX)----*/
		String taskId = Igrp.getInstance().getRequest().getParameter("taskId");
		TaskServiceQuery taskS = new TaskServiceQuery();
		QueryHistoricDetail qhd = new QueryHistoricDetail();
		taskS.addFilter("taskId", taskId);
		String content = "";
		for(TaskServiceQuery task:taskS.queryHistoryTask()) {
			content = generateSubmittedFormTask(task,qhd.queryHistoricDetail(taskId));
			break;//because for unique task
		}
		return this.renderView(content);
		/*----#END-PRESERVED-AREA----*/
	}

	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/

	private String generateSubmittedFormTask(TaskServiceQuery task, List<QueryHistoricDetail> queryHistoricDetail) {
		if(task.hasCustomForm()) {
			return this.generateCustomFormTask(task);
		}
		String path_xsl = Config.LINK_XSL_MAP_PROCESS;
		XMLWritter xml = new XMLWritter("rows", path_xsl , "utf-8");
		xml.addXml(Config.getHeader());
		xml.startElement("content");
		xml.writeAttribute("type", "");
		xml.setElement("title", gt("Detalhes Tarefa"));	
		xml.addXml(this.generateViewTask(task));
		xml.addXml(this.generateFormTask(queryHistoricDetail));
		xml.addXml(this.generateTableTask(task));
		return xml.toString();
	}
	
	private String generateFormTask(List<QueryHistoricDetail> task) {
		IGRPTable table_form = new IGRPTable("table", (float)2.1);
		IGRPForm form = new IGRPForm("form",(float)2.1);
		
		Field prm_doc_list = new TextField(null,"prm_doc_list");
		prm_doc_list.propertie().add("type", "separatordialog");
		prm_doc_list.propertie().add("container", "true");
		prm_doc_list.setLabel(gt("Documentos"));
		
		Field p_fwl_tab_page = new TextField(null,"p_fwl_tab_page");
		p_fwl_tab_page.propertie().add("type", "hidden");
		Field p_fwl_workflow = new TextField(null,"p_fwl_workflow");
		p_fwl_workflow.propertie().add("type", "hidden");
		Field p_fwl_dialogbox = new TextField(null,"p_fwl_dialogbox");
		p_fwl_dialogbox.propertie().add("type", "hidden");
		Field p_fwl_relbox = new TextField(null,"p_fwl_relbox");
		p_fwl_relbox.propertie().add("type", "hidden");
		Field p_fwl_tab_menu = new TextField(null,"p_fwl_tab_menu");
		p_fwl_tab_menu.propertie().add("type", "hidden");
		
		
		Field prm_file_name = new LinkField(null,"prm_file_name");
		prm_file_name.setLabel(gt("Nome Ficheiro"));
		prm_file_name.propertie().add("rel", "prm_doc_list").add("required", "true");
		Field prm_file_name_desc = new LinkField(null,"prm_file_name_desc");
		prm_file_name_desc.setLabel(gt("Nome Ficheiro"));
		Field prm_file_description = new LinkField(null,"prm_file_description");
		prm_file_description.setLabel(gt("Descrição"));
		prm_file_description.propertie().add("rel", "prm_doc_list").add("required", "true");
		Field prm_file_description_desc = new LinkField(null,"prm_file_description_desc");
		prm_file_description_desc.setLabel(gt("Descrição"));
		Field prm_file = new LinkField(null,"prm_file");
		prm_file.setLabel(gt("Ficheiro"));
		prm_file.propertie().add("rel", "prm_doc_list").add("maxlength", 300).add("end", "true").add("required", "true");
		Field prm_file_desc = new LinkField(null,"prm_file_desc");
		prm_file_desc.setLabel(gt("Ficheiro"));
		prm_file_desc.propertie().add("maxlength", 300);
		Field prm_doc_list_id = new TextField(null,"prm_doc_list_id");
		prm_doc_list_id.propertie().add("type", "hidden");
		
		table_form.addField(prm_file_name);
		table_form.addField(prm_file_name_desc);
		table_form.addField(prm_file_description);
		table_form.addField(prm_file_description_desc);
		table_form.addField(prm_file);
		table_form.addField(prm_file_desc);
		table_form.addField(prm_doc_list_id);
		
		task.stream().forEach(t->{
			if(t.getVariable()!=null && !t.getVariable().getType().equalsIgnoreCase("binary")) {
				Field field = XMLTransform.getField(t.getVariable().getName(),t.getVariable().getType());
				if(Core.isNotNull(t.getVariable().getValue()))
					field.setValue(t.getVariable().getValue());
				field.propertie().add("readonly", "true");
				field.propertie().add("disabled", "true");
				field.setLabel(gt(StringHelper.camelCase(t.getVariable().getName())));
				form.addField(field);
			}
			if(Core.isNotNull(t.getPropertyId())) {
				Field field = XMLTransform.getField(t.getPropertyId(),"string");
				if(Core.isNotNull(t.getPropertyValue()))
					field.setValue(t.getPropertyValue());
				field.propertie().add("readonly", "true");
				field.propertie().add("disabled", "true");
				field.setLabel(gt(StringHelper.camelCase(t.getPropertyId())));
				form.addField(field);
			}
		});
		
		form.addField(prm_doc_list);
		form.addField(p_fwl_tab_menu);
		form.addField(p_fwl_relbox);
		form.addField(p_fwl_dialogbox);
		form.addField(p_fwl_workflow);
		form.addField(p_fwl_tab_page);
		form.addField(prm_file_name);
		form.addField(prm_file_description);
		form.addField(prm_file);
		table_form.addRowsXMl(this.generateDocumentsTask(task));
		form.setTable(table_form);
		return form.toString();
	}

	private String generateDocumentsTask(List<QueryHistoricDetail> task) {
		XMLWritter xml = new XMLWritter();
		xml.startElement("value");
		task.stream()
		 .filter(t->t.getVariable()!=null)
		 .forEach(t->{				
					 String[] file_desc = t.getVariable().getName().split("___");
					 xml.startElement("row");
					 xml.writeAttribute("nodelete", "");
					 xml.writeAttribute("noupdate", "");			 	
						 xml.setElement("prm_file_name",file_desc[0]);
						 xml.setElement("prm_file_name_desc",file_desc[0]);
						 xml.setElement("prm_file_description",file_desc[1]);
						 xml.setElement("prm_file_description_desc",file_desc[1]);							 
						 xml.startElement("prm_file");
					 		xml.writeAttribute("type", "link");
					 		xml.writeAttribute("target", "_newtab");
					 		xml.text(Config.getResolveUrl("igrp", "Detalhes_tarefas", "get-file&url="+t.getVariable().getValueUrl()+"&fileName="+file_desc[2]));
					 	xml.endElement();		 	
	
					 	xml.startElement("prm_file_desc");
					 		xml.writeAttribute("type", "link");
					 		xml.text(file_desc[2]);
					 	xml.endElement();			 	
						xml.setElement("prm_doc_list_id", t.getVariable().getName());
					 xml.endElement();
	 	 });
		xml.endElement();
		return xml.toString();
	}

	private String generateTableTask(TaskServiceQuery task) {
		IGRPTable table = new IGRPTable("table", (float)2.1);
		return table.toString();
	}

	private String generateViewTask(TaskServiceQuery task) {
		IGRPView view = new IGRPView("view",gt("Processo Nº "+task.getProcessInstanceId()+" - Tarefa "+task.getId()),(float)2.1);
		
		Field user_exec = new TextField(null,"user_exec");
		user_exec.propertie().add("type","text").add("name","p_user_exec").add("persist","true").add("maxlength","4000");
		user_exec.setLabel(gt("Executado por:"));
		user_exec.setValue(Core.isNotNull(task.getAssignee())?task.getAssignee():"");

		Field startDate = new TextField(null,"start_date");
		startDate.propertie().add("type","text").add("name","p_start_date").add("persist","true").add("maxlength","4000");	
		startDate.setLabel(gt("Data Inicio"));
		startDate.setValue(Core.isNotNull(task.getStartTime())?Core.ToChar(task.getStartTime(), "yyyy-MM-dd'T'HH:mm:ss","yyyy-MM-dd HH:mm:ss"):"");

		Field endDate = new TextField(null,"end_date");
		endDate.propertie().add("type","text").add("name","p_end_date").add("persist","true").add("maxlength","4000");	
		endDate.setLabel(gt("Data Fim"));
		endDate.setValue(Core.isNotNull(task.getEndTime())?Core.ToChar(task.getEndTime(), "yyyy-MM-dd'T'HH:mm:ss","yyyy-MM-dd HH:mm:ss"):"");
		
		view.addField(user_exec);
		view.addField(startDate);
		view.addField(endDate);
		return view.toString();
	}
	
	private String generateCustomFormTask(TaskServiceQuery task) {
		Gson gson = new Gson();
		String app = "";
		String page ="";
		String action = "index";
		List<TaskVariables> tv = task.getVariables().stream()
				   									.filter(v->v.getName().equalsIgnoreCase("CustomVariableIGRP"))
				   									.collect(Collectors.toList());		
		CustomVariableIGRP custom = gson.fromJson(tv.get(0).toString(), CustomVariableIGRP.class);
		if(custom!=null){
			for(Rows rows:custom.getRows()) {
				if(rows.getName().equalsIgnoreCase("page_igrp_ativiti")) {
					page = rows.getValue()[0].toString();
				}if(rows.getName().equalsIgnoreCase("app_igrp_ativiti")) {
					app = rows.getValue()[0].toString();
				}
			}
			Response resp = this.call(app, page, action);
			return resp.getContent();
		}
		return null;
	}
	
	
	public Response actionGetFile() throws IOException {
		String url = Igrp.getInstance().getRequest().getParameter("url");
		String fileName = Igrp.getInstance().getRequest().getParameter("fileName");
		FileRest content = new TaskService().getFile(url);
		byte[] bytes = new byte[content.getSize()];
		content.getContent().read(bytes, 0, bytes.length);
		content.getContent().close();
		return this.xSend(bytes,fileName, content.getContentType(), true);
	}
	/*----#END-PRESERVED-AREA----*/
}
