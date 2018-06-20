package nosi.core.webapp.bpmn;

import java.util.List;
import org.apache.commons.lang.StringEscapeUtils;
import nosi.core.config.Config;
import nosi.core.webapp.Core;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.activit.rest.HistoricTaskService;
import nosi.core.webapp.activit.rest.TaskVariables;
import nosi.core.webapp.helpers.DateHelper;
import nosi.webapps.igrp.dao.TipoDocumentoEtapa;

/**
 * Emanuel
 * 7 May 2018
 */
public class BPMNHelper {

	public static Object getValue(String type,String name){
		Object value = Igrp.getInstance().getRequest().getParameter("p_"+name.toLowerCase());
		try {
			switch (type.toLowerCase()) {
				case "date":
					return DateHelper.convertDate(value.toString(), "dd-MM-yyyy", "dd-MM-yyyy h:mm");
				case "long":
					if(Core.isNotNull(value))
						return Long.parseLong(value.toString());
					return 0;
				case "double":
					if(Core.isNotNull(value))
						return Double.parseDouble(value.toString());
					return 0;
				case "float":
					if(Core.isNotNull(value))
						return Float.parseFloat(value.toString());
					return 0;
				case "boolean":
					return value.toString().equals("1");
				case "enum":
				case "string":
					return value.toString();
			}
		}catch(NullPointerException e) {}
		return "";
	}
	
	//Add file separator, allow to upload your file
	public static String addFileSeparator(String processDefinition,String taskDefinition,Integer idApp,List<HistoricTaskService> history) {

		DisplayDocmentType display = new DisplayDocmentType();
		List<TipoDocumentoEtapa> tipoDocsIN = new TipoDocumentoEtapa()
				.find()
				.andWhere("processId", "=",Core.isNotNull(processDefinition)?processDefinition:"-1")
				.andWhere("taskId", "=",Core.isNotNull(taskDefinition)?taskDefinition:"-1")
				.andWhere("tipoDocumento.application", "=",idApp)
				.andWhere("status", "=",1)
				.andWhere("tipo", "=","IN")
				.all();
		if(history!=null && !history.isEmpty()) {
			List<TaskVariables> variables = history.get(0).getVariables(); 
			if(variables !=null) {
				tipoDocsIN.stream().forEach(doc->{			 			 	
					variables.stream()
					 		 .filter(v->v.getType().equalsIgnoreCase("binary") && v.getName().startsWith(StringEscapeUtils.escapeJava(doc.getTipoDocumento().getNome()).replaceAll("\\\\", "__SCAPE__")))
					 		 .forEach(v->{					 			 
					 			 doc.setLink(new Config().getResolveUrl("igrp","Addfiletask","index")+"&taskid="+history.get(0).getId()+"&filename="+v.getName());
					 			 doc.setLink_desc("Mostrar");
					 		 });
				});			
			}
			display.setListTipoDocs(tipoDocsIN);
			display.addListTipoDocs(getTipoDocOutput(taskDefinition, history.get(0).getProcessDefinitionId()));
		}else {
			display.setListTipoDocs(tipoDocsIN);
			display.addListTipoDocs(getTipoDocOutput());
		}
		return display.display();
	}
	
	
	private static List<TipoDocumentoEtapa> getTipoDocOutput() {
		String taskAnt = Core.getParam("taskAnt");
		String procAnt = Core.getParam("procAnt");
		String idAppAnt = Core.getParam("idAppAnt");
		if(Core.isNotNull(taskAnt) && Core.isNotNull(procAnt) && Core.isNotNull(idAppAnt)) {
			return getTipoDocOutput(taskAnt,procAnt);
		}
		return null;
	}

	private static List<TipoDocumentoEtapa> getTipoDocOutput(String task, String proc) {
		List<TipoDocumentoEtapa> tipoDocs = null;
		proc = proc.substring(0, proc.indexOf(":"));
		tipoDocs = new TipoDocumentoEtapa()
				.find()
				.andWhere("processId", "=",proc)
				.andWhere("taskId", "=",task)
				.andWhere("status", "=",1)
				.andWhere("tipo", "=","OUT")
				.andWhere("repTemplate", "notnull")
				.all();
		tipoDocs.stream().forEach(t->{
			t.setLink(new Config().getResolveUrl("igrp_studio","web-report","get-report&code="+t.getRepTemplate().getCode()));
			t.setLink_desc("Mostrar");
		});
		return tipoDocs;
	}
}
