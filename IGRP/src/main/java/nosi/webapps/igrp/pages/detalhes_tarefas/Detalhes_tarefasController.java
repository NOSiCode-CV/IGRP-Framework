
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
import nosi.core.gui.fields.FileField;
import nosi.core.gui.fields.TextAreaField;
import nosi.core.gui.fields.TextField;
import java.io.IOException;
import java.util.List;
import com.google.gson.Gson;
import nosi.core.webapp.Response;
import nosi.core.webapp.activit.rest.CustomVariableIGRP;
import nosi.core.webapp.activit.rest.Rows;
import nosi.core.webapp.activit.rest.TaskServiceQuery;
import nosi.core.webapp.activit.rest.TaskVariables;
import nosi.core.webapp.helpers.StringHelper;
import nosi.core.xml.XMLTransform;
import nosi.core.xml.XMLWritter;
/*----#END-PRESERVED-AREA----*/

public class Detalhes_tarefasController extends Controller {

	public Response actionIndex() throws IOException{
		/*----#START-PRESERVED-AREA(INDEX)----*/
		String taskId = Igrp.getInstance().getRequest().getParameter("taskId");
		TaskServiceQuery taskS = new TaskServiceQuery();
		taskS.addFilter("includeProcessVariables", "true");
		taskS.addFilter("taskId", taskId);
		String content = "";
		for(TaskServiceQuery task:taskS.queryHistoryTask()) {
			content = generateSubmittedFormTask(task,task.getVariables());
		}
		return this.renderView(content);
		/*----#END-PRESERVED-AREA----*/
	}

	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
	private String generateSubmittedFormTask(TaskServiceQuery task,List<TaskVariables> variables) {
		String path_xsl = Config.LINK_XSL_MAP_PROCESS;
		XMLWritter xml = new XMLWritter("rows", path_xsl , "utf-8");
		xml.addXml(Config.getHeader());
		xml.startElement("content");
		xml.writeAttribute("type", "");
		xml.setElement("title", gt("Detalhes Tarefa"));
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
		

		IGRPForm form = new IGRPForm("form",(float)2.1);
		IGRPTable table = new IGRPTable("table", (float)2.1);
		IGRPTable table_form = new IGRPTable("table", (float)2.1);
		
		Field prm_file_name = new TextField(null,"prm_file_name");
		prm_file_name.setLabel(gt("Nome Ficheiro"));
		prm_file_name.propertie().add("rel", "prm_doc_list").add("required", "true");
		Field prm_file_name_desc = new TextField(null,"prm_file_name_desc");
		prm_file_name_desc.setLabel(gt("Nome Ficheiro"));
		Field prm_file_description = new TextAreaField(null,"prm_file_description");
		prm_file_description.setLabel(gt("Descri��o"));
		prm_file_description.propertie().add("rel", "prm_doc_list").add("required", "true");
		Field prm_file_description_desc = new TextAreaField(null,"prm_file_description_desc");
		prm_file_description_desc.setLabel(gt("Descri��o"));
		Field prm_file = new FileField(null,"prm_file");
		prm_file.setLabel(gt("Ficheiro"));
		prm_file.propertie().add("rel", "prm_doc_list").add("maxlength", 300);
		prm_file.propertie().add("end", "true").add("required", "true");
		Field prm_file_desc = new FileField(null,"prm_file_desc");
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
		
	
		Field prm_doc_list = new TextField(null,"prm_doc_list");
		prm_doc_list.propertie().add("type", "separatordialog");
		prm_doc_list.propertie().add("container", "true");
		prm_doc_list.setLabel(gt("Adicionar Documentos"));
		
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

		if(task!=null && variables.size()>0) {
			for(TaskVariables prop:variables){
				if(prop.getName().equalsIgnoreCase("CustomVariableIGRP")) {
					return this.generateIGRPFormTask(prop);
				}
				Field field = XMLTransform.getField(prop.getName(),prop.getType());
				if(Core.isNotNull(prop.getValue()))
					field.setValue(prop.getValue());
				field.propertie().add("readonly", "true");
				field.propertie().add("disabled", "true");
				field.setLabel(gt(StringHelper.camelCase(prop.getName())));
				form.addField(field);
			}
		}
		
		form.addField(prm_doc_list);
		form.addField(p_fwl_tab_menu);
		form.addField(p_fwl_relbox);
		form.addField(p_fwl_dialogbox);
		form.addField(p_fwl_workflow);
		form.addField(p_fwl_tab_page);
		form.addField(prm_file_name);
		form.addField(prm_file_description);
		form.addField(prm_file);
		form.setTable(table_form);
		xml.addXml(view.toString());
		xml.addXml(form.toString());
		xml.addXml(table.toString());
		return xml.toString();
	}
	
	private String generateIGRPFormTask(TaskVariables prop) {
		Gson gson = new Gson();
		String app = "";
		String page ="";
		String action = "index";
		CustomVariableIGRP custom = gson.fromJson(prop.getValue().toString(), CustomVariableIGRP.class);
		if(custom!=null){
			for(Rows rows:custom.getRows()) {
				if(rows.getName().equalsIgnoreCase("page_igrp_ativiti")) {
					page = rows.getValue()[0].toString();
				}if(rows.getName().equalsIgnoreCase("app_igrp_ativiti")) {
					app = rows.getValue()[0].toString();
				}
//				if(rows.getName().equalsIgnoreCase("p_prm_definitionid")) {
//					app = "index&p_prm_definitionid="+rows.getValue()[0].toString();
//				}if(rows.getName().equalsIgnoreCase("p_prm_taskid")) {
//					app = "index&p_prm_taskid="+rows.getValue()[0].toString();
//				}					
//				for(Object o:rows.getValue()) {
//					
//				}
			}
			Response resp = this.call(app, page, action);
			return resp.getContent();
		}
		return null;
	}
	
	/*----#END-PRESERVED-AREA----*/
}
