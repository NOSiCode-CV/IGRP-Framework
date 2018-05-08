package nosi.core.webapp.bpmn;

import java.util.List;
import org.apache.commons.text.StringEscapeUtils;
import nosi.core.webapp.Controller;
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
	public static String addFileSeparator(Controller controller,String processDefinition,String taskDefinition,String idApp,List<HistoricTaskService> history) {
		List<TipoDocumentoEtapa> tipoDocs = new TipoDocumentoEtapa()
				.find()
				.andWhere("processId", "=",Core.isNotNull(processDefinition)?processDefinition:"-1")
				.andWhere("taskId", "=",Core.isNotNull(taskDefinition)?taskDefinition:"-1")
				.andWhere("tipoDocumento.application", "=",Core.toInt(idApp))
				.andWhere("status", "=",1)
				.andWhere("tipo", "=","IN")
				.all();
		if(tipoDocs != null && tipoDocs.size() > 0 && Core.isNull(history)){
			for(TipoDocumentoEtapa doc:tipoDocs){
				controller.addQueryString("p_formlist_documento_task_nome_fk",doc.getTipoDocumento().getNome());
				controller.addQueryString("p_formlist_documento_task_nome_fk_desc",doc.getTipoDocumento().getNome());
				controller.addQueryString("p_formlist_documento_task_descricao_fk",doc.getTipoDocumento().getDescricao());
				controller.addQueryString("p_formlist_documento_task_descricao_fk_desc",doc.getTipoDocumento().getDescricao());
				controller.addQueryString("p_formlist_documento_task_obrigatoriedade_fk",getObrigatoriedade(doc.getRequired()));
				controller.addQueryString("p_formlist_documento_task_obrigatoriedade_fk_desc",getObrigatoriedade(doc.getRequired()));
				controller.addQueryString("p_formlist_documento_task_mostrar_fk","");
				controller.addQueryString("p_formlist_documento_task_mostrar_fk_desc","");
			}			
		}else if(tipoDocs != null && !tipoDocs.isEmpty() && history!=null && !history.isEmpty()) {
			List<TaskVariables> variables = history.get(0).getVariables(); 
			if(variables !=null) {
				tipoDocs.stream().forEach(doc->{			 			 	
					variables.stream()
					 		 .filter(v->v.getType().equalsIgnoreCase("binary") && v.getName().startsWith(StringEscapeUtils.escapeJava(doc.getTipoDocumento().getNome()).replaceAll("\\\\", "__SCAPE__")))
					 		 .forEach(v->{
					 			 controller.addQueryString("p_formlist_documento_task_nome_fk",doc.getTipoDocumento().getNome());
					 			 controller.addQueryString("p_formlist_documento_task_nome_fk_desc",doc.getTipoDocumento().getNome());
					 			 controller.addQueryString("p_formlist_documento_task_descricao_fk",doc.getTipoDocumento().getDescricao());
					 			 controller.addQueryString("p_formlist_documento_task_descricao_fk_desc",doc.getTipoDocumento().getDescricao());
					 			 controller.addQueryString("p_formlist_documento_task_obrigatoriedade_fk",getObrigatoriedade(doc.getRequired()));
					 			 controller.addQueryString("p_formlist_documento_task_obrigatoriedade_fk_desc",getObrigatoriedade(doc.getRequired()));
					 			 controller.addQueryString("p_formlist_documento_task_documento_fk_desc", v.getName());
					 			 controller.addQueryString("p_formlist_documento_task_documento_fk", v.getName());
					 			 controller.addQueryString("formlist_documento_task_documento_fk",v.getName());
					 			 controller.addQueryString("formlist_documento_task_documento_fk_desc",v.getName());
					 			 controller.addQueryString("p_formlist_documento_task_mostrar_fk",controller.getConfig().getResolveUrl("igrp","Addfiletask","index").replaceAll("&", "&amp;")+"&amp;taskid="+history.get(0).getId()+"&amp;filename="+v.getName());
					 			 controller.addQueryString("p_formlist_documento_task_mostrar_fk_desc","Mostrar");
					 		 });
				});			
			}
		}
		return tipoDocs != null && !tipoDocs.isEmpty()?controller.call("igrp", "Addfiletask", "index", controller.queryString()).getContent():"";
	}
	
	private static String getObrigatoriedade(int required) {
		return required==1?"Sim":"Nao";
	}
}
