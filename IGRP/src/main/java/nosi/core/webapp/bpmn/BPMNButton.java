package nosi.core.webapp.bpmn;

import static nosi.core.i18n.Translator.gt;

import nosi.core.gui.components.IGRPButton;
import nosi.core.gui.components.IGRPToolsBar;
import nosi.core.webapp.Core;

/**
 * Emanuel
 * 20 Apr 2019
 */
public class BPMNButton {

	private static final String TITLE_BUTTON_SART_PROCESS = "Iniciar Processo";
	private static final String BUTTON_START_PROCESS = "iniciar_processo";
	private static final String BUTTON_TARGET_SAVE_PROCESS = "submit";
	private static final String BUTTON_IMG_SAVE_PROCESS = "success|fa-play";
	private static final String BUTTON_BACK = "back_processo";
	private static final String TITLE_BUTTON_BACK = "Voltar";
	private static final String BUTTON_TARGET_BACK_PROCESS = "_self";
	private static final String BUTTON_IMG_BACK_PROCESS = "primary|fa-backward";
	private static final String TITLE_BUTTON_NEXT = "Seguinte";
	private static final Object BUTTON_NEXT = "next_process";
	private static final String BUTTON_IMG_EDIT_PROCESS = "success|fa-backward";
	
	
	public static IGRPToolsBar generateButtonProcess(String appDad,Integer appId, String page,String action,String p_processId) {
		IGRPToolsBar toolsbar1 = new IGRPToolsBar("toolsbar");
		IGRPButton button = new IGRPButton();
		button.getProperties().add("code", BUTTON_START_PROCESS);
		button.getProperties().add("rel", BUTTON_START_PROCESS);
		button.getProperties().add("type", "specific");
		button.setTitle(gt(TITLE_BUTTON_SART_PROCESS));
		button.setApp(appDad);
		button.setPage(page);
		button.setLink(action+"&"+"p_prm_definitionid="+p_processId+"&processDefinition="+Core.getParam("processDefinition",false)+"&taskDefinition="+Core.getParam("taskDefinition",false)+"&appId="+appId);
		button.setTarget(BUTTON_TARGET_SAVE_PROCESS);
		button.setImg(BUTTON_IMG_SAVE_PROCESS);
		toolsbar1.addButton(button);
		return toolsbar1;
	}
	
	public static IGRPToolsBar generateButtonBack() {
		IGRPToolsBar toolsbar1 = new IGRPToolsBar("toolsbar");
		IGRPButton button = new IGRPButton();
		button.getProperties().add("code", BUTTON_BACK);
		button.getProperties().add("rel", BUTTON_BACK);
		button.getProperties().add("type", "specific");
		button.setTitle(gt(TITLE_BUTTON_BACK));
		button.setApp("igrp");
		button.setPage("ExecucaoTarefas");
		button.setLink("index");
		button.setTarget(BUTTON_TARGET_BACK_PROCESS);
		button.setImg(BUTTON_IMG_BACK_PROCESS);
		toolsbar1.addButton(button);
		return toolsbar1;
	}
	
	public static IGRPToolsBar generateButtonTask(String appDad,Integer appId, String page,String action, String taskId) {
		return generateButtonTask(appDad,appId, page, action, BUTTON_IMG_SAVE_PROCESS, taskId);
	}

	public static IGRPToolsBar generateButtonEditTask(String appDad,Integer appId,String page,String action,String taskId) {
		return generateButtonTask(appDad,appId, page, action, BUTTON_IMG_EDIT_PROCESS, taskId);
	}
	
	public static IGRPToolsBar generateButtonTask(String appDad,Integer appId, String page,String action,String icon, String taskId) {
		IGRPToolsBar toolsbar1 = new IGRPToolsBar("toolsbar");
		IGRPButton button = new IGRPButton();
		button.getProperties().add("code", BUTTON_NEXT);
		button.getProperties().add("rel",  BUTTON_NEXT);
		button.getProperties().add("type", "specific");
		button.setTitle(gt(TITLE_BUTTON_NEXT));
		button.setApp(appDad);
		button.setPage(page);
		String processParams = getDefaultProcessParams();
		button.setLink(action+"&"+"taskId="+taskId+"&appId="+appId+processParams);
		button.setTarget(BUTTON_TARGET_SAVE_PROCESS);
		button.setImg(icon);
		toolsbar1.addButton(button);
		return toolsbar1;
	}
	
	private static String getDefaultProcessParams() {
		String params = "&processDefinition="+Core.getParam("processDefinition",false)
						+"&taskDefinition="+Core.getParam("taskDefinition",false)
						+"&appDad="+Core.getParam("appDad",false)
						+"&formKey="+Core.getParam("formKey",false)
						+"&processDefinitionId="+Core.getParam("processDefinitionId",false)
						+"&taskDefinition="+Core.getParam("taskDefinition",false)
						+"&previewTask="+Core.getParam("previewTask",false)
						+"&preiviewApp="+Core.getParam("preiviewApp",false)
						+"&preiviewProcessDefinition="+Core.getParam("preiviewProcessDefinition",false)
						+"&showTimeLine=true"
						+"&previewTaskId="+Core.getParam("previewTaskId",false);
		return params;
	}
	
	public static String removeXMLButton(String content) {
		int index = content.indexOf("xml-type=\"toolsbar\"");
		if(index != -1) {
			int index2 = content.indexOf("<item",index);
			if(index2 != -1) {
				String c = content.substring(0,content.indexOf(">",index))+">";
				c+= content.substring(content.lastIndexOf("</item>")+"</item>".length()); 
				return c;
			}
		}
		return content;
	}
	
}
