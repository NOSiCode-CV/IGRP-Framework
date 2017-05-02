/*-------------------------*/

/*Create View*/

package nosi.webapps.igrp.pages.testenovo;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import nosi.core.config.Config; 

public class TesteNovoView extends View {
	public String title = "Teste bnovo";		
	

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_nova_pagina;
	public TesteNovoView(TesteNovo model){			

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_nova_pagina = new IGRPButton("Nova Pagina","igrp","ListaEnv","index","_self","default|fa-angle-right","","");
		btn_nova_pagina.propertie.add("type","specific").add("code","").add("rel","nova_pagina");
		
	}
		
	@Override
	public void render(){
		Config.TITLE = this.title;


		toolsbar_1.addButton(btn_nova_pagina);
		this.addToPage(toolsbar_1);
	}
}
/*-------------------------*/