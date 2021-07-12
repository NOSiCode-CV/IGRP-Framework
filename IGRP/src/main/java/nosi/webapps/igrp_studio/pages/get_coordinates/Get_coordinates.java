package nosi.webapps.igrp_studio.pages.get_coordinates;

import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;

public class Get_coordinates extends Model{		

	@RParam(rParamName = "p_map_os_1_data")
	private String map_os_1_data;
	
	public void setMap_os_1_data(String map_os_1_data){
		this.map_os_1_data = map_os_1_data;
	}
	public String getMap_os_1_data(){
		return this.map_os_1_data;
	}



}
