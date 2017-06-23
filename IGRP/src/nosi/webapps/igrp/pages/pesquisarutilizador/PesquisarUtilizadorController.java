/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.pesquisarutilizador;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.Response;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.webapps.igrp.dao.User;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;


public class PesquisarUtilizadorController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		PesquisarUtilizador model = new PesquisarUtilizador();
		ArrayList<PesquisarUtilizador.Table_1> lista = new ArrayList<>();
		
		User user_db = new User();
		Application objApp = new Application();
		user_db.setAplicacao(objApp);
		Organization objOrg = new Organization();
		user_db.setOrganica(objOrg);
		ProfileType objProTy = new ProfileType();
		user_db.setProfile(objProTy);
		//condiccao para pesquisar com filtros
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			model.load();
			objApp.setId(model.getAplicacao());
			objOrg.setId(model.getOrganica());
			objProTy.setId(model.getPerfil());
			user_db.setUser_name(model.getUsername());
			user_db.setEmail(model.getEmail());
		}
		//Preenchendo a tabela
		for(Object obj:user_db.getAllComFiltros()){
			User u = (User) obj;
			PesquisarUtilizador.Table_1 table1 = new PesquisarUtilizador().new Table_1();
			table1.setEmail(u.getEmail());
			table1.setNome(u.getUser_name());
			table1.setNominho(u.getName());
			table1.setPerfil(u.getProfile().getDescr());
			table1.setP_id(u.getId());
			lista.add(table1);
		}
		
		//Alimentando o selectorOption (Aplicacao, organica, e menuPrincipal)
		PesquisarUtilizadorView view = new PesquisarUtilizadorView(model);
		HashMap<Integer,String> applications =  new Application().getListApps();
		view.aplicacao.setValue(applications);
		view.organica.setValue(new Organization().getListOrganizations());
		view.perfil.setValue(new ProfileType().getListProfiles());
		
		//Para pegar os parametros que queremos enviar para poder editar o menu no view
		view.p_id.setParam(true);
		view.table_1.addData(lista);
		
		return this.renderView(view);
	}
	
	
	public void actionEditar() throws IOException{
		
	}
	
	public void actionEliminar() throws IOException{
		
	}
	
	public Response actionConvidar() throws IOException{
		return this.redirect("igrp", "NovoUtilizador","index","id="+Igrp.getInstance().getRequest().getParameter("p_id"));
	}
}
