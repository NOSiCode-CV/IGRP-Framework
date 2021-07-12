package nosi.webapps.igrp_studio.pages.get_coordinates;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class Get_coordinatesView extends View {

	public Field map_os_1_data;
	public IGRPForm map_os_1;


	public Get_coordinatesView(){

		this.setPageTitle("Get coordinates");
			
		map_os_1 = new IGRPForm("map_os_1","");

		map_os_1_data = new TextField(model,"map_os_1_data");
		map_os_1_data.setLabel(gt("Map Data"));
		map_os_1_data.setValue(gt("/IGRP/images/IGRP/IGRP2.3/core/formgen/types/containers/map_os/config.example.json"));
		map_os_1_data.propertie().add("type","text").add("name","p_map_os_1_data").add("maxlength","8000");
		


		
	}
		
	@Override
	public void render(){
		
		map_os_1.addField(map_os_1_data);

		this.addToPage(map_os_1);
	}
		
	@Override
	public void setModel(Model model) {
			

		}
}
