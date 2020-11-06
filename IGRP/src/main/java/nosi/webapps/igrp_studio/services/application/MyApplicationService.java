package nosi.webapps.igrp_studio.services.application;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import nosi.core.webapp.Core;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Profile;

/**
 * Emanuel
 * 23 Apr 2019
 */

@Path("/application")
public class MyApplicationService {

	@Path("/my_app/{email}")
	@Produces({MediaType.APPLICATION_XML,MediaType.APPLICATION_JSON})
	@Consumes({MediaType.APPLICATION_XML,MediaType.APPLICATION_JSON})
	@GET
	public List<MyApplication> getMyApp(@PathParam("email") String email){
		String type = Core.getParam("type");
		List<Profile> myAppByUser = new Application().getMyAppByEmail(email); 
		List<MyApplication> myApp = new ArrayList<>();
		if(myAppByUser!=null) {
			myAppByUser = myAppByUser.stream()
					  .filter(profile->profile.getOrganization().getApplication().getStatus()==1).collect(Collectors.toList());
			if(type!=null && type.equalsIgnoreCase("dev")) {
				myAppByUser = myAppByUser.stream()					 
						.filter(profile->!profile.getOrganization().getApplication().getDad().toLowerCase().equals("tutorial"))
						.filter(profile->!profile.getOrganization().getApplication().getDad().toLowerCase().equals("igrp_studio"))
						.collect(Collectors.toList());
			}
			for(Profile p:myAppByUser) {
				MyApplication mp = new MyApplication();
				mp.setDad(p.getOrganization().getApplication().getDad().toLowerCase());
				mp.setDescription(p.getOrganization().getApplication().getDescription().toLowerCase());
				mp.setId(p.getOrganization().getApplication().getId());
				String page = "tutorial/DefaultPage/index&title="+p.getOrganization().getApplication().getName();
				if(p.getOrganization().getApplication().getAction()!=null){
					Action ac = p.getOrganization().getApplication().getAction();
					page = (ac!=null && ac.getPage()!=null)? ac.getApplication().getDad().toLowerCase()+"/" + ac.getPage()+"/"+ac.getAction():page;
				}
				mp.setPage(page);
				mp.setImg(p.getOrganization().getApplication().getImg_src());
				myApp.add(mp);
			}
		}
		return myApp;
	}
}
