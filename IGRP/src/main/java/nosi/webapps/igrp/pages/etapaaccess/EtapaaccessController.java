package nosi.webapps.igrp.pages.etapaaccess;

import nosi.core.webapp.Controller;//
import java.io.IOException;//
import nosi.core.webapp.Core;//
import nosi.core.webapp.Response;//
/* Start-Code-Block (import) */
/* End-Code-Block */
/*----#start-code(packages_import)----*/
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import nosi.core.config.ConfigDBIGRP;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
import nosi.core.webapp.activit.rest.business.ProcessDefinitionIGRP;
import nosi.core.webapp.activit.rest.entities.ProcessDefinitionService;
import nosi.core.webapp.activit.rest.entities.TaskService;
import nosi.core.webapp.activit.rest.services.ResourceServiceRest;
import nosi.core.webapp.activit.rest.services.TaskServiceRest;
import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.webapps.igrp.dao.TaskAccess;
import nosi.webapps.igrp.dao.User;
import nosi.webapps.igrp.pages.etapaaccess.Etapaaccess.Table_1;

/*----#end-code----*/
		
public class EtapaaccessController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		var model = new Etapaaccess();
		model.load();
		var view = new EtapaaccessView();
		view.processid.setParam(true);
		view.task_id.setParam(true);
		view.env_fk.setParam(true);
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_1(Core.query(null,"SELECT '1' as id,'Anim perspiciatis adipiscing a' as descricao,'hidden-0965_34fe' as processid,'hidden-d0f0_4fa3' as task_id,'hidden-4681_5b09' as env_fk "));
		  ----#gen-example */
		/* Start-Code-Block (index) *//* End-Code-Block (index) */
		/*----#start-code(index)----*/
		String type = Core.getParam("type");
		Integer orgProfId = Core.getParamInt("p_id");
		Integer orgId=null;
		Integer profId= null;
		String userEmail = Core.getParam("userEmail");		
		if(type.compareTo("org")==0) {
			model.setTable_1(this.getOrganizationTasks(orgProfId));
			orgId = orgProfId;
		}
		if(type.compareTo("user")==0) {
			ProfileType prof = new ProfileType().findOne(orgProfId);
			model.setTable_1(this.getUserTasks(prof,new User().findIdentityByEmail(userEmail)));
			orgId = prof.getOrganization().getId();
			profId = prof.getId();
		}
		if(type.compareTo("prof")==0) {
			ProfileType prof = new ProfileType().findOne(orgProfId);
			model.setTable_1(this.getProfileTasks(prof));	
			orgId = prof.getOrganization().getId();		
		}
		view.btn_gravar.setLink("gravar&type="+type+"&orgProfId="+orgProfId+"&orgId="+orgId+"&profId="+profId+"&userEmail="+userEmail);
		view.btn_associar_etapa_documento.addParameter("p_aplicacao",Core.getParam("p_aplicacao"));
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		var model = new Etapaaccess();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 this.addQueryString("p_processid",Core.getParam("p_processid"));
		 this.addQueryString("p_task_id",Core.getParam("p_task_id"));
		 this.addQueryString("p_env_fk",Core.getParam("p_env_fk"));
		 return this.forward("igrp","etapaaccess","index",this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(gravar)----*/
		String type = Core.getParam("type");
		Integer orgProfId = Core.getParamInt("orgProfId");
		String userEmail = Core.getParam("userEmail");
		User user = null;
		 String[] p_id = Core.getParamArray("p_id_fk");
		 String[] p_id_check = Core.getParamArray("p_id_check_fk"); 
		 
		List<String> chekedIds = new ArrayList<>(Arrays.asList(p_id_check));
		List<String> unChekedIds = new ArrayList<>(Arrays.asList(p_id)); // all Ids
		 
		 try {
			 unChekedIds.removeIf(p->chekedIds.stream().anyMatch(f->f.equals(p))); 
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(type.compareTo("user")==0) {
			user = Core.findUserByEmail(userEmail);
			this.removeOldInserts(type, user.getId(), unChekedIds);	
		}else {
			this.removeOldInserts(type, orgProfId, unChekedIds);	
		}
		boolean r = this.insertNew(chekedIds, type, orgProfId, user);		
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
	
	public Response actionAssociar_etapa_documento() throws IOException, IllegalArgumentException, IllegalAccessException{
		var model = new Etapaaccess();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_processid",Core.getParam("p_processid"));
		  this.addQueryString("p_task_id",Core.getParam("p_task_id"));
		  this.addQueryString("p_env_fk",Core.getParam("p_env_fk"));
		  return this.forward("igrp","LookupListPage","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (associar_etapa_documento)  *//* End-Code-Block  */
		/*----#start-code(associar_etapa_documento)----*/
		this.addQueryString("p_process_id",Core.getParam("p_processid"));
		this.addQueryString("p_general_id",Core.getParam("p_task_id"));
		this.addQueryString("p_env_fk",Core.getParam("p_env_fk"));
		this.addQueryString("onlyDocs","true");
		/*----#end-code----*/
		return this.redirect("igrp","LookupListPage","index", this.queryString());	
	}
	/* Start-Code-Block (custom-actions)  *//* End-Code-Block  */
/*----#start-code(custom_actions)----*/

	private boolean insertNew(List<String> chekedIds, String type, Integer orgProfId,User user) {
		boolean r = true;
		Integer orgId = Core.getParamInt("orgId");
		if(chekedIds!=null) {
			Organization org = new Organization();
			if(Core.isNotNull(orgId) && orgId!=0) {
				org = org.findOne(orgId);
			}else {
				org = org.findOne(orgProfId);
			}			
			ProfileType prof = null;
			if("prof".compareTo(type)==0 || "user".compareTo(type)==0) {
				prof = Core.findProfileById(orgProfId);
			}
			for(String id : chekedIds) {
				String[] taskProcess = id.split(SEPARATOR);
				if(taskProcess.length > 1) {
					
					TaskAccess taskAux = new TaskAccess().find().andWhere("processName", "=", taskProcess[1])
										.andWhere("taskName", "=", taskProcess[0]); 
					
					TaskAccess task = new TaskAccess();
					task.setProcessName(taskProcess[1]);
					task.setTaskName(taskProcess[0]);
					task.setTaskDescription(taskProcess[2]);
					if("org".compareTo(type)==0) { 
						taskAux = taskAux.andWhere("organization", "=", org).one(); 
						if(taskAux == null) {
							task.setOrganization(org);
							r = task.insert() != null;
						}
					}else
					if("prof".compareTo(type)==0 && prof!=null) {
						if(taskAux != null)
							taskAux = taskAux.andWhere("organization", "=", prof.getOrganization()).andWhere("profileType", "=", prof).one(); 
						if(taskAux == null) {
							task.setOrganization(prof.getOrganization());
							task.setProfileType(prof);
							r = task.insert() != null;	
						}
					}else
					if("user".compareTo(type)==0 && prof!=null) {
						task = task.find().andWhere("processName", "=",task.getProcessName())
								   .andWhere("taskName","=",task.getTaskName())
								   .andWhere("profileType", "=",prof.getId())
								   .andWhere("organization", "=",org.getId())
								   .one();
						if(task!=null) {
							task.setUser_fk(user.getId());	
							r = task.update()!=null;	
						}
					}	
				}
			}
		}
		return r;
	}

	/*
	 * Remove all old associates tasks
	 */
	private void removeOldInserts(String type,Integer orgProfUserId,List<String> uncheckedIds) {
		Integer orgId = Core.getParamInt("orgId");
		if(uncheckedIds != null  && orgId!=0) { 
			for(String uncheckedId : uncheckedIds) { 
				String processname = null; 
				String taskname = null; 
				try {
					String[] aux = uncheckedId.split(SEPARATOR); 
					taskname = aux[0]; 
					processname = aux[1];
				} catch (Exception ignored) {}
				if("org".compareTo(type)==0) {				
					Core.delete(ConfigDBIGRP.FILE_NAME_HIBERNATE_IGRP_CONFIG,"tbl_task_access")
											.where("org_fk=:org_fk and processname=:processname and taskname=:taskname") 
											.addInt("org_fk",orgProfUserId)
											.addString("taskname",taskname)
											.addString("processname",processname)
											.execute();
				}
				if("prof".compareTo(type)==0) {
					Core.delete(ConfigDBIGRP.FILE_NAME_HIBERNATE_IGRP_CONFIG,"tbl_task_access") 
						.where("prof_fk=:prof_fk and processname=:processname and taskname=:taskname") 
					   .addInt("prof_fk",orgProfUserId)
					   .addString("taskname",taskname)
					   .addString("processname",processname)
					   .execute();
				}
				if("user".compareTo(type)==0) {
					Core.query(ConfigDBIGRP.FILE_NAME_HIBERNATE_IGRP_CONFIG,"UPDATE tbl_task_access SET user_fk=null WHERE user_fk="+orgProfUserId+" AND prof_fk="+Core.getParamInt("profId"));
				}
				
			}
			
		}
	}

	/*
	 * List all task associate to application with references to organization
	 */
	private List<Table_1> getOrganizationTasks(Integer orgProfId) {
		Organization org = new Organization().findOne(orgProfId);
		List<Table_1> table = new ArrayList<>();
		if(org!=null) {
			List<TaskService> list = new ArrayList<>();
			List<TaskAccess> listExist = new ArrayList<>();
			ProcessDefinitionIGRP processRest = new ProcessDefinitionIGRP();
			TaskServiceRest taskRest = new TaskServiceRest();
			for(ProcessDefinitionService process:processRest.getProcessDefinitionsForCreated(org.getApplication().getDad())){
				String link = process.getResource().replace("/resources/", "/resourcedata/");
				String resource = new ResourceServiceRest().getResourceData(link); 
				list.addAll(taskRest.extractTasks(resource,true));
				listExist.addAll(this.getTaskOrgExists(org.getId(), process.getKey()));
			}
			 
			list.forEach(task->{
				Table_1 t = new Table_1();
				t.setId(task.getTaskDefinitionKey()+SEPARATOR+task.getProcessDefinitionId()+SEPARATOR+Core.getSwitchNotNullValue(task.getProcessDefinitionKey(),task.getProcessDefinitionId()) + " - " + task.getName()+" ("+task.getProcessDefinitionId()+")");

				if (listExist.stream()
						.filter(c -> c.getProcessName().compareTo(task.getProcessDefinitionId()) == 0)
						.anyMatch(c -> c.getTaskName().compareTo(task.getTaskDefinitionKey()) == 0)) {
					t.setId_check(t.getId());
				}
				t.setDescricao(Core.getSwitchNotNullValue(task.getProcessDefinitionKey(),task.getProcessDefinitionId()) + " - <b>" + task.getName()+"</b> ("+task.getProcessDefinitionId()+")");
				t.setProcessid(task.getProcessDefinitionId());
				t.setTask_id(task.getTaskDefinitionKey());
				t.setEnv_fk(org.getApplication().getId());
				table.add(t);
			});
		}
		return table;
	}
	
	
	/*
	 * List all task associate to organization with references to profile
	 */
	private List<Table_1> getProfileTasks(ProfileType prof) {
		List<Table_1> table = new ArrayList<>();
		if(prof!=null) {
			List<TaskAccess> list = new TaskAccess().find()
													.andWhere("organization", "=",prof.getOrganization().getId())
													.andWhereIsNull("profileType")
													.all();
			
			list = list.stream().collect(Collectors.groupingBy(task->task.getProcessName() + "" + task.getTaskName()))
				.values().stream().map(m->m.get(0)).toList(); // Eliminar Duplicatas
			
			list.forEach(task->{
				Table_1 t = new Table_1();
				t.setId(task.getTaskName()+SEPARATOR+task.getProcessName()+SEPARATOR+task.getTaskDescription());
				t.setProcessid(task.getProcessName());
				t.setTask_id(task.getTaskName());
				t.setEnv_fk(prof.getApplication().getId());
				t.setDescricao(task.getTaskDescription());
				if(this.getTaskProfExists(prof.getOrganization().getId(), prof.getId(), task.getProcessName(), task.getTaskName()))
					t.setId_check(t.getId());
				table.add(t);
			});
		}
		return table;
	}

	
	/*
	 * List all task associate to application with references to user
	 */
	private List<Table_1> getUserTasks(ProfileType prof, User user) {
		List<Table_1> table = new ArrayList<>();
		if(prof!=null) {
			List<TaskAccess> list = new TaskAccess().find()
													.andWhere("organization", "=",prof.getOrganization().getId())
													.andWhere("profileType","=", prof.getId())
													.andWhereNotNull("profileType")
													.all();
			list.forEach(task->{
				Table_1 t = new Table_1();
				t.setId(task.getTaskName()+SEPARATOR+task.getProcessName()+SEPARATOR+task.getTaskDescription());
				t.setProcessid(task.getProcessName());
				t.setTask_id(task.getTaskName());
				t.setEnv_fk(prof.getApplication().getId());
				t.setDescricao(task.getTaskDescription());
				if(this.getTaskUserExists(user,task.getProcessName(), task.getTaskName()))
					t.setId_check(t.getId());
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
				.andWhereIsNull("profileType")
				.all() ;
	}
	
	/*
	 * Get existing task associate to the profile
	 */
	private boolean getTaskProfExists(Integer idOrg,Integer idProf,String proccessName,String taskName){
		return new TaskAccess().find()
				.andWhere("organization", "=",idOrg)
				.andWhere("processName", "=",proccessName)
				.andWhere("taskName", "=",taskName)
				.andWhere("profileType", "=",idProf)
				.limit(1)
				.getCount()>0;
	}
	
	/*
	 * Get existing task associate to the user
	 */
	private boolean getTaskUserExists(User user,String proccessName,String taskName){
	       return new TaskAccess().find()
					.andWhere("processName", "=",proccessName)
					.andWhere("taskName", "=",taskName)
					.andWhere("user_fk", "=",user.getId())
					.limit(1)
					.getCount()>0;
		}
	private static final String SEPARATOR = "---IGRP---";
	/*----#end-code----*/
}