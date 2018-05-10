package nosi.core.webapp.webservices.rest;

import javax.ws.rs.QueryParam;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import com.google.gson.Gson;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
import nosi.webapps.igrp.dao.TaskAccess;
/**
 * Emanuel
 * 25 Mar 2018
 */

@Path("/task-service")
public class IGRPTaskService extends Controller{

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public String getProcess(@QueryParam("igrp_app") String app,@QueryParam("igrp_page") String page,@QueryParam("igrp_action") String action,@QueryParam("igrp_task_id") String taskId) {
		this.addQueryString("taskExecutionId",taskId);
		Response r = this.call(app, page, action,this.queryString());
		Properties p = new Properties();
		p.put("status", r.getStatus());
		return new Gson().toJson(p);
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("task-access")
	public String getTaskAccess(@QueryParam("tenantId") String tenantId,@QueryParam("taskId") String taskId,@QueryParam("proccessId") String proccessId) {
		List<TaskAccess> listTaskAccess = new TaskAccess().find()
				.andWhere("taskName", "=",taskId)
				.andWhere("processName", "=",proccessId)
				.andWhere("profileType", "notnull")
				.andWhere("organization.application", "=", Core.toInt(tenantId))
				.all();
		List<Properties> list = new ArrayList<>();
		listTaskAccess.stream().forEach(t->{
			Properties p = new Properties();
			p.put("code",t.getOrganization().getCode()+"."+t.getProfileType().getCode());
			list.add(p);
		});
		return new Gson().toJson(list);
	}
}
