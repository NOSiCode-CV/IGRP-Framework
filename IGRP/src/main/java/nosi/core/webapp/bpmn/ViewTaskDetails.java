package nosi.core.webapp.bpmn;
/**
 * Emanuel
 * 9 Jul 2018
 */

import static nosi.core.i18n.Translator.gt;
import nosi.core.gui.components.IGRPView;
import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.TextField;

public class ViewTaskDetails {

	public static IGRPView get(String processName,String taskName,String nProcess,String nTask) {
		return get(processName, taskName, nProcess, nTask,null,null,null,null,null);
	}
	
	public static IGRPView get(String processName,String taskName,String nProcess,String nTask,String startTime,String endTime,String org,String profile,String userName) {
		IGRPView view = new IGRPView("view_1", "Detalhes de Tarefa");
		view.getProperties().put("type", "workflow_taskview");
		
		Field fProcName = new TextField(null, "proc_name");
		Field fTaskName = new TextField(null, "task_name");
		Field fNProc = new TextField(null, "n_proc");
		Field fNTask = new TextField(null, "n_task");
		Field fStartTime = new TextField(null, "start_time");
		Field fEndTime = new TextField(null, "end_time");
		Field fOrg = new TextField(null, "org");
		Field fProfile = new TextField(null, "profile");
		Field fUserName = new TextField(null, "user_name");
		
		fOrg.setLabel(gt("Executado com organica: "));
		fOrg.setValue(org);
		
		fProfile.setLabel(gt("Executado com perfil: "));
		fProfile.setValue(profile);
		
		fUserName.setLabel(gt("Executado pelo: "));
		fUserName.setValue(userName);
		
		fProcName.setLabel(gt("Nome Processo"));
		fProcName.setValue(processName);
		fTaskName.setLabel(gt("Nome Tarefa"));
		fTaskName.setValue(taskName);
		fNProc.setLabel(gt("Nº Processo"));
		fNProc.setValue(nProcess);
		fNTask.setLabel(gt("Nº Tarefa"));
		fNTask.setValue(nTask);
		fStartTime.setLabel(gt("Data de Inicio"));
		fStartTime.setValue(startTime);
		fEndTime.setLabel(gt("Data de Fim"));
		fEndTime.setValue(endTime);
		
		view.addField(fProcName);
		view.addField(fTaskName);
		view.addField(fNProc);
		view.addField(fNTask);
		if(startTime!=null) {
			view.addField(fOrg);
			view.addField(fProfile);
			view.addField(fUserName);
			view.addField(fStartTime);
			view.addField(fEndTime);
		}
		return view;
	}
}
