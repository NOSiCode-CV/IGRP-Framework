/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.pesquisarorganica;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Organization;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;


public class PesquisarOrganicaController extends Controller {		

	public void actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		PesquisarOrganica model = new PesquisarOrganica();
		ArrayList<PesquisarOrganica.Table_1> lista = new ArrayList<>();
		Organization organica_db = new Organization();
		
		//condiccao para pesquisar com filtros
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			model.load();
			organica_db.setEnv_fk(model.getAplicacao());
		}
		
		//Preenchendo a tabela
		for(Object obj:organica_db.getAllComFiltro()){
			Organization org = (Organization) obj;
			PesquisarOrganica.Table_1 table1 = new PesquisarOrganica().new Table_1();
			table1.setDescricao(org.getName());
			table1.setEstado(org.getStatus()==1?"Ativo":"Inativo");
			table1.setP_id(org.getId());
			lista.add(table1);
		}
		//Alimentando o selectorOption (Aplicacao, organica, e menuPrincipal)
		PesquisarOrganicaView view = new PesquisarOrganicaView(model);
		HashMap<Integer,String> applications =  new Application().getListApps();
		view.aplicacao.setValue(applications);
		
		//Para pegar os parametros que queremos enviar para poder editar o menu no view
		view.table_1.addData(lista);
		view.p_id.setParam(true);
		this.renderView(view);
	}

	
	public void actionEidtar() throws IOException{
		
	}
	
	public void actionEliminar() throws IOException{
		
	}
	
	public void actionMenu() throws IOException{
		String id = Igrp.getInstance().getRequest().getParameter("p_id");
		this.redirect("igrp", "MenuOrganica", "index","id="+id+"&type=org");
	}
	
	public void actionTransacao() throws IOException{
		String id = Igrp.getInstance().getRequest().getParameter("p_id");
		this.redirect("igrp", "TransacaoOrganica", "index","id="+id+"&type=org");
	}
	
	public void actionEtapa() throws IOException{
		
	}
}
