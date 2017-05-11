/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.pesquisarperfil;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.igrp.dao.ProfileType;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;



public class PesquisarPerfilController extends Controller {		

	public void actionIndex() throws IOException{
		PesquisarPerfil model = new PesquisarPerfil();
		PesquisarPerfilView view = new PesquisarPerfilView(model);
		ArrayList<PesquisarPerfil.Table_1> lista = new ArrayList<>();
		//Alimentando o selectorOption (Aplicacao, organica, e menuPrincipal)
		HashMap<Integer,String> applications =  new Application().getListApps();
		view.aplicacao.setValue(applications);
		view.organia.setValue(new Organization().getListOrganizations());
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
		for(Object obj:new ProfileType().getAll()){
			ProfileType p = (ProfileType) obj;
			PesquisarPerfil.Table_1 table1 = new PesquisarPerfil().new Table_1();
			table1.setCodigo(p.getCode());
			table1.setDescricao(p.getDescr());
			table1.setEstado(p.getStatus()==1?"Ativo":"Inativo");
			table1.setOrganica(p.getOrganica().getName());
			table1.setP_id(p.getId());
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
	
	public void actionMenu() throws IOException{
		String id = Igrp.getInstance().getRequest().getParameter("p_id");
		this.redirect("igrp", "MenuOrganica", "index","id="+id+"&type=perfil");
	}
	
	public void actionTransacao() throws IOException{
		
	}
	
	public void actionEtapa() throws IOException{
		
	}
}
