package nosi.core.webapp.activit.rest;

import java.io.IOException;
import java.util.Collection;
import javax.servlet.ServletException;
import javax.servlet.http.Part;
import org.apache.commons.text.StringEscapeUtils;
import nosi.core.webapp.Core;
import nosi.core.webapp.Igrp;
/**
 * Emanuel
 * 30 Jan 2018
 */
public class TaskFile {

	public void addFile(Activit task) throws IOException, ServletException{
		Collection<Part> parts = Igrp.getInstance().getRequest().getParts();
		if(parts!=null) {			
			parts.stream()
					.filter(file->Core.isNotNull(file.getSubmittedFileName()))
					.filter(file->Core.isNotNull(file.getName()))
					.forEach(file->{
						try {
							String fileName = StringEscapeUtils.escapeJava(file.getSubmittedFileName());
							fileName = fileName.replaceAll("\\\\", "_____");
							if(task instanceof ProcessInstancesService)
								((ProcessInstancesService) task).submitProcessFile(file,((ProcessInstancesService) task).getId(),fileName);
							else if(task instanceof TaskService)
								((TaskService) task).submitTaskFile(file,((TaskService) task).getId(),fileName);
						}catch(Exception e) {
							e.printStackTrace();
						}
					});
		}
	}
}
