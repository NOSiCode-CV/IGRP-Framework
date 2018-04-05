package nosi.core.xml;

import static nosi.core.i18n.Translator.gt;
import java.util.List;
import nosi.core.gui.components.IGRPButton;
import nosi.core.webapp.Core;
import nosi.webapps.igrp.dao.TaskComponent;

/**
 * Emanuel
 * 5 Apr 2018
 */
public class XMLExtractComponent {

	private String component="";
	
	public String extract(String xml) {
		if(Core.isNotNull(xml)) {
			int start = xml.indexOf(">",xml.indexOf("<content"))+">".length();
			int end = xml.lastIndexOf("</content>");
			if(start != -1 && end != -1) {
				return xml.substring(start, end);
			}
		}
		return "";
	}
	

	public IGRPButton generateButtonProcess(String p_processId,String taskId) {
		String id = Core.isNotNull(p_processId)?("p_prm_definitionid="+p_processId):("p_prm_taskid="+taskId);
		IGRPButton button = new IGRPButton();
		button.getProperties().add("code", "iniciar_processo");
		button.getProperties().add("rel", "iniciar_processo");
		button.getProperties().add("type", "specific");
		button.setTitle(gt(Core.isNotNull(p_processId)?"Iniciar Processo":"Seguinte"));
		button.setApp("igrp");
		button.setPage("ExecucaoTarefas");
		button.setLink("process-task&"+id);
		button.setTarget("submit");
		button.setImg("primary|fa-arrow-right");
		return button;
	}
	
	public String joinComponent(String codigo) {
		List<TaskComponent> components = new TaskComponent().find().andWhere("codigo", "=",codigo).all();
		components.stream().forEach(c->{
			component += c.getAction().getXmlContent();
		});
		return component;
	}
}
