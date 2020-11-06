package nosi.core.webapp.bpmn;
/**
 * Emanuel
 * 9 Jul 2018
 */

import static nosi.core.i18n.Translator.gt;
import nosi.core.gui.components.IGRPView;
import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.TextField;
import nosi.core.webapp.Core;

public class ViewTaskDetails {

	private String processName;
	private String taskName;
	private String nProcess;
	private String nTask;
	private String startTime;
	private String endTime;
	private String org;
	private String profile;
	private String userName;
	
	
	
	public String getProcessName() {
		return processName;
	}

	public void setProcessName(String processName) {
		this.processName = processName;
	}

	public String getTaskName() {
		return taskName;
	}

	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}

	public String getnProcess() {
		return nProcess;
	}

	public void setnProcess(String nProcess) {
		this.nProcess = nProcess;
	}

	public String getnTask() {
		return nTask;
	}

	public void setnTask(String nTask) {
		this.nTask = nTask;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getOrg() {
		return org;
	}

	public void setOrg(String org) {
		this.org = org;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getUserName() {
		if(Core.isNotNull(userName))
			return userName;
		return Core.getCurrentUser().getUser_name();
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public static IGRPView get(ViewTaskDetails details) {
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
		fOrg.setValue(details.getOrg());
		
		fProfile.setLabel(gt("Executado com perfil: "));
		fProfile.setValue(details.getProfile());
		
		fUserName.setLabel(gt("Executado pelo: "));
		fUserName.setValue(details.getUserName());
		
		fProcName.setLabel(gt("Nome Processo"));
		fProcName.setValue(details.getProcessName());
		fTaskName.setLabel(gt("Nome Tarefa"));
		fTaskName.setValue(details.getTaskName());
		fNProc.setLabel(gt("Nº Processo"));
		fNProc.setValue(details.getnProcess());
		fNTask.setLabel(gt("Nº Tarefa"));
		fNTask.setValue(details.getnTask());
		fStartTime.setLabel(gt("Data de Inicio"));
		fStartTime.setValue(details.getStartTime());
		fEndTime.setLabel(gt("Data de Fim"));
		fEndTime.setValue(details.getEndTime());
		
		view.addField(fProcName);
		view.addField(fTaskName);
		view.addField(fNProc);
		view.addField(fNTask);
		if(details.getStartTime()!=null) {
			view.addField(fOrg);
			view.addField(fProfile);
			view.addField(fUserName);
			view.addField(fStartTime);
			view.addField(fEndTime);
		}
		return view;
	}
}
