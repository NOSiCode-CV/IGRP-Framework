package nosi.webapps.igrp_studio.services;

import javax.ws.rs.ApplicationPath;
import org.glassfish.jersey.server.ResourceConfig;

/**
 * Emanuel
 * 23 Apr 2019
 */

@ApplicationPath("/igrp/rest-api")
public class ServiceConfiguration extends ResourceConfig{

	public ServiceConfiguration() {
		this.packages("nosi.webapps.igrp_studio.services");
	}
}
