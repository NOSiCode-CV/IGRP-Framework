/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.pesquisarutilizador;
/*---- Import your packages here... ----*/

import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.Response;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.igrp.dao.Profile;
import nosi.webapps.igrp.dao.ProfileType;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/*---- End ----*/

public class PesquisarUtilizadorController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		PesquisarUtilizador model = new PesquisarUtilizador();
		
		ArrayList<PesquisarUtilizador.Table_1> lista = new ArrayList<>();			
		//condiccao para pesquisar com filtros
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			model.load();
		}
		Profile prof = new Profile();
		List<Profile> profiles = prof.find().andWhere("type","=", "PROF")
											.andWhere("user.user_name", "=", model.getUsername())
											.andWhere("organization", "=",model.getOrganica()!=0? model.getOrganica():null)
											.andWhere("profileType", "=",model.getPerfil()!=0? model.getPerfil():null)
											.andWhere("profileType.application", "=", model.getAplicacao()!=0?model.getAplicacao():null)
											.andWhere("user.email", "=", model.getEmail())
											.all();
		//Preenchendo a tabela
		for(Profile p:profiles){
			PesquisarUtilizador.Table_1 table1 = new PesquisarUtilizador().new Table_1();
			table1.setEmail(p.getUser().getEmail());
			table1.setNome(p.getUser().getUser_name());
			table1.setNominho(p.getUser().getName());
			table1.setPerfil(p.getProfileType().getDescr());
			table1.setP_id(p.getUser().getId());
			lista.add(table1);
		}		
		//Alimentando o selectorOption (Aplicacao, organica, e menuPrincipal)
		PesquisarUtilizadorView view = new PesquisarUtilizadorView(model);
		view.aplicacao.setValue(new Application().getListApps());
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
