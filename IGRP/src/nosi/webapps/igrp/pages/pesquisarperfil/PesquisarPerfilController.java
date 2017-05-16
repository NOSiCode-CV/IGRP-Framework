/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.pesquisarperfil;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.igrp.dao.Profile;
import nosi.webapps.igrp.dao.ProfileType;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;



public class PesquisarPerfilController extends Controller {		

	public void actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		PesquisarPerfil model = new PesquisarPerfil();
		
		ArrayList<PesquisarPerfil.Table_1> lista = new ArrayList<>();
		ProfileType profile_db = new ProfileType();
		
		
		//condiccao para pesquisar com filtros
		Application objapp = new Application();
		profile_db.setAplicacao(objapp);
		Organization objOrg = new Organization();
		profile_db.setOrganica(objOrg);
		
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			model.load();
			objapp.setId(model.getAplicacao());
			objOrg.setId(model.getOrgania());
		}
		
		//Preenchendo a tabela
		for(Object obj:profile_db.getAllComFiltro()){
			ProfileType p = (ProfileType) obj;
			PesquisarPerfil.Table_1 table1 = new PesquisarPerfil().new Table_1();
			table1.setCodigo(p.getCode());
			table1.setDescricao(p.getDescr());
			table1.setEstado(p.getStatus()==1?"Ativo":"Inativo");
			table1.setOrganica(p.getOrganica().getName());
			table1.setP_id(p.getId());
			lista.add(table1);
		}
		//Alimentando o selectorOption (Aplicacao, organica, e menuPrincipal)
		PesquisarPerfilView view = new PesquisarPerfilView(model);
		view.aplicacao.setValue(new Application().getListApps());
		view.organia.setValue(new Organization().getListOrganizations());
		//Para pegar os parametros que queremos enviar para poder editar o menu no view
		view.p_id.setParam(true);
		view.table_1.addData(lista);
		this.renderView(view);
	}
	
	
	public void actionEditar() throws IOException{
		
	}
	
	public void actionEliminar() throws IOException{
		
	}
	
	public void actionMenu() throws IOException{
		String id = Igrp.getInstance().getRequest().getParameter("p_id");
		this.redirect("igrp", "MenuOrganica", "index","id="+id+"&type=perfil");
	}
	
	public void actionTransacao() throws IOException{
		
	}
	
	public void actionEtapa() throws IOException{
		
	}
}
