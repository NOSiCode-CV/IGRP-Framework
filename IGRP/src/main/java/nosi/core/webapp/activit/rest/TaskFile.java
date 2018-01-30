package nosi.core.webapp.activit.rest;

import java.io.IOException;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import javax.servlet.http.Part;
import nosi.core.webapp.Core;

/**
 * Emanuel
 * 30 Jan 2018
 */
public class TaskFile {

	public void addFile(Activit task,Collection<Part> parts,String [] p_prm_file_name_fk,String [] p_prm_file_description_fk){
		if(parts!=null && p_prm_file_name_fk!=null && p_prm_file_description_fk!=null && parts.size() > 0 && p_prm_file_name_fk.length > 0 && p_prm_file_description_fk.length > 0) {
			List<Part> part_a = parts.stream()
					.filter(file->Core.isNotNull(file.getSubmittedFileName()))
					.filter(file->Core.isNotNull(file.getName()))
					.collect(Collectors.toList());
			Map<String,String> file_name = IntStream.range(0, p_prm_file_name_fk.length)
					.boxed()
					.collect(Collectors.toMap(i->part_a.get(i).getSubmittedFileName(), i->p_prm_file_name_fk[i]));
			Map<String,String> file_desc = IntStream.range(0, p_prm_file_description_fk.length)
					.boxed()
					.collect(Collectors.toMap(i->part_a.get(i).getSubmittedFileName(), i->p_prm_file_description_fk[i]));
			
			parts.stream()
				.filter(file->Core.isNotNull(file.getSubmittedFileName()))
				.filter(file->Core.isNotNull(file.getName()))
				.forEach(file->{
					try {
						if(task instanceof ProcessDefinitionService)
							new ProcessDefinitionService().addProcessFile(file,task.getId(),file_name.get(file.getSubmittedFileName())+"___"+file_desc.get(file.getSubmittedFileName())+"___"+file.getSubmittedFileName());
						else if(task instanceof TaskService)
							new TaskService().addTaskFile(file,task.getId(),file_name.get(file.getSubmittedFileName())+"___"+file_desc.get(file.getSubmittedFileName())+"___"+file.getSubmittedFileName());
					} catch (IOException e) {
						e.printStackTrace();
					}finally {
						try {
							file.delete();
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
				});
		}
	}
}
