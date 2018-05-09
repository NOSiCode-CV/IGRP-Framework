
package nosi.webapps.igrp.pages.etapaaccess;

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.webapps.igrp.dao.TaskAccess;
import nosi.webapps.igrp.pages.etapaaccess.Etapaaccess.Table_1;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import nosi.core.webapp.activit.rest.ProcessDefinitionService;
import nosi.core.webapp.activit.rest.ResourceService;
import nosi.core.webapp.activit.rest.TaskService;
/*----#end-code----*/


public class EtapaaccessController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		Etapaaccess model = new Etapaaccess();
		model.load();
		EtapaaccessView view = new EtapaaccessView();
		/*----#gen-example
		  This is an example of how you can implement your code:
		  In a .query(null,... change 'null' to your db connection name added in application builder.
		
		model.loadTable_1(Core.query(null,"SELECT 'id' as id,'descricao' as descricao,'processid' as processid "));
		
		
		----#gen-example */
		/*----#start-code(index)----*/
		String type = Core.getParam("type");
		String orgProfId = Core.getParam("p_id");
		view.btn_gravar.setLink("gravar&type="+type+"&orgProfId="+orgProfId);
		if(type.compareTo("org")==0) {
			model.setTable_1(this.getOrganizationTasks(orgProfId));
		}
		if(type.compareTo("prof")==0) {
			model.setTable_1(this.getProfileTasks(orgProfId));			
		}
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		Etapaaccess model = new Etapaaccess();
		model.load();
		/*----#gen-example
		  This is an example of how you can implement your code:
		  In a .query(null,... change 'null' to your db connection name added in application builder.
		
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","Etapaaccess","index", this.queryString()); //if submit, loads the values
		
		----#gen-example */
		/*----#start-code(gravar)----*/
		String type = Core.getParam("type");
		String orgProfId = Core.getParam("orgProfId");
		String[] p_id = Core.getParamArray("p_id");
		this.removeOldInserts(type,orgProfId);		
		boolean r = this.insertNew(p_id,type,orgProfId);		
		if(r) {
			Core.setMessageSuccess();
		}else {
			Core.setMessageError();
		}
		this.addQueryString("type", type).addQueryString("p_id", orgProfId);
		return this.forward("igrp","Etapaaccess","index", this.queryString());	
		/*----#end-code----*/
			
	}
	
	/*----#start-code(custom_actions)----*/

	private boolean insertNew(String[] p_id, String type, String orgProfId) {
		boolean r = true;
		if(p_id!=null) {
			Organization organization = new Organization().findOne(Core.toInt(orgProfId));
			ProfileType profileType = new ProfileType().findOne(Core.toInt(orgProfId));
			for(String id:p_id) {
				String[] taskProcess = id.split(separator);
				if(taskProcess.length > 1) {
					TaskAccess task = new TaskAccess();
					task.setProcessName(taskProcess[1]);
					task.setTaskName(taskProcess[0]);
					if("org".compareTo(type)==0) {
						task.setOrganization(organization);
					}
					if("prof".compareTo(type)==0) {
						task.setOrganization(profileType.getOrganization());
						task.setProfileType(profileType);
					}
					r = task.insert()!=null;
				}
			}
		}
		return r;
	}

	private void removeOldInserts(String type,String orgProfId) {
		String[] p_id = Core.getParamArray("p_processid_fk");
		if(p_id!=null) {
			for(String id:p_id) {
				if("org".compareTo(type)==0) {
					Core.delete("tbl_task_access").where("org_fk=:org_fk")
										   .addInt("org_fk", Core.toInt(orgProfId))
										   .andWhere("processname", "=",id)
										   .execute();
				}
				if("prof".compareTo(type)==0) {
					Core.delete("tbl_task_access").where("prof_fk=:prof_fk")
										   .addInt("prof_fk", Core.toInt(orgProfId))
										   .andWhere("processname", "=",id)
										   .execute();
				}
			}
		}
	}
	
	private List<Table_1> getProfileTasks(String orgProfId) {
		List<Table_1> table = new ArrayList<>();
		ProfileType prof = new ProfileType().findOne(orgProfId);
		if(prof!=null) {
			List<TaskAccess> list = new TaskAccess().find()
													.andWhere("organization", "=",prof.getOrganization().getId())
													.andWhere("profileType", "isnull")
													.all();
			list.stream().forEach(task->{
				Table_1 t = new Table_1();
				t.setId(task.getTaskName()+separator+task.getProcessName());
				t.setDescricao(task.getProcessName() + " - " + task.getTaskName());
				t.setProcessid(task.getProcessName());
				if(this.getTaskProfExists(prof.getOrganization().getId(), prof.getId(), task.getProcessName(), task.getTaskName())!=null)
					t.setId_check(task.getTaskName()+separator+task.getProcessName());
				table.add(t);
			});
		}
		return table;
	}

	private List<Table_1> getOrganizationTasks(String orgProfId) {
		Organization org = new Organization().findOne(Core.toInt(orgProfId));
		List<Table_1> table = new ArrayList<>();
		if(org!=null) {
			List<TaskService> list = new ArrayList<>();
			List<TaskAccess> listExist = new ArrayList<>();
			for(ProcessDefinitionService process:new ProcessDefinitionService().getProcessDefinitionsAtivos(org.getApplication().getId())){
				String link = process.getResource().replace("/resources/", "/resourcedata/");
				String resource = new ResourceService().getResourceData(link);
				list.addAll(process.extractTasks(resource));
				listExist.addAll(this.getTaskOrgExists(org.getId(), process.getKey()));
			}
			 
			list.stream().forEach(task->{
				Table_1 t = new Table_1();
				t.setId(task.getTaskDefinitionKey()+separator+task.getProcessDefinitionId());
				if(listExist!=null) {
					if(!listExist.stream().filter(c->c.getTaskName().compareTo(task.getTaskDefinitionKey())==0).collect(Collectors.toList()).isEmpty()) {
						t.setId_check(task.getTaskDefinitionKey()+separator+task.getProcessDefinitionId());
					}
				}
				t.setDescricao(task.getProcessDefinitionId() + " - " + task.getName());
				t.setProcessid(task.getProcessDefinitionId());
				table.add(t);
			});
		}
		return table;
	}
	
	private List<TaskAccess> getTaskOrgExists(Integer id,String proccessName){
		return new TaskAccess().find()
				.andWhere("organization", "=",id)
				.andWhere("processName", "=",proccessName)
				.andWhere("profileType", "isnull")
				.all();
	}
		
	private TaskAccess getTaskProfExists(Integer idOrg,Integer idProf,String proccessName,String taskName){
		return new TaskAccess().find()
				.andWhere("organization", "=",idOrg)
				.andWhere("processName", "=",proccessName)
				.andWhere("taskName", "=",taskName)
				.andWhere("profileType", "=",idProf)
				.one();
	}
	private final String separator = "---IGRP---";
	/*----#end-code----*/
	}
