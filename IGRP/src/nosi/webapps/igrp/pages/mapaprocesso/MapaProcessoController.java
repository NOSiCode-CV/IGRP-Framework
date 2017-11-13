/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.mapaprocesso;
/*---- Import your packages here... ----*/
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import nosi.core.config.Config;
import nosi.core.gui.components.IGRPButton;
import nosi.core.gui.components.IGRPForm;
import nosi.core.gui.components.IGRPMenu;
import nosi.core.gui.components.IGRPMessage;
import nosi.core.gui.components.IGRPTable;
import nosi.core.gui.fields.CheckBoxField;
import nosi.core.gui.fields.DateField;
import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.FileField;
import nosi.core.gui.fields.HiddenField;
import nosi.core.gui.fields.ListField;
import nosi.core.gui.fields.NumberField;
import nosi.core.gui.fields.SeparatorField;
import nosi.core.gui.fields.TextAreaField;
import nosi.core.gui.fields.TextField;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import nosi.core.webapp.Response;
import nosi.core.webapp.activit.rest.FormDataService;
import nosi.core.webapp.activit.rest.FormDataService.FormProperties;
import nosi.core.webapp.helpers.IgrpHelper;
import nosi.core.xml.XMLWritter;
import nosi.core.webapp.activit.rest.ProcessDefinitionService;
import nosi.core.webapp.activit.rest.TaskService;

import static nosi.core.i18n.Translator.gt;

/*---- End ----*/

public class MapaProcessoController extends Controller {		


	public Response actionIndex() throws IOException{
		/*---- Insert your code here... ----*/
		MapaProcesso model = new MapaProcesso();
		MapaProcessoView view = new MapaProcessoView(model);
		List<IGRPMenu> listMenus = new ArrayList<>();
		IGRPMenu menus = new IGRPMenu(gt("Lista de Processos"),"webapps?r=");
		IGRPMenu.Menu menu = new IGRPMenu.Menu(gt("Processos Ativos"));
		for(ProcessDefinitionService process:new ProcessDefinitionService().getProcessDefinitionsAtivos()){
			IGRPMenu.SubMenu submenu = new IGRPMenu.SubMenu(process.getName(), "webapps?r=igrp/MapaProcesso/openProcess&amp;p_processId="+process.getId(), process.getId(),process.getSuspended(), "LEFT_MENU");
			menu.addSubMenu(submenu);
		}
		menus.addMenu(menu);
		listMenus.add(menus);
		view.menu.setListMenu(listMenus);
		return this.renderView(view);
		/*---- End ----*/
	}

	/*---- Insert your actions here... ----*/
	public Response actionOpenProcess(){
		String p_processId = Igrp.getInstance().getRequest().getParameter("p_processId");
		String taskId = Igrp.getInstance().getRequest().getParameter("taskId");
		FormDataService formData = null;
		String title = "";
		if(p_processId!=null){
			ProcessDefinitionService process = new ProcessDefinitionService().getProcessDefinition(p_processId);
			title = process!=null? process.getName()+" -  Nº "+process.getDeploymentId():"";
			formData = new FormDataService().getFormDataByProcessDefinitionId(p_processId);
		}
		if(taskId!=null){
			TaskService task = new TaskService().getTask(taskId);
			title = task!=null?task.getName()+" - Nº "+task.getId():"";
			formData = new FormDataService().getFormDataByTaskId(taskId);
		}
		String content = this.transformToXmlWorkFlow(title,formData);
		return this.renderView(content);
	}
	/*---- End ----*/

	private String transformToXmlWorkFlow(String title,FormDataService formData) {
		String path_xsl = "images/IGRP/IGRP2.3/xsl/IGRP-process.xsl";
		XMLWritter xml = new XMLWritter("rows", path_xsl , "utf-8");
		xml.addXml(Config.getHeader());
		xml.startElement("content");
		xml.writeAttribute("type", "");
		xml.setElement("title", title);
		IGRPMessage msg = new IGRPMessage();
		String m = msg.toString();
		xml.addXml(m);
		IGRPForm form = new IGRPForm("form",(float)2.1);
		IGRPButton btn_next = new IGRPButton((formData!=null && formData.getProcessDefinitionId()!=null)?"Iniciar Processo":"Seguinte", "igrp", "ExecucaoTarefas", "process-task", "submit", "next.png", "", "");
		IGRPTable table = new IGRPTable("table", (float)2.1);
		IGRPTable table_form = new IGRPTable("table", (float)2.1);
		
		Field prm_file_name = new TextField(null,"prm_file_name");
		prm_file_name.setLabel(gt("Nome Ficheiro"));
		prm_file_name.propertie().add("rel", "prm_doc_list").add("required", "true");
		Field prm_file_name_desc = new TextField(null,"prm_file_name_desc");
		prm_file_name_desc.setLabel(gt("Nome Ficheiro"));
		Field prm_file_description = new TextAreaField(null,"prm_file_description");
		prm_file_description.setLabel(gt("Descrição"));
		prm_file_description.propertie().add("rel", "prm_doc_list").add("required", "true");
		Field prm_file_description_desc = new TextAreaField(null,"prm_file_description_desc");
		prm_file_description_desc.setLabel(gt("Descrição"));
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
		
		Field separatoradd_document1 = new SeparatorField(null, "separatoradd_document1");
		separatoradd_document1.propertie().add("start", "add_document");
		separatoradd_document1.setLabel(gt("Adicionar Documento"));
		
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

		
		if(formData!=null){
			Field prm_taskid = getField("prm_taskid", "hidden");
			prm_taskid.setValue(formData.getTaskId()!=null?formData.getTaskId():"");

			Field prm_definitionid = getField("prm_definitionid", "hidden");
			prm_definitionid.setValue(formData.getProcessDefinitionId()!=null?formData.getProcessDefinitionId():"");
			form.addField(prm_taskid);
			form.addField(prm_definitionid);
			if(formData.getFormProperties()!=null){
				for(FormProperties prop:formData.getFormProperties()){
					Field field = getField(prop.getId().toLowerCase(), prop.getType());
					field.setLabel(prop.getName());
					if(prop.getValue()!=null && !prop.getValue().equals("null"))
						field.setValue(prop.getValue());
					if(prop.getRequired())
						field.propertie().add("required","true");
					if(!prop.getReadable())
						field.setVisible(false);
					if(!prop.getWritable())
						field.propertie().add("readonly", "true");
					if(prop.getType().endsWith("enum")){
						field.setValue(IgrpHelper.toMap(prop.getEnumValues(), "id", "name",gt("--- Selecionar Opção ---")));
					}
					form.addField(field);
				}
			}
		}
		form.addField(separatoradd_document1);
		form.addField(prm_doc_list);
		form.addField(p_fwl_tab_menu);
		form.addField(p_fwl_relbox);
		form.addField(p_fwl_dialogbox);
		form.addField(p_fwl_workflow);
		form.addField(p_fwl_tab_page);
		form.addField(prm_file_name);
		form.addField(prm_file_description);
		form.addField(prm_file);
		
		form.addButton(btn_next);
		form.setTable(table_form);
		xml.addXml(form.toString());
		xml.addXml(table.toString());
		return xml.toString();
	}
	
	private Field getField(String name,String type){
		switch (type) {
			case "date":
				return new DateField(null, name);
			case "long":
				return new NumberField(null, name);
			case "boolean":
				return new CheckBoxField(null, name);
			case "enum":
				return new ListField(null, name);
			case "hidden":
				return new HiddenField(null, name);
		}
		return new TextField(null, name);
	}
}
