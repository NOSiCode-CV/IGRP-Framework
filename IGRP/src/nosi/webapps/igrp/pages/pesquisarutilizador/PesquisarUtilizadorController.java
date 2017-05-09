/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.pesquisarutilizador;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.webapps.igrp.dao.User;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;


public class PesquisarUtilizadorController extends Controller {		

	public void actionIndex() throws IOException{
		PesquisarUtilizador model = new PesquisarUtilizador();
		PesquisarUtilizadorView view = new PesquisarUtilizadorView(model);
		
		ArrayList<PesquisarUtilizador.Table_1> lista = new ArrayList<>();
		//Alimentando o selectorOption (Aplicacao, organica, e menuPrincipal)
		HashMap<Integer,String> applications =  new Application().getListApps();
		view.aplicacao.setValue(applications);
		view.organica.setValue(new Organization().getListOrganizations());
		view.perfil.setValue(new ProfileType().getListProfiles());
		//condiccao para pesquisar com filtros
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			/*model.load();
			menu_db.setEnv_fk(model.getAplicacao());
			Organization objOrg = new Organization();
			objOrg.setId(model.getOrganica());
			menu_db.setOrganica(objOrg);
			menu_db.setFlg_base(model.getMenu_principal());*/
		}
		
		//Preenchendo a tabela
		for(Object obj:new User().getAll()){
			User u = (User) obj;
			PesquisarUtilizador.Table_1 table1 = new PesquisarUtilizador().new Table_1();
			table1.setEmail(u.getEmail());
			table1.setNome(u.getUser_name());
			table1.setNominho(u.getName());
			table1.setPerfil(u.getProfile().getDescr());
			table1.setP_id(u.getId());
			lista.add(table1);
		}
		//Para pegar os parametros que queremos enviar para poder editar o menu no view
		//view..setParam(true);
		view.p_id.setParam(true);
		view.table_1.addData(lista);
		this.renderView(view);
	}
	
	public void actionPesquisar() throws IOException{
		
	}
	
	public void actionEditar() throws IOException{
		
	}
	
	public void actionEliminar() throws IOException{
		
	}
	
	public void actionConvidar() throws IOException{
		
	}
}
