
package nosi.webapps.igrp.pages.etapaaccess;

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.webapps.igrp.dao.TaskAccess;
import nosi.webapps.igrp.dao.User;
import nosi.webapps.igrp.pages.etapaaccess.Etapaaccess.Table_1;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import nosi.core.webapp.activit.rest.ProcessDefinitionService;
import nosi.core.webapp.activit.rest.ResourceService;
import nosi.core.webapp.activit.rest.TaskService;
import nosi.core.webapp.databse.helpers.ResultSet;
/*----#end-code----*/


public class EtapaaccessController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{		
		Etapaaccess model = new Etapaaccess();
		model.load();
		EtapaaccessView view = new EtapaaccessView();
		/*----#start-code(index)----*/
		String type = Core.getParam("type");
		String orgProfId = Core.getParam("p_id");
		String userEmail = Core.getParam("userEmail");		
		if(type.compareTo("org")==0) {
			model.setTable_1(this.getOrganizationTasks(orgProfId));
		}
		if(type.compareTo("user")==0) {
			ProfileType prof = new ProfileType().findOne(Core.toInt(orgProfId));
			model.setTable_1(this.getUserTasks(prof.getOrganization().getId().toString(),orgProfId,new User().find().andWhere("email", "=",userEmail).one()));
		}
		if(type.compareTo("prof")==0) {
			model.setTable_1(this.getProfileTasks(orgProfId));			
		}
		view.btn_gravar.setLink("gravar&type="+type+"&orgProfId="+orgProfId+"&userEmail="+userEmail);
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}


	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{		
		Etapaaccess model = new Etapaaccess();
		model.load();
		/*----#start-code(gravar)----*/
		String type = Core.getParam("type");
		String orgProfId = Core.getParam("orgProfId");
		String userEmail = Core.getParam("userEmail");
		String[] p_id = Core.getParamArray("p_id");
		User user = null;
		if(type.compareTo("user")==0) {
			user = new User().find().andWhere("email", "=",userEmail).one();
			this.removeOldInserts(type,user.getId().toString());	
		}else {
			this.removeOldInserts(type,orgProfId);	
		}
		boolean r = this.insertNew(p_id,type,orgProfId,user);		
		if(r) {
			Core.setMessageSuccess();
		}else {
			Core.setMessageError();
		}
		this.addQueryString("type", type)
			.addQueryString("p_id", orgProfId)
			.addQueryString("userEmail", userEmail);
		return this.forward("igrp","Etapaaccess","index", this.queryString());	
		/*----#end-code----*/			
	}
	
	/*----#start-code(custom_actions)----*/

	private boolean insertNew(String[] p_id, String type, String orgProfId,User user) {
		boolean r = true;
		if(p_id!=null) {
			Organization org = new Organization().findOne(Core.toInt(orgProfId));
			ProfileType prof = null;
			if("prof".compareTo(type)==0) {
				prof = new ProfileType().findOne(Core.toInt(orgProfId));
			}
			for(String id:p_id) {
				String[] taskProcess = id.split(separator);
				if(taskProcess.length > 1) {
					TaskAccess task = new TaskAccess();
					task.setProcessName(taskProcess[1]);
					task.setTaskName(taskProcess[0]);
					if("org".compareTo(type)==0) {
						task.setOrganization(org);
					}
					if("prof".compareTo(type)==0) {
						task.setOrganization(prof.getOrganization());
						task.setProfileType(prof);
					}
					if("user".compareTo(type)==0) {
						task.setUser_fk(user.getId());				
					}
					r = task.insert()!=null;		
				}
			}

			if(this.listR!=null) {
				this.listR.stream().forEach(rr->{
					if(rr!=null && rr.RowList!=null) {
						rr.RowList.forEach(rrr->{
							Integer prof_fk = rrr.getInt("prof_fk");
							String processname = rrr.getString("processname");
							String taskname = rrr.getString("taskname");
							Integer org_fk = rrr.getInt("org_fk");
							if(Core.isNotNull(prof_fk) && Core.isNotNull(org_fk) && Core.isNotNull(processname) && Core.isNotNull(taskname)) {
								TaskAccess task = new TaskAccess();
								task.setOrganization(new Organization().findOne(org_fk));
								task.setProfileType(new ProfileType().findOne(prof_fk));
								task.setProcessName(processname);
								task.setTaskName(taskname);
								task.insert();
							}
						});
					}
				});					
			}
		}
		return r;
	}

	/*
	 * Remove all old associates tasks
	 */
	private void removeOldInserts(String type,String orgProfUserId) {
//		String[] p_id = Core.getParamArray("p_processid_fk");
		String[] p_id = Core.getParamArray("p_id");
		if(p_id!=null && p_id.length > 0) {
			for(String id:p_id) {
				String[] taskProcess = id.split(separator);
				if("org".compareTo(type)==0) {	
					ResultSet.Record r = Core.query("SELECT prof_fk,org_fk,processname,taskname FROM public.tbl_task_access")
						 .where("org_fk=:org_fk AND processname=:processname AND taskname=:taskname AND prof_fk is not null")
						 .addInt("org_fk", Core.toInt(orgProfUserId))
						 .addString("processname", taskProcess[1])
						 .addString("taskname", taskProcess[0])
						 .getRecordList();
					this.listR.add(r);			
					Core.delete("tbl_task_access").where("org_fk=:org_fk")
										   .addInt("org_fk", Core.toInt(orgProfUserId))
										   .andWhere("processname", "=",taskProcess[1])
										   .execute();
				}
				if("prof".compareTo(type)==0) {
					Core.delete("tbl_task_access").where("prof_fk=:prof_fk")
					   .addInt("prof_fk", Core.toInt(orgProfUserId))
					   .andWhere("processname", "=",taskProcess[1])
					   .execute();
				}
				if("user".compareTo(type)==0) {
					Core.delete("tbl_task_access").where("user_fk=:user_fk")
										   .addInt("user_fk", Core.toInt(orgProfUserId))
										   .andWhere("processname", "=",taskProcess[1])
										   .execute();
				}
			}
		}
	}
	
	/*
	 * List all task associate to organization with references to profile
	 */
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

	/*
	 * List all task associate to application with references to organization
	 */
	private List<Table_1> getOrganizationTasks(String orgProfId) {
		Organization org = new Organization().findOne(Core.toInt(orgProfId));
		List<Table_1> table = new ArrayList<>();
		if(org!=null) {
			List<TaskService> list = new ArrayList<>();
			List<TaskAccess> listExist = new ArrayList<>();
			for(ProcessDefinitionService process:new ProcessDefinitionService().getProcessDefinitionsAllAtivos(org.getApplication().getDad())){
				String link = process.getResource().replace("/resources/", "/resourcedata/");
				String resource = new ResourceService().getResourceData(link);
				list.addAll(process.extractTasks(resource,true));
				listExist.addAll(this.getTaskOrgExists(org.getId(), process.getKey()));
			}
			 
			list.stream().forEach(task->{
				Table_1 t = new Table_1();
				t.setId(task.getTaskDefinitionKey()+separator+task.getProcessDefinitionId());
				if(listExist!=null) {
					if(!listExist.stream().filter(c->c.getProcessName().compareTo(task.getProcessDefinitionId())==0).filter(c->c.getTaskName().compareTo(task.getTaskDefinitionKey())==0).collect(Collectors.toList()).isEmpty()) {
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
	
	
	/*
	 * List all task associate to application with references to user
	 */
	private List<Table_1> getUserTasks(String orgId,String idProf, User user) {
		Organization org = new Organization().findOne(Core.toInt(orgId));
		List<Table_1> table = new ArrayList<>();
		if(org!=null) {
			List<TaskService> list = new ArrayList<>();
			for(ProcessDefinitionService process:new ProcessDefinitionService().getProcessDefinitionsAllAtivos(org.getApplication().getDad())){
				String link = process.getResource().replace("/resources/", "/resourcedata/");
				String resource = new ResourceService().getResourceData(link);
				list.addAll(process.extractTasks(resource,true));
			}			 
			list.stream().forEach(task->{
				Table_1 t = new Table_1();
				t.setId(task.getTaskDefinitionKey()+separator+task.getProcessDefinitionId());
				if(this.getTaskUserExists(user,Core.toInt(idProf),task.getProcessDefinitionId(),task.getTaskDefinitionKey())!=null)
					t.setId_check(task.getTaskDefinitionKey()+separator+task.getProcessDefinitionId());
				t.setDescricao(task.getProcessDefinitionId() + " - " + task.getName());
				t.setProcessid(task.getProcessDefinitionId());
				table.add(t);
			});
		}
		return table;
	}
	
	/*
	 *  Get existing task associate to the organization
	 */
	private List<TaskAccess> getTaskOrgExists(Integer id,String proccessName){
		return new TaskAccess().find()
				.andWhere("organization", "=",id)
				.andWhere("processName", "=",proccessName)
				.andWhere("profileType", "isnull")
				.all() ;
	}
	
	/*
	 * Get existing task associate to the profile
	 */
	private TaskAccess getTaskProfExists(Integer idOrg,Integer idProf,String proccessName,String taskName){
		return new TaskAccess().find()
				.andWhere("organization", "=",idOrg)
				.andWhere("processName", "=",proccessName)
				.andWhere("taskName", "=",taskName)
				.andWhere("profileType", "=",idProf)
				.one();
	}
	
	/*
	 * Get existing task associate to the user
	 */
	private TaskAccess getTaskUserExists(User user,Integer idProf,String proccessName,String taskName){
		TaskAccess t= new TaskAccess().find()
				.andWhere("processName", "=",proccessName)
				.andWhere("taskName", "=",taskName)
				.andWhere("user_fk", "=",user.getId())		
				.one();
		if(t==null) {//If no associate to user, check associate to profile
			 t= new TaskAccess().find()
						.andWhere("processName", "=",proccessName)
						.andWhere("taskName", "=",taskName)
						.andWhere("profileType", "=",idProf)		
						.one();
		}
		return t;
	}
	private final String separator = "---IGRP---";
	private List<ResultSet.Record> listR = new ArrayList<>();
	/*----#end-code----*/
	}
