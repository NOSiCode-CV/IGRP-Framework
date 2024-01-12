package nosi.core.webapp.bpmn;

import nosi.core.gui.components.IGRPButton;
import nosi.core.gui.components.IGRPToolsBar;
import nosi.core.webapp.Core;
import nosi.core.webapp.QueryString;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Objects;

import static nosi.core.i18n.Translator.gt;

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
	private static final String TITLE_BUTTON_BACK = "Tarefas";
	private static final String BUTTON_TARGET_BACK_PROCESS = "_self";
	private static final String BUTTON_IMG_BACK_PROCESS = "primary|fa-list-ol";
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
	
	public static IGRPToolsBar generateButtonTask(String appDad,Integer appId, String page,String action, String taskId, QueryString<String, Object> qs) {
		return generateButtonTask(appDad,appId, page, action, BUTTON_IMG_SAVE_PROCESS, taskId, qs);
	}

	public static IGRPToolsBar generateButtonEditTask(String appDad,Integer appId,String page,String action,String taskId, QueryString<String, Object> qs) {
		return generateButtonTask(appDad,appId, page, action, BUTTON_IMG_EDIT_PROCESS, taskId, qs);
	}
	
	public static IGRPToolsBar generateButtonTask(String appDad,Integer appId, String page,String action,String icon, String taskId, QueryString<String, Object> qs) {
		IGRPToolsBar toolsbar1 = new IGRPToolsBar("toolsbar");
		IGRPButton button = new IGRPButton();
		button.getProperties().add("code", BUTTON_NEXT);
		button.getProperties().add("rel",  BUTTON_NEXT);
		button.getProperties().add("type", "specific");
		button.setTitle(gt(TITLE_BUTTON_NEXT));
		button.setApp(appDad);
		button.setPage(page);
		String _link = action + "&"+ BPMNConstants.PRM_TASK_ID + "=" + taskId; 
		StringBuilder sb = new StringBuilder(); 
		setQueryString(qs, sb); 
		if(sb.length() > 0) 
			_link += sb.toString(); 
		button.setLink(_link);
		button.setTarget(BUTTON_TARGET_SAVE_PROCESS);
		button.setImg(icon);
		toolsbar1.addButton(button);
		return toolsbar1;
	}
	
	private static void setQueryString(QueryString<String, Object> queryString, StringBuilder qs) {
		if (queryString != null && !queryString.getQueryString().isEmpty()) {
			queryString.getQueryString().forEach((key, value) -> value.stream().filter(Objects::nonNull)
                    .forEach(q1 -> {
                       if (key.startsWith(BPMNConstants.CUSTOM_PARAM_PREFIX))
                          qs.append("&").append(key).append("=").append(Core.isNotNull(q1) && q1 instanceof String ? URLEncoder.encode((String) q1, StandardCharsets.UTF_8) : q1);
                    }));
		}
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
