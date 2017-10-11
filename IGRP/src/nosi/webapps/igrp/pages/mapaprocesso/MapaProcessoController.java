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
import nosi.core.gui.fields.CheckBoxField;
import nosi.core.gui.fields.DateField;
import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.HiddenField;
import nosi.core.gui.fields.ListField;
import nosi.core.gui.fields.NumberField;
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

/*---- End ----*/

public class MapaProcessoController extends Controller {		


	public Response actionIndex() throws IOException{
		/*---- Insert your code here... ----*/
		MapaProcesso model = new MapaProcesso();
		MapaProcessoView view = new MapaProcessoView(model);
		List<IGRPMenu> listMenus = new ArrayList<>();
		IGRPMenu menus = new IGRPMenu("Lista de Processos","webapps?r=");
		IGRPMenu.Menu menu = new IGRPMenu.Menu("Processos Ativos");
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
		if(p_processId!=null){
			formData = new FormDataService().getFormDataByProcessDefinitionId(p_processId);
		}
		if(taskId!=null){
			formData = new FormDataService().getFormDataByTaskId(taskId);
		}
		String content = this.transformToXml(formData);
		return this.renderView(content);
	}
	/*---- End ----*/

	private String transformToXml(FormDataService formData) {
		String path_xsl = "images/IGRP/IGRP2.3/xsl/IGRP-process.xsl";
		XMLWritter xml = new XMLWritter("rows", path_xsl , "utf-8");
		xml.addXml(Config.getHeader());
		xml.startElement("content");
		xml.writeAttribute("type", "");
		xml.setElement("title", "Process Task");
		IGRPForm form = new IGRPForm("form",(float)2.1);
		IGRPButton btn_next = new IGRPButton("Seguinte", "igrp", "ExecucaoTarefas", "process-task", "submit", "primary|fa-arrow-circle-right", "", "");

		if(formData!=null && formData.getFormProperties()!=null){
			Field id = getField("task_id", "hidden");
			id.setValue(formData.getTaskId());
			form.addField(id);
			for(FormProperties prop:formData.getFormProperties()){
				Field field = getField(prop.getId().toLowerCase(), prop.getType());
				field.setLabel(prop.getName());
				if(prop.getValue()!=null && !prop.getValue().equals("null"))
					field.setValue(prop.getValue());
				if(prop.getRequired())
					field.propertie().add("required","true");
//				if(prop.getReadable())
//					field.propertie().add("readonly", "true");
//				if(prop.getWritable())
//					field.propertie().add("disabled", "true");
				if(prop.getType().endsWith("enum")){
					field.setValue(IgrpHelper.toMap(prop.getEnumValues(), "id", "name","--- Selecionar Opção ---"));
				}
				form.addField(field);
			}
		}
		form.addButton(btn_next);
		xml.addXml(form.toString());
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
