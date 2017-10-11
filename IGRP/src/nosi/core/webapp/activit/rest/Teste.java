package nosi.core.webapp.activit.rest;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import nosi.core.config.Config;
import nosi.core.gui.components.IGRPForm;
import nosi.core.gui.components.IGRPMenu;
import nosi.core.gui.fields.CheckBoxField;
import nosi.core.gui.fields.DateField;
import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.ListField;
import nosi.core.gui.fields.NumberField;
import nosi.core.gui.fields.TextField;
import nosi.core.gui.page.Page;
import nosi.core.webapp.activit.rest.FormDataService.FormProperties;
import nosi.core.webapp.helpers.DateHelper;
import nosi.core.webapp.helpers.IgrpHelper;
import nosi.core.xml.XMLWritter;

/**
 * Yma
 * 26 Sep 2017
 */
public class Teste{

//	public Teste() {
//		
//	}
//	public static void t(){
//		FormDataService formData = new FormDataService().getFormDataByProcessDefinitionId("Processo_Almoco:1:11319");
//		if(!formData.getFormProperties().isEmpty()){
//			String path_xsl = "../Process.xsl";
//			XMLWritter xml = new XMLWritter("rows", path_xsl , "utf-8");
//
//			xml.addXml(Config.getHeader());
//			xml.startElement("content");
//			xml.writeAttribute("type", "");
//			xml.setElement("title", "");
//			xml.startElement("content");
//			IGRPForm form = new IGRPForm("form");
//			for(FormProperties prop:formData.getFormProperties()){
//				Field field = getField(prop.getId().toLowerCase(), prop.getType());
//				field.setValue(prop.getValue());
//				field.setLabel(prop.getName());
//				if(prop.getType().endsWith("enum")){
//					field.setValue(IgrpHelper.toMap(prop.getEnumValues(), "id", "name","--- Selecionar Opção ---"));
//				}
//				form.addField(field);
//				xml.addXml(form.toString());
//			}
//			xml.endElement();
//			System.out.println(xml);
//		}
//	}
//
//	private  static Field getField(String name,String type){
//		switch (type) {
//		case "date":
//			return new DateField(null, name);
//		case "long":
//			return new NumberField(null, name);
//		case "boolean":
//			return new CheckBoxField(null, name);
//		case "enum":
//			return new ListField(null, name);
//		}
//		return new TextField(null, name);
//	}
	public static void main(String[] args){
		
		System.out.println(DateHelper.convertDate("11-10-2017", "dd-MM-yyyy", "dd-MM-yyyy h:mm"));
//		TaskService task = new TaskService();
//
//		task.addVariable("customerName", "string","Customer Teste");
//		task.addVariable("potentialProfit", "long",12);
//		task.addVariable("details", "string","Teste");
//		
//		if(task.completeTask("5516")){
//			System.out.println("ok");
//		}else{
//			System.err.println("task:"+task.getError());
//		}
		
//		FormData formData = new FormData();
//		formData.setTaskId("5516");
//		formData.addPropertie("customerName", "Ymac");
//		formData.addPropertie("potentialProfit", 100);
//		formData.addPropertie("details", "Cumi Bebi");
//		if(formData.submitFormByTask()){
//			System.out.println("Sumited success");
//		}else{
//			System.err.println("formData:"+formData.getError());
//		}
//		t();
//		FormData formData = new FormData().getFormDataByProcessDefinitionId("Processo_Almoco:1:11319");
//		System.out.println(formData);
		/*
		 Deployment d = new Deployment();
				d = d.getDeployment("23");
				d.setDeploymentTime(new Date());
				d = d.update(d);
		//		if(d.delete("5888")){
		//			System.out.println("Deletado");
		//		}else{
		//			System.out.println("error");
		//		}
		//		System.out.println(d.getName());
		//		for(Deployment dd:d.getDeployments()){
		//			System.out.println(dd.getName());
		//		}
				
		//		Resource dep = new Resource().getResourceData("23", "org/activiti/explorer/demo/process/createTimersProcess.bpmn20.xml");
		//		System.out.println(dep.getId());
		 
		 
		for(ProcessDefinition pd:new ProcessDefinition().getProcessDefinitions()){
			System.out.println(pd.getName());
		}*/
//		for(ProcessDefinitionService pd : new ProcessDefinitionService().getProcessDefinitionsAtivos())
//			System.out.println(pd.getName());
//		for(Task task:new Task().getTasks("kermit")){
//			System.out.println(task);
//		}
//		TaskService task = new TaskService();
//		if(task.delegateTask("33429", "isac"))
//			System.out.println("ok completado");
//		else
//			System.err.println("Error: "+task.getError().getException());
//		List<IGRPMenu> listMenus = new ArrayList<>();
//		IGRPMenu menus = new IGRPMenu("Activiti REST","");
//		IGRPMenu.Menu menu = new IGRPMenu.Menu("Deployed");
//		for(ProcessDefinitionService process:new ProcessDefinitionService().getProcessDefinitionsAtivos()){
//			IGRPMenu.SubMenu submenu = new IGRPMenu.SubMenu(process.getName(), "/igrp/MapaProcesso/openProcess&amp;p_processId="+process.getId(), process.getId(),process.getSuspended(), "LEFT_MENU");
//			menu.addSubMenu(submenu);
//			menus.addMenu(menu);
//		}
//		listMenus.add(menus);
//		IGRPMenu view_menu = new IGRPMenu("menus");
//		view_menu.setListMenu(listMenus);
//		System.out.println(view_menu);
//		for(TaskService task:new TaskService().getAllTasks()){
//			System.out.println(task);
//			ExecucaoTarefas.Table_gerir_tarefas t = new ExecucaoTarefas.Table_gerir_tarefas();
//			t.setAtribuido_a(task.getAssignee());
//			t.setAtribuido_por(task.getOwner());
//			t.setData_entrada(task.getDueDate().toString());
//			t.setDesc_tarefa(task.getDescription());
//			t.setNumero_processo_tabela(task.getId());
//			t.setTipo(task.getCategory());
//			taskManage.add(t);
//		}
		
//		GroupService group = new GroupService();
//		group.setId("igrp.admin");
//		group.setName("Admin IGRP");
//		group.setType("assignment");
//		
//		GroupService group1 = new GroupService();
//		group1.setId("igrp.user");
//		group1.setName("User IGRP");
//		group1.setType("security-role");
//		
//		
//		group.create(group);
//		group1.create(group1);
//		
//		UserService user = new UserService();
//		user.setId("user.igrp");
//		user.setPassword("password.igrp");
//		user.setFirstName("User");
//		user.setLastName("IGRP");
//		user.setEmail("igrp@nosi.cv");
//		user.create(user);
//		
//		group.addUser(user.getId());
		
//		new GroupService().addUser("Org Activiti", "x");
	}
}
