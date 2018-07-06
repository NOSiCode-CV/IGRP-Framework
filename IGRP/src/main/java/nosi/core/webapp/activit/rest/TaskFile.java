package nosi.core.webapp.activit.rest;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.Part;
import org.apache.commons.text.StringEscapeUtils;
import nosi.core.webapp.Core;
/**
 * Emanuel
 * 30 Jan 2018
 */
public class TaskFile {

	public void addFile(ProcessInstancesService task,List<Part> parts) throws IOException, ServletException{
		String[] indexs = Core.getParamArray("p_formlist_documento_task_id");
		String[] names = Core.getParamArray("p_formlist_documento_task_nome_fk");
		this.addFile(task, parts, indexs, names);
	}
	
	public void addFile(ProcessInstancesService task) throws IOException, ServletException{
		List<Part> parts = Core.getFiles();
		this.addFile(task, parts);
	}
	
	public void addFile(ProcessInstancesService task,List<Part> parts,String[] indexs,String[] names) throws IOException, ServletException{
		if(parts!=null && indexs!=null && names!=null) {	
			for(int i=0;i<indexs.length;i++) {
				try {
					Part file = parts.get(i);
					String fileName =  names[i]+"_"+file.getSubmittedFileName();
					fileName = StringEscapeUtils.escapeJava(fileName).replaceAll("\\\\", "__SCAPE__");
					task.submitProcessFile(file,task.getId(),fileName);
				}catch(java.lang.IndexOutOfBoundsException e) {
					
				}
			}
		}
	}
}
